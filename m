Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65237786A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:30 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l19so8706166pgo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f1fFy0RajlNOObua5R89/cQjxa6kFN7Z0R+BNdWVD0I=;
	b=dEbXwdbT0j2GFQ++cNYbLJitVK+WaihvnLYPXMfuPalLAxS7UhFR0NgZOcKsOlsGza
	OSLEXrccs9m2vUCVSWvbZzOVLceMFi1jOFKS4d31oHzioze5KHUH1kGKFomf9mp9SJUK
	ldcH57QjoxeFZLDM06H+g5nVPrugUEzIRZvVFFJN1mvZ/Hcc8w44VY877o6od4t8s95o
	1brJZvDggwbLQ0eLUOGOFZzPnEAQukaBnYZd7x5tAkyN5mH/BHFocjiIlA6eXoVYHzrg
	J5X+st5fbybNyJkBHWeaciWy+kFLHrfxDeEYbppbLCXeCa0jDfclvtCVpQ6kUFJWBIt8
	segg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f1fFy0RajlNOObua5R89/cQjxa6kFN7Z0R+BNdWVD0I=;
	b=jfN31iMG9sgH/rVdtUMox1zlyAJFKPEcQcMGvvM+hHP8JAbeYwNWapIfkvt+RPgPm5
	sZGeD9Cnea3/P0P78OS7vlmZDd3JZYjosw+hdoN8IR7Vuq2VDXcvOoR//p8h5IB6a2tr
	NEV6+jAXIKWn35NQ6BdRmdHzdBw2I+u8UhXeEGyx8za636XcLouYvALnEGjZm5QjTZr/
	fahedkoXVXTLD8+fKuWBpsTisvoDADx/6mdvso1RX6+fgfRhzoCdOBxcuXXos8CQyfnH
	GhfQLgxvmBYvkjNvbM9fwBnxzMp03Tn0BfsjCi3OYS5uyDMgCRshL1GD1RvSgNiYIvRl
	b8kA==
X-Gm-Message-State: AJaThX7MNaOWWeze+gr8Nznb0RKd2GLFP++p/HmB6ZZoUEZsP4vPQxnu
	xAbc/s56HRkA+lzqCkuMZwk=
X-Google-Smtp-Source: AGs4zMYCJ4ZtP82bHdwrki5TeWRjr7beDxY6zYTFf+LgxKj4gax7xnzcs7jYLI5dspapfPwMUc/j4Q==
X-Received: by 10.101.88.140 with SMTP id d12mr15206087pgu.166.1511222851609; 
	Mon, 20 Nov 2017 16:07:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:11 -0800
Message-Id: <cb6bd21a2334aaad2f19df7dc433d629313bb146.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
Subject: [PATCH 1/5] gnutls: update to 3.6.1
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:30 -0000

zlib configure.ac support removed in  3.6.1
drop patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc                            | 3 +--
 meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} (45%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 29b5dd6..7bcb913 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -21,7 +21,7 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn zlib"
+PACKAGECONFIG ??= "libidn"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
@@ -32,7 +32,6 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
     --enable-doc \
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.16.bb b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
similarity index 45%
rename from meta/recipes-support/gnutls/gnutls_3.5.16.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.1.bb
index 635c519..7624a20 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.16.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
@@ -1,10 +1,9 @@
 require gnutls.inc
 
 SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
-            file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "4c39612f1ec3ef7ed79cfb8936fa8143"
-SRC_URI[sha256sum] = "0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25"
+SRC_URI[md5sum] = "4b65ae3ffef59f3eeed51a6166ff12b3"
+SRC_URI[sha256sum] = "20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


