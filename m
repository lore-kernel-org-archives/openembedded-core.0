Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4226D4B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 02:59:29 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 205so20363104pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 19:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f966UGdMbrIalZGi3rvBuQDjFONl0e0e46FUB+haXXE=;
	b=muwApwIHL5UVmOANe9fMFYEH2LOOiCOen1pz3GnmdbfpRMEKcVC2+iZahO0Dw4gBCn
	pxBulSueV3PBWxE0yaGXrNq1KctuRWD4662PD7lkHxXPdF3wJ3EpnGmZqfXC9Jy2PSWz
	hEz7u1efLL0n8jd0uOMpKWrwMe6zOGPELp/wUCw6a+EVBCF8J1SnH3obdEt2XZhNhKYQ
	hCTwar7DgyRGlLBl+EMJ1UbyKUqUKQGOG3HXzvlexTygiNznKKK1jHSgQMmxhdt4BGhv
	Ivhq5adAAm+pwq8FKjRY+27HbZcZ3K8qv/7BcdHx4leYnBWTUeYcIEw5Q/Bc5GdG1vTA
	ElJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f966UGdMbrIalZGi3rvBuQDjFONl0e0e46FUB+haXXE=;
	b=FLLmbgNCxMnesPjRJfcW36UP+PC7CMSz7eCuWEGpj7YvwreKqdSdjpLtq2+ICeBYVQ
	saUQdcABRtUDBhjBssBwQustXx6DxMYgYrl4RO0iGHonBoZydfQJFC+JnBLfbWsvBqG/
	XE3VXVRRsFYvaUI1YkKOgzOfisOo0M8CjCo8LJjKBm09+unGYWziQ6mk0r6Gstxu1vqG
	QFYybTrxhKY5EEDqjA/Nm5hUNag9oJT9CctlFT1EsSY809Gld0xRBixBy2gW6khf4SBu
	+0P48P/ehlzbNO6FAsI1dcR+IGZKIyb8mpnKUlfgnpANf6PIhxZyQ6um7Z/fMHS56R6Q
	x3Wg==
X-Gm-Message-State: APjAAAXIE57SZ3kBDb1RcTcY1RucMFinPwyFLhsBN2L1nd0FNnljh+PG
	TxL0c4KccTzjQheyTs/0P1mfsnM8xUI=
X-Google-Smtp-Source: APXvYqyijHY3uvJCKIYyVbQBzbRkav9H8z3Q76dwskCxEFFz1Z5s/nsGdb+nJ0inJBMOAj64tibSdw==
X-Received: by 2002:a65:6152:: with SMTP id o18mr40834903pgv.279.1568516370650;
	Sat, 14 Sep 2019 19:59:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	6sm54699668pfa.162.2019.09.14.19.59.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 19:59:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Sep 2019 19:59:22 -0700
Message-Id: <20190915025922.3859296-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915025922.3859296-1-raj.khem@gmail.com>
References: <20190915025922.3859296-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] populate_sdk_base.bbclass: nativesdk-glibc-locale is required on musl too
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
X-List-Received-Date: Sun, 15 Sep 2019 02:59:30 -0000
Content-Transfer-Encoding: 8bit

musl based extensible sdk fails to install

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Your system needs to support the en_US.UTF-8 locale.

The real reason is that its missing locale-archive in buildtools-tarball
hence python3 from buildtools-tarball fails to run bitbake when
installing esdk

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 59920a57a7..4e3794f75c 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -63,7 +63,7 @@ python () {
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
 PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
-SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
+SDK_DEPENDS += "nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
-- 
2.23.0


