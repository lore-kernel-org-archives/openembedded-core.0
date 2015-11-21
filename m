Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0A46011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 18:22:51 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so148772848pad.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 10:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=d0KmdLdpWHbZhneAHUN9TLksQCM0IQKaUBwHdsD1mXk=;
	b=w3zWQF2K1rtKHYE/iOCeo0Cx9ChUoVJZYoU45v1wTixMaTPq5LP1TpRaTFZMWiYFXL
	R6z1evbPksr1sjafladt+t9jGQXgOeJOJ1H0FnjeSnsFfOSQeAbNMAIw4t0IXLdv11CE
	b+fqsvUMR6dbfkcI7yzXmctBvCl+rnP6FelT38fQblXvjGPC2aP/ZuefTL3Nc20I2oRJ
	ngxloV6ZgGrcbFTbCJMKTL+p0xxdsodkyQV84fHUW0UJWNKoYn1pktYBacu5/xBXF1h6
	rWTuV7d3V2qiPgKPweZMWji3niR6i2f2t8Wh7/gLMPsFzgiY///3BpLFZK30mOIvvdS2
	EJZw==
X-Received: by 10.98.64.87 with SMTP id n84mr6908344pfa.109.1448130172396;
	Sat, 21 Nov 2015 10:22:52 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r5sm3972016pfi.73.2015.11.21.10.22.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Nov 2015 10:22:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 92813FCC838; Sat, 21 Nov 2015 10:22:47 -0800 (PST)
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 10:22:41 -0800
Message-Id: <cover.1448130024.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] Dizzy-next
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Nov 2015 18:22:52 -0000

Please consider these changes for Dizzy-next

The following changes since commit 6d34267e0a13e10ab91b60590b27a2b5ba3b7da6:

  documentation: Changed some 'intro' tags to resolve multiple mega-manual warnings. (2015-11-18 16:44:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Armin Kuster (1):
  openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565

Sergiy Kibrik (1):
  rsync: backport libattr checking patch

Sona Sarmadi (2):
  libtasn1: CVE-2015-3622
  grep2.19: CVE-2015-1345

 .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++++
 .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++++
 .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
 .../rsync/files/check_libattr.patch                |  33 ++++++
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
 .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 +++++++++++++++++++++
 meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++++
 meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
 10 files changed, 321 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
 create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch

-- 
1.9.1


