Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADFD7F502
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:30 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u12so3920899pgb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=fxyNfpdR0ubEkMSW+lJ9+ZF0t1Zol3SToW1F8HJ/d7U=;
	b=Mau+gjC6ZzM+mbAm8vi+0XhwveCgKgSsFWw5y52+rCyhKCj55BbpFziwaKS6qgocDN
	H3RkgOWu3dHM2BlGdCKf1NAl93b6vpf3tavd2ePsVp9BSguTJd5aNpEJ8RtuCHrPDD/G
	9hiqz6DP32VujK3jcFtf87+l/lmFQQXmxhnkSa+ID+3EVuIwgoUYC+sg05AQwULw+2Rd
	xu/wattLRy+sPPIDd+7Th/y7jSYvUhVGaOHu2qRBZZk5TS1EK1XfTnhN7+WbMWgLuxE1
	QDdLWDQIexYHIIL7OaG0YfPf7FTMDThd4egyuCX93xs8NgOT4VALZJ8qNkBd0yVI1Pnz
	UzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=fxyNfpdR0ubEkMSW+lJ9+ZF0t1Zol3SToW1F8HJ/d7U=;
	b=V8bX6lKrs2+f3uGT3MqkOowbYmQcxlHJjbXvmsvj7IcLmaQkx9NXlDBIykZsQsOn5A
	0+z6NURqJBqiZhDu6sqV+nZyRLEyER4f0zGTnBH/6j26NdZY0PbNPgwUdC1mNP52CLb1
	e+wGvtnb5fAD72c96o+dE6KvP30ZSALtv6j+amJ564qqo5XGFi7+vvqUfpcpC8pCCxq/
	dLQoafRMfzDwBO0SRqczThY2VEHpYMZzFwTM5ubfh6Udn5cN+bcl6ldVuTeTCvmZb0QE
	xH+w7tu+CXs6ThdHwlc2ajmryaqs4ZreBXjAEaeDXIwRNRk3wPSDizKlluVt3D5zOFgs
	P3ZQ==
X-Gm-Message-State: APjAAAUnuXaqpeCSKm752OlExoTwAzuDo3jX1cjdgSJroWn60BcvFiBk
	B1UCJxlZ4+d/Nt+kBtzftOShx7Wq
X-Google-Smtp-Source: APXvYqw9lVjckxY5yGwjTTV8h/jxi/Pd3ESntbb0MZIUcADyRvGf/uEo5F7D+hvBVXqBFZO/d/p/3w==
X-Received: by 2002:a65:408a:: with SMTP id t10mr11944363pgp.385.1570722570781;
	Thu, 10 Oct 2019 08:49:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:14 -0700
Message-Id: <e4b6a39bdf1b660233a7145599cd4fc3e971fc8f.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 02/12] qemu: Fix 4 CVEs
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dan Tran <dantran@microsoft.com>

Fixes CVE-2018-18954, CVE-2019-3812, CVE-2019-6778, and CVE-2019-8934.
Also deleted duplicated patch and cleanup.

Signed-off-by: Dan Tran <dantran@microsoft.com>
[fixup for thud-next]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../qemu/qemu/CVE-2018-10839.patch                 |   2 +-
 .../qemu/qemu/CVE-2018-17958.patch                 |  52 -----
 .../qemu/qemu/CVE-2018-18954.patch                 |  50 +++++
 .../recipes-devtools/qemu/qemu/CVE-2019-3812.patch |  39 ++++
 .../recipes-devtools/qemu/qemu/CVE-2019-6778.patch |  41 ++++
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   6 +-
 7 files changed, 351 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
index 7e1e442..81607c9 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
@@ -19,7 +19,7 @@ Signed-off-by: Jason Wang <jasowang@redhat.com>
 Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff
 ;h=fdc89e90fac40c5ca2686733df17b6423fb8d8fb#patch1]
 
