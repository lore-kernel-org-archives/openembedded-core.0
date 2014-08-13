Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCF965DA3;
	Wed, 13 Aug 2014 20:39:49 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so228529lbi.41
	for <multiple recipients>; Wed, 13 Aug 2014 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=snIYEooBIuxi1ylfunE3I6WIaa7aSXbl+rh+mKd5p78=;
	b=mYvqTD+RPiq6sW2BMlyGRNW4WynTnGAB6BpUm1p6XnhSOCzuQqrl/zBvusrqzsqfpm
	/phJkDgDSv4g4Ius7gk+y7Nhcz782/8enc/aa8Pi0rgy7dmCfBxddvNhNAP0A6OKVOOx
	eo2hr7VSPXp5xkvGdFOf9Xnlt/4biIIuHU3KBdsTAcU7KsSe3csHk1YmV6FqQGEOTBPp
	1CnTxBn1EyMyWStTaPbL0moeBQhaz4z6nm+iij3wAmbPMgGsG+UsIVcz7DsMutq5O1OG
	qv9SCTdRYRIlXkifIX5hsjs5DqaLrbuIyhHzpYPdJthIofvd9tbOY9EL3Em6wx2U4sUC
	6Pjg==
X-Received: by 10.152.4.97 with SMTP id j1mr427769laj.10.1407962390028;
	Wed, 13 Aug 2014 13:39:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	sc8sm4557590lbb.27.2014.08.13.13.39.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 13:39:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 22:40:26 +0200
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20140813204025.GZ14848@jama>
References: <20140811095511.ADAAF503E6@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140811095511.ADAAF503E6@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: upgrade to 2.1
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
X-List-Received-Date: Wed, 13 Aug 2014 20:39:53 -0000
X-Groupsio-MsgNum: 56426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Syt9/4BcFIM5c5mV"
Content-Disposition: inline

--Syt9/4BcFIM5c5mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 09:55:11AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3ae32d0d6c7cf8294300f32d346da36748e05f3d
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3ae32d0d6c7cf8294300f32d346da36748e05f3d
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Wed Aug  6 10:43:25 2014 +0300
>=20
> qemu: upgrade to 2.1
>=20

This causes new QA warning:
qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? [build-d=
eps]

please fix that

