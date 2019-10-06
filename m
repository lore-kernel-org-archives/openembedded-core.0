Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7097D71B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:24:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id u12so5608747pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=+WT+xpCGjaUI+z2BehkwNPB0kR2jZr+XfpkVBifoZ+g=;
	b=d9VluQKA3PECDQg/WDGHdlUbLyPB+cr30bpNPxLtdxCeKmh1z4uBWhSXAoLObXcrns
	A4SlSxtV+qU1GXTLxewJ6idQhH2HB2yNwZb2sxOLAm26ydJ1gB1tBrZlTQX4f7uPtWEs
	Uuz+RqsoglkQUUNkaMD2p8zgCsBCLhgt+G62S0sxlctCo50DUjvdw5MrvjgGCvUVGoDq
	OXLaUKllg9zdb3MAezOejSJuWJvbsKeBKuYubhO6ljKF2ogHHSRQwVYPUsmSRgbF60NJ
	maDymJzyWoKGESnbXJAuNbTpqKKYcDLNKjVsVaGjRWDV1ytga1sv9B009IDd83EK42Gg
	LAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=+WT+xpCGjaUI+z2BehkwNPB0kR2jZr+XfpkVBifoZ+g=;
	b=QnMCM2DoNqWQQtOloSVSwPHrHRadXAL+l+VvV2tcUBuOf9Q1SrPu2dnVDFhmUWrOae
	BKDGTvCmo7hFV0gxHRCpqPT9mGVAIAbOc9TiwRqhbo+Z7uMmA6tHfT7IZsiyiNcI/q9R
	+w48mgVltXyWqtf8+MDkEvQUJ5vTp5ADW8llTFdDsHjuX11Ym6Bq07kMr4Qa4y/B8wEJ
	1pCUUFGfgNjiO/4WCOb8cB1yIYWfn7WfDtx1OGW+o067B0ZghmI2eI63r23NIGM+JOe4
	5WyU1Dz3qZBPl3IvFCWcnug78P0l16weFOJ86rPudqXH5XorhX0a6/KakjN6lUjeOk4V
	tEZQ==
X-Gm-Message-State: APjAAAUKAIOQD3OBNyLa877PStbM5RwKbD/mptErMxfn6/HA6gHyhEAs
	cvebeQqQTF6JfqNnvMhlW+gmBrTiCP8=
X-Google-Smtp-Source: APXvYqxht657SXUoPFL0TQWxDXcclOfNt58tCvIE7vCvkIi4dRTrXy92NNFMcoPMK5UlyesarhnLjA==
X-Received: by 2002:a17:902:36a:: with SMTP id
	97mr25231918pld.61.1570375455790; 
	Sun, 06 Oct 2019 08:24:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	v1sm10586425pjd.22.2019.10.06.08.24.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 08:24:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:24:04 -0700
Message-Id: <5950f550ec493da8d7defd1dacef00e0a6579cc8.1570375187.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570375187.git.akuster808@gmail.com>
References: <cover.1570375187.git.akuster808@gmail.com>
Subject: [warrior] 4/8] qemu: Fix CVE-2019-8934
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
X-List-Received-Date: Sun, 06 Oct 2019 15:24:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Dan Tran <dantran@microsoft.com>
[Fix up against lastest warrior]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3de87d3..e720ddf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2019-3812.patch \
            file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
            file://CVE-2018-20815.patch \
