Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CE4C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5529.1784741049297245757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2QhO+nCG;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso28219835e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741047; x=1785345847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=virqmaFyh7gltWeL6kh56gomAQqICHGvI0tRV0Ayueo=;
        b=2QhO+nCG2R9DJ35T/ktV7a9XIv3Go5O/m17Y3mBM6Sccm/A6nkxCvPgho7elKTPEX1
         Dn4SSyoNqd6yVcqEBRsbnKZPWsN6AxEOPkNW8sC0VpPaWqM5dhizYbUVY5cOQfi7Tsx/
         2e93SqQ8ntsvLFeHhLU3mv1ooW8KTLLicHesE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741047; x=1785345847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=virqmaFyh7gltWeL6kh56gomAQqICHGvI0tRV0Ayueo=;
        b=DkkhrdxTbERWalz2+ohhl9RW7+Kl6vMX1RjMItETq0xdec0xviLikBNzWqs4wkEsW2
         hkK9rZL8ymlTBEXewoW3jBB9OzRQyXtc/+WMJohiQgGc7E5tr50Ad6NY1id1pcp24ymN
         e+knUpV5pGAZPlY2mT0jL22PxJPA6F0CeeIaVqso9ADROfxhZdPoI567NyTmSBP+gMTK
         l4lE1MChIU5zNyw4zddpFc+4BwxGjygyWyYAEsfna7OtypNTIai8KgHvutKnLAwZ6F5D
         VQTnT8GXUFia5O5iqRtglE0GzHNmBTuSVXg0QtCkI+ANca9BEhJB8jP0QS7h3mQ9grGU
         kDBg==
X-Gm-Message-State: AOJu0Yz95ncsSDFZxXk8XA2AfQn6qKxoHfaIdFkXB/oDE3f3m5KYT7TA
	+WRJlqwWYczz6oUgIGNSUvSPD26uOatnuFQyaavFnqdnxR9zOwFw1zCV8miKqnyJNrfB/WoqBvd
	fziSx/bA=
X-Gm-Gg: AR+sD12ZpYumtJOcHNofiq0iyGrF6nps1sGKclZZiaiXjsZBb5CuChOLTBzrkPN03ok
	q0VWzrpMJrVV6ULZBkzkxBQ65hzfZ7B33Ex6mqZU/j1Vu9yPka4pYanWfzXDKVH/TTcBtXDcTzW
	TkX6/QJ2BZibOXiczsy8Z2lqs6PGAc38PL2T0JNwC71CMG1gtV5VQeV4v8pVU9xFpjf5NkoEYtH
	QuQ1hddFDKyNQwLYjYuL2A1iPCRIHDg1jv28YKEUfaij6msmzXC4E+uO6SxhNsKTajBa7TsNs28
	MpyTapGmn0GbNneG7CvmsuuCHElEl8/sklSVGDMza3E2WSRr9bVvEgUUeFxlAbHSY6CBSWPxvk2
	J6Wm99vYhkn21mGm1TxZJiM75wXrPAfceSx5OrEV5okwyY9HA6zdeYY7h0VLBDLu6S/qbH28sdi
	e3Z8ynrdDPtapN8UMjH/Zn/DPO3T9SX9rqxl/sxnP09cse+Enrr/V/VBJ+0hDg0Av6dItswJBpZ
	jll8Upw86PG
X-Received: by 2002:a05:600c:1549:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-4954a3d08c0mr266553915e9.5.1784741047422;
        Wed, 22 Jul 2026 10:24:07 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/27] glib-2.0: upgrade 2.88.0 -> 2.88.2
Date: Wed, 22 Jul 2026 19:23:30 +0200
Message-ID: <145aa7ee15e5eb73a6e6f12ac721305142b16848.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241727

From: Peter Marko <peter.marko@siemens.com>

Refresh patches via devtool.
Release notes: [1] and [2].

2.88.1: Fix various minor (low severity) security issues
        CVE-2026-58010, CVE-2026-58011, CVE-2026-58012, CVE-2026-58013,
        CVE-2026-58014 and CVE-2026-58015

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.88.1
[2] https://gitlab.gnome.org/GNOME/glib/-/releases/2.88.2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 12 ++++----
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 30 +++++++++----------
 ...l_2.88.0.bb => glib-2.0-initial_2.88.2.bb} |  0
 ...{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97b..9beafd106d1 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -30,7 +30,7 @@ diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
 index c7be334ce2f7..6f722ee6153d 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* ---------------------------------------------------------------------------------------------------- */
    if (strcmp (element_name, "node") == 0)
      {
@@ -43,10 +43,10 @@ diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspection.c
 index 44cb7a96af45..daca313f77e7 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+ 
 +static void
 +test_invalid (void)
 +{
@@ -80,14 +80,14 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ---------------------------------------------------------------------------------------------------- */
-
+ 
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+ 
    ret = session_bus_run ();
 
 --
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a7..a07aa529ae8 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -30,63 +30,63 @@ diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
 index 6f722ee6153d..ed0d291f99f0 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+ 
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+ 
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+ 
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+ 
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+ 
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+ 
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+ 
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fb35f84eec5..d49ae131685 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -240,7 +240,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "3546251ccbb3744d4bc4eb48354540e1f6200846572bab68e3a2b7b2b64dfd07"
+SRC_URI[archive.sha256sum] = "cf3f215a640c8a4257f14317586b8f1fdd25a10a93cb4bdda147c0f9ad88e74f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

