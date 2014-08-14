Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id F0EED60CFC;
	Thu, 14 Aug 2014 08:38:40 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so736297lab.15
	for <multiple recipients>; Thu, 14 Aug 2014 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bqZYJcwmF5ipjIP8hdxvX0kOa5KV23qp4EI/yeIqj1E=;
	b=ILqNzdw1XWhS3Wjxfx1efMzyZUaULe2nMfydSjcf57t2w0Qbgs8DbhAj1s+t4jdyR6
	WY+MEyWydo8eKFquqQ80LN1wvPAINpUlYBHvnmj4UcHVKDT3rRDN3fS0ZiS+bxyoA6oa
	1hLhZkN0xn8aKY/12GI6PKMKSebqYyVZiXKBU3BSM6mavbIYOjqSvPF7yJm9C1RArJxE
	el6mnvQ/DdtJjRbcUx5mVOWb9chahUxMOHkBthzvCeaTtc/FBKiJH0j+bnwXZkD8Tn+8
	P7OhpY02GvsOySaSJ6sgIS0kJ6nQsaKlmvfGg4of2bE2VFclPhiLYcaLNlUsL0lJE/jP
	CRtQ==
X-Received: by 10.152.171.69 with SMTP id as5mr1485054lac.94.1408005520962;
	Thu, 14 Aug 2014 01:38:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id f2sm6949813lbo.2.2014.08.14.01.38.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 01:38:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 10:39:17 +0200
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20140814083917.GE14848@jama>
References: <20140811095511.ADAAF503E6@opal.openembedded.org>
	<20140813204025.GZ14848@jama> <53EC1B2A.8070503@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F2C0D6C@IRSMSX105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F2C0D6C@IRSMSX105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 14 Aug 2014 08:38:42 -0000
X-Groupsio-MsgNum: 56461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X7JfAZXCART3xQo9"
Content-Disposition: inline

--X7JfAZXCART3xQo9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 06:12:17AM +0000, Iorga, Cristian wrote:
> Hello Martin, Kai,
> Same goes for me as for Kai.
> Kai, thanks for testing.
> Martin, can you give more details?

Have you built lzo before building qemu?

insane_qa won't detect it if it isn't in sysroot.

