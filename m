Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id D0CE365F81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:44:46 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id b6so5865115yha.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 19:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BTeyz7MBAGgZIO/H7ZFIkb+QYrGv9zrbC8x1V5vuubI=;
	b=tvVW8QfkSc4Lo7MTKtaNYVMJ+jhshzA8GKx6sae6TsNByCHsDuCVOFteVT5qVawk3i
	CxV898pOOKH5/iRgbsEkBcHLnK3yspzntnD1OtWpZ+kTzj5vHRmPxajz9Ljn+chPQYYz
	TlKN0Q8LswpbmWPhRZj8KupgOpf3zxoXXe/cPzo28qOHwIBxjy3Lu55CslkjIfgdrDgN
	sw05rp6PYOf3hK8N9mJRxnSYBkTKxkg3sF55/lS7dCVmFSZjHxHgGhfcdopmB6C/UJgS
	q8VZ5PF8BY5XLkRdV+gGMeTF5ec6xTaK5CyHiBki6OzEYNPDPWdhTpaoP3eLFu7nSIhl
	x7wA==
X-Received: by 10.236.44.41 with SMTP id m29mr40388155yhb.57.1407725088018;
	Sun, 10 Aug 2014 19:44:48 -0700 (PDT)
Received: from localhost.localdomain ([201.53.208.133])
	by mx.google.com with ESMTPSA id
	v64sm21037728yhc.55.2014.08.10.19.44.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Aug 2014 19:44:47 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 23:44:05 -0300
Message-Id: <1407725046-16711-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [daisy][PATCH] libxml-parser-perl remove rpath
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
X-List-Received-Date: Mon, 11 Aug 2014 02:44:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test case to run without patch:

1) add meta-intel and meta-crownbay layers
2) build MACHINE=qemux86 bitbake libxml-parser-perl
3) build MACHINE=genericx86 bitbake libxml-parser-perl
4) build MACHINE=crownbay-noemgd bitbake libxml-parser-perl

The step 4 wont complete because rpath issues.

To get it work:

 MACHINE=crownbay-noemgd bitbake libxml-parser-perl perl -c cleanssate

Then

 MACHINE=crownbay-noemgd bitbake libxml-parser-perl

Master branch seems not be affected by this behaviour

João Henrique Ferreira de Freitas (1):
  libxml-parser-perl: remove rpath

 .../perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch   | 14 ++++++++++++++
 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb      |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch

-- 
1.9.1


