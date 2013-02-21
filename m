Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U8fBd-0007Mg-1J
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 00:04:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1LMm7XX000189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2013 14:48:07 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 21 Feb 2013 14:48:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 17:18:28 -0600
Message-ID: <1361488709-2340-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1] rootfs_rpm.bbclass: Handle multilib configures with different
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 23:04:21 -0000
Content-Type: text/plain

This change requires a previous change that was sent up to the list the other
day.  (That change is already in the 'next' tree.):

   rootfs_rpm.bbclass: Reorder feed priority based on multilib image setting

We found a case where the TARGET_OS of a multilib was not the same as other 
multilibs in the set of packages.  This caused the wrong entries to be added
to the /etc/rpm/platforms file, which caused a silent failure during package
installation.  (Smart decided the right packages were selected, while RPM
decided that package was incompatible...  Why this was silently ignored,
I'm not sure.)

We refactor the way we generate and pass the platform information.  This
actually simplifies the code a lot and we can avoid making assumptions based
on whichever multilib the image was generated with.