> Cristian Iorga
> Yocto Project
> Intel Corporation
>=20
> From: Kang Kai [mailto:Kai.Kang@windriver.com]
> Sent: Thursday, August 14, 2014 5:13 AM
> To: Martin Jansa; openembedded-core@lists.openembedded.org; Iorga, Cristi=
an
> Cc: openembedded-commits@lists.openembedded.org
> Subject: Re: [OE-core] [oe-commits] Cristian Iorga : qemu: upgrade to 2.1
>=20
> On 2014=E5=B9=B408=E6=9C=8814=E6=97=A5 04:40, Martin Jansa wrote:
>=20
> On Mon, Aug 11, 2014 at 09:55:11AM +0000, git@git.openembedded.org<mailto=
:git@git.openembedded.org> wrote:
>=20
> Module: openembedded-core.git
>=20
> Branch: master
>=20
> Commit: 3ae32d0d6c7cf8294300f32d346da36748e05f3d
>=20
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3ae32d0d6c7cf8294300f32d346da36748e05f3d
>=20
>=20
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com><mailto:cristian.iorga@i=
ntel.com>
>=20
> Date:   Wed Aug  6 10:43:25 2014 +0300
>=20
>=20
>=20
> qemu: upgrade to 2.1
>=20
>=20
>=20
>=20
>=20
> This causes new QA warning:
>=20
> qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? [build=
-deps]
>=20
> I  built qemu-2.1.0 for qemux86 and no such warning. What's the arch the =
warning shows and does it need other configs?
>=20
> Regards,
> Kai
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> please fix that
>=20
>=20
>=20
> QEMU 2.1 comes with fixes and improvements.
>=20
> See http://wiki.qemu.org/ChangeLog/2.1 for details.
>=20
> - Added config for quorum support, depending on gnutls.
>=20
> - pcie_better_hotplug_support.patch removed,
>=20
> integrated upstream.
>=20
> - Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated
>=20
> to 2.1 source code.
>=20
> - no-strip.patch removed, no longer necessary due to code changes.
>=20
>=20
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com><mailto:cristian.=
iorga@intel.com>
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org><mailto=
:richard.purdie@linuxfoundation.org>
>=20
>=20
>=20
> ---
>=20
>=20
>=20
>  ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
>=20
>  .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------=
------
>=20
>  meta/recipes-devtools/qemu/qemu.inc                |  2 +-
>=20
>  meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
>=20
>  .../qemu/{qemu_2.0.0.bb =3D> qemu_2.1.0.bb}          |  7 +-
>=20
>  5 files changed, 4 insertions(+), 96 deletions(-)
>=20
>=20
>=20
> diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-me=
mory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versat=
ilepb-Add-memory-size-checking.patch
>=20
> index 3834aed..7f1c5a9 100644
>=20
> --- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-si=
ze-checking.patch
>=20
> +++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-si=
ze-checking.patch
>=20
> @@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644
>=20
>  +                ((unsigned int)ram_size / (1 << 20)));
>=20
>  +        exit(1);
>=20
>  +    }
>=20
> -     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);
>=20
> +     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_siz=
e);
>=20
>       vmstate_register_ram_global(ram);
>=20
>       /* ??? RAM should repeat to fill physical memory space.  */
>=20
>  --
>=20
> diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support=
=2Epatch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.pat=
ch
>=20
> deleted file mode 100644
>=20
> index c7035b2..0000000
>=20
> --- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
>=20
> +++ /dev/null
>=20
> @@ -1,74 +0,0 @@
>=20
> -The current code is broken: it does surprise removal which crashes guest=
s.
>=20
> -
>=20
> -Reimplemented the steps:
>=20
> - - Hotplug triggers both 'present detect change' and
>=20
> -   'attention button pressed'.
>=20
> -
>=20
> - - Hotunplug starts by triggering 'attention button pressed',
>=20
> -   then waits for the OS to power off the device and only
>=20
> -   then detaches it.
>=20
> -
>=20
> -Fixes CVE-2014-3471.
>=20
> -
>=20
> -Originated-by: Marcel Apfelbaum <address@hidden>
>=20
> -Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com><mailto:daniel.bornaz@=
enea.com>
>=20
> -
>=20
> ---- a/hw/pci/pcie.c 2014-04-17 15:44:44.000000000 +0200
>=20
> -+++ b/hw/pci/pcie.c 2014-07-15 13:03:16.905070562 +0200
>=20
> -@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
>=20
> -
>=20
> -     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>=20
> -                                PCI_EXP_SLTSTA_PDS);
>=20
> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
>=20
> -+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
>=20
> -+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
>=20
> - }
>=20
> -
>=20
> - void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceSta=
te *dev,
>=20
> -@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
>=20
> -
>=20
> -     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap=
, errp);
>=20
> -
>=20
> --    object_unparent(OBJECT(dev));
>=20
> --    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>=20
> --                                 PCI_EXP_SLTSTA_PDS);
>=20
> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
>=20
> -+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
>=20
> - }
>=20
> -
>=20
> - /* pci express slot for pci express root/downstream port
>=20
> -@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
>=20
> -     hotplug_event_update_event_status(dev);
>=20
> - }
>=20
> -
>=20
> -+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaqu=
e)
>=20
> -+{
>=20
> -+    object_unparent(OBJECT(dev));
>=20
> -+}
>=20
> -+
>=20
> - void pcie_cap_slot_write_config(PCIDevice *dev,
>=20
> -                                 uint32_t addr, uint32_t val, int len)
>=20
> - {
>=20
> -@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
>=20
> -                         sltsta);
>=20
> -     }
>=20
> -
>=20
> -+    /*
>=20
> -+     * If the slot is polulated, power indicator is off and power
>=20
> -+     * controller is off, it is safe to detach the devices.
>=20
> -+     */
>=20
> -+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
>=20
> -+        ((val & PCI_EXP_SLTCTL_PIC_OFF) =3D=3D PCI_EXP_SLTCTL_PIC_OFF))=
 {
>=20
> -+            PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
>=20
> -+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
>=20
> -+                                pcie_unplug_device, NULL);
>=20
> -+
>=20
> -+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>=20
> -+                                         PCI_EXP_SLTSTA_PDS);
>=20
> -+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>=20
> -+                                       PCI_EXP_SLTSTA_PDC);
>=20
> -+    }
>=20
> -+
>=20
> -     hotplug_event_notify(dev);
>=20
> -
>=20
> -     /*
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
>=20
> index 84330ae..57907ae 100644
>=20
> --- a/meta/recipes-devtools/qemu/qemu.inc
>=20
> +++ b/meta/recipes-devtools/qemu/qemu.inc
>=20
> @@ -17,7 +17,6 @@ QEMU_TARGETS ?=3D "arm i386 mips mipsel mips64 mips64el=
 ppc sh4 x86_64"
>=20
>=20
>=20
>  SRC_URI =3D "\
>=20
>      file://powerpc_rom.bin<file:///\\powerpc_rom.bin> \
>=20
> -    file://no-strip.patch<file:///\\no-strip.patch> \
>=20
>      file://larger_default_ram_size.patch<file:///\\larger_default_ram_si=
ze.patch> \
>=20
>      file://disable-grabs.patch<file:///\\disable-grabs.patch> \
>=20
>      file://exclude-some-arm-EABI-obsolete-syscalls.patch<file:///\\exclu=
de-some-arm-EABI-obsolete-syscalls.patch> \
>=20
> @@ -89,6 +88,7 @@ PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-att=
r,--disable-virtfs,libcap a
>=20
>  PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
>=20
>  PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
>=20
>  PACKAGECONFIG[xen] =3D "--enable-xen, --disable-xen,,"
>=20
> +PACKAGECONFIG[quorum] =3D "--enable-quorum, --disable-quorum, gnutls,"
>=20
>  PACKAGECONFIG[vnc-tls] =3D "--enable-vnc --enable-vnc-tls,--disable-vnc-=
tls, gnutls,"
>=20
>  PACKAGECONFIG[vnc-ws] =3D "--enable-vnc --enable-vnc-ws,--disable-vnc-ws=
, gnutls,"
>=20
>  PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-vn=
c-sasl,cyrus-sasl,"
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipe=
s-devtools/qemu/qemu/no-strip.patch
>=20
> deleted file mode 100644
>=20
> index d6a4377..0000000
>=20
> --- a/meta/recipes-devtools/qemu/qemu/no-strip.patch
>=20
> +++ /dev/null
>=20
> @@ -1,15 +0,0 @@
>=20
> -Upstream-Status: Inappropriate [configuration]
>=20
> -
>=20
> -Index: qemu-0.14.0/Makefile
>=20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> ---- qemu-0.14.0.orig/Makefile
>=20
> -+++ qemu-0.14.0/Makefile
>=20
> -@@ -235,7 +235,7 @@ install-sysconfig:
>=20
> - install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
>=20
> -    $(INSTALL_DIR) "$(DESTDIR)$(bindir)"
>=20
> - ifneq ($(TOOLS),)
>=20
> --   $(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
>=20
> -+   $(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
>=20
> - endif
>=20
> - ifneq ($(BLOBS),)
>=20
> -    $(INSTALL_DIR) "$(DESTDIR)$(datadir)"
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devt=
ools/qemu/qemu_2.1.0.bb
>=20
> similarity index 81%
>=20
> rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb
>=20
> rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb
>=20
> index 9a530a6..abf8dfc 100644
>=20
> --- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
>=20
> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
>=20
> @@ -5,14 +5,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86=
e15a37fa47e15a72fbac \<file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72=
fbac\SRC_URI+=3D>
>=20
>  <file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac\SRC_URI+=3D>
>=20
>  SRC_URI +=3D "</a<file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fb=
ac\SRC_URI+=3D>"file://qemu-enlarge-env-entry-size.patch \
>=20
>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch<f=
ile:///\\Qemu-Arm-versatilepb-Add-memory-size-checking.patch> \
>=20
> -            file://pcie_better_hotplug_support.patch<file:///\\pcie_bett=
er_hotplug_support.patch> \
>=20
>              "
>=20
>=20
>=20
> -
>=20
> -
>=20
>  SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.bz2=
"<http://wiki.qemu-project.org/download/$%7bBP%7d.tar.bz2>
>=20
> -SRC_URI[md5sum] =3D "2790f44fd76da5de5024b4aafeb594c2"
>=20
> -SRC_URI[sha256sum] =3D "60cc1aa0cad39cec891f970bed60ca8a484f071adad49431=
23599ac223543a3b"
>=20
> +SRC_URI[md5sum] =3D "6726977292b448cbc7f89998fac6983b"
>=20
> +SRC_URI[sha256sum] =3D "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e9=
7e6fd2f31e8f8802"
>=20
>=20
>=20
>  COMPATIBLE_HOST_class-target_mips64 =3D "null"
>=20
>=20
>=20
>=20
>=20
> --
>=20
> _______________________________________________
>=20
> Openembedded-commits mailing list
>=20
> Openembedded-commits@lists.openembedded.org<mailto:Openembedded-commits@l=
ists.openembedded.org>
>=20
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> --
>=20
> Regards,
>=20
> Neil | Kai Kang

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X7JfAZXCART3xQo9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPsdbUACgkQN1Ujt2V2gBwP8gCgux4Yvy3LuO3/ZF3X7MtfePeC
R54AoKqDfgptNzyA2c9UtRXi2Wzz8fof
=Ibn9
-----END PGP SIGNATURE-----

--X7JfAZXCART3xQo9--
