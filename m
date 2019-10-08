Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA6A7F382
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id a2so10914430pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=vHbw3dFkzKFQdauIVlkOG6NCUn5ED2tr2O3a/QYZbgY=;
	b=Z7S4RCuefJS6lH85HNQhQ6knsJeYCZKF6/1KYUp6Sw/V8/DNZ5kVdW0Rc85TB8R+uA
	BWSaDULcpmrMxjjLfnGg465UnPtNZxFVD0bUdCHFNY5Mg5N58Qpj/wqBBtl5Nysgt+CJ
	Y8QrsDqmGrLSrOxcxnabI+rt9KeyUJbyStUmGEQ5FpqhBG7ow7l6S/hp51X9DrhnXw1W
	+Wg+FOykpi6lpc4MNUUOdCZsNL9m+mQyT5f5shh26wxLGOmbfhAu+R1x+G+bCIcsIhyf
	RAdHg8FFbJRqFJRaK36YsARhUajuvFMh9LT6P5wrEPHy1xp0cY0kFzM+lTHHJ6yutsVP
	gPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=vHbw3dFkzKFQdauIVlkOG6NCUn5ED2tr2O3a/QYZbgY=;
	b=cQr1yZbIjcIkzX+uY1Qd4pBI6vZ+aeE3P5OV3h/djnF64ex0qXeG9cchKsZrIwQe8B
	ODthxydRKy9+NflS0nQpaS/eZJDh3e3iENUH/adpk8OhW37LMIFUu92ewEzVp5FwiuQ/
	p1i/9opjZfEGpnF10JCkRjWNcf+mSLmNW3lKkx0Ecfvk+/5uxPLP+EXEmDv9KS9mw5F+
	uiZWBXbJk45ejdv6zlDBUXAZO3I0lrmKRP1pNhvRy6L80u5HSzY7w974R8sth0AWVEpB
	wd06nAjNBC7yY4rW3c8XkFBB4kblwoxhsm5AfAtPFSL8TLb5G6ftJ3cHcn1fCEb2ale3
	yuKQ==
X-Gm-Message-State: APjAAAUXNA9KHcLjt+6kjzK4DLXxQpFROMeP5xNC9u2nNalz5/7EVwE4
	jpGiup5kCsA8peu73Oqf2Vwqe3H0rO0=
X-Google-Smtp-Source: APXvYqw3vumUE0qPWnifyVJ1Mi65gbzo13vj+pCWbE6FEUtzIlMwcxcaW5F9XG5ZGiwZZpW00oD4bA==
X-Received: by 2002:a62:b603:: with SMTP id j3mr38532452pff.171.1570547086949; 
	Tue, 08 Oct 2019 08:04:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:31 -0700
Message-Id: <7f13e4e9ef51bf62729a9a955967aa4752d0d2e8.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 04/10] qemu: Fix CVE-2019-8934
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dan Tran <msft.dantran@gmail.com>

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


