Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4CACD60670
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 13:18:35 +0000 (UTC)
Received: by padev16 with SMTP id ev16so91581697pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oVGBkNDoKeujUPcmyaqFe+JZ9UQBxEjgN/3dtVFst/s=;
	b=J+8X7sgISWNukTHNgj2oZk08pV//3C4bG1a7WCSXWC0r7jf4tuLX4KhNUbjfu8CwY6
	LsKcGoUW48OTE5OmlDT7yGD9KKftaQ5Uimqy3mvdvaa9FMuFYpPZTSxinaeC7E97zga4
	/FcoIkg57HIH/lsOh1hcRZ1eHKS5uFId8Sme/6L/VsB42b8bNc8icuKXGEYCENtgaieL
	2N7avQ2/l1db7QVmhY3VL7r2lGWmm0VT4BzoL2D8WdOu5mqHWpz6GDl4eQaUPlLb3JGx
	c18dJ2becU7RRelLKht8xpWO6HX6GDKJwi1PgW9OzHawkoZfo84M3vhlyDLYB6Do/l3V
	zbKg==
X-Received: by 10.66.222.161 with SMTP id qn1mr22570397pac.66.1435497516872;
	Sun, 28 Jun 2015 06:18:36 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id v17sm6830628pbs.35.2015.06.28.06.18.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jun 2015 06:18:35 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 3C585FC07A4; Sun, 28 Jun 2015 06:18:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jun 2015 06:18:29 -0700
Message-Id: <cover.1435497302.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] gnutls update to 3.4.1
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
X-List-Received-Date: Sun, 28 Jun 2015 13:18:36 -0000

The nettle and gnutls updates must be done as a pair.

The following changes since commit 4948bf62f63e311744ef2ba1e750d4c08a0794c4:

  tcmode-default: Test gcc 5.1 (2015-06-28 06:05:07 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls_update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gnutls_update

Armin Kuster (2):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1

 meta/recipes-support/gnutls/gnutls.inc             |  4 ++-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++++++------------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ------
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++++
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}    | 12 ++++-----
 5 files changed, 30 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

-- 
1.9.1