+           file://CVE-2019-8934.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
new file mode 100644
index 0000000..d1d7d23
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
@@ -0,0 +1,215 @@
+From 8c2e30a92d95d89e2cf45d229bce274881026cf7 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 18 Feb 2019 23:43:49 +0530
+Subject: [PATCH] ppc: add host-serial and host-model machine attributes
+ (CVE-2019-8934)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On ppc hosts, hypervisor shares following system attributes
+
+  - /proc/device-tree/system-id
+  - /proc/device-tree/model
+
+with a guest. This could lead to information leakage and misuse.[*]
+Add machine attributes to control such system information exposure
+to a guest.
+
+[*] https://wiki.openstack.org/wiki/OSSN/OSSN-0028
+
+Reported-by: Daniel P. Berrangé <berrange@redhat.com>
+Fix-suggested-by: Daniel P. Berrangé <berrange@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20190218181349.23885-1-ppandit@redhat.com>
+Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Greg Kurz <groug@kaod.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+
+CVE: CVE-2019-8934
+Upstream-Status: Backport
+[https://github.com/qemu/qemu/commit/27461d69a0f108dea756419251acc3ea65198f1b]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ hw/ppc/spapr.c         | 128 ++++++++++++++++++++++++++++++++++++++---
+ include/hw/ppc/spapr.h |   2 +
+ 2 files changed, 123 insertions(+), 7 deletions(-)
+
+diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
+index 7afd1a175b..bcee7c162d 100644
+--- a/hw/ppc/spapr.c
++++ b/hw/ppc/spapr.c
+@@ -1244,13 +1244,30 @@ static void *spapr_build_fdt(sPAPRMachineState *spapr,
+      * Add info to guest to indentify which host is it being run on
+      * and what is the uuid of the guest
+      */
+-    if (kvmppc_get_host_model(&buf)) {
+-        _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
+-        g_free(buf);
++    if (spapr->host_model && !g_str_equal(spapr->host_model, "none")) {
++        if (g_str_equal(spapr->host_model, "passthrough")) {
++            /* -M host-model=passthrough */
++            if (kvmppc_get_host_model(&buf)) {
++                _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
++                g_free(buf);
++            }
++        } else {
++            /* -M host-model=<user-string> */
++            _FDT(fdt_setprop_string(fdt, 0, "host-model", spapr->host_model));
++        }
+     }
+-    if (kvmppc_get_host_serial(&buf)) {
+-        _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
+-        g_free(buf);
++
++    if (spapr->host_serial && !g_str_equal(spapr->host_serial, "none")) {
++        if (g_str_equal(spapr->host_serial, "passthrough")) {
++            /* -M host-serial=passthrough */
++            if (kvmppc_get_host_serial(&buf)) {
++                _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
++                g_free(buf);
++            }
++        } else {
++            /* -M host-serial=<user-string> */
++            _FDT(fdt_setprop_string(fdt, 0, "host-serial", spapr->host_serial));
++        }
+     }
+ 
+     buf = qemu_uuid_unparse_strdup(&qemu_uuid);
+@@ -3031,6 +3048,73 @@ static void spapr_set_vsmt(Object *obj, Visitor *v, const char *name,
+     visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+ }
+ 
++static char *spapr_get_ic_mode(Object *obj, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    if (spapr->irq == &spapr_irq_xics_legacy) {
++        return g_strdup("legacy");
++    } else if (spapr->irq == &spapr_irq_xics) {
++        return g_strdup("xics");
++    } else if (spapr->irq == &spapr_irq_xive) {
++        return g_strdup("xive");
++    } else if (spapr->irq == &spapr_irq_dual) {
++        return g_strdup("dual");
++    }
++    g_assert_not_reached();
++}
++
++static void spapr_set_ic_mode(Object *obj, const char *value, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
++        error_setg(errp, "This machine only uses the legacy XICS backend, don't pass ic-mode");
++        return;
++    }
++
++    /* The legacy IRQ backend can not be set */
++    if (strcmp(value, "xics") == 0) {
++        spapr->irq = &spapr_irq_xics;
++    } else if (strcmp(value, "xive") == 0) {
++        spapr->irq = &spapr_irq_xive;
++    } else if (strcmp(value, "dual") == 0) {
++        spapr->irq = &spapr_irq_dual;
++    } else {
++        error_setg(errp, "Bad value for \"ic-mode\" property");
++    }
++}
++
++static char *spapr_get_host_model(Object *obj, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    return g_strdup(spapr->host_model);
++}
++
++static void spapr_set_host_model(Object *obj, const char *value, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    g_free(spapr->host_model);
++    spapr->host_model = g_strdup(value);
++}
++
++static char *spapr_get_host_serial(Object *obj, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    return g_strdup(spapr->host_serial);
++}
++
++static void spapr_set_host_serial(Object *obj, const char *value, Error **errp)
++{
++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
++
++    g_free(spapr->host_serial);
++    spapr->host_serial = g_strdup(value);
++}
++
+ static void spapr_instance_init(Object *obj)
+ {
+     sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
+@@ -3067,6 +3151,25 @@ static void spapr_instance_init(Object *obj)
+                                     " the host's SMT mode", &error_abort);
+     object_property_add_bool(obj, "vfio-no-msix-emulation",
+                              spapr_get_msix_emulation, NULL, NULL);
++
++    /* The machine class defines the default interrupt controller mode */
++    spapr->irq = smc->irq;
++    object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
++                            spapr_set_ic_mode, NULL);
++    object_property_set_description(obj, "ic-mode",
++                 "Specifies the interrupt controller mode (xics, xive, dual)",
++                 NULL);
++
++    object_property_add_str(obj, "host-model",
++        spapr_get_host_model, spapr_set_host_model,
++        &error_abort);
++    object_property_set_description(obj, "host-model",
++        "Set host's model-id to use - none|passthrough|string", &error_abort);
++    object_property_add_str(obj, "host-serial",
++        spapr_get_host_serial, spapr_set_host_serial,
++        &error_abort);
++    object_property_set_description(obj, "host-serial",
++        "Set host's system-id to use - none|passthrough|string", &error_abort);
+ }
+ 
+ static void spapr_machine_finalizefn(Object *obj)
+@@ -3965,7 +4068,18 @@ static void spapr_machine_3_1_instance_options(MachineState *machine)
+ 
+ static void spapr_machine_3_1_class_options(MachineClass *mc)
+ {
+-    /* Defaults for the latest behaviour inherited from the base class */
++    sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
++    static GlobalProperty compat[] = {
++        { TYPE_SPAPR_MACHINE, "host-model", "passthrough" },
++        { TYPE_SPAPR_MACHINE, "host-serial", "passthrough" },
++    };
++
++    spapr_machine_4_0_class_options(mc);
++    compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
++    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
++
++    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
++    smc->update_dt_enabled = false;
+ }
+ 
+ DEFINE_SPAPR_MACHINE(3_1, "3.1", true);
+diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
+index 6279711fe8..63692a13bd 100644
+--- a/include/hw/ppc/spapr.h
++++ b/include/hw/ppc/spapr.h
+@@ -171,6 +171,8 @@ struct sPAPRMachineState {
+ 
+     /*< public >*/
+     char *kvm_type;
++    char *host_model;
++    char *host_serial;
+ 
+     const char *icp_type;
+     int32_t irq_map_nr;
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
-- 
2.7.4


