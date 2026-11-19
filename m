Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83.1795101863532402831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fdxg59xS;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso32839095e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101862; x=1795706662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pmybtl7xiyq1l0BvgS98K0PonIvF//wxWi9a5I5W6Ng=;
        b=fdxg59xStRLI337qoWW7XK1tMJM7+wYqAE1OvGODrhk6Zdxu9WT4EjOKrYCnsH1/18
         Yko/3vA9atNUiKLLjhqi4sn3uFx5ajGKWVtxk+JU9vvWMddJ9lRBq8KnXHjTTe1CKdgB
         qwLo9YqEuX1//qBhY22VfUzeM/EAQUl9TsIemP1TnC+0cB4jr9rhlTkqKSew3gWjSV/A
         0hauJxI+NKhifR85jH3bcCquteuqlaNKJ/d0GLLfa/RfdEaxlxO08uTke9ivEgfzYACX
         IjkLgrLICMKuQhfCe4pVrEZn0jSjpDhMHI+rlzeK4LLR3t1rQr0NMrRPTfgevV+lO8rv
         SXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101862; x=1795706662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pmybtl7xiyq1l0BvgS98K0PonIvF//wxWi9a5I5W6Ng=;
        b=Kx4Yzdo87JztQ6oATZeTO7H1HKYJn2u34tcNdXPOKlaj3UEHuTv7+JkJNtjcKfM+qW
         seRfqCmwoc9xxg/blIKMAJuGpFYdomabsWW2oNaGDv6kf8JDsCZdYGWslltQxqt/SBYP
         nkpjuCw6V/dAW9evtvaGc/lbYWvfWymNU5SQEAPGw8DE2IO6w6F3Cu/eoBw+PyulsAie
         1janYt5hr2fDoSp19i5Fnxmd+s78m0tqP3iSESYl8qfCIPSF5bOMF+NpzsKGTX+hKlxd
         DRz7RpNVXz8kXk4mikCnY5jLIk0+y5hW1JY0yEGxylsAjlMmbXIvzN0Vsv3ZZHXXyJE3
         TUpw==
X-Gm-Message-State: APuU4Z//s0aW1m6gr1TWU5MSGUD7ZRKnS2wI7QkZVZJ2N2wqe3LnQ3ja
	Pm3xgF4+4O5oJ0NFwareGtde5aoe1VIRlKEF1nLXFRIOuYTy3Cfw+IPcl0iMc4794SS0zo8PBp/
	AljB1fOE=
X-Gm-Gg: AYBFou1NLXMqyKYjQgNZ+yttGVIkpzORwaSoddpVzWzxNhGZGjx9J3nfVlq7nQwbteS
	NYjL7XYbvG78T/9JdlNUtMsWMc0VBM4xTYENc1tDtElP56rLx3ONYzksEj5Swi+winrBzKLlF/Y
	fbtCpz5qFfpE0HQRVDjAQg9SdTwWrGogJjZjOfUI3zxTLzLxGNIjomBanV0csVqwO3PCIpcjH7B
	q54lB1gLS556bao19n/ipZ4JfykIZeO4avkL/ZTzQq4Zbf1m9DX4X3DXQWG84yfYLrDHfu7ihdy
	T8iLwtBdGAPtGVT6GmZme/em4g7FjqHHLDYUqwhykFYeq2nm+QwkRcPqtST/onNhKAnzDar+N6M
	ViKNcOG4MdObxf2fAwgtZTCKjqzua3H1lopMxD+PRfL/U/3WKV3yfwfTb5LeEsR34opaqXbVHGj
	bGcOO3oCJ0NyfJNam3L6qNfgNRtgxF3pd9H/UxUxixpHsxCm9/9sYWxgEVnQBzMrncWlOa9PBaw
	RYyOfKPVH7JsSwn+mpMJ/mSs31nH+dnsHTKLDkOs6xX9/h0rjnB2Ry/5A5qkSP0KAhWkerxtg3K
	FZm0iZvLQ46hhRuVoozhCXU8SFLKqjcDeR2c/VjcdkXPvHxMnkdr0oeZ/SU3zxe5IQrD+WIrz5R
	qJNe4TUAKl1ee9hPGcyVfRG5ScTauHoac6v7qzgmFt61P4o6PBpPiHVk=
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr136736655e9.21.1795101861735;
        Thu, 19 Nov 2026 07:24:21 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:21 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/19] pseudo: Upgrade 1.9.11 -> 1.9.12+git
Date: Thu, 19 Nov 2026 16:22:32 +0100
Message-ID: <eee779e8c65cdd88efea8a33f2feaa65a63dbd7f.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250689
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Switch from master to the pseudo-1.9 stable branch.

Changelog:
* pseudo_client: Fix xattr/rename handling with empty paths
* ports/linux/guts: Add open_tree wrapper
* test: Add open_tree test
* ports/linux/pseudo_wrappers.c: Add syscall support for open_tree() wrapper
* test: Add open_tree syscall test
* test: Add open_tree_attr syscall test
* ports/linux/guts: Add open_tree_attr wrapper
* ports/linux/pseudo_wrappers: forward pre-init syscall/prctl to the real function
* pseudo_util: bound pseudo_get_value()'s recovery re-init
* Makefile.in: Bump to 1.9.12
* ports/linux: Add missing header
* ports/linux: Fix header ordering for Ubuntu 22.04
* ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1320d19ad4..764f81b683 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=pseudo-1.9;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
+SRCREV = "e627b0dcb639f387db935fae1f9b93b30cded5e1"
 S = "${WORKDIR}/git"
-PV = "1.9.11"
+PV = "1.9.12+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
