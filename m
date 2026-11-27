Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1544.1795801792505535746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=nz5HKTZk;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3852748f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801791; x=1796406591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nX/4lRG3h+E7fcakxZsVzDoCtWgB/WnJlVJdChX+P3k=;
        b=nz5HKTZkr36Hr7hnodvFA4kAjcnl+K//8ukogtU7YOZ2nlp18TGHbgjOfryNj2w97K
         febguQmIwIwNAmcsoeHt07odGVBtEmvmPEhZB44GWmxla+wkCIHyNGspe0Z7WB1w313p
         Pqjck3h07flGHHO5oPH6Ejp68FYspr+WqvSVqvfKYk+qZvqZFkzSZjz2f9AewTzNy9ZP
         3B9rnr3k8hDZO3bKGbMQRhxbx2vMHWpjJJKAVAjupOuG+LiJI4B6ZAkcSmXn9Dq9Uvia
         k2G/DAgj1eHv/X/Z6la470ShemwgxKOQGmvKWHCiwI1R1A3fHdUc1LB+kG/hN0Vow5Ie
         vfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801791; x=1796406591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nX/4lRG3h+E7fcakxZsVzDoCtWgB/WnJlVJdChX+P3k=;
        b=NafRv8+K6IzEmI0hrkIOgon2DYKwZFi4a5su0HPd7+QLM8WM+2z8UJs+Iuj39OFGmh
         NncNXSdGAoMZp9SFTvD+vLtOfA2gBxaYn8O6s3vfrCmrgL3WX10gnmNU8OFpyao/uURJ
         obN73J7LDCqz6J8Ak5/MQXChCDrXotZqGrFZ1Rp8w6GWoHRnaqCYWJEipfS5WtWAHgeO
         Oy4GTmKRtdr5kkJDh520oBFQPtY7hfxKj0u1KgGjkrg7hfvh+iMF7lIULy45QXBVtZye
         joWZdsSyRDQgVaMJOXejE+Pz+vSxDeLVT1wVPuo0R7D2z47Dl780XfwZQYPJLXDxqTxv
         PBtg==
X-Gm-Message-State: APuU4Z8Y9OHCAYzgUfiCRhS48xFyg/h509TbcXT2rfhD0HVoDYhTtTKV
	xc5BYCazX6CQqk3ZUwDU1VAR0lK4rP+iqVK8rFmBpahppgJV1m++fgxMiknLZo0Np+vcGZrQR9f
	7+FJUSKs=
X-Gm-Gg: AZFdTZe6vI5f0jHndilQRsZb4so48qkMKCHRMTeKxFyU+1rfYOnzZVYh6X7ZVb6wx9u
	Ei4SrGzU186tdhogwFBFHYYZmj5DQm72v2JHa8k/U2O5yE/HMJAq8jxA7ceWDtYI2OfYlzL/Rm5
	tu1VaSC2LC6ONJVGHCC7Pe/a9idhUli4d6K4/bPeQ/on2a2Ct/fjPqua7bvtXm5UZ46Z/mooTIX
	SzLiCzGU81BS+fJyAplMxXn5bYtGsLB3cvQvB5LDm85ViXsMVoznqRZAzlxty2zI6CxCTnUFspi
	tfQdukf6aL/VrJLKcBDiBiVDykSDl7P1kcfxJbjjbP93qvITz8LCwf/B4atPaxJGo2jc8yl52Lh
	n9N8p+tXjt0SVow0uOO8QUSPOiJBtyamOb32yoC+KIP/O7rFRM9Nsy0cx1z/zrgOaTxL/C8gOLA
	Z3N6zbOfYjCz5F6IQs7V2hpG64JBM5nBOyZGlxh9mkPvaHZfzHAixajDqRavoNzvio6AEvh41eg
	AOJxLjsey83xwyIvmY0WdK9oEz5VeqYeNNWwLAnSnT7mnrFZZv59RaS4p0vCU9y/p0KXR8Om3Yz
	zfWZXJPSVJ5lMVbfY+t8koXLC/dwBVDjfgHo3ngEVXUDAAq3+cBEBC9ArqOvpH3f7TrB4aNwlMH
	SBsny+WLfUBIqzCTQT5iCm8r7gz63
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr46025537f8f.36.1795801790742;
        Fri, 27 Nov 2026 09:49:50 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/37] libxml2: Security fix for CVE-2026-74860
Date: Fri, 27 Nov 2026 18:49:12 +0100
Message-ID: <e0b0940e513fe7877fb01274bf8e782621bc639b.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251435
Content-Type: text/plain; charset="utf-8"

From: Rohini Sangam <rsangam@mvista.com>

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f41e1865781f74d1cadfe2fbdfeefed946026f12
[2] https://security-tracker.debian.org/tracker/CVE-2026-74860

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed Upstream-Status format]
---
 .../libxml/libxml2/CVE-2026-74860.patch       | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
new file mode 100644
index 00000000000..c08790c14d0
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
@@ -0,0 +1,35 @@
+From f41e1865781f74d1cadfe2fbdfeefed946026f12 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Tue, 10 Mar 2026 20:30:20 +0100
+Subject: [PATCH] python: Do not decref string after adding to the list
+
+The python API PyList_SetItem function "steals" a reference to item, so
+we don't need to call Py_DECREF here.
+
+https://docs.python.org/3.13/c-api/list.html#c.PyList_SetItem
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1076
+
+CVE: CVE-2026-74860
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f41e1865781f74d1cadfe2fbdfeefed946026f12]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ python/libxml.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/python/libxml.c b/python/libxml.c
+index 2bf1407..728ecbf 100644
+--- a/python/libxml.c
++++ b/python/libxml.c
+@@ -1232,7 +1232,6 @@ pythonAttributeDecl(void *user_data,
+         for (node = tree; node != NULL; node = node->next) {
+             newName = PY_IMPORT_STRING((char *) node->name);
+             PyList_SetItem(nameList, count, newName);
+-	    Py_DECREF(newName);
+             count++;
+         }
+         result = PyObject_CallMethod(handler, (char *) "attributeDecl",
+-- 
+2.44.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 5e4cabbf5d9..387f47c3edc 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -39,6 +39,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86142.patch \
            file://CVE-2026-86143.patch \
            file://CVE-2026-86144.patch \
+           file://CVE-2026-74860.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
