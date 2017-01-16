Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id B680571AD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:36:49 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id a10so71348127ywa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uO14yha2KiD/Is0JS2+RSM2mol74PCV7NIORpgUxfn8=;
	b=TM+1712cOwS0x+Dbt4uhDlQHijk4n8Ze2Pt41ixpTYJDGeZaJ/l7dvqMgY4ZrBGgxd
	pnQQ4L75bc9OfuFYP41Fa3zl/VUnWZpm7ybes/U8MieKxGnYtM7az2z9QsINo54BJwZ7
	eai++yTwiTQSi/6s+IAslcYBgP7QwetYHRoUodYhl0yjXd0pykI5Vs1mPwANj23ogwdN
	l5GYlxXd69f3RMQvI8ugWDEKQeNHiB3NpkIGIVYb7Y1guvJh3h5IXE0ZnOerAS1ZnPOZ
	QThFtiRGIQ9Vx1Sc6xhrITjSEpr45cUVlmTtWzp+PFNyUaYIm7IDIoYJ6Fgxd6dS736F
	Rcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uO14yha2KiD/Is0JS2+RSM2mol74PCV7NIORpgUxfn8=;
	b=Nohu3Zafm/T5biCmgROwZwvHPJSzjvpZnqJDNhduIg7+qMJyZ7BkzSh6FgKbTLt5Ae
	9SdD8joQKRnbVIDFGAImlt9OgFkbNAQa56K+CHl74/qSc+JjBLGJS2lE96qvhNfYn7YX
	1tN/0IHMJsW0iP2eKRzSPFGtZjHZvu33+LeWnD7+5YCcbjoDncpHn1fkjYjHG0PSrpPV
	rw6Wl/DDhCzKqtCKZhjsIWgALHCS75QZ81MyMOQ0M8IirpPMXr7xeW9oqRCSaUiwhdJr
	uDuIeicMaLxDgUZm3zb1tMqohT0xCtuy/DWTwmQBL5+5aNqzTY1WvVd7VBmB+Rs3DZbd
	w3fA==
X-Gm-Message-State: AIkVDXJGLI+HS4dyIS06021eEYspR9nriol0QwxRolqzKkzcgmiU0FeZG5VXGq6/t7stBLTdY16a0YZSUgCBwhXU
X-Received: by 10.55.183.133 with SMTP id h127mr6141015qkf.121.1484584609000; 
	Mon, 16 Jan 2017 08:36:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 16 Jan 2017 08:36:28 -0800 (PST)
In-Reply-To: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jan 2017 16:36:28 +0000
Message-ID: <CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Mon, 16 Jan 2017 16:36:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600564244cc054638cabb

--94eb2c0600564244cc054638cabb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Looks like this is broken for ppc when building gobject-introspection:

http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=3D%20gobje=
ct-introspection:%20do_compile&type=3Dfailure&page=3D1

(top seven results in ross/mut2)

Ross

