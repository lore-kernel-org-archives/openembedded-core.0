Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UY0eO-0005tr-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 23:02:49 +0200
Received: by mail-pa0-f47.google.com with SMTP id kl13so551311pab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Zqm3QgfIVaX853cmp9m5MoUcdr9usLVPe/1J+L2Wwl8=;
	b=S5lExu/reUVHI33fXtg1ncxj3jAJIJn9hWdAvW25eNuvVU3QK+JohRP3n/FY91BlAH
	G+Fa1CWzICy82RJwrfHYclpKCiwmbzbZmcRU8t2fbLDEoSF8BgnZYFyNV66Qkjn76BNx
	KmQMv5eDd39ZNQYpps9L3fHLYs/s6VajGI8OFLfSyN+XiCjN4mxiUMaG4RQsg8CGxuLe
	92y0RfReM0YVbTOIQ77cn34yDSnis/QjtCksunhu588hSa4xrY7I6FdIkLSVZepzLoYu
	mQXMmlWPvgmkNRY8+9r0NeoGtSHPdxvB2uRSIAg+IeDmJx8rd5RVYFJOITZKnIDdC5sN
	nyBA==
X-Received: by 10.68.233.3 with SMTP id ts3mr10846386pbc.153.1367527494271;
	Thu, 02 May 2013 13:44:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id cp1sm8566853pbc.42.2013.05.02.13.44.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 13:44:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 06:56:31 +1000
Message-Id: <1367528193-10516-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/2] Scope variables in image classes to avoid conflicts
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
X-List-Received-Date: Thu, 02 May 2013 21:02:51 -0000

Note: This depends on syslinux update to 4.06.

Jonathan Liu (2):
  boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
  bootimg: Scope HDDDIR and ISODIR variables to avoid conflicts

 meta/classes/boot-directdisk.bbclass | 25 ++++++++++++-------------
 meta/classes/bootimg.bbclass         | 25 +++++++++++++------------
 2 files changed, 25 insertions(+), 25 deletions(-)

-- 
1.8.2.1