-CVE: CVE-2018-10839
+CVE: CVE-2018-10839 CVE-2018-17958
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
deleted file mode 100644
index af40ff2..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2018-17958.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 06e88ca78d056ea4de885e3a1496805179dc47bc Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 15 Oct 2018 16:33:04 +0800
-Subject: [PATCH] ne2000: fix possible out of bound access in ne2000_receive
-
-In ne2000_receive(), we try to assign size_ to size which converts
-from size_t to integer. This will cause troubles when size_ is greater
-INT_MAX, this will lead a negative value in size and it can then pass
-the check of size < MIN_BUF_SIZE which may lead out of bound access of
-for both buf and buf1.
-
-Fixing by converting the type of size to size_t.
-
-CC: address@hidden
-Reported-by: Daniel Shapira <address@hidden>
-Reviewed-by: Michael S. Tsirkin <address@hidden>
-Signed-off-by: Jason Wang <address@hidden>
-
-Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03273.html]
-
-CVE: CVE-2018-17958
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- hw/net/ne2000.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
-index 07d79e3..869518e 100644
---- a/hw/net/ne2000.c
-+++ b/hw/net/ne2000.c
-@@ -174,7 +174,7 @@ static int ne2000_buffer_full(NE2000State *s)
- ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
- {
-     NE2000State *s = qemu_get_nic_opaque(nc);
--    int size = size_;
-+    size_t size = size_;
-     uint8_t *p;
-     unsigned int total_len, next, avail, len, index, mcast_idx;
-     uint8_t buf1[60];
-@@ -182,7 +182,7 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
-         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
- 
- #if defined(DEBUG_NE2000)
--    printf("NE2000: received len=%d\n", size);
-+    printf("NE2000: received len=%zu\n", size);
- #endif
- 
-     if (s->cmd & E8390_STOP || ne2000_buffer_full(s))
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
new file mode 100644
index 0000000..9fe1364
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18954.patch
@@ -0,0 +1,50 @@
+From 3c9fd43da473a324f6cc7a0d3db58f651a2d262c Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 26 Oct 2018 18:03:58 +0530
+Subject: [PATCH] ppc/pnv: check size before data buffer access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While performing PowerNV memory r/w operations, the access length
+'sz' could exceed the data[4] buffer size. Add check to avoid OOB
+access.
+
+Reported-by: Moguofang <moguofang@huawei.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Cédric Le Goater <clg@kaod.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+
+CVE: CVE-2018-18954
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=commit;h=d07945e78eb6b593cd17a4640c1fc9eb35e3245d]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ hw/ppc/pnv_lpc.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
+index d7721320a2..172a915cfc 100644
+--- a/hw/ppc/pnv_lpc.c
++++ b/hw/ppc/pnv_lpc.c
+@@ -155,9 +155,15 @@ static void pnv_lpc_do_eccb(PnvLpcController *lpc, uint64_t cmd)
+     /* XXX Check for magic bits at the top, addr size etc... */
+     unsigned int sz = (cmd & ECCB_CTL_SZ_MASK) >> ECCB_CTL_SZ_LSH;
+     uint32_t opb_addr = cmd & ECCB_CTL_ADDR_MASK;
+-    uint8_t data[4];
++    uint8_t data[8];
+     bool success;
+ 
++    if (sz > sizeof(data)) {
++        qemu_log_mask(LOG_GUEST_ERROR,
++            "ECCB: invalid operation at @0x%08x size %d\n", opb_addr, sz);
++        return;
++    }
++
+     if (cmd & ECCB_CTL_READ) {
+         success = opb_read(lpc, opb_addr, data, sz);
+         if (success) {
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
new file mode 100644
index 0000000..0e11ad2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
@@ -0,0 +1,39 @@
+From b664d9d003d1a98642dcfb8e6fceef6dbf3d52d8 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 8 Jan 2019 11:23:01 +0100
+Subject: [PATCH] i2c-ddc: fix oob read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Suggested-by: Michael Hanselmann <public@hansmi.ch>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Michael Hanselmann <public@hansmi.ch>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 20190108102301.1957-1-kraxel@redhat.com
+
+CVE: CVE-2019-3812
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=commit;h=b05b267840515730dbf6753495d5b7bd8b04ad1c]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ hw/i2c/i2c-ddc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
+index bec0c91e2d..89e659288e 100644
+--- a/hw/i2c/i2c-ddc.c
++++ b/hw/i2c/i2c-ddc.c
+@@ -247,7 +247,7 @@ static int i2c_ddc_rx(I2CSlave *i2c)
+     I2CDDCState *s = I2CDDC(i2c);
+ 
+     int value;
+-    value = s->edid_blob[s->reg];
++    value = s->edid_blob[s->reg % sizeof(s->edid_blob)];
+     s->reg++;
+     return value;
+ }
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
new file mode 100644
index 0000000..5b14596
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-6778.patch
@@ -0,0 +1,41 @@
+From b6c0fa3b435375918714e107b22de2ef13a41c26 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Sun, 13 Jan 2019 23:29:48 +0530
+Subject: [PATCH] slirp: check data length while emulating ident function
+
+While emulating identification protocol, tcp_emu() does not check
+available space in the 'sc_rcv->sb_data' buffer. It could lead to
+heap buffer overflow issue. Add check to avoid it.
+
+Reported-by: Kira <864786842@qq.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+
+CVE: CVE-2019-6778
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=commit;h=a7104eda7dab99d0cdbd3595c211864cba415905]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ slirp/tcp_subr.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/slirp/tcp_subr.c b/slirp/tcp_subr.c
+index 8d0f94b75f..7277aadfdf 100644
+--- a/slirp/tcp_subr.c
++++ b/slirp/tcp_subr.c
+@@ -640,6 +640,11 @@ tcp_emu(struct socket *so, struct mbuf *m)
+ 			socklen_t addrlen = sizeof(struct sockaddr_in);
+ 			struct sbuf *so_rcv = &so->so_rcv;
+ 
++			if (m->m_len > so_rcv->sb_datalen
++					- (so_rcv->sb_wptr - so_rcv->sb_data)) {
++			    return 1;
++			}
++
+ 			memcpy(so_rcv->sb_wptr, m->m_data, m->m_len);
+ 			so_rcv->sb_wptr += m->m_len;
+ 			so_rcv->sb_rptr += m->m_len;
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
new file mode 100644
index 0000000..db3201c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
@@ -0,0 +1,215 @@
+From 13e153f01b4f2a3e199202b34a247d83c176f21a Mon Sep 17 00:00:00 2001
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
+index 421b2dd09b..069d678ee0 100644
+--- a/hw/ppc/spapr.c
++++ b/hw/ppc/spapr.c
+@@ -1266,13 +1266,30 @@ static void *spapr_build_fdt(sPAPRMachineState *spapr,
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
+@@ -3027,6 +3044,73 @@ static void spapr_set_vsmt(Object *obj, Visitor *v, const char *name,
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
+@@ -3063,6 +3147,25 @@ static void spapr_instance_init(Object *obj)
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
+@@ -4067,7 +4170,18 @@ static void spapr_machine_3_0_instance_options(MachineState *machine)
+ 
+ static void spapr_machine_3_0_class_options(MachineClass *mc)
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
+ DEFINE_SPAPR_MACHINE(3_0, "3.0", true);
+diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
+index 7e5de1a6fd..4c69a55374 100644
+--- a/include/hw/ppc/spapr.h
++++ b/include/hw/ppc/spapr.h
+@@ -165,6 +165,8 @@ struct sPAPRMachineState {
+ 
+     /*< public >*/
+     char *kvm_type;
++    char *host_model;
++    char *host_serial;
+ 
+     const char *icp_type;
+ 
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index f02e312..6c3049b 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
+           file://CVE-2018-10839.patch\
            file://CVE-2018-15746.patch \
-           file://CVE-2018-17958.patch \
            file://CVE-2018-17962.patch \
            file://CVE-2018-17963.patch \
            file://CVE-2018-16867.patch \
@@ -36,6 +36,10 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-20815_p2.patch \
            file://CVE-2019-9824.patch \
            file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
+           file://CVE-2018-18954.patch \
+           file://CVE-2019-3812.patch \
+           file://CVE-2019-6778.patch \
+           file://CVE-2019-8934.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