On 12 January 2017 at 16:19, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> Rebased patches:
>
> - exclude-some-arm-EABI-obsolete-syscalls.patc
>
> Removed patches (already in upstream):
>
> - 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> - 0002-fix-CVE-2016-7423.patch
> - 0003-fix-CVE-2016-7908.patch
> - 0004-fix-CVE-2016-7909.patch
> - Qemu-Arm-versatilepb-Add-memory-size-checking.patch
> - 0001-target-mips-add-24KEc-CPU-definition.patch
>
> Changelog,
>
> http://wiki.qemu.org/ChangeLog/2.8
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/conf/auto.conf                                |  6 ++
>  meta/recipes-devtools/qemu/qemu.inc                |  3 -
>  ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch | 71
> ----------------------
>  ...0001-target-mips-add-24KEc-CPU-definition.patch | 54 ----------------
>  ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch | 57 ----------------=
-
>  .../qemu/qemu/0002-fix-CVE-2016-7423.patch         | 45 --------------
>  .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62
> -------------------
>  .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 -------------
>  ...-Arm-versatilepb-Add-memory-size-checking.patch | 46 --------------
>  .../exclude-some-arm-EABI-obsolete-syscalls.patch  | 28 ++++-----
>  .../qemu/{qemu_2.7.0.bb =3D> qemu_2.8.0.bb}          | 10 +--
>  11 files changed, 21 insertions(+), 403 deletions(-)
>  create mode 100644 meta/conf/auto.conf
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-add-
> 24KEc-CPU-definition.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-
> inuse-in-virtio_reset.patch
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0002-fix-CVE-2016-7423.patch
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0003-fix-CVE-2016-7908.patch
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0004-fix-CVE-2016-7909.patch
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
>  rename meta/recipes-devtools/qemu/{qemu_2.7.0.bb =3D> qemu_2.8.0.bb} (58=
%)
>
> diff --git a/meta/conf/auto.conf b/meta/conf/auto.conf
> new file mode 100644
> index 0000000..492ac82
> --- /dev/null
> +++ b/meta/conf/auto.conf
> @@ -0,0 +1,6 @@
> +SSTATE_MIRRORS =3D "file://.* http://yctb01.zpn.intel.com/data/sstates/P=
ATH
> \n"
> +PREMIRRORS_prepend =3D "\
> +     git://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
> +     ftp://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
> +     http://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n \
> +     https://.*/.* http://yctb01.zpn.intel.com/data/sources/ \n"
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index b46e7f7..e3af5c2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,8 +9,6 @@ require qemu-targets.inc
>  inherit autotools ptest
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -PR =3D "r1"
> -
>  # QEMU_TARGETS is overridable variable
>  QEMU_TARGETS ?=3D "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4
> x86_64"
>
> @@ -21,7 +19,6 @@ SRC_URI =3D "\
>      file://wacom.patch \
>      file://add-ptest-in-makefile.patch \
>      file://run-ptest \
> -    file://0001-target-mips-add-24KEc-CPU-definition.patch \
>      "
>
>  SRC_URI_append_class-native =3D "\
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-
> MSI-X-cap-and-table-with-PCIDevi.patch b/meta/recipes-devtools/qemu/
> qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> deleted file mode 100644
> index 03472dd..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-
> MSI-X-cap-and-table-with-PCIDevi.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 6baa545df93253fced4fc0d52b14b98447e00473 Mon Sep 17 00:00:00 2001
> -From: Peter Xu <peterx@redhat.com>
> -Date: Mon, 28 Nov 2016 15:02:44 +0800
> -Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDevice
> -
> -Since commit e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn"),
> -kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fetch
> -MSI info. This requires that we setup MSI related fields in PCIDevice.
> -For most devices, that won't be a problem, as long as we are using
> -general interfaces like msi_init()/msix_init().
> -
> -However, for pci-assign devices, MSI/MSI-X is treated differently - PCI
> -assign devices are maintaining its own MSI table and cap information in
> -AssignedDevice struct. however that's not synced up with PCIDevice's
> -fields. That will leads to pci_get_msi_message() failed to find correct
> -MSI capability, even with an NULL msix_table.
> -
> -A quick fix is to sync up the two places: both the capability bits and
> -table address for MSI/MSI-X.
> -
> -Upstream-Status: Backport [https://lists.gnu.org/
> archive/html/qemu-devel/2016-11/msg04649.html]
> -
> -Reported-by: Changlimin <address@hidden>
> -Tested-by: Changlimin <address@hidden>
> -Cc: address@hidden
> -Fixes: e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn")
> -Signed-off-by: Peter Xu <address@hidden>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - hw/i386/kvm/pci-assign.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
> -index 8238fbc..87dcbdd 100644
> ---- a/hw/i386/kvm/pci-assign.c
> -+++ b/hw/i386/kvm/pci-assign.c
> -@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(PCIDevice
> *pci_dev, Error **errp)
> -             error_propagate(errp, local_err);
> -             return -ENOTSUP;
> -         }
> -+        dev->dev.cap_present |=3D QEMU_PCI_CAP_MSI;
> -         dev->cap.available |=3D ASSIGNED_DEVICE_CAP_MSI;
> -         /* Only 32-bit/no-mask currently supported */
> -         ret =3D pci_add_capability2(pci_dev, PCI_CAP_ID_MSI, pos, 10,
> -@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(PCIDevice
> *pci_dev, Error **errp)
> -             error_propagate(errp, local_err);
> -             return -ENOTSUP;
> -         }
> -+        dev->dev.cap_present |=3D QEMU_PCI_CAP_MSIX;
> -         dev->cap.available |=3D ASSIGNED_DEVICE_CAP_MSIX;
> -         ret =3D pci_add_capability2(pci_dev, PCI_CAP_ID_MSIX, pos, 12,
> -                                   &local_err);
> -@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_mmio(Assign=
edDevice
> *dev, Error **errp)
> -         dev->msix_table =3D NULL;
> -         return;
> -     }
> -+    dev->dev.msix_table =3D (uint8_t *)dev->msix_table;
> -
> -     assigned_dev_msix_reset(dev);
> -
> -@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_mmio(Assi=
gnedDevice
> *dev)
> -         error_report("error unmapping msix_table! %s", strerror(errno))=
;
> -     }
> -     dev->msix_table =3D NULL;
> -+    dev->dev.msix_table =3D NULL;
> - }
> -
> - static const VMStateDescription vmstate_assigned_device =3D {
> ---
> -2.8.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-C=
PU-definition.patch
> b/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-
> 24KEc-CPU-definition.patch
> deleted file mode 100644
> index c4dbee7..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-
> 24KEc-CPU-definition.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 926bc194f918d46bd93557b15da8153b6a94a1d5 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> -Date: Mon, 25 Jul 2016 23:58:22 +0100
> -Subject: [PATCH] target-mips: add 24KEc CPU definition
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Define a new CPU definition supporting 24KEc cores, similar to
> -the existing 24Kc, but with added support for DSP instructions
> -and MIPS16e (and without FPU).
> -
> -Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ----
> -Upstream-Status: Submitted [http://lists.nongnu.org/
> archive/html/qemu-devel/2016-07/msg05778.html]
> - target-mips/translate_init.c | 22 ++++++++++++++++++++++
> - 1 file changed, 22 insertions(+)
> -
> -diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
> -index 39ed5c4..6ae23e4 100644
> ---- a/target-mips/translate_init.c
> -+++ b/target-mips/translate_init.c
> -@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =3D
> -         .mmu_type =3D MMU_TYPE_R4000,
> -     },
> -     {
> -+        .name =3D "24KEc",
> -+        .CP0_PRid =3D 0x00019600,
> -+        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> -+                       (MMU_TYPE_R4000 << CP0C0_MT),
> -+        .CP0_Config1 =3D MIPS_CONFIG1 | (15 << CP0C1_MMU) |
> -+                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 <<
> CP0C1_IA) |
> -+                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 <<
> CP0C1_DA) |
> -+                       (1 << CP0C1_CA),
> -+        .CP0_Config2 =3D MIPS_CONFIG2,
> -+        .CP0_Config3 =3D MIPS_CONFIG3 | (1 << CP0C3_DSPP) | (0 <<
> CP0C3_VInt),
> -+        .CP0_LLAddr_rw_bitmask =3D 0,
> -+        .CP0_LLAddr_shift =3D 4,
> -+        .SYNCI_Step =3D 32,
> -+        .CCRes =3D 2,
> -+        /* we have a DSP, but no FPU */
> -+        .CP0_Status_rw_bitmask =3D 0x1378FF1F,
> -+        .SEGBITS =3D 32,
> -+        .PABITS =3D 32,
> -+        .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP,
> -+        .mmu_type =3D MMU_TYPE_R4000,
> -+    },
> -+    {
> -         .name =3D "24Kf",
> -         .CP0_PRid =3D 0x00019300,
> -         .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> ---
> -2.8.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in=
-virtio_reset.patch
> b/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-
> inuse-in-virtio_reset.patch
> deleted file mode 100644
> index 86955d0..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-
> inuse-in-virtio_reset.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Upstream-Status: Backport
> -
> -Supplementary fix of CVE-2016-5403 which is backported from:
> -
> -http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4b7f91e
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 4b7f91ed0270a371e1933efa21ba600b6da23ab9 Mon Sep 17 00:00:00 2001
> -From: Stefan Hajnoczi <stefanha@redhat.com>
> -Date: Wed, 7 Sep 2016 11:51:25 -0400
> -Subject: [PATCH] virtio: zero vq->inuse in virtio_reset()
> -
> -vq->inuse must be zeroed upon device reset like most other virtqueue
> -fields.
> -
> -In theory, virtio_reset() just needs assert(vq->inuse =3D=3D 0) since
> -devices must clean up in-flight requests during reset (requests cannot
> -not be leaked!).
> -
> -In practice, it is difficult to achieve vq->inuse =3D=3D 0 across reset
> -because balloon, blk, 9p, etc implement various different strategies for
> -cleaning up requests.  Most devices call g_free(elem) directly without
> -telling virtio.c that the VirtQueueElement is cleaned up.  Therefore
> -vq->inuse is not decremented during reset.
> -
> -This patch zeroes vq->inuse and trusts that devices are not leaking
> -VirtQueueElements across reset.
> -
> -I will send a follow-up series that refactors request life-cycle across
> -all devices and converts vq->inuse =3D 0 into assert(vq->inuse =3D=3D 0)=
 but
> -this more invasive approach is not appropriate for stable trees.
> -
> -Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> -Cc: qemu-stable <qemu-stable@nongnu.org>
> -Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> -Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> -Reviewed-by: Ladi Prosek <lprosek@redhat.com>
> ----
> - hw/virtio/virtio.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> -index 74c085c..e8a13a5 100644
> ---- a/hw/virtio/virtio.c
> -+++ b/hw/virtio/virtio.c
> -@@ -822,6 +822,7 @@ void virtio_reset(void *opaque)
> -         vdev->vq[i].signalled_used_valid =3D false;
> -         vdev->vq[i].notification =3D true;
> -         vdev->vq[i].vring.num =3D vdev->vq[i].vring.num_default;
> -+        vdev->vq[i].inuse =3D 0;
> -     }
> - }
> -
> ---
> -2.9.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
> b/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
> deleted file mode 100644
> index fdf58a3..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport patch to fix CVE-2016-7423 from:
> -
> -http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D670e56d3ed
> -
> -CVE: CVE-2016-7423
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 670e56d3ed2918b3861d9216f2c0540d9e9ae0d5 Mon Sep 17 00:00:00 2001
> -From: Li Qiang <liqiang6-s@360.cn>
> -Date: Mon, 12 Sep 2016 18:14:11 +0530
> -Subject: [PATCH] scsi: mptsas: use g_new0 to allocate MPTSASRequest obje=
ct
> -
> -When processing IO request in mptsas, it uses g_new to allocate
> -a 'req' object. If an error occurs before 'req->sreq' is
> -allocated, It could lead to an OOB write in mptsas_free_request
> -function. Use g_new0 to avoid it.
> -
> -Reported-by: Li Qiang <liqiang6-s@360.cn>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Message-Id: <1473684251-17476-1-git-send-email-ppandit@redhat.com>
> -Cc: qemu-stable@nongnu.org
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ----
> - hw/scsi/mptsas.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> -index 0e0a22f..eaae1bb 100644
> ---- a/hw/scsi/mptsas.c
> -+++ b/hw/scsi/mptsas.c
> -@@ -304,7 +304,7 @@ static int mptsas_process_scsi_io_request(MPTSASStat=
e
> *s,
> -         goto bad;
> -     }
> -
> --    req =3D g_new(MPTSASRequest, 1);
> -+    req =3D g_new0(MPTSASRequest, 1);
> -     QTAILQ_INSERT_TAIL(&s->pending, req, next);
> -     req->scsi_io =3D *scsi_io;
> -     req->dev =3D s;
> ---
> -2.9.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
> b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
> deleted file mode 100644
> index 05cc3d9..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport patch to fix CVE-2016-7908 from:
> -
> -http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D070c4b92b8c
> -
> -CVE: CVE-2016-7908
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 070c4b92b8cd5390889716677a0b92444d6e087a Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 22 Sep 2016 16:02:37 +0530
> -Subject: [PATCH] net: mcf: limit buffer descriptor count
> -
> -ColdFire Fast Ethernet Controller uses buffer descriptors to manage
> -data flow to/fro receive & transmit queues. While transmitting
> -packets, it could continue to read buffer descriptors if a buffer
> -descriptor has length of zero and has crafted values in bd.flags.
> -Set upper limit to number of buffer descriptors.
> -
> -Reported-by: Li Qiang <liqiang6-s@360.cn>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> -Signed-off-by: Jason Wang <jasowang@redhat.com>
> ----
> - hw/net/mcf_fec.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
> -index 0ee8ad9..d31fea1 100644
> ---- a/hw/net/mcf_fec.c
> -+++ b/hw/net/mcf_fec.c
> -@@ -23,6 +23,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while
> (0)
> - #define DPRINTF(fmt, ...) do {} while(0)
> - #endif
> -
> -+#define FEC_MAX_DESC 1024
> - #define FEC_MAX_FRAME_SIZE 2032
> -
> - typedef struct {
> -@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
> -     uint32_t addr;
> -     mcf_fec_bd bd;
> -     int frame_size;
> --    int len;
> -+    int len, descnt =3D 0;
> -     uint8_t frame[FEC_MAX_FRAME_SIZE];
> -     uint8_t *ptr;
> -
> -@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
> -     ptr =3D frame;
> -     frame_size =3D 0;
> -     addr =3D s->tx_descriptor;
> --    while (1) {
> -+    while (descnt++ < FEC_MAX_DESC) {
> -         mcf_fec_read_bd(&bd, addr);
> -         DPRINTF("tx_bd %x flags %04x len %d data %08x\n",
> -                 addr, bd.flags, bd.length, bd.data);
> ---
> -2.9.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
> b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
> deleted file mode 100644
> index e71bbf6..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Backport [http://git.qemu.org/?p=3Dqemu.
> git;a=3Dcommit;h=3D34e29ce]
> -CVE: CVE-2016-7909
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 34e29ce754c02bb6b3bdd244fbb85033460feaff Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Fri, 30 Sep 2016 00:27:33 +0530
> -Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length
> -
> -The AMD PC-Net II emulator has set of control and status(CSR)
> -registers. Of these, CSR76 and CSR78 hold receive and transmit
> -descriptor ring length respectively. This ring length could range
> -from 1 to 65535. Setting ring length to zero leads to an infinite
> -loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.
> -
> -Reported-by: Li Qiang <liqiang6-s@360.cn>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Signed-off-by: Jason Wang <jasowang@redhat.com>
> ----
> - hw/net/pcnet.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> -index 198a01f..3078de8 100644
> ---- a/hw/net/pcnet.c
> -+++ b/hw/net/pcnet.c
> -@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s,
> uint32_t rap, uint32_t new_value)
> -     case 47: /* POLLINT */
> -     case 72:
> -     case 74:
> -+        break;
> -     case 76: /* RCVRL */
> -     case 78: /* XMTRL */
> -+        val =3D (val > 0) ? val : 512;
> -+        break;
> -     case 112:
> -        if (CSR_STOP(s) || CSR_SPND(s))
> -            break;
> ---
> -2.10.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-mem=
ory-size-checking.patch
> b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-
> memory-size-checking.patch
> deleted file mode 100644
> index 1a6cf51..0000000
> --- a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-
> memory-size-checking.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
> -From: Jiang Lu <lu.jiang@windriver.com>
> -Date: Wed, 13 Nov 2013 10:38:08 +0800
> -Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
> -
> -The machine can not work with memory over 256M, so add a checking
> -at startup. If the memory size exceed 256M, just stop emulation then
> -throw out warning about memory limitation.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> -
> -Updated it on 2014-01-15 for rebasing
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Update it when upgrade qemu to 2.2.0
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ----
> - hw/arm/versatilepb.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> -index 6c69f4e..9278d90 100644
> ---- a/hw/arm/versatilepb.c
> -+++ b/hw/arm/versatilepb.c
> -@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine,
> int board_id)
> -         exit(1);
> -     }
> -
> -+    if (machine->ram_size > (256 << 20)) {
> -+        fprintf(stderr,
> -+                "qemu: Too much memory for this machine: %d MB, maximum
> 256 MB\n",
> -+                ((unsigned int)ram_size / (1 << 20)));
> -+        exit(1);
> -+    }
> -+
> -     cpuobj =3D object_new(object_class_get_name(cpu_oc));
> -
> -     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
> ---
> -2.1.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsole=
te-syscalls.patch
> b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-
> obsolete-syscalls.patch
> index 171bda7..60253bd 100644
> --- a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-
> obsolete-syscalls.patch
> +++ b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-
> obsolete-syscalls.patch
> @@ -1,4 +1,7 @@
> -[PATCH] exclude some arm EABI obsolete syscalls
> +From 51910343594b3f655a205a096e092ecdacc253da Mon Sep 17 00:00:00 2001
> +From: "Roy.Li" <rongqing.li@windriver.com>
> +Date: Mon, 23 Jun 2014 14:28:30 +0800
> +Subject: [PATCH 02/11] [PATCH] exclude some arm EABI obsolete syscalls
>
>  Upstream-Status: Pending
>
> @@ -26,15 +29,16 @@ or kernel header:
>         /usr/include/asm/unistd.h
>
>  Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +
>  ---
> - qemu-seccomp.c | 14 ++++++++------
> - 1 file changed, 8 insertions(+), 6 deletions(-)
> + qemu-seccomp.c | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
>
>  diff --git a/qemu-seccomp.c b/qemu-seccomp.c
> -index caa926e..5a78502 100644
> +index df75d9c..0e577f8 100644
>  --- a/qemu-seccomp.c
>  +++ b/qemu-seccomp.c
> -@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
> +@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
>       { SCMP_SYS(timer_settime), 255 },
>       { SCMP_SYS(timer_gettime), 254 },
>       { SCMP_SYS(futex), 253 },
> @@ -58,7 +62,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(mprotect), 246 },
>       { SCMP_SYS(execve), 245 },
>       { SCMP_SYS(open), 245 },
> -@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
> +@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
>       { SCMP_SYS(bind), 245 },
>       { SCMP_SYS(listen), 245 },
>       { SCMP_SYS(semget), 245 },
> @@ -66,13 +70,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(gettimeofday), 245 },
>       { SCMP_SYS(readlink), 245 },
>       { SCMP_SYS(access), 245 },
> -     { SCMP_SYS(prctl), 245 },
> -     { SCMP_SYS(signalfd), 245 },
> --    { SCMP_SYS(getrlimit), 245 },
> -     { SCMP_SYS(set_tid_address), 245 },
> -     { SCMP_SYS(statfs), 245 },
> -     { SCMP_SYS(unlink), 245 },
> -@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
> +@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
>       { SCMP_SYS(times), 245 },
>       { SCMP_SYS(exit), 245 },
>       { SCMP_SYS(clock_gettime), 245 },
> @@ -80,7 +78,7 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(restart_syscall), 245 },
>       { SCMP_SYS(pwrite64), 245 },
>       { SCMP_SYS(nanosleep), 245 },
> -@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
> +@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall
> seccomp_whitelist[] =3D {
>       { SCMP_SYS(lstat64), 241 },
>       { SCMP_SYS(sendfile64), 241 },
>       { SCMP_SYS(ugetrlimit), 241 },
> @@ -89,5 +87,5 @@ index caa926e..5a78502 100644
>       { SCMP_SYS(rt_sigqueueinfo), 241 },
>       { SCMP_SYS(rt_tgsigqueueinfo), 241 },
>  --
> -1.9.1
> +2.1.4
>
> diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
> similarity index 58%
> rename from meta/recipes-devtools/qemu/qemu_2.7.0.bb
> rename to meta/recipes-devtools/qemu/qemu_2.8.0.bb
> index 0d680a7..efb1fb0 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
> @@ -5,20 +5,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> 441c28d2cf86e15a37fa47e15a72fbac \
>
>  SRC_URI +=3D "file://configure-fix-Darwin-target-detection.patch \
>              file://qemu-enlarge-env-entry-size.patch \
> -            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
>              file://qemu-2.5.0-cflags.patch \
> -            file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
> -            file://0002-fix-CVE-2016-7423.patch \
> -            file://0003-fix-CVE-2016-7908.patch \
> -            file://0004-fix-CVE-2016-7909.patch \
> -            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCI=
Devi.patch
> \
>  "
>
>  SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.bz2=
"
> -SRC_URI[md5sum] =3D "08d4d06d1cb598efecd796137f4844ab"
> -SRC_URI[sha256sum] =3D "326e739506ba690daf69fc17bd3913
> a6c313d9928d743bd8eddb82f403f81e53"
> +SRC_URI[md5sum] =3D "17940dce063b6ce450a12e719a6c9c43"
> +SRC_URI[sha256sum] =3D "dafd5d7f649907b6b617b822692f4c
> 82e60cf29bc0fc58bc2036219b591e5e62"
>
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
> --
> 2.1.4
>
>

--94eb2c0600564244cc054638cabb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like this is broken for ppc when building gobject-in=
trospection:<div><br></div><div><a href=3D"http://errors.yoctoproject.org/E=
rrors/Latest/Autobuilder/?filter=3D%20gobject-introspection:%20do_compile&a=
mp;type=3Dfailure&amp;page=3D1">http://errors.yoctoproject.org/Errors/Lates=
t/Autobuilder/?filter=3D%20gobject-introspection:%20do_compile&amp;type=3Df=
ailure&amp;page=3D1</a><br></div><div><br></div><div>(top seven results in =
ross/mut2)</div><div><br></div><div>Ross</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 12 January 2017 at 16:19, An=C3=ADbal=
 Lim=C3=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@linux.inte=
l.com" target=3D"_blank">anibal.limon@linux.intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">Rebased patches:<br>
<br>
- exclude-some-arm-EABI-<wbr>obsolete-syscalls.patc<br>
<br>
Removed patches (already in upstream):<br>
<br>
- 0001-pci-assign-sync-MSI-MSI-<wbr>X-cap-and-table-with-PCIDevi.<wbr>patch=
<br>
- 0002-fix-CVE-2016-7423.patch<br>
- 0003-fix-CVE-2016-7908.patch<br>
- 0004-fix-CVE-2016-7909.patch<br>
</span>- Qemu-Arm-versatilepb-Add-<wbr>memory-size-checking.patch<br>
- 0001-target-mips-add-24KEc-<wbr>CPU-definition.patch<br>
<span class=3D""><br>
Changelog,<br>
<br>
<a href=3D"http://wiki.qemu.org/ChangeLog/2.8" rel=3D"noreferrer" target=3D=
"_blank">http://wiki.qemu.org/<wbr>ChangeLog/2.8</a><br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
nux.intel.com">anibal.limon@linux.intel.com</a>&gt;<br>
---<br>
</span>=C2=A0meta/conf/auto.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 ++<br>
=C2=A0meta/recipes-devtools/qemu/<wbr>qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 -<br>
=C2=A0...sync-MSI-MSI-X-cap-and-<wbr>table-with-PCIDevi.patch | 71 --------=
--------------<br>
=C2=A0...0001-target-mips-add-24KEc-<wbr>CPU-definition.patch | 54 --------=
--------<br>
<span class=3D"">=C2=A0...0001-virtio-zero-vq-inuse-<wbr>in-virtio_reset.pa=
tch | 57 -----------------<br>
=C2=A0.../qemu/qemu/0002-fix-CVE-<wbr>2016-7423.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 45 --------------<br>
=C2=A0.../qemu/qemu/0003-fix-CVE-<wbr>2016-7908.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 62 -------------------<br>
=C2=A0.../qemu/qemu/0004-fix-CVE-<wbr>2016-7909.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 42 -------------<br>
</span>=C2=A0...-Arm-versatilepb-Add-<wbr>memory-size-checking.patch | 46 -=
-------------<br>
=C2=A0.../exclude-some-arm-EABI-<wbr>obsolete-syscalls.patch=C2=A0 | 28 +++=
+-----<br>
=C2=A0.../qemu/{<a href=3D"http://qemu_2.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">qemu_2.7.0.bb</a> =3D&gt; <a href=3D"http://qemu_2.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qemu_2.8.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 +--<br>
=C2=A011 files changed, 21 insertions(+), 403 deletions(-)<br>
=C2=A0create mode 100644 meta/conf/auto.conf<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0001-pci-assi=
gn-sync-MSI-<wbr>MSI-X-cap-and-table-with-<wbr>PCIDevi.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0001-target-m=
ips-add-<wbr>24KEc-CPU-definition.patch<br>
<span class=3D"">=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>q=
emu/0001-virtio-zero-vq-<wbr>inuse-in-virtio_reset.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0002-fix-CVE-=
2016-7423.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0003-fix-CVE-=
2016-7908.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0004-fix-CVE-=
2016-7909.<wbr>patch<br>
</span>=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/Qemu-A=
rm-versatilepb-Add-<wbr>memory-size-checking.patch<br>
=C2=A0rename meta/recipes-devtools/qemu/{<a href=3D"http://qemu_2.7.0.bb" r=
el=3D"noreferrer" target=3D"_blank">qe<wbr>mu_2.7.0.bb</a> =3D&gt; <a href=
=3D"http://qemu_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.8.0.b=
b</a>} (58%)<br>
<br>
diff --git a/meta/conf/auto.conf b/meta/conf/auto.conf<br>
new file mode 100644<br>
index 0000000..492ac82<br>
--- /dev/null<br>
+++ b/meta/conf/auto.conf<br>
@@ -0,0 +1,6 @@<br>
+SSTATE_MIRRORS =3D &quot;file://.* <a href=3D"http://yctb01.zpn.intel.com/=
data/sstates/PATH" rel=3D"noreferrer" target=3D"_blank">http://yctb01.zpn.i=
ntel.com/<wbr>data/sstates/PATH</a> \n&quot;<br>
+PREMIRRORS_prepend =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0git://.*/.* <a href=3D"http://yctb01.zpn.intel.com/dat=
a/sources/" rel=3D"noreferrer" target=3D"_blank">http://yctb01.zpn.intel.co=
m/<wbr>data/sources/</a> \n \<br>
+=C2=A0 =C2=A0 =C2=A0ftp://.*/.* <a href=3D"http://yctb01.zpn.intel.com/dat=
a/sources/" rel=3D"noreferrer" target=3D"_blank">http://yctb01.zpn.intel.co=
m/<wbr>data/sources/</a> \n \<br>
+=C2=A0 =C2=A0 =C2=A0http://.*/.* <a href=3D"http://yctb01.zpn.intel.com/da=
ta/sources/" rel=3D"noreferrer" target=3D"_blank">http://yctb01.zpn.intel.c=
om/<wbr>data/sources/</a> \n \<br>
+=C2=A0 =C2=A0 =C2=A0https://.*/.* <a href=3D"http://yctb01.zpn.intel.com/d=
ata/sources/" rel=3D"noreferrer" target=3D"_blank">http://yctb01.zpn.intel.=
com/<wbr>data/sources/</a> \n&quot;<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu.inc b/meta/recipes-devtoo=
ls/qemu/<wbr>qemu.inc<br>
index b46e7f7..e3af5c2 100644<br>
<span class=3D"">--- a/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
@@ -9,8 +9,6 @@ require qemu-targets.inc<br>
=C2=A0inherit autotools ptest<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
-<br>
=C2=A0# QEMU_TARGETS is overridable variable<br>
=C2=A0QEMU_TARGETS ?=3D &quot;arm aarch64 i386 mips mipsel mips64 mips64el =
ppc sh4 x86_64&quot;<br>
<br>
</span>@@ -21,7 +19,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://wacom.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://add-ptest-in-makefile.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 file://0001-target-mips-add-<wbr>24KEc-CPU-definition.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot;\<br>
<div><div class=3D"h5">diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/00=
01-pci-assign-sync-MSI-<wbr>MSI-X-cap-and-table-with-<wbr>PCIDevi.patch b/m=
eta/recipes-devtools/qemu/<wbr>qemu/0001-pci-assign-sync-MSI-<wbr>MSI-X-cap=
-and-table-with-<wbr>PCIDevi.patch<br>
deleted file mode 100644<br>
index 03472dd..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0001-pci-assign-sync-MSI-<wbr>MS=
I-X-cap-and-table-with-<wbr>PCIDevi.patch<br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-From 6baa545df93253fced4fc0d52b14b9<wbr>8447e00473 Mon Sep 17 00:00:00 200=
1<br>
-From: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com<=
/a>&gt;<br>
-Date: Mon, 28 Nov 2016 15:02:44 +0800<br>
-Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDevice<b=
r>
-<br>
-Since commit e1d4fb2d (&quot;kvm-irqchip: x86: add msi route notify fn&quo=
t;),<br>
-kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fetch<b=
r>
-MSI info. This requires that we setup MSI related fields in PCIDevice.<br>
-For most devices, that won&#39;t be a problem, as long as we are using<br>
-general interfaces like msi_init()/msix_init().<br>
-<br>
-However, for pci-assign devices, MSI/MSI-X is treated differently - PCI<br=
>
-assign devices are maintaining its own MSI table and cap information in<br=
>
-AssignedDevice struct. however that&#39;s not synced up with PCIDevice&#39=
;s<br>
-fields. That will leads to pci_get_msi_message() failed to find correct<br=
>
-MSI capability, even with an NULL msix_table.<br>
-<br>
-A quick fix is to sync up the two places: both the capability bits and<br>
-table address for MSI/MSI-X.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2016-11/msg04649.html" rel=3D"noreferrer" target=3D"_blank">https=
://lists.gnu.org/<wbr>archive/html/qemu-devel/2016-<wbr>11/msg04649.html</a=
>]<br>
-<br>
-Reported-by: Changlimin &lt;address@hidden&gt;<br>
-Tested-by: Changlimin &lt;address@hidden&gt;<br>
-Cc: address@hidden<br>
-Fixes: e1d4fb2d (&quot;kvm-irqchip: x86: add msi route notify fn&quot;)<br=
>
-Signed-off-by: Peter Xu &lt;address@hidden&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- hw/i386/kvm/pci-assign.c | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c<br>
-index 8238fbc..87dcbdd 100644<br>
---- a/hw/i386/kvm/pci-assign.c<br>
-+++ b/hw/i386/kvm/pci-assign.c<br>
-@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(<wbr>PCIDevi=
ce *pci_dev, Error **errp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, loca=
l_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;dev.cap_present |=3D QEMU_PCI_CAP_MSI=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;cap.available |=3D ASSIGNED_DEVI=
CE_CAP_MSI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only 32-bit/no-mask currently support=
ed */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_add_capability2(pci_dev, PCI=
_CAP_ID_MSI, pos, 10,<br>
-@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(<wbr>PCIDevi=
ce *pci_dev, Error **errp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, loca=
l_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;dev.cap_present |=3D QEMU_PCI_CAP_MSI=
X;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;cap.available |=3D ASSIGNED_DEVI=
CE_CAP_MSIX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_add_capability2(pci_dev, PCI=
_CAP_ID_MSIX, pos, 12,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;local_err);<br>
-@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_<wbr>mmio(Ass=
ignedDevice *dev, Error **errp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;msix_table =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 dev-&gt;dev.msix_table =3D (uint8_t *)dev-&gt;msix_table;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0assigned_dev_msix_reset(dev);<br>
-<br>
-@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_<wbr>mmio(A=
ssignedDevice *dev)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;error unmapping msix_=
table! %s&quot;, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0dev-&gt;msix_table =3D NULL;<br>
-+=C2=A0 =C2=A0 dev-&gt;dev.msix_table =3D NULL;<br>
- }<br>
-<br>
- static const VMStateDescription vmstate_assigned_device =3D {<br>
---<br>
-2.8.3<br>
-<br>
</div></div>diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0001-target-m=
ips-add-<wbr>24KEc-CPU-definition.patch b/meta/recipes-devtools/qemu/<wbr>q=
emu/0001-target-mips-add-<wbr>24KEc-CPU-definition.patch<br>
deleted file mode 100644<br>
index c4dbee7..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0001-target-mips-add-<wbr>24KEc-=
CPU-definition.patch<br>
+++ /dev/null<br>
@@ -1,54 +0,0 @@<br>
-From 926bc194f918d46bd93557b15da815<wbr>3b6a94a1d5 Mon Sep 17 00:00:00 200=
1<br>
-From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D<wbr>20Draszik?=3D &lt;<a href=3D"mailt=
o:git@andred.net">git@andred.net</a>&gt;<br>
-Date: Mon, 25 Jul 2016 23:58:22 +0100<br>
-Subject: [PATCH] target-mips: add 24KEc CPU definition<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Define a new CPU definition supporting 24KEc cores, similar to<br>
-the existing 24Kc, but with added support for DSP instructions<br>
-and MIPS16e (and without FPU).<br>
-<br>
-Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net">gi=
t@andred.net</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"http://lists.nongnu.org/archive/htm=
l/qemu-devel/2016-07/msg05778.html" rel=3D"noreferrer" target=3D"_blank">ht=
tp://lists.nongnu.org/<wbr>archive/html/qemu-devel/2016-<wbr>07/msg05778.ht=
ml</a>]<br>
- target-mips/translate_init.c | 22 ++++++++++++++++++++++<br>
- 1 file changed, 22 insertions(+)<br>
-<br>
-diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c<b=
r>
-index 39ed5c4..6ae23e4 100644<br>
---- a/target-mips/translate_init.c<br>
-+++ b/target-mips/translate_init.c<br>
-@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mmu_type =3D MMU_TYPE_R4000,<br>
-=C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;24KEc&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_PRid =3D 0x00019600,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 &lt;&lt;=
 CP0C0_AR) |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(MMU_TYPE_R4000 &lt;&lt; CP0C0_MT),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config1 =3D MIPS_CONFIG1 | (15 &lt;&lt; =
CP0C1_MMU) |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0 &lt;&lt; CP0C1_IS) | (3 &lt;&lt; CP0C1_IL) | (1 &lt;&lt; CP0C1=
_IA) |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0 &lt;&lt; CP0C1_DS) | (3 &lt;&lt; CP0C1_DL) | (1 &lt;&lt; CP0C1=
_DA) |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; CP0C1_CA),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config2 =3D MIPS_CONFIG2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Config3 =3D MIPS_CONFIG3 | (1 &lt;&lt; C=
P0C3_DSPP) | (0 &lt;&lt; CP0C3_VInt),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_rw_bitmask =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_LLAddr_shift =3D 4,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SYNCI_Step =3D 32,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CCRes =3D 2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we have a DSP, but no FPU */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .CP0_Status_rw_bitmask =3D 0x1378FF1F,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .SEGBITS =3D 32,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .PABITS =3D 32,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | A=
SE_DSP,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mmu_type =3D MMU_TYPE_R4000,<br>
-+=C2=A0 =C2=A0 },<br>
-+=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;24Kf&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_PRid =3D 0x00019300,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.CP0_Config0 =3D MIPS_CONFIG0 | (0x1 &lt=
;&lt; CP0C0_AR) |<br>
---<br>
-2.8.1<br>
<div><div class=3D"h5">-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0001-virtio-zero-vq-<wbr>=
inuse-in-virtio_reset.patch b/meta/recipes-devtools/qemu/<wbr>qemu/0001-vir=
tio-zero-vq-<wbr>inuse-in-virtio_reset.patch<br>
deleted file mode 100644<br>
index 86955d0..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0001-virtio-zero-vq-<wbr>inuse-i=
n-virtio_reset.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Supplementary fix of CVE-2016-5403 which is backported from:<br>
-<br>
-<a href=3D"http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4b7f91e" rel=
=3D"noreferrer" target=3D"_blank">http://git.qemu.org/?p=3Dqemu.<wbr>git;a=
=3Dcommit;h=3D4b7f91e</a><br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-From 4b7f91ed0270a371e1933efa21ba60<wbr>0b6da23ab9 Mon Sep 17 00:00:00 200=
1<br>
-From: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@=
redhat.com</a>&gt;<br>
-Date: Wed, 7 Sep 2016 11:51:25 -0400<br>
-Subject: [PATCH] virtio: zero vq-&gt;inuse in virtio_reset()<br>
-<br>
-vq-&gt;inuse must be zeroed upon device reset like most other virtqueue<br=
>
-fields.<br>
-<br>
-In theory, virtio_reset() just needs assert(vq-&gt;inuse =3D=3D 0) since<b=
r>
-devices must clean up in-flight requests during reset (requests cannot<br>
-not be leaked!).<br>
-<br>
-In practice, it is difficult to achieve vq-&gt;inuse =3D=3D 0 across reset=
<br>
-because balloon, blk, 9p, etc implement various different strategies for<b=
r>
-cleaning up requests.=C2=A0 Most devices call g_free(elem) directly withou=
t<br>
-telling virtio.c that the VirtQueueElement is cleaned up.=C2=A0 Therefore<=
br>
-vq-&gt;inuse is not decremented during reset.<br>
-<br>
-This patch zeroes vq-&gt;inuse and trusts that devices are not leaking<br>
-VirtQueueElements across reset.<br>
-<br>
-I will send a follow-up series that refactors request life-cycle across<br=
>
-all devices and converts vq-&gt;inuse =3D 0 into assert(vq-&gt;inuse =3D=
=3D 0) but<br>
-this more invasive approach is not appropriate for stable trees.<br>
-<br>
-Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">=
stefanha@redhat.com</a>&gt;<br>
-Cc: qemu-stable &lt;<a href=3D"mailto:qemu-stable@nongnu.org">qemu-stable@=
nongnu.org</a>&gt;<br>
-Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@=
redhat.com</a>&gt;<br>
-Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">ms=
t@redhat.com</a>&gt;<br>
-Reviewed-by: Ladi Prosek &lt;<a href=3D"mailto:lprosek@redhat.com">lprosek=
@redhat.com</a>&gt;<br>
----<br>
- hw/virtio/virtio.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c<br>
-index 74c085c..e8a13a5 100644<br>
---- a/hw/virtio/virtio.c<br>
-+++ b/hw/virtio/virtio.c<br>
-@@ -822,6 +822,7 @@ void virtio_reset(void *opaque)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;vq[i].signalled_used_<wbr>valid=
 =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;vq[i].notification =3D true;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;vq[i].vring.num =3D vdev-&gt;vq=
