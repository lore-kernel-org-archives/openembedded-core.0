Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC078C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 05:07:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36151.1722402442538353792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 22:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8942b62a52=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4ESMc002990
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 22:07:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40n0dfudmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 22:07:21 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 22:07:19 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] qemu: upgrade 8.2.2 -> 8.2.3
Date: Wed, 31 Jul 2024 05:07:00 +0000
Message-ID: <20240731050700.1594038-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Cb64Ft_R5ffAc-qoykyMTr0Iz6_t8w84
X-Proofpoint-ORIG-GUID: Cb64Ft_R5ffAc-qoykyMTr0Iz6_t8w84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_02,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407310036
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46V4ESMc002990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202691

From: Yogita Urade <yogita.urade@windriver.com>

This includes fix for: CVE-2024-26327, CVE-2024-26328 and CVE-2024-3447

General changelog for 8.2: https://wiki.qemu.org/ChangeLog/8.2

Droped 0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch,
CVE-2024-3446 and CVE-2024-3567 since already contained the fix.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...u-native_8.2.2.bb =3D> qemu-native_8.2.3.bb} |  0
 ...e_8.2.2.bb =3D> qemu-system-native_8.2.3.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  8 +-
 ...4-Handle-the-vsyscall-page-in-open_s.patch | 56 --------------
 .../qemu/qemu/CVE-2024-3446-01.patch          | 73 -------------------
 .../qemu/qemu/CVE-2024-3446-02.patch          | 48 ------------
 .../qemu/qemu/CVE-2024-3446-03.patch          | 47 ------------
 .../qemu/qemu/CVE-2024-3446-04.patch          | 52 -------------
 .../qemu/qemu/CVE-2024-3567.patch             | 48 ------------
 .../qemu/{qemu_8.2.2.bb =3D> qemu_8.2.3.bb}     |  0
 10 files changed, 1 insertion(+), 331 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.2.bb =3D> qemu-native=
