Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30A61BAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:25:55 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id y7so1664489pjn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Iaw4sBGGfnw6gwauSq9qG7UgESNJQHdh7ye9PxI1sJw=;
	b=M1jUuKhl4P3qp6Zlr/CVTtEQBIsNJqiDdhTvCzFWrjWEE7rBmlheySkwaJIVXXq7oc
	T7UlrSuiqnjTtuUQk8bDpW3KRylsL9Hkgn6Z8XuuENPK85ezdD6c0IQBLds3zgOHNme/
	CCu5/OnTa6KbTgowx/H7ScrJFgmHhUK9z9nyN3dGFX5NzMEgT5zzlkUz+6Fp2keiPzrY
	h628k0iH3VreDlrH+6/1HTlUYCcNczja/owJtWCnoi8IVPOiC4Vu/eeabYm0yXDKqCBW
	BssMDhnZXH0FRc7C+xQrb8eTzPcFejUVc9a4k8z9D0el9ApTWxjT4cUYZdCMV9nzTQ75
	7CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Iaw4sBGGfnw6gwauSq9qG7UgESNJQHdh7ye9PxI1sJw=;
	b=qL6/63aQn4+OaDl67S169ws1gOL7yW6axCJLpqydHX2H19Uvx60hHh97tOqFQKz5rI
	kxF82QXlCqU3hEqoOWGZiE/ZdCz0I6DSomGLBDuevylzyupAj6zI0F1ZbuvLlMU2HkZ1
	B2/ekYNAP14JWj4SmG3AaGS/y1Lu3DbZ5oOq7oHU1ADAIFG5V6tYQeuyTj6bxRZe0iC2
	YapPn0LF+FRXo+LLKaAHFqzOakfeB/mJ/LSq8hzgbT/d0TI0Cl5To70xK+bHy71dXBcK
	DTWDacw2xRMCJkozv4XKWGQAYQCFCbvM6YQETUddeb69yzC1Ds6k3vyDRIocMyU6VAFN
	9JkA==
X-Gm-Message-State: ANhLgQ0IbYrqchfVOJhd6/2Qagff+2qQMTU/HSRCmjvK/aEsLjoTYlqz
	XxmolVf3q3Qgs6XuP+x0dW5Fn+urZvM=
X-Google-Smtp-Source: ADFU+vuIK7eR/kxzxeN0SH2SRSbhyTiNlNkBJA6nEAGHxUWu7mYDpw6xE/u43/XO+rf2edkZ3nNgkg==
X-Received: by 2002:a17:902:8545:: with SMTP id
	d5mr4786005plo.116.1583965556962; 
	Wed, 11 Mar 2020 15:25:56 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	r14sm32085887pfh.119.2020.03.11.15.25.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:25:56 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B8BE72A05EB; Wed, 11 Mar 2020 15:25:55 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:25:44 -0700
Message-Id: <20200311222546.30284-4-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222546.30284-1-jpuhlman@mvista.com>
References: <20200311222546.30284-1-jpuhlman@mvista.com>
Subject: [PATCH 4/6] gtk-doc: Fix reproducibity issues
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
X-List-Received-Date: Wed, 11 Mar 2020 22:25:56 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

path to pkg-config and python3 encoded in scripts

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
index 50d4d99722..b508e62741 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
@@ -36,6 +36,17 @@ do_configure_prepend() {
         sed -i -e 's,^JH_CHECK_XML_CATALOG.*,,' ${S}/configure.ac
 }
 
+do_install_append () {
+    # configure values for python3 and pkg-config encoded in scripts
+    for fn in ${bindir}/gtkdoc-depscan \
+        ${bindir}/gtkdoc-mkhtml2 \
+        ${datadir}/gtk-doc/python/gtkdoc/config.py; do 
+        sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
+            -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -i ${D}$fn
+    done
+}
+
 FILES_${PN} += "${datadir}/sgml"
 FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-doc = ""
@@ -48,3 +59,4 @@ gtkdoc_makefiles_sysroot_preprocess() {
            -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
            ${SYSROOT_DESTDIR}${datadir}/gtk-doc/data/gtk-doc*make
 }
+
-- 
2.13.3


