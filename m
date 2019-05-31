Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34F497E594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 15:56:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so6854593wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rzE6N2i/W90l9c5CqEqo8P7T5G1yWa6BznYH5qvUErY=;
	b=iNeBzbyX1cgFqiu1RxJ7Il1GUOG51fUzMF+PW+q3BGKQ3jJnJKTP0aMwaT48YzYiQM
	3ajL6DSVpFYPT3hTcwkw9OKt+374Wqya1YX607+YsS0GDBzj+UhQu425/WrObTdJew9K
	WaiiN0gxey0cDMnKwEfTk4LmoevsTp8J8L1J6MswC6ylAA25FVGLHsRBEXxvrxXSgngL
	u7UZCqcd2d0bcdBWsJk3tFsxkuc+sTrfxFkBXTVl82+RAQEgVz9TkJEjHJiRlRvN1BIc
	MbXOgOJ5lMUtyJxxT7wtqVfVVhQUCIGijcNFmB7YvcQdwbd66K4gACGqaN6yUuIysdCh
	xpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rzE6N2i/W90l9c5CqEqo8P7T5G1yWa6BznYH5qvUErY=;
	b=rezoMmvn9jr8BCrYE99J7VgRRzzhJkA/pYm8hoc01ZKGgas5FRPOZS1pcNfxXe9K5L
	fNY4Ltf0BBrRzlhoRKpRFc9iH8nr1W9TTxLXTDMd8PwmuuRXJI1qkKm9KgxMcSkrVwiz
	MOhz9W3xj/Zpn2XnlSan/qYKzXSnC9G7OdocHirMgo8KptYXjDtIAmapfG3+GeA+9/pX
	5iaF3fY8P/tKnfuskXEHtM6L4Da66zM6bFzykkdxsFVCoTBqisvAm/5xJId2jEdv3diy
	Ex8Ri55aLK4LP+/Am4VhQ/ov2+tAK6OPsA/shoehigkcylycc/yUoGsqXQVaS/tnof3O
	0SWQ==
X-Gm-Message-State: APjAAAVHaIMHTkCEWe6AUB2PbdZPeNUJR9vFxcsCG00/gazPUtJzg1PD
	5/wrh3S8Ihki/cN9wSZ35RazWwTMvHPxyw==
X-Google-Smtp-Source: APXvYqxPUjx475fIOhhi7HEWnLb8TqxZRh4lWVxnayHzxbvwtZsXBnvn/EDqrK/+AfSXcKe3jbQViA==
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr7172991wrw.348.1559318181564; 
	Fri, 31 May 2019 08:56:21 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u19sm16496445wmu.41.2019.05.31.08.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:56:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:56:06 +0200
Message-Id: <20190531155612.75663-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531155612.75663-1-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] perl: update to 5.30.0
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
X-List-Received-Date: Fri, 31 May 2019 15:56:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../files/perl-configpm-switch.patch          | 21 +++++++++++++------
 .../{perl_5.28.2.bb => perl_5.30.0.bb}        | 12 +++++------
 2 files changed, 20 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/perl-sanity/{perl_5.28.2.bb => perl_5.30.0.bb} (97%)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
index e6f23eed657..3c2cecb8c18 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
@@ -1,3 +1,8 @@
+From 7f313cac31c55cbe62a4d0cdfa8321cc05a8eb3a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 27 May 2007 21:04:11 +0000
+Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
+
 This patch is used for perl-native only. It enables the switching of
 configuration files between Config_heavy.pl and
 Config_heavy-target.pl by setting the environment variables
@@ -10,11 +15,15 @@ values would be valid for the host only.
 Upstream-Status: Inappropriate [native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
-Index: perl-5.14.2/configpm
-===================================================================
---- perl-5.14.2.orig/configpm
-+++ perl-5.14.2/configpm
-@@ -658,7 +658,7 @@ sub FETCH {
+---
+ configpm | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configpm b/configpm
+index 09c4a3b..6a0a680 100755
+--- a/configpm
++++ b/configpm
+@@ -687,7 +687,7 @@ sub FETCH {
      my($self, $key) = @_;
  
      # check for cached value (which may be undef so we use exists not defined)
@@ -23,7 +32,7 @@ Index: perl-5.14.2/configpm
  }
  
  ENDOFEND
-@@ -816,7 +816,21 @@ $config_txt .= sprintf <<'ENDOFTIE', $fa
+@@ -845,7 +845,21 @@ $config_txt .= sprintf <<'ENDOFTIE', $fast_config;
  sub DESTROY { }
  
  sub AUTOLOAD {
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
similarity index 97%
rename from meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
rename to meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
index f175e87a12e..6bd83cc1748 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.2.3/perl-cross-1.2.3.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.3/perl-cross-1.3.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -23,12 +23,10 @@ SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
 
-SRC_URI[perl.md5sum] = "1323e7581fbedf3791d2843f4ccaec4b"
-SRC_URI[perl.sha256sum] = "aa95456dddb3eb1cc5475fed4e08f91876bea71fb636fba6399054dfbabed6c7"
-SRC_URI[perl-cross.md5sum] = "03d9eafd71161eb5d1f80434e8b49dbc"
-SRC_URI[perl-cross.sha256sum] = "84583a1bb5f3a2c64d13d031386c114382e5c62955c6f84a27cec8318536627c"
-
-PR = "r1"
+SRC_URI[perl.md5sum] = "9770584cdf9b5631c38097645ce33549"
+SRC_URI[perl.sha256sum] = "851213c754d98ccff042caa40ba7a796b2cee88c5325f121be5cbb61bbf975f2"
+SRC_URI[perl-cross.md5sum] = "4dda3daf9c4fe42b3d6a5dd052852a48"
+SRC_URI[perl-cross.sha256sum] = "49edea1ea2cd6c5c47386ca71beda8d150c748835781354dbe7f75b1df27e703"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.17.1