_8.2.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.2.bb =3D> qemu=
-system-native_8.2.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_6=
4-Handle-the-vsyscall-page-in-open_s.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patc=
h
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patc=
h
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patc=
h
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patc=
h
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.2.bb =3D> qemu_8.2.3.bb} (10=
0%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.2.bb b/meta/recip=
es-devtools/qemu/qemu-native_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb b/met=
a/recipes-devtools/qemu/qemu-system-native_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e121ae70cc..41af9ca045 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,18 +34,12 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://fixedmeson.patch \
            file://no-pip.patch \
            file://4a8579ad8629b57a43daa62e46cc7af6e1078116.patch \
-           file://0001-linux-user-x86_64-Handle-the-vsyscall-page-in-ope=
n_s.patch \
            file://0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA=
.patch \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-se=
lf-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-           file://CVE-2024-3446-01.patch \
-           file://CVE-2024-3446-02.patch \
-           file://CVE-2024-3446-03.patch \
-           file://CVE-2024-3446-04.patch \
-           file://CVE-2024-3567.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
@@ -62,7 +56,7 @@ SRC_URI:append:class-native =3D " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch =
\
         "
=20
-SRC_URI[sha256sum] =3D "847346c1b82c1a54b2c38f6edbd85549edeb17430b7d4d3d=
a12620e2962bc4f3"
+SRC_URI[sha256sum] =3D "dc747fb366809455317601c4876bd1f6829a32a23e83fb76=
e45ab12c2a569964"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handl=
e-the-vsyscall-page-in-open_s.patch b/meta/recipes-devtools/qemu/qemu/000=
1-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
deleted file mode 100644
index 2eaebe883c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-v=
syscall-page-in-open_s.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4517e2046610722879761bcdb60edbb2b929c848 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:14 -1000
-Subject: [PATCH 1/5] linux-user/x86_64: Handle the vsyscall page in
- open_self_maps_{2,4}
-
-This is the only case in which we expect to have no host memory backing
-for a guest memory page, because in general linux user processes cannot
-map any pages in the top half of the 64-bit address space.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nong=
nu.org/msg1026793.html]
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2170
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/syscall.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index a114f29a8..8307a8a61 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -7922,6 +7922,10 @@ static void open_self_maps_4(const struct open_se=
lf_maps_data *d,
-         path =3D "[heap]";
-     } else if (start =3D=3D info->vdso) {
-         path =3D "[vdso]";
-+#ifdef TARGET_X86_64
-+    } else if (start =3D=3D TARGET_VSYSCALL_PAGE) {
-+        path =3D "[vsyscall]";
-+#endif
-     }
-=20
-     /* Except null device (MAP_ANON), adjust offset for this fragment. =
*/
-@@ -8010,6 +8014,18 @@ static int open_self_maps_2(void *opaque, target_=
ulong guest_start,
-     uintptr_t host_start =3D (uintptr_t)g2h_untagged(guest_start);
-     uintptr_t host_last =3D (uintptr_t)g2h_untagged(guest_end - 1);
-=20
-+#ifdef TARGET_X86_64
-+    /*
-+     * Because of the extremely high position of the page within the gu=
est
-+     * virtual address space, this is not backed by host memory at all.
-+     * Therefore the loop below would fail.  This is the only instance
-+     * of not having host backing memory.
-+     */
-+    if (guest_start =3D=3D TARGET_VSYSCALL_PAGE) {
-+        return open_self_maps_3(opaque, guest_start, guest_end, flags);
-+    }
-+#endif
-+
-     while (1) {
-         IntervalTreeNode *n =3D
-             interval_tree_iter_first(d->host_maps, host_start, host_sta=
rt);
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
deleted file mode 100644
index 15dbca92cd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-rom eb546a3f49f45e6870ec91d792cd09f8a662c16e Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
-Date: Thu, 4 Apr 2024 20:56:11 +0200
-Subject: [PATCH] hw/virtio: Introduce virtio_bh_new_guarded() helper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Introduce virtio_bh_new_guarded(), similar to qemu_bh_new_guarded()
-but using the transport memory guard, instead of the device one
-(there can only be one virtio device per virtio bus).
-
-Inspired-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-2-philmd@linaro.org>
-(cherry picked from commit ec0504b989ca61e03636384d3602b7bf07ffe4da)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/eb546a3f49f45e6870ec91d792cd09f8a662c16e]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/virtio/virtio.c         | 10 ++++++++++
- include/hw/virtio/virtio.h |  7 +++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
-index 3a160f86e..8590b8971 100644
---- a/hw/virtio/virtio.c
-+++ b/hw/virtio/virtio.c
-@@ -4095,3 +4095,13 @@ static void virtio_register_types(void)
- }
-=20
- type_init(virtio_register_types)
-+
-+QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
-+                                   QEMUBHFunc *cb, void *opaque,
-+                                   const char *name)
-+{
-+    DeviceState *transport =3D qdev_get_parent_bus(dev)->parent;
-+
-+    return qemu_bh_new_full(cb, opaque, name,
-+                            &transport->mem_reentrancy_guard);
-+}
-diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
-index c8f72850b..7d5ffdc14 100644
---- a/include/hw/virtio/virtio.h
-+++ b/include/hw/virtio/virtio.h
-@@ -22,6 +22,7 @@
- #include "standard-headers/linux/virtio_config.h"
- #include "standard-headers/linux/virtio_ring.h"
- #include "qom/object.h"
-+#include "block/aio.h"
-=20
- /*
-  * A guest should never accept this. It implies negotiation is broken
-@@ -508,4 +509,10 @@ static inline bool virtio_device_disabled(VirtIODev=
ice *vdev)
- bool virtio_legacy_allowed(VirtIODevice *vdev);
- bool virtio_legacy_check_disabled(VirtIODevice *vdev);
-=20
-+QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
-+                                   QEMUBHFunc *cb, void *opaque,
-+                                   const char *name);
-+#define virtio_bh_new_guarded(dev, cb, opaque) \
-+    virtio_bh_new_guarded_full((dev), (cb), (opaque), (stringify(cb)))
-+
- #endif
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
deleted file mode 100644
index 843ed43ba8..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 4f01537ced3e787bd985b8f8de5869b92657160a Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
-Date: Thu, 4 Apr 2024 20:56:41 +0200
-Subject: [PATCH] hw/virtio/virtio-crypto: Protect from DMA re-entrancy b=
ugs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
-so the bus and device use the same guard. Otherwise the
-DMA-reentrancy protection can be bypassed.
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Suggested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-5-philmd@linaro.org>
-(cherry picked from commit f4729ec39ad97a42ceaa7b5697f84f440ea6e5dc)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/4f01537ced3e787bd985b8f8de5869b92657160a]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/virtio/virtio-crypto.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
-index 0e2cc8d5a..4aaced74b 100644
---- a/hw/virtio/virtio-crypto.c
-+++ b/hw/virtio/virtio-crypto.c
-@@ -1080,8 +1080,8 @@ static void virtio_crypto_device_realize(DeviceSta=
te *dev, Error **errp)
-         vcrypto->vqs[i].dataq =3D
-                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_data=
q_bh);
-         vcrypto->vqs[i].dataq_bh =3D
--                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->=
vqs[i],
--                                     &dev->mem_reentrancy_guard);
-+                 virtio_bh_new_guarded(dev, virtio_crypto_dataq_bh,
-+                                       &vcrypto->vqs[i]);
-         vcrypto->vqs[i].vcrypto =3D vcrypto;
-     }
-=20
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
deleted file mode 100644
index a24652dea3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fbeb0a160cbcc067c0e1f0d380cea4a31de213e3 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
-Date: Thu, 4 Apr 2024 20:56:35 +0200
-Subject: [PATCH] hw/char/virtio-serial-bus: Protect from DMA re-entrancy=
 bugs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
-so the bus and device use the same guard. Otherwise the
-DMA-reentrancy protection can be bypassed.
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Suggested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-4-philmd@linaro.org>
-(cherry picked from commit b4295bff25f7b50de1d9cc94a9c6effd40056bca)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/fbeb0a160cbcc067c0e1f0d380cea4a31de213e3]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/char/virtio-serial-bus.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
-index dd619f073..1221fb7f1 100644
---- a/hw/char/virtio-serial-bus.c
-+++ b/hw/char/virtio-serial-bus.c
-@@ -985,8 +985,7 @@ static void virtser_port_device_realize(DeviceState =
*dev, Error **errp)
-         return;
-     }
-=20
--    port->bh =3D qemu_bh_new_guarded(flush_queued_data_bh, port,
--                                   &dev->mem_reentrancy_guard);
-+    port->bh =3D virtio_bh_new_guarded(dev, flush_queued_data_bh, port)=
;
-     port->elem =3D NULL;
- }
-=20
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
deleted file mode 100644
index 7f0293242d..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 1b2a52712b249e14d246cd9c7db126088e6e64db Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
-Date: Thu, 4 Apr 2024 20:56:27 +0200
-Subject: [PATCH] hw/display/virtio-gpu: Protect from DMA re-entrancy bug=
s
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-qemu-system-i386: warning: Blocked re-entrant IO on MemoryRegion: virtio=
-pci-common-virtio-gpu at addr: 0x6
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Yongkang Jia <kangel@zju.edu.cn>
-Reported-by: Xiao Lei <nop.leixiao@gmail.com>
-Reported-by: Yiming Tao <taoym@zju.edu.cn>
-Buglink: https://bugs.launchpad.net/qemu/+bug/1888606
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-3-philmd@linaro.org>
-(cherry picked from commit ba28e0ff4d95b56dc334aac2730ab3651ffc3132)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/1b2a52712b249e14d246cd9c7db126088e6e64db]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/display/virtio-gpu.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
-index b016d3bac..a7b16ba07 100644
---- a/hw/display/virtio-gpu.c
-+++ b/hw/display/virtio-gpu.c
-@@ -1463,10 +1463,8 @@ void virtio_gpu_device_realize(DeviceState *qdev,=
 Error **errp)
-=20
-     g->ctrl_vq =3D virtio_get_queue(vdev, 0);
-     g->cursor_vq =3D virtio_get_queue(vdev, 1);
--    g->ctrl_bh =3D qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
--                                     &qdev->mem_reentrancy_guard);
--    g->cursor_bh =3D qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
--                                       &qdev->mem_reentrancy_guard);
-+    g->ctrl_bh =3D virtio_bh_new_guarded(qdev, virtio_gpu_ctrl_bh, g);
-+    g->cursor_bh =3D virtio_bh_new_guarded(qdev, virtio_gpu_cursor_bh, =
g);
-     g->reset_bh =3D qemu_bh_new(virtio_gpu_reset_bh, g);
-     qemu_cond_init(&g->reset_cond);
-     QTAILQ_INIT(&g->reslist);
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2024-3567.patch
deleted file mode 100644
index f14178f881..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1cfe45956e03070f894e91b304e233b4d5b99719 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
-Date: Tue, 9 Apr 2024 19:54:05 +0200
-Subject: [PATCH] hw/net/net_tx_pkt: Fix overrun in update_sctp_checksum(=
)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-If a fragmented packet size is too short, do not try to
-calculate its checksum.
-
-Fixes: CVE-2024-3567
-Cc: qemu-stable@nongnu.org
-Reported-by: Zheyu Ma <zheyuma97@gmail.com>
-Fixes: f199b13bc1 ("igb: Implement Tx SCTP CSO")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2273
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
-Acked-by: Jason Wang <jasowang@redhat.com>
-Message-Id: <20240410070459.49112-1-philmd@linaro.org>
-(cherry picked from commit 83ddb3dbba2ee0f1767442ae6ee665058aeb1093)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/1cfe45956e03070f894e91b304e233b4d5b99719]
-CVE: CVE-2024-3567
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/net/net_tx_pkt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
-index 2e5f58b3c..d40d508a1 100644
---- a/hw/net/net_tx_pkt.c
-+++ b/hw/net/net_tx_pkt.c
-@@ -141,6 +141,10 @@ bool net_tx_pkt_update_sctp_checksum(struct NetTxPk=
t *pkt)
-     uint32_t csum =3D 0;
-     struct iovec *pl_start_frag =3D pkt->vec + NET_TX_PKT_PL_START_FRAG=
;
-=20
-+    if (iov_size(pl_start_frag, pkt->payload_frags) < 8 + sizeof(csum))=
 {
-+        return false;
-+    }
-+
-     if (iov_from_buf(pl_start_frag, pkt->payload_frags, 8, &csum, sizeo=
f(csum)) < sizeof(csum)) {
-         return false;
-     }
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.2.bb b/meta/recipes-devt=
ools/qemu/qemu_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.3.bb
--=20
2.40.0