[i].vring.num_default;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev-&gt;vq[i].inuse =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
-<br>
---<br>
-2.9.3<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0002-fix-CVE-2016-7423.<w=
br>patch b/meta/recipes-devtools/qemu/<wbr>qemu/0002-fix-CVE-2016-7423.<wbr=
>patch<br>
deleted file mode 100644<br>
index fdf58a3..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0002-fix-CVE-2016-7423.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Backport patch to fix CVE-2016-7423 from:<br>
-<br>
-<a href=3D"http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D670e56d3ed" re=
l=3D"noreferrer" target=3D"_blank">http://git.qemu.org/?p=3Dqemu.<wbr>git;a=
=3Dcommit;h=3D670e56d3ed</a><br>
-<br>
-CVE: CVE-2016-7423<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-From 670e56d3ed2918b3861d9216f2c054<wbr>0d9e9ae0d5 Mon Sep 17 00:00:00 200=
1<br>
-From: Li Qiang &lt;<a href=3D"mailto:liqiang6-s@360.cn">liqiang6-s@360.cn<=
/a>&gt;<br>
-Date: Mon, 12 Sep 2016 18:14:11 +0530<br>
-Subject: [PATCH] scsi: mptsas: use g_new0 to allocate MPTSASRequest object=
<br>
-<br>
-When processing IO request in mptsas, it uses g_new to allocate<br>
-a &#39;req&#39; object. If an error occurs before &#39;req-&gt;sreq&#39; i=
s<br>
-allocated, It could lead to an OOB write in mptsas_free_request<br>
-function. Use g_new0 to avoid it.<br>
-<br>
-Reported-by: Li Qiang &lt;<a href=3D"mailto:liqiang6-s@360.cn">liqiang6-s@=
360.cn</a>&gt;<br>
-Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org=
">pjp@fedoraproject.org</a>&gt;<br>
-Message-Id: &lt;<a href=3D"mailto:1473684251-17476-1-git-send-email-ppandi=
t@redhat.com">1473684251-17476-1-git-send-<wbr>email-ppandit@redhat.com</a>=
&gt;<br>
-Cc: <a href=3D"mailto:qemu-stable@nongnu.org">qemu-stable@nongnu.org</a><b=
r>
-Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pb=
onzini@redhat.com</a>&gt;<br>
----<br>
- hw/scsi/mptsas.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c<br>
-index 0e0a22f..eaae1bb 100644<br>
---- a/hw/scsi/mptsas.c<br>
-+++ b/hw/scsi/mptsas.c<br>
-@@ -304,7 +304,7 @@ static int mptsas_process_scsi_io_<wbr>request(MPTSASS=
tate *s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 req =3D g_new(MPTSASRequest, 1);<br>
-+=C2=A0 =C2=A0 req =3D g_new0(MPTSASRequest, 1);<br>
-=C2=A0 =C2=A0 =C2=A0QTAILQ_INSERT_TAIL(&amp;s-&gt;<wbr>pending, req, next)=
;<br>
-=C2=A0 =C2=A0 =C2=A0req-&gt;scsi_io =3D *scsi_io;<br>
-=C2=A0 =C2=A0 =C2=A0req-&gt;dev =3D s;<br>
---<br>
-2.9.3<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0003-fix-CVE-2016-7908.<w=
br>patch b/meta/recipes-devtools/qemu/<wbr>qemu/0003-fix-CVE-2016-7908.<wbr=
>patch<br>
deleted file mode 100644<br>
index 05cc3d9..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0003-fix-CVE-2016-7908.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Backport patch to fix CVE-2016-7908 from:<br>
-<br>
-<a href=3D"http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D070c4b92b8c" r=
el=3D"noreferrer" target=3D"_blank">http://git.qemu.org/?p=3Dqemu.<wbr>git;=
a=3Dcommit;h=3D070c4b92b8c</a><br>
-<br>
-CVE: CVE-2016-7908<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-From 070c4b92b8cd5390889716677a0b92<wbr>444d6e087a Mon Sep 17 00:00:00 200=
1<br>
-From: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org">pjp@fed=
oraproject.org</a>&gt;<br>
-Date: Thu, 22 Sep 2016 16:02:37 +0530<br>
-Subject: [PATCH] net: mcf: limit buffer descriptor count<br>
-<br>
-ColdFire Fast Ethernet Controller uses buffer descriptors to manage<br>
-data flow to/fro receive &amp; transmit queues. While transmitting<br>
-packets, it could continue to read buffer descriptors if a buffer<br>
-descriptor has length of zero and has crafted values in bd.flags.<br>
-Set upper limit to number of buffer descriptors.<br>
-<br>
-Reported-by: Li Qiang &lt;<a href=3D"mailto:liqiang6-s@360.cn">liqiang6-s@=
360.cn</a>&gt;<br>
-Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org=
">pjp@fedoraproject.org</a>&gt;<br>
-Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbon=
zini@redhat.com</a>&gt;<br>
-Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasow=
ang@redhat.com</a>&gt;<br>
----<br>
- hw/net/mcf_fec.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c<br>
-index 0ee8ad9..d31fea1 100644<br>
---- a/hw/net/mcf_fec.c<br>
-+++ b/hw/net/mcf_fec.c<br>
-@@ -23,6 +23,7 @@ do { printf(&quot;mcf_fec: &quot; fmt , ## __VA_ARGS__);=
 } while (0)<br>
- #define DPRINTF(fmt, ...) do {} while(0)<br>
- #endif<br>
-<br>
-+#define FEC_MAX_DESC 1024<br>
- #define FEC_MAX_FRAME_SIZE 2032<br>
-<br>
- typedef struct {<br>
-@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)<br>
-=C2=A0 =C2=A0 =C2=A0uint32_t addr;<br>
-=C2=A0 =C2=A0 =C2=A0mcf_fec_bd bd;<br>
-=C2=A0 =C2=A0 =C2=A0int frame_size;<br>
--=C2=A0 =C2=A0 int len;<br>
-+=C2=A0 =C2=A0 int len, descnt =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t frame[FEC_MAX_FRAME_SIZE];<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t *ptr;<br>
-<br>
-@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)<br>
-=C2=A0 =C2=A0 =C2=A0ptr =3D frame;<br>
-=C2=A0 =C2=A0 =C2=A0frame_size =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0addr =3D s-&gt;tx_descriptor;<br>
--=C2=A0 =C2=A0 while (1) {<br>
-+=C2=A0 =C2=A0 while (descnt++ &lt; FEC_MAX_DESC) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mcf_fec_read_bd(&amp;bd, addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;tx_bd %x flags %04x len %d=
 data %08x\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr, bd.fla=
gs, bd.length, bd.data);<br>
---<br>
-2.9.3<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0004-fix-CVE-2016-7909.<w=
br>patch b/meta/recipes-devtools/qemu/<wbr>qemu/0004-fix-CVE-2016-7909.<wbr=
>patch<br>
deleted file mode 100644<br>
index e71bbf6..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0004-fix-CVE-2016-7909.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-Upstream-Status: Backport [<a href=3D"http://git.qemu.org/?p=3Dqemu.git;a=
=3Dcommit;h=3D34e29ce" rel=3D"noreferrer" target=3D"_blank">http://git.qemu=
.org/?p=3Dqemu.<wbr>git;a=3Dcommit;h=3D34e29ce</a>]<br>
-CVE: CVE-2016-7909<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-From 34e29ce754c02bb6b3bdd244fbb850<wbr>33460feaff Mon Sep 17 00:00:00 200=
1<br>
-From: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org">pjp@fed=
oraproject.org</a>&gt;<br>
-Date: Fri, 30 Sep 2016 00:27:33 +0530<br>
-Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length<br>
-<br>
-The AMD PC-Net II emulator has set of control and status(CSR)<br>
-registers. Of these, CSR76 and CSR78 hold receive and transmit<br>
-descriptor ring length respectively. This ring length could range<br>
-from 1 to 65535. Setting ring length to zero leads to an infinite<br>
-loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.<br>
-<br>
-Reported-by: Li Qiang &lt;<a href=3D"mailto:liqiang6-s@360.cn">liqiang6-s@=
360.cn</a>&gt;<br>
-Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org=
">pjp@fedoraproject.org</a>&gt;<br>
-Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasow=
ang@redhat.com</a>&gt;<br>
----<br>
- hw/net/pcnet.c | 3 +++<br>
- 1 file changed, 3 insertions(+)<br>
-<br>
-diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c<br>
-index 198a01f..3078de8 100644<br>
---- a/hw/net/pcnet.c<br>
-+++ b/hw/net/pcnet.c<br>
-@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s, uint32_=
t rap, uint32_t new_value)<br>
-=C2=A0 =C2=A0 =C2=A0case 47: /* POLLINT */<br>
-=C2=A0 =C2=A0 =C2=A0case 72:<br>
-=C2=A0 =C2=A0 =C2=A0case 74:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0case 76: /* RCVRL */<br>
-=C2=A0 =C2=A0 =C2=A0case 78: /* XMTRL */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D (val &gt; 0) ? val : 512;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0case 112:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (CSR_STOP(s) || CSR_SPND(s))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
---<br>
-2.10.1<br>
-<br>
</div></div>diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/Qemu-Arm-vers=
atilepb-Add-<wbr>memory-size-checking.patch b/meta/recipes-devtools/qemu/<w=
br>qemu/Qemu-Arm-versatilepb-Add-<wbr>memory-size-checking.patch<br>
deleted file mode 100644<br>
index 1a6cf51..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/Qemu-Arm-versatilepb-Add-<wbr>me=
mory-size-checking.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 896fa02c24347e6e9259812cfda187<wbr>b1d6ca6199 Mon Sep 17 00:00:00 200=
1<br>
-From: Jiang Lu &lt;<a href=3D"mailto:lu.jiang@windriver.com">lu.jiang@wind=
river.com</a>&gt;<br>
-Date: Wed, 13 Nov 2013 10:38:08 +0800<br>
-Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking<br>
-<br>
-The machine can not work with memory over 256M, so add a checking<br>
-at startup. If the memory size exceed 256M, just stop emulation then<br>
-throw out warning about memory limitation.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Jiang Lu &lt;<a href=3D"mailto:lu.jiang@windriver.com">lu.j=
iang@windriver.com</a>&gt;<br>
-<br>
-Updated it on 2014-01-15 for rebasing<br>
-<br>
-Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com=
">liezhi.yang@windriver.com</a>&gt;<br>
-<br>
-Update it when upgrade qemu to 2.2.0<br>
<span class=3D"">-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
</span>-Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@=
intel.com">cristian.iorga@intel.com</a>&gt;<br>
----<br>
- hw/arm/versatilepb.c | 7 +++++++<br>
- 1 file changed, 7 insertions(+)<br>
-<br>
-diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c<br>
-index 6c69f4e..9278d90 100644<br>
---- a/hw/arm/versatilepb.c<br>
-+++ b/hw/arm/versatilepb.c<br>
-@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine, int=
 board_id)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; (256 &lt;&lt; 20)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;qemu: Too m=
uch memory for this machine: %d MB, maximum 256 MB\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((unsigned int)ra=
m_size / (1 &lt;&lt; 20)));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0cpuobj =3D object_new(object_class_get_<wbr>name(cpu_o=
c));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0/* By default ARM1176 CPUs have EL3 enabled.=C2=A0 Thi=
s board does not<br>
---<br>
-2.1.0<br>
<div><div class=3D"h5">-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/exclude-some-arm-EABI-<wb=
r>obsolete-syscalls.patch b/meta/recipes-devtools/qemu/<wbr>qemu/exclude-so=
me-arm-EABI-<wbr>obsolete-syscalls.patch<br>
index 171bda7..60253bd 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/exclude-some-arm-EABI-<wbr>obsol=
ete-syscalls.patch<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/exclude-some-arm-EABI-<wbr>obsol=
ete-syscalls.patch<br>
@@ -1,4 +1,7 @@<br>
-[PATCH] exclude some arm EABI obsolete syscalls<br>
+From 51910343594b3f655a205a096e092e<wbr>cdacc253da Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;Roy.Li&quot; &lt;<a href=3D"mailto:rongqing.li@windriver.com">=
rongqing.li@windriver.com</a>&gt;<br>
+Date: Mon, 23 Jun 2014 14:28:30 +0800<br>
+Subject: [PATCH 02/11] [PATCH] exclude some arm EABI obsolete syscalls<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
@@ -26,15 +29,16 @@ or kernel header:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/include/asm/unistd.h<br>
<br>
=C2=A0Signed-off-by: Roy.Li &lt;<a href=3D"mailto:rongqing.li@windriver.com=
">rongqing.li@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- qemu-seccomp.c | 14 ++++++++------<br>
- 1 file changed, 8 insertions(+), 6 deletions(-)<br>
+ qemu-seccomp.c | 13 ++++++++-----<br>
+ 1 file changed, 8 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/qemu-seccomp.c b/qemu-seccomp.c<br>
-index caa926e..5a78502 100644<br>
+index df75d9c..0e577f8 100644<br>
=C2=A0--- a/qemu-seccomp.c<br>
=C2=A0+++ b/qemu-seccomp.c<br>
-@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
+@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(timer_settime), 255 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(timer_gettime), 254 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(futex), 253 },<br>
@@ -58,7 +62,7 @@ index caa926e..5a78502 100644<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(mprotect), 246 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(execve), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(open), 245 },<br>
-@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
+@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist=
[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(bind), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(listen), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(semget), 245 },<br>
@@ -66,13 +70,7 @@ index caa926e..5a78502 100644<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(gettimeofday), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(readlink), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(access), 245 },<br>
-=C2=A0 =C2=A0 =C2=A0{ SCMP_SYS(prctl), 245 },<br>
-=C2=A0 =C2=A0 =C2=A0{ SCMP_SYS(signalfd), 245 },<br>
--=C2=A0 =C2=A0 { SCMP_SYS(getrlimit), 245 },<br>
-=C2=A0 =C2=A0 =C2=A0{ SCMP_SYS(set_tid_address), 245 },<br>
-=C2=A0 =C2=A0 =C2=A0{ SCMP_SYS(statfs), 245 },<br>
-=C2=A0 =C2=A0 =C2=A0{ SCMP_SYS(unlink), 245 },<br>
-@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist=
[] =3D {<br>
+@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(times), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(exit), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(clock_gettime), 245 },<br>
@@ -80,7 +78,7 @@ index caa926e..5a78502 100644<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(restart_syscall), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(pwrite64), 245 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(nanosleep), 245 },<br>
-@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
+@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall seccomp_whiteli=
st[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(lstat64), 241 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(sendfile64), 241 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(ugetrlimit), 241 },<br>
@@ -89,5 +87,5 @@ index caa926e..5a78502 100644<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(rt_sigqueueinfo), 241 },<br>
=C2=A0 =C2=A0 =C2=A0 { SCMP_SYS(rt_tgsigqueueinfo), 241 },<br>
=C2=A0--<br>
-1.9.1<br>
+2.1.4<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" re=
l=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.7.0.bb</a> b/meta/recipes-de=
vtools/qemu/<a href=3D"http://qemu_2.8.0.bb" rel=3D"noreferrer" target=3D"_=
blank">q<wbr>emu_2.8.0.bb</a><br>
</div></div>similarity index 58%<br>
<span class=3D"">rename from meta/recipes-devtools/qemu/<a href=3D"http://q=
emu_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.7.0.bb</a><b=
r>
rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.8.0.bb</a><br>
</span>index 0d680a7..efb1fb0 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">q<wbr>emu_2.7.0.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.0.bb" rel=3D"no=
referrer" target=3D"_blank">q<wbr>emu_2.8.0.bb</a><br>
@@ -5,20 +5,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>441c=
28d2cf86e15a37fa47e15a72fb<wbr>ac \<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://configure-fix-Darwin-<wbr>target-detection.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-enlarge-env-ent=
ry-<wbr>size.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Qemu-Arm-versatilepb-<wbr=
>Add-memory-size-checking.patch \<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://no-valgrind.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pathlimit.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-2.5.0-cflags.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-virtio-zero-vq-<wbr>=
inuse-in-virtio_reset.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-fix-CVE-2016-7423.<w=
br>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-fix-CVE-2016-7908.<w=
br>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-fix-CVE-2016-7909.<w=
br>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pci-assign-sync-<wbr=
>MSI-MSI-X-cap-and-table-with-<wbr>PCIDevi.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_prepend =3D &quot;<a href=3D"http://wiki.qemu-project.org/dow=
nload/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.qemu-=
project.org/<wbr>download/${BP}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>08d4d06d1cb598efecd796137f4844<wbr>ab&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>326e739506ba690daf69fc17bd3913<wbr>a6c31=
3d9928d743bd8eddb82f403f8<wbr>1e53&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>17940dce063b6ce450a12e719a6c9c<wbr>43&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>dafd5d7f649907b6b617b822692f4c<wbr>82e60=
cf29bc0fc58bc2036219b591e<wbr>5e62&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
=C2=A0COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div>

--94eb2c0600564244cc054638cabb--
