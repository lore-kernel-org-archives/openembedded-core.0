Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 510AD6D7A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2019 21:20:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x127so6029128pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2019 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=l3WWmv+e5xpbrylNYwWpyUtsrzYGkldBi+/8L0Win+A=;
	b=QMsqRrE4A2WpHlE2sIkG54SeksAWYs1sCvS/P9BD6NvfNGl5P0hiSXqOiMK58ObGyK
	qcs0uZ9RQSwV4pP8uiqVBilYYA/d8/KVjzdFHwYETGmAqkn7rQN8KW4fKa+gPBFEDup8
	1urpTyGMimCCjt5UaDpwvepMj6ODsHG0dMu2FdW6MZz5dizBWpo6qSHKBWDlFUj3oUQn
	yPeuSBUFJR7HdNWjcAF/RoW21gLPEwbKgZJIjwJy2K5ZOJmSW0MRqSqXgIfm+2/oqrho
	8bgivDBSQDVNZYAPlz23TODMrPVCX5viCPBcnP/0n5iTrm7Gn88V4JydIGuBEIhGqUBc
	PdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=l3WWmv+e5xpbrylNYwWpyUtsrzYGkldBi+/8L0Win+A=;
	b=BM/kyUsY4qe0xF8a4iiMnNsd9t7TEL6DHUIwQFCIkxa4Io2hR2nUvxynkvh9mqIN84
	JFFKcc/Qoc15eFUC5FpvErlorQLEXn/qzWmLTyu6srJkT/rJ0aDM1ic8DlIKL8WgNYcy
	YLOy6cXOD4z7K68uDDZz4kILSq3Qum1l7feLM4UDffT9RQo+g4qkrn76+gZ6dalgV+GK
	4iTkJy5s0NCrcdG/OsvBL2Fu7JSzUUHHmdwjJdb3eS0hjfQdEJFjhNRp48Vzgg7xLuDY
	CgKVSH3sB2HDORnYby3PnCljtAr8JrYqD5sZUSDepODtIxdAGUIW80YEQjJPG5jwy6Uy
	u5uQ==
X-Gm-Message-State: APjAAAV4vYw+26jYf7EU2S5PanqlIFziV+mp4eWconmN8/3C6irsNKtO
	Ad1cDfxrk5uIk7N6cvGL+AyDCuBFhd4=
X-Google-Smtp-Source: APXvYqzuOOojSXdIpOJSVjvOCxySdicz2y/jKoJ3chrnoA2ql7T8JCXiGT/EwJV5P1sXqM8BKdh0sg==
X-Received: by 2002:a62:684:: with SMTP id 126mr10347251pfg.104.1570310401006; 
	Sat, 05 Oct 2019 14:20:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:88cc:97a9:c570:f3a6?
	([2601:202:4180:a5c0:88cc:97a9:c570:f3a6])
	by smtp.gmail.com with ESMTPSA id i1sm10736838pfg.2.2019.10.05.14.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Oct 2019 14:20:00 -0700 (PDT)
To: msft.dantran@gmail.com, openembedded-core@lists.openembedded.org
References: <20190925170513.1448-1-dantran@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2adb992c-36d2-c1fe-b7c5-d5594d524d61@gmail.com>
Date: Sat, 5 Oct 2019 14:19:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925170513.1448-1-dantran@microsoft.com>
Subject: Re: [warrior][PATCH] qemu: Fix CVE-2019-8934
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
X-List-Received-Date: Sat, 05 Oct 2019 21:20:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/25/19 10:05 AM, msft.dantran@gmail.com wrote:
> From: Dan Tran <dantran@microsoft.com>
>
> Signed-off-by: Dan Tran <dantran@microsoft.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   3 +-
>  .../qemu/qemu/CVE-2019-8934.patch             | 215 ++++++++++++++++++
>  2 files changed, 217 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index e503aa866d..1f8c1b3135 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,7 +30,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0018-fix-CVE-2018-20191.patch \
>             file://0019-fix-CVE-2018-20216.patch \
>             file://CVE-2019-3812.patch \
> -           "
> +	   file://CVE-2019-8934.patch \

