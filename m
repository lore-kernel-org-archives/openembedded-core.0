Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1B-000571-PK
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:30 +0200
Received: by pzk35 with SMTP id 35so573669pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=clbHJTA+h5bscWZFeUhTkZmhtEII0oEWud+SbjSTvn4=;
	b=dFR74BcmUcfv17o7qFQXtORiJB7QMJ545PocH9VtP26FgISIIJldCX0XIM6VrxNItF
	1W6uSl5Bto9iUrW/eg3yQt5EFQ3G3hV4bA1+S+ePdG0vajbUuPl9casKRg1jMbDlYHFc
	Cp7itAUlG3YbJfV5YIPXpibwkRzpCdvqLrsQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wcYX5jXNp8xsO/JadcOaF27Y/9It83C685oMVTTq6a1o4sCaSkJr3IGnD4sR043avJ
	Ulns4+SrCvE7TF6R5rnSxTlaLV8JAQ5ncrKjtb2PWqcwGtixIkQzY04zcxXZoEIgAAtH
	6dBau6IgpJEMwBxaCnG5cvbWLJh2o1fYjT9g4=
Received: by 10.142.118.23 with SMTP id q23mr2860976wfc.7.1301632168380;
	Thu, 31 Mar 2011 21:29:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm2390656wfc.5.2011.03.31.21.29.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:19 -0700
Message-Id: <0fe42395ba7e0e69f4d6a93af1345d9f6466db54.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 22/46] e2fsprogs.inc: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:31:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 1ef6340..1a1a7b8 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -18,10 +18,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "gettext util-linux"
+DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
            file://mkdir.patch;apply=yes"
 
-inherit autotools
+inherit autotools gettext
 
-- 
1.7.4.1



