Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 073617DE64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:55:06 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 198so3407002wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mLAdDCKz/0fOHmMCNpp9ucYvnfwXe48j0m6c+inalOE=;
	b=Rw5r2wMkb2Hyv4dLXvD7NUoVAgdtZfLCTLJwpvV7n7gueeyPF8cCD8ByirVs1PlEvG
	VFR4dPCcc2wXUCJLUeC6OWNvKWaTmjFtTPMK49+7L+B3VuDzl7W5SdreldhxP1tKTtmK
	u+gChOFXoAdqb6FQETMkxSm+2yK4wgEeAuku/dxlVEM09xiuzGX0UW+IFpL+IWf559CM
	3Jcut3TVqkol2lnBpEG96PXPT0LdhP7sTFsq/FT5bA3pq9cuhuPDVBp1bNGfyHJLs2yi
	U9Ayw8naNYWPsR2xFpzfTZFomzRQLs7pwwvYdTBy92SVVADXN0c7GB8OsgulFYpTKoTb
	FLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mLAdDCKz/0fOHmMCNpp9ucYvnfwXe48j0m6c+inalOE=;
	b=XfJ9mo2o5fXVqZBZiexIHwVzrbt4DR9WUVPaLjf3/1wDvDIPftHRVUXBSxEL3nnpGd
	GIU6Bs6drkPII/vWbhUy1opuWFvQHDXSGIaI4Ay9oSDfMZgJlGUXD83CmWUNsQkfmDNS
	3d6zLTolOtA2CHfEbP0jS+HVOnP10J12R214rb/Sv9lDdeC7lMF5CnuwdQaqQAzOAStz
	VyDyHoZjHRykYHfhq0k8OkWoh1hU7BHdWPLyG/6MZc+b1HHJwcxxG7JtaeK9e4FD55/y
	oIJ1tXwLz6AKq8KyIQRczLLDdPcYJQpxWdmt2wJDlGL30aHQOP23E/dHUDrDnDIFO1I9
	enEw==
X-Gm-Message-State: APjAAAWKG1dagpt51gC8OPjMDEGTkXqvGgMSnBsJ5ELQp0PhDH19grsn
	7ON1Gee5WYL+7mPFwNoEUZWJWVCH
X-Google-Smtp-Source: APXvYqxCOiDLJP+2OFe6eUc8JANHG8Z5mto85riKqEscLS9BhUXGoQoDa4E0bIKVHD8Hm+G5y09eOw==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3450948wmj.45.1557323707595;
	Wed, 08 May 2019 06:55:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j190sm4212478wmb.19.2019.05.08.06.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 06:55:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 15:54:58 +0200
Message-Id: <20190508135459.84886-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508135459.84886-1-alex.kanavin@gmail.com>
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] perl: update to 5.28.2
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
X-List-Received-Date: Wed, 08 May 2019 13:55:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../perl-sanity/{perl_5.28.1.bb => perl_5.28.2.bb}     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/perl-sanity/{perl_5.28.1.bb => perl_5.28.2.bb} (97%)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
similarity index 97%
rename from meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
rename to meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
index f3948a5f8d4..12b220a4d80 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.2.2/perl-cross-1.2.2.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.2.3/perl-cross-1.2.3.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -23,10 +23,10 @@ SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
 
-SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
-SRC_URI[perl.sha256sum] = "3ebf85fe65df2ee165b22596540b7d5d42f84d4b72d84834f74e2e0b8956c347"
-SRC_URI[perl-cross.md5sum] = "9a6c05497bdde9a3106e3be9246f4da1"
-SRC_URI[perl-cross.sha256sum] = "e6987838f27d8cd3368ea68fc56a68cc52371505950927b8b7c5cb76e3a94caa"
+SRC_URI[perl.md5sum] = "1323e7581fbedf3791d2843f4ccaec4b"
+SRC_URI[perl.sha256sum] = "aa95456dddb3eb1cc5475fed4e08f91876bea71fb636fba6399054dfbabed6c7"
+SRC_URI[perl-cross.md5sum] = "03d9eafd71161eb5d1f80434e8b49dbc"
+SRC_URI[perl-cross.sha256sum] = "84583a1bb5f3a2c64d13d031386c114382e5c62955c6f84a27cec8318536627c"
 
 PR = "r1"
 
-- 
2.17.1