This is causing build errors in YP AB. Maybe its related to this patch
not being against what got merged to mainline warrior.

see https://errors.yoctoproject.org/Errors/Details/272786/

- armin
> +	   "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
>  SRC_URI[md5sum] = "fb687ce0b02d3bf4327e36d3b99427a8"
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
> new file mode 100644
> index 0000000000..d1d7d23968
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
> @@ -0,0 +1,215 @@
> +From 8c2e30a92d95d89e2cf45d229bce274881026cf7 Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Mon, 18 Feb 2019 23:43:49 +0530
> +Subject: [PATCH] ppc: add host-serial and host-model machine attributes
> + (CVE-2019-8934)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On ppc hosts, hypervisor shares following system attributes
> +
> +  - /proc/device-tree/system-id
> +  - /proc/device-tree/model
> +
> +with a guest. This could lead to information leakage and misuse.[*]
> +Add machine attributes to control such system information exposure
> +to a guest.
> +
> +[*] https://wiki.openstack.org/wiki/OSSN/OSSN-0028
> +
> +Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> +Fix-suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Message-Id: <20190218181349.23885-1-ppandit@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +Reviewed-by: Greg Kurz <groug@kaod.org>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +
> +CVE: CVE-2019-8934
> +Upstream-Status: Backport
> +[https://github.com/qemu/qemu/commit/27461d69a0f108dea756419251acc3ea65198f1b]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + hw/ppc/spapr.c         | 128 ++++++++++++++++++++++++++++++++++++++---
> + include/hw/ppc/spapr.h |   2 +
> + 2 files changed, 123 insertions(+), 7 deletions(-)
> +
> +diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> +index 7afd1a175b..bcee7c162d 100644
> +--- a/hw/ppc/spapr.c
> ++++ b/hw/ppc/spapr.c
> +@@ -1244,13 +1244,30 @@ static void *spapr_build_fdt(sPAPRMachineState *spapr,
> +      * Add info to guest to indentify which host is it being run on
> +      * and what is the uuid of the guest
> +      */
> +-    if (kvmppc_get_host_model(&buf)) {
> +-        _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
> +-        g_free(buf);
> ++    if (spapr->host_model && !g_str_equal(spapr->host_model, "none")) {
> ++        if (g_str_equal(spapr->host_model, "passthrough")) {
> ++            /* -M host-model=passthrough */
> ++            if (kvmppc_get_host_model(&buf)) {
> ++                _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
> ++                g_free(buf);
> ++            }
> ++        } else {
> ++            /* -M host-model=<user-string> */
> ++            _FDT(fdt_setprop_string(fdt, 0, "host-model", spapr->host_model));
> ++        }
> +     }
> +-    if (kvmppc_get_host_serial(&buf)) {
> +-        _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
> +-        g_free(buf);
> ++
> ++    if (spapr->host_serial && !g_str_equal(spapr->host_serial, "none")) {
> ++        if (g_str_equal(spapr->host_serial, "passthrough")) {
> ++            /* -M host-serial=passthrough */
> ++            if (kvmppc_get_host_serial(&buf)) {
> ++                _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
> ++                g_free(buf);
> ++            }
> ++        } else {
> ++            /* -M host-serial=<user-string> */
> ++            _FDT(fdt_setprop_string(fdt, 0, "host-serial", spapr->host_serial));
> ++        }
> +     }
> + 
> +     buf = qemu_uuid_unparse_strdup(&qemu_uuid);
> +@@ -3031,6 +3048,73 @@ static void spapr_set_vsmt(Object *obj, Visitor *v, const char *name,
> +     visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> + }
> + 
> ++static char *spapr_get_ic_mode(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    if (spapr->irq == &spapr_irq_xics_legacy) {
> ++        return g_strdup("legacy");
> ++    } else if (spapr->irq == &spapr_irq_xics) {
> ++        return g_strdup("xics");
> ++    } else if (spapr->irq == &spapr_irq_xive) {
> ++        return g_strdup("xive");
> ++    } else if (spapr->irq == &spapr_irq_dual) {
> ++        return g_strdup("dual");
> ++    }
> ++    g_assert_not_reached();
> ++}
> ++
> ++static void spapr_set_ic_mode(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
> ++        error_setg(errp, "This machine only uses the legacy XICS backend, don't pass ic-mode");
> ++        return;
> ++    }
> ++
> ++    /* The legacy IRQ backend can not be set */
> ++    if (strcmp(value, "xics") == 0) {
> ++        spapr->irq = &spapr_irq_xics;
> ++    } else if (strcmp(value, "xive") == 0) {
> ++        spapr->irq = &spapr_irq_xive;
> ++    } else if (strcmp(value, "dual") == 0) {
> ++        spapr->irq = &spapr_irq_dual;
> ++    } else {
> ++        error_setg(errp, "Bad value for \"ic-mode\" property");
> ++    }
> ++}
> ++
> ++static char *spapr_get_host_model(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    return g_strdup(spapr->host_model);
> ++}
> ++
> ++static void spapr_set_host_model(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    g_free(spapr->host_model);
> ++    spapr->host_model = g_strdup(value);
> ++}
> ++
> ++static char *spapr_get_host_serial(Object *obj, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    return g_strdup(spapr->host_serial);
> ++}
> ++
> ++static void spapr_set_host_serial(Object *obj, const char *value, Error **errp)
> ++{
> ++    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> ++
> ++    g_free(spapr->host_serial);
> ++    spapr->host_serial = g_strdup(value);
> ++}
> ++
> + static void spapr_instance_init(Object *obj)
> + {
> +     sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
> +@@ -3067,6 +3151,25 @@ static void spapr_instance_init(Object *obj)
> +                                     " the host's SMT mode", &error_abort);
> +     object_property_add_bool(obj, "vfio-no-msix-emulation",
> +                              spapr_get_msix_emulation, NULL, NULL);
> ++
> ++    /* The machine class defines the default interrupt controller mode */
> ++    spapr->irq = smc->irq;
> ++    object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> ++                            spapr_set_ic_mode, NULL);
> ++    object_property_set_description(obj, "ic-mode",
> ++                 "Specifies the interrupt controller mode (xics, xive, dual)",
> ++                 NULL);
> ++
> ++    object_property_add_str(obj, "host-model",
> ++        spapr_get_host_model, spapr_set_host_model,
> ++        &error_abort);
> ++    object_property_set_description(obj, "host-model",
> ++        "Set host's model-id to use - none|passthrough|string", &error_abort);
> ++    object_property_add_str(obj, "host-serial",
> ++        spapr_get_host_serial, spapr_set_host_serial,
> ++        &error_abort);
> ++    object_property_set_description(obj, "host-serial",
> ++        "Set host's system-id to use - none|passthrough|string", &error_abort);
> + }
> + 
> + static void spapr_machine_finalizefn(Object *obj)
> +@@ -3965,7 +4068,18 @@ static void spapr_machine_3_1_instance_options(MachineState *machine)
> + 
> + static void spapr_machine_3_1_class_options(MachineClass *mc)
> + {
> +-    /* Defaults for the latest behaviour inherited from the base class */
> ++    sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> ++    static GlobalProperty compat[] = {
> ++        { TYPE_SPAPR_MACHINE, "host-model", "passthrough" },
> ++        { TYPE_SPAPR_MACHINE, "host-serial", "passthrough" },
> ++    };
> ++
> ++    spapr_machine_4_0_class_options(mc);
> ++    compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
> ++    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
> ++
> ++    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
> ++    smc->update_dt_enabled = false;
> + }
> + 
> + DEFINE_SPAPR_MACHINE(3_1, "3.1", true);
> +diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> +index 6279711fe8..63692a13bd 100644
> +--- a/include/hw/ppc/spapr.h
> ++++ b/include/hw/ppc/spapr.h
> +@@ -171,6 +171,8 @@ struct sPAPRMachineState {
> + 
> +     /*< public >*/
> +     char *kvm_type;
> ++    char *host_model;
> ++    char *host_serial;
> + 
> +     const char *icp_type;
> +     int32_t irq_map_nr;
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +


