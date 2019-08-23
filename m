Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 206537F37A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:56 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s11so1299712pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JDUXwdfimvLz8cK+WRXh5bdFu7vqePl0bsArrG3AXV0=;
	b=NOfDudkR0/K8MKZRnEzmyhxMU5t0q+T0URGhHmkU3LF0LoVBiqPTJNcENkXRI89Brk
	nCi2gEIu04DmJpZUb5iDcpWj5oAU+AVfjzvsg1Fo8s5wmR/qHZjsvXaKI4X+wV86eNo+
	73+iGSnJEPpqo0IFQ+5oAmmd12hlPoV6lk3RbUyjKah1J0QPKaZTQZ6zOHq5V8FraLGm
	KePCf3/Y4VYtWXmXBX8b6lonMcl8YfGCbscHrNmSg8oxPByUe3gbHC8yWZRbsCJqNsrJ
	4398E8oFdMl+1gjU3zqKSDaDPIrupzGasKvgFJNv7Gt3HIeKEk0v/7fb3Nmn9AuN8GH0
	WtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JDUXwdfimvLz8cK+WRXh5bdFu7vqePl0bsArrG3AXV0=;
	b=HzDw+j3Gl5r1d0i+G8p8OC9Y6hdgTE+zSV9EnLJcI+m8X/9M74r4wl97Sdw21eHbr7
	0X5RvGv/npoupQFBZwK22zRl+/DrP4uq43LcpQfNuvhyQ16ZSwPLhSH94CDAfrHehNRH
	kMzkTxOPofyWOdzOopOfAwUaYAPvsBqngPim6owmgleeYbiLH9ZIpzCOI1N7TbgOiVd/
	iQXq3biqtiFJUH90BleMSef5Z7f34vkQtNKkmKKvD07a6cISb4ToKDd/lBupHNK0kvso
	k7aJx8L/UPVOrfAFvcp3fcozHsbIbAW/jIkKHsNPHZ8yg6wRmCKPc5Dk3ExpJd4gnjBO
	9qMg==
X-Gm-Message-State: APjAAAU/Ggb9LD2QyjbOd5pF4bDy4TEn/cqFA6hIwfUjNHJG3nsYy1ml
	iTcqlGl3LOKzntFqpcvyERuwTbws
X-Google-Smtp-Source: APXvYqw6ZGu1pVpHjHt4GzOVc0faq0l9CSIF2aZHon/EAN29xnIGSr5WCAm/8OYmOLiLhODIsQASPA==
X-Received: by 2002:a63:7d49:: with SMTP id m9mr5798125pgn.161.1566593577907; 
	Fri, 23 Aug 2019 13:52:57 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:40 -0700
Message-Id: <1566593504-21918-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 09/13] glibc: drop obsolete packaging of glibc libnsl libs
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:57 -0000

Packaging rules were left behind when libnsl was removed:

  https://git.openembedded.org/openembedded-core/commit/?id=9dc9983901cec364ea57a72b9da1a0396b60663a

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index f796876..a0df267 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -14,7 +14,7 @@ RPROVIDES_glibc-extra-nss = "eglibc-extra-nss"
 RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
-libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 ARCH_DYNAMIC_LOADER = ""
 # The aarch64 ABI says the dynamic linker -must- be
 # /lib/ld-linux-aarch64{,_be}.so.1. With usrmerge, that may mean that
-- 
1.9.1