> QEMU 2.1 comes with fixes and improvements.
> See http://wiki.qemu.org/ChangeLog/2.1 for details.
> - Added config for quorum support, depending on gnutls.
> - pcie_better_hotplug_support.patch removed,
> integrated upstream.
> - Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated
> to 2.1 source code.
> - no-strip.patch removed, no longer necessary due to code changes.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
>  .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------=
------
>  meta/recipes-devtools/qemu/qemu.inc                |  2 +-
>  meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
>  .../qemu/{qemu_2.0.0.bb =3D> qemu_2.1.0.bb}          |  7 +-
>  5 files changed, 4 insertions(+), 96 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-me=
mory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versat=
ilepb-Add-memory-size-checking.patch
> index 3834aed..7f1c5a9 100644
> --- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-si=
ze-checking.patch
> +++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-si=
ze-checking.patch
> @@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644
>  +                ((unsigned int)ram_size / (1 << 20)));
>  +        exit(1);
>  +    }
> -     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);
> +     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_siz=
e);
>       vmstate_register_ram_global(ram);
>       /* ??? RAM should repeat to fill physical memory space.  */
>  --=20
> diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support=
=2Epatch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.pat=
ch
> deleted file mode 100644
> index c7035b2..0000000
> --- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -The current code is broken: it does surprise removal which crashes guest=
s.
> -
> -Reimplemented the steps:
> - - Hotplug triggers both 'present detect change' and
> -   'attention button pressed'.
> -
> - - Hotunplug starts by triggering 'attention button pressed',
> -   then waits for the OS to power off the device and only
> -   then detaches it.
> -
> -Fixes CVE-2014-3471.
> -
> -Originated-by: Marcel Apfelbaum <address@hidden>
> -Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com>
> -
> ---- a/hw/pci/pcie.c	2014-04-17 15:44:44.000000000 +0200
> -+++ b/hw/pci/pcie.c	2014-07-15 13:03:16.905070562 +0200
> -@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
> -=20
> -     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
> -                                PCI_EXP_SLTSTA_PDS);
> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
> -+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
> -+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
> - }
> -=20
> - void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceSta=
te *dev,
> -@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
> -=20
> -     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap=
, errp);
> -=20
> --    object_unparent(OBJECT(dev));
> --    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> --                                 PCI_EXP_SLTSTA_PDS);
> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
> -+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
> - }
> -=20
> - /* pci express slot for pci express root/downstream port
> -@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
> -     hotplug_event_update_event_status(dev);
> - }
> -=20
> -+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaqu=
e)
> -+{
> -+    object_unparent(OBJECT(dev));
> -+}
> -+
> - void pcie_cap_slot_write_config(PCIDevice *dev,
> -                                 uint32_t addr, uint32_t val, int len)
> - {
> -@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
> -                         sltsta);
> -     }
> -=20
> -+    /*
> -+     * If the slot is polulated, power indicator is off and power
> -+     * controller is off, it is safe to detach the devices.
> -+     */
> -+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -+        ((val & PCI_EXP_SLTCTL_PIC_OFF) =3D=3D PCI_EXP_SLTCTL_PIC_OFF))=
 {
> -+            PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> -+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -+                                pcie_unplug_device, NULL);
> -+
> -+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> -+                                         PCI_EXP_SLTSTA_PDS);
> -+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
> -+                                       PCI_EXP_SLTSTA_PDC);
> -+    }
> -+
> -     hotplug_event_notify(dev);
> -=20
> -     /*=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 84330ae..57907ae 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -17,7 +17,6 @@ QEMU_TARGETS ?=3D "arm i386 mips mipsel mips64 mips64el=
 ppc sh4 x86_64"
> =20
>  SRC_URI =3D "\
>      file://powerpc_rom.bin \
> -    file://no-strip.patch \
>      file://larger_default_ram_size.patch \
>      file://disable-grabs.patch \
>      file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> @@ -89,6 +88,7 @@ PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-att=
r,--disable-virtfs,libcap a
>  PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
>  PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
>  PACKAGECONFIG[xen] =3D "--enable-xen, --disable-xen,,"
> +PACKAGECONFIG[quorum] =3D "--enable-quorum, --disable-quorum, gnutls,"
>  PACKAGECONFIG[vnc-tls] =3D "--enable-vnc --enable-vnc-tls,--disable-vnc-=
tls, gnutls,"
>  PACKAGECONFIG[vnc-ws] =3D "--enable-vnc --enable-vnc-ws,--disable-vnc-ws=
, gnutls,"
>  PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-vn=
c-sasl,cyrus-sasl,"
> diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipe=
s-devtools/qemu/qemu/no-strip.patch
> deleted file mode 100644
> index d6a4377..0000000
> --- a/meta/recipes-devtools/qemu/qemu/no-strip.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: qemu-0.14.0/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qemu-0.14.0.orig/Makefile
> -+++ qemu-0.14.0/Makefile
> -@@ -235,7 +235,7 @@ install-sysconfig:
> - install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
> - 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
> - ifneq ($(TOOLS),)
> --	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
> -+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
> - endif
> - ifneq ($(BLOBS),)
> - 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
> diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devt=
ools/qemu/qemu_2.1.0.bb
> similarity index 81%
> rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb
> rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb
> index 9a530a6..abf8dfc 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> @@ -5,14 +5,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86=
e15a37fa47e15a72fbac \
> =20
>  SRC_URI +=3D "file://qemu-enlarge-env-entry-size.patch \
>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
> -            file://pcie_better_hotplug_support.patch \
>              "
> =20
> -
> -
>  SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "2790f44fd76da5de5024b4aafeb594c2"
> -SRC_URI[sha256sum] =3D "60cc1aa0cad39cec891f970bed60ca8a484f071adad49431=
23599ac223543a3b"
> +SRC_URI[md5sum] =3D "6726977292b448cbc7f89998fac6983b"
> +SRC_URI[sha256sum] =3D "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e9=
7e6fd2f31e8f8802"
> =20
>  COMPATIBLE_HOST_class-target_mips64 =3D "null"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Syt9/4BcFIM5c5mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPrzTkACgkQN1Ujt2V2gBxVZwCfUvIQVn1aIabx7goJEKQ1Dn2G
BEYAnix8lOVwe7BIljjSZb0EVfuRH9eE
=jOmJ
-----END PGP SIGNATURE-----

--Syt9/4BcFIM5c5mV--
