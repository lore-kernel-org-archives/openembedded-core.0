Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UB8Ak-0000HH-Tc
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 19:25:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1SI9Dmm022509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 10:09:14 -0800 (PST)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Thu, 28 Feb 2013 10:09:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2013 12:09:04 -0600
Message-ID: <1362074946-7062-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 0/2] kernel module fixes
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
X-List-Received-Date: Thu, 28 Feb 2013 18:25:43 -0000
Content-Type: text/plain

There are two patches in this set, they address two different, but related
problems.

The first patch likely needs some discussion before it can be accepted.  This
fixes the issue, but we're not sure that putting these two files into the
kernel-base package is the right answer.

The second patch adds a new depmodwrapper, that resolves the issue.  This fix
was suggested by Richard.  I think it's a reasonable solution and in all of my
testing it has resolved the problem.  (Without the first patch, you will get
warnings about the missing files, but that first patch is not required for
this one to work.)


