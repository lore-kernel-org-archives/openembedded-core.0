Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DA53B62252;
	Thu, 14 Aug 2014 06:12:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2014 23:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,861,1400050800"; 
	d="scan'208,217";a="587908785"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2014 23:12:27 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 14 Aug 2014 07:12:26 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.240]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.233]) with mapi id
	14.03.0195.001; Thu, 14 Aug 2014 07:12:25 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Kang, Kai (Wind River)" <kai.kang@windriver.com>, Martin Jansa
	<martin.jansa@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-commits] Cristian Iorga : qemu: upgrade to 2.1
Thread-Index: AQHPtUptwOyTa6wVLEOq2NAKfjUD/pvO8kcAgABc6ACAAFMGEA==
Date: Thu, 14 Aug 2014 06:12:17 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F2C0D6C@IRSMSX105.ger.corp.intel.com>
References: <20140811095511.ADAAF503E6@opal.openembedded.org>
	<20140813204025.GZ14848@jama> <53EC1B2A.8070503@windriver.com>
In-Reply-To: <53EC1B2A.8070503@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
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
X-List-Received-Date: Thu, 14 Aug 2014 06:12:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_969F26A8BAB325438E7EB80D3C3134FB2F2C0D6CIRSMSX105gercor_"

--_000_969F26A8BAB325438E7EB80D3C3134FB2F2C0D6CIRSMSX105gercor_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hello Martin, Kai,
Same goes for me as for Kai.
Kai, thanks for testing.
Martin, can you give more details?

Cristian Iorga
Yocto Project
Intel Corporation

From: Kang Kai [mailto:Kai.Kang@windriver.com]
Sent: Thursday, August 14, 2014 5:13 AM
To: Martin Jansa; openembedded-core@lists.openembedded.org; Iorga, Cristian
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [OE-core] [oe-commits] Cristian Iorga : qemu: upgrade to 2.1

On 2014=1B$BG/=1B(B08=1B$B7n=1B(B14=1B$BF|=1B(B 04:40, Martin Jansa wrote:

On Mon, Aug 11, 2014 at 09:55:11AM +0000, git@git.openembedded.org<mailto:g=
it@git.openembedded.org> wrote:

Module: openembedded-core.git

Branch: master

Commit: 3ae32d0d6c7cf8294300f32d346da36748e05f3d

URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=
=3D3ae32d0d6c7cf8294300f32d346da36748e05f3d



Author: Cristian Iorga <cristian.iorga@intel.com><mailto:cristian.iorga@int=
el.com>

Date:   Wed Aug  6 10:43:25 2014 +0300



qemu: upgrade to 2.1





This causes new QA warning:

qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? [build-d=
eps]

I  built qemu-2.1.0 for qemux86 and no such warning. What's the arch the wa=
rning shows and does it need other configs?

Regards,
Kai







please fix that



QEMU 2.1 comes with fixes and improvements.

See http://wiki.qemu.org/ChangeLog/2.1 for details.

- Added config for quorum support, depending on gnutls.

- pcie_better_hotplug_support.patch removed,

integrated upstream.

- Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated

to 2.1 source code.

- no-strip.patch removed, no longer necessary due to code changes.



Signed-off-by: Cristian Iorga <cristian.iorga@intel.com><mailto:cristian.io=
rga@intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org><mailto:r=
ichard.purdie@linuxfoundation.org>



---



 ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-

 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ------------------=
----

 meta/recipes-devtools/qemu/qemu.inc                |  2 +-

 meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----

 .../qemu/{qemu_2.0.0.bb =3D> qemu_2.1.0.bb}          |  7 +-

 5 files changed, 4 insertions(+), 96 deletions(-)



diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memo=
ry-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatil=
epb-Add-memory-size-checking.patch

index 3834aed..7f1c5a9 100644

--- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size=
-checking.patch

+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size=
-checking.patch

@@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644

 +                ((unsigned int)ram_size / (1 << 20)));

 +        exit(1);

 +    }

-     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);

+     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size)=
;

      vmstate_register_ram_global(ram);

      /* ??? RAM should repeat to fill physical memory space.  */

 --

diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.p=
atch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch

deleted file mode 100644

index c7035b2..0000000

--- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch

+++ /dev/null

@@ -1,74 +0,0 @@

-The current code is broken: it does surprise removal which crashes guests.

-

-Reimplemented the steps:

- - Hotplug triggers both 'present detect change' and

-   'attention button pressed'.

-

- - Hotunplug starts by triggering 'attention button pressed',

-   then waits for the OS to power off the device and only

-   then detaches it.

-

-Fixes CVE-2014-3471.

-

-Originated-by: Marcel Apfelbaum <address@hidden>

-Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com><mailto:daniel.bornaz@en=
ea.com>

-

---- a/hw/pci/pcie.c 2014-04-17 15:44:44.000000000 +0200

-+++ b/hw/pci/pcie.c 2014-07-15 13:03:16.905070562 +0200

-@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan

-

-     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,

-                                PCI_EXP_SLTSTA_PDS);

--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);

-+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),

-+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);

- }

-

- void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState=
 *dev,

-@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug

-

-     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap, =
errp);

-

--    object_unparent(OBJECT(dev));

--    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,

--                                 PCI_EXP_SLTSTA_PDS);

--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);

-+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));

- }

-

- /* pci express slot for pci express root/downstream port

-@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)

-     hotplug_event_update_event_status(dev);

- }

-

-+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)

-+{

-+    object_unparent(OBJECT(dev));

-+}

-+

- void pcie_cap_slot_write_config(PCIDevice *dev,

-                                 uint32_t addr, uint32_t val, int len)

- {

-@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic

-                         sltsta);

-     }

-

-+    /*

-+     * If the slot is polulated, power indicator is off and power

-+     * controller is off, it is safe to detach the devices.

-+     */

-+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&

-+        ((val & PCI_EXP_SLTCTL_PIC_OFF) =3D=3D PCI_EXP_SLTCTL_PIC_OFF)) {

-+            PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));

-+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),

-+                                pcie_unplug_device, NULL);

-+

-+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,

-+                                         PCI_EXP_SLTSTA_PDS);

-+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,

-+                                       PCI_EXP_SLTSTA_PDC);

-+    }

-+

-     hotplug_event_notify(dev);

-

-     /*

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc

index 84330ae..57907ae 100644

--- a/meta/recipes-devtools/qemu/qemu.inc

+++ b/meta/recipes-devtools/qemu/qemu.inc

@@ -17,7 +17,6 @@ QEMU_TARGETS ?=3D "arm i386 mips mipsel mips64 mips64el p=
pc sh4 x86_64"



 SRC_URI =3D "\

     file://powerpc_rom.bin<file:///\\powerpc_rom.bin> \

-    file://no-strip.patch<file:///\\no-strip.patch> \

     file://larger_default_ram_size.patch<file:///\\larger_default_ram_size=
.patch> \

     file://disable-grabs.patch<file:///\\disable-grabs.patch> \

     file://exclude-some-arm-EABI-obsolete-syscalls.patch<file:///\\exclude=
-some-arm-EABI-obsolete-syscalls.patch> \

@@ -89,6 +88,7 @@ PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr,=
--disable-virtfs,libcap a

 PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"

 PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"

 PACKAGECONFIG[xen] =3D "--enable-xen, --disable-xen,,"

+PACKAGECONFIG[quorum] =3D "--enable-quorum, --disable-quorum, gnutls,"

 PACKAGECONFIG[vnc-tls] =3D "--enable-vnc --enable-vnc-tls,--disable-vnc-tl=
s, gnutls,"

 PACKAGECONFIG[vnc-ws] =3D "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, =
gnutls,"

 PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-vnc-=
sasl,cyrus-sasl,"

diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipes-=
devtools/qemu/qemu/no-strip.patch

deleted file mode 100644

index d6a4377..0000000

--- a/meta/recipes-devtools/qemu/qemu/no-strip.patch

+++ /dev/null

@@ -1,15 +0,0 @@

-Upstream-Status: Inappropriate [configuration]

-

-Index: qemu-0.14.0/Makefile

-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

---- qemu-0.14.0.orig/Makefile

-+++ qemu-0.14.0/Makefile

-@@ -235,7 +235,7 @@ install-sysconfig:

- install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig

-    $(INSTALL_DIR) "$(DESTDIR)$(bindir)"

- ifneq ($(TOOLS),)

--   $(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"

-+   $(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"

- endif

- ifneq ($(BLOBS),)

-    $(INSTALL_DIR) "$(DESTDIR)$(datadir)"

diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devtoo=
ls/qemu/qemu_2.1.0.bb

similarity index 81%

rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb

rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb

index 9a530a6..abf8dfc 100644

--- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb

+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb

@@ -5,14 +5,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e1=
5a37fa47e15a72fbac \<file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fb=
ac\SRC_URI+=3D>

 <file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac\SRC_URI+=3D>

 SRC_URI +=3D "</a<file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac=
\SRC_URI+=3D>"file://qemu-enlarge-env-entry-size.patch \

             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch<fil=
e:///\\Qemu-Arm-versatilepb-Add-memory-size-checking.patch> \

-            file://pcie_better_hotplug_support.patch<file:///\\pcie_better=
_hotplug_support.patch> \

             "



-

-

 SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.bz2"<=
http://wiki.qemu-project.org/download/$%7bBP%7d.tar.bz2>

-SRC_URI[md5sum] =3D "2790f44fd76da5de5024b4aafeb594c2"

-SRC_URI[sha256sum] =3D "60cc1aa0cad39cec891f970bed60ca8a484f071adad4943123=
599ac223543a3b"

+SRC_URI[md5sum] =3D "6726977292b448cbc7f89998fac6983b"

+SRC_URI[sha256sum] =3D "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e=
6fd2f31e8f8802"



 COMPATIBLE_HOST_class-target_mips64 =3D "null"





--

_______________________________________________

Openembedded-commits mailing list

Openembedded-commits@lists.openembedded.org<mailto:Openembedded-commits@lis=
ts.openembedded.org>

http://lists.openembedded.org/mailman/listinfo/openembedded-commits








--

Regards,

Neil | Kai Kang

--_000_969F26A8BAB325438E7EB80D3C3134FB2F2C0D6CIRSMSX105gercor_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS PGothic","sans-serif";
	color:black;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS Gothic";
	color:black;
	mso-fareast-language:JA;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;
	mso-fareast-language:JA;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Hello Martin, Kai,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Same goes for me as for Kai.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Kai, thanks for testing.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Martin, can you give more details?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Cristian Iorga<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Yocto Project<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D;mso-fareast-language:EN-US=
">Intel Corporation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"font-size=
:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497=
D;mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></a></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:wind=
owtext">From:</span></b><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:windowtext"> Kang Kai [mailto:Kai=
.Kang@windriver.com]
<br>
<b>Sent:</b> Thursday, August 14, 2014 5:13 AM<br>
<b>To:</b> Martin Jansa; openembedded-core@lists.openembedded.org; Iorga, C=
ristian<br>
<b>Cc:</b> openembedded-commits@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [oe-commits] Cristian Iorga : qemu: upgrade t=
o 2.1<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">On 2014<span lang=3D"JA">=
=1B$BG/=1B(B</span>08<span lang=3D"JA">=1B$B7n=1B(B</span>14<span lang=3D"J=
A">=1B$BF|=1B(B</span> 04:40, Martin Jansa wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:.5in">On Mon, Aug 11, 2014 at 09:55:11AM &#43;000=
0, <a href=3D"mailto:git@git.openembedded.org">git@git.openembedded.org</a>=
 wrote:<o:p></o:p></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:.5in">Module: openembedded-core.git<o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in">Branch: master<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">Commit: 3ae32d0d6c7cf8294300f32d346da36748e=
05f3d<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">URL:&nbsp;&nbsp;&nbsp; <a href=3D"http://gi=
t.openembedded.org/?p=3Dopenembedded-core.git&amp;a=3Dcommit;h=3D3ae32d0d6c=
7cf8294300f32d346da36748e05f3d">http://git.openembedded.org/?p=3Dopenembedd=
ed-core.git&amp;a=3Dcommit;h=3D3ae32d0d6c7cf8294300f32d346da36748e05f3d</a>=
<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">Author: Cristian Iorga <a href=3D"mailto:cr=
istian.iorga@intel.com">&lt;cristian.iorga@intel.com&gt;</a><o:p></o:p></pr=
e>
<pre style=3D"margin-left:.5in">Date:&nbsp;&nbsp; Wed Aug&nbsp; 6 10:43:25 =
2014 &#43;0300<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">qemu: upgrade to 2.1<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
</blockquote>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">This causes new QA warning:<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">qemu-2.1.0: qemu rdepends on lzo, but it is=
n't a build dependency? [build-deps]<o:p></o:p></pre>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
I&nbsp; built qemu-2.1.0 for qemux86 and no such warning. What's the arch t=
he warning shows and does it need other configs?<br>
<br>
Regards,<br>
Kai<br>
<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">please fix that<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre style=3D"margin-left:.5in">QEMU 2.1 comes with fixes and improvements.=
<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">See <a href=3D"http://wiki.qemu.org/ChangeL=
og/2.1">http://wiki.qemu.org/ChangeLog/2.1</a> for details.<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">- Added config for quorum support, dependin=
g on gnutls.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- pcie_better_hotplug_support.patch removed=
,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">integrated upstream.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- Qemu-Arm-versatilepb-Add-memory-size-chec=
king.patch updated<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">to 2.1 source code.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- no-strip.patch removed, no longer necessa=
ry due to code changes.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">Signed-off-by: Cristian Iorga <a href=3D"ma=
ilto:cristian.iorga@intel.com">&lt;cristian.iorga@intel.com&gt;</a><o:p></o=
:p></pre>
<pre style=3D"margin-left:.5in">Signed-off-by: Richard Purdie <a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation=
.org&gt;</a><o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">---<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in"> ...-Arm-versatilepb-Add-memory-size-checki=
ng.patch |&nbsp; 2 &#43;-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> .../qemu/files/pcie_better_hotplug_support=
.patch&nbsp;&nbsp; | 74 ----------------------<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> meta/recipes-devtools/qemu/qemu.inc&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 2 &#43;-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> meta/recipes-devtools/qemu/qemu/no-strip.p=
atch&nbsp;&nbsp;&nbsp;&nbsp; | 15 -----<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> .../qemu/{qemu_2.0.0.bb =3D&gt; qemu_2.1.0=
.bb}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 &#43;-=
<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> 5 files changed, 4 insertions(&#43;), 96 d=
eletions(-)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">diff --git a/meta/recipes-devtools/qemu/fil=
es/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devto=
ols/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch<o:p></o:=
p></pre>
<pre style=3D"margin-left:.5in">index 3834aed..7f1c5a9 100644<o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in">--- a/meta/recipes-devtools/qemu/files/Qemu=
-Arm-versatilepb-Add-memory-size-checking.patch<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;&#43;&#43; b/meta/recipes-devtools/qem=
u/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">@@ -32,7 &#43;32,7 @@ index b48d84c..ad2cd5=
a 100644<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((unsigned int)ram_si=
ze / (1 &lt;&lt; 20)));<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; exit(1);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> &#43;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; memory_region_ini=
t_ram(ram, NULL, &quot;versatile.ram&quot;, args-&gt;ram_size);<o:p></o:p><=
/pre>
<pre style=3D"margin-left:.5in">&#43;&nbsp;&nbsp;&nbsp;&nbsp; memory_region=
_init_ram(ram, NULL, &quot;versatile.ram&quot;, machine-&gt;ram_size);<o:p>=
</o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vmstate_regi=
ster_ram_global(ram);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ??? RAM s=
hould repeat to fill physical memory space.&nbsp; */<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> -- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">diff --git a/meta/recipes-devtools/qemu/fil=
es/pcie_better_hotplug_support.patch b/meta/recipes-devtools/qemu/files/pci=
e_better_hotplug_support.patch<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">deleted file mode 100644<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">index c7035b2..0000000<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--- a/meta/recipes-devtools/qemu/files/pcie=
_better_hotplug_support.patch<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;&#43;&#43; /dev/null<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">@@ -1,74 &#43;0,0 @@<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-The current code is broken: it does surpri=
se removal which crashes guests.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Reimplemented the steps:<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- - Hotplug triggers both 'present detect c=
hange' and<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp; 'attention button pressed'.<o=
:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- - Hotunplug starts by triggering 'attenti=
on button pressed',<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp; then waits for the OS to powe=
r off the device and only<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp; then detaches it.<o:p></o:p><=
/pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Fixes CVE-2014-3471.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Originated-by: Marcel Apfelbaum &lt;addres=
s@hidden&gt;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Updated-by: Daniel BORNAZ <a href=3D"mailt=
o:daniel.bornaz@enea.com">&lt;daniel.bornaz@enea.com&gt;</a><o:p></o:p></pr=
e>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">---- a/hw/pci/pcie.c 2014-04-17 15:44:44.00=
0000000 &#43;0200<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&#43;&#43; b/hw/pci/pcie.c 2014-07-15=
 13:03:16.905070562 &#43;0200<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-@@ -258,7 &#43;258,8 @@ void pcie_cap_slot=
_hotplug_cb(HotplugHan<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; pci_word_test_and=
_set_mask(exp_cap &#43; PCI_EXP_SLTSTA,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCI_E=
XP_SLTSTA_PDS);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp;&nbsp; pcie_cap_slot_event(PC=
I_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; pcie_cap_slot_even=
t(PCI_DEVICE(hotplug_dev),<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);<o:p></o:=
p></pre>
<pre style=3D"margin-left:.5in">- }<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- void pcie_cap_slot_hot_unplug_cb(HotplugH=
andler *hotplug_dev, DeviceState *dev,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-@@ -268,10 &#43;269,7 @@ void pcie_cap_slo=
t_hot_unplug_cb(Hotplug<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; pcie_cap_slot_hot=
plug_common(PCI_DEVICE(hotplug_dev), dev, &amp;exp_cap, errp);<o:p></o:p></=
pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp;&nbsp; object_unparent(OBJECT=
(dev));<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp;&nbsp; pci_word_test_and_clea=
r_mask(exp_cap &#43; PCI_EXP_SLTSTA,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; PCI_EXP_SLTSTA_PDS);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp;&nbsp; pcie_cap_slot_event(PC=
I_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; pcie_cap_slot_push=
_attention_button(PCI_DEVICE(hotplug_dev));<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- }<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- /* pci express slot for pci express root/=
downstream port<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-@@ -352,6 &#43;350,11 @@ void pcie_cap_slo=
t_reset(PCIDevice *dev)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; hotplug_event_upd=
ate_event_status(dev);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- }<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;static void pcie_unplug_device(PCIBus=
 *bus, PCIDevice *dev, void *opaque)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;{<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; object_unparent(OB=
JECT(dev));<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;}<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- void pcie_cap_slot_write_config(PCIDevice=
 *dev,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;uint32_t addr, uint32_t val, int len)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- {<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-@@ -376,6 &#43;379,22 @@ void pcie_cap_slo=
t_write_config(PCIDevic<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; sltsta);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; /*<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp; * If the slo=
t is polulated, power indicator is off and power<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp; * controller=
 is off, it is safe to detach the devices.<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p=
></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; if ((sltsta &amp; =
PCI_EXP_SLTSTA_PDS) &amp;&amp; (val &amp; PCI_EXP_SLTCTL_PCC) &amp;&amp;<o:=
p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ((val &amp; PCI_EXP_SLTCTL_PIC_OFF) =3D=3D PCI_EXP_SLTCTL_PIC_OFF)) {=
<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PC=
I_BRIDGE(dev));<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_for_each_device(sec_bus, pci_bus_num(sec_=
bus),<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
pcie_unplug_device, NULL);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_word_test_and_clear_mask(exp_cap &#43; PC=
I_EXP_SLTSTA,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCI_EXP_SLTSTA_PDS);<=
o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_word_test_and_set_mask(exp_cap &#43; PCI_=
EXP_SLTSTA,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCI_EXP_SLTSTA_PDC);<o:p></o:p></=
pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; hotplug_event_not=
ify(dev);<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp; /* <o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in">diff --git a/meta/recipes-devtools/qemu/qem=
u.inc b/meta/recipes-devtools/qemu/qemu.inc<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">index 84330ae..57907ae 100644<o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in">--- a/meta/recipes-devtools/qemu/qemu.inc<o=
:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;&#43;&#43; b/meta/recipes-devtools/qem=
u/qemu.inc<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">@@ -17,7 &#43;17,6 @@ QEMU_TARGETS ?=3D &qu=
ot;arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64&quot;<o:p></o:p></pr=
e>
<pre style=3D"margin-left:.5in"> <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;SRC_URI =3D &quot;\<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> &nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"file://=
/\\powerpc_rom.bin">file://powerpc_rom.bin</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\no=
-strip.patch">file://no-strip.patch</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://=
/\\larger_default_ram_size.patch">file://larger_default_ram_size.patch</a> =
\<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://=
/\\disable-grabs.patch">file://disable-grabs.patch</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://=
/\\exclude-some-arm-EABI-obsolete-syscalls.patch">file://exclude-some-arm-E=
ABI-obsolete-syscalls.patch</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">@@ -89,6 &#43;88,7 @@ PACKAGECONFIG[virtfs]=
 =3D &quot;--enable-virtfs --enable-attr,--disable-virtfs,libcap a<o:p></o:=
p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[aio] =3D &quot;--enable-linu=
x-aio,--disable-linux-aio,libaio,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[xfs] =3D &quot;--enable-xfsc=
tl,--disable-xfsctl,xfsprogs,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[xen] =3D &quot;--enable-xen,=
 --disable-xen,,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;PACKAGECONFIG[quorum] =3D &quot;--enab=
le-quorum, --disable-quorum, gnutls,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[vnc-tls] =3D &quot;--enable-=
vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[vnc-ws] =3D &quot;--enable-v=
nc --enable-vnc-ws,--disable-vnc-ws, gnutls,&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> PACKAGECONFIG[vnc-sasl] =3D &quot;--enable=
-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,&quot;<o:p></o:p></pre=
>
<pre style=3D"margin-left:.5in">diff --git a/meta/recipes-devtools/qemu/qem=
u/no-strip.patch b/meta/recipes-devtools/qemu/qemu/no-strip.patch<o:p></o:p=
></pre>
<pre style=3D"margin-left:.5in">deleted file mode 100644<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">index d6a4377..0000000<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--- a/meta/recipes-devtools/qemu/qemu/no-st=
rip.patch<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;&#43;&#43; /dev/null<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">@@ -1,15 &#43;0,0 @@<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Upstream-Status: Inappropriate [configurat=
ion]<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-Index: qemu-0.14.0/Makefile<o:p></o:p></pr=
e>
<pre style=3D"margin-left:.5in">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">---- qemu-0.14.0.orig/Makefile<o:p></o:p></=
pre>
<pre style=3D"margin-left:.5in">-&#43;&#43;&#43; qemu-0.14.0/Makefile<o:p><=
/o:p></pre>
<pre style=3D"margin-left:.5in">-@@ -235,7 &#43;235,7 @@ install-sysconfig:=
<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- install: all $(if $(BUILD_DOCS),install-d=
oc) install-sysconfig<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- &nbsp;&nbsp; $(INSTALL_DIR) &quot;$(DESTD=
IR)$(bindir)&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- ifneq ($(TOOLS),)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">--&nbsp;&nbsp; $(INSTALL_PROG) $(STRIP_OPT)=
 $(TOOLS) &quot;$(DESTDIR)$(bindir)&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&#43;&nbsp;&nbsp; $(INSTALL_PROG) $(TOOLS)=
 &quot;$(DESTDIR)$(bindir)&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- endif<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- ifneq ($(BLOBS),)<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">- &nbsp;&nbsp; $(INSTALL_DIR) &quot;$(DESTD=
IR)$(datadir)&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">diff --git a/meta/recipes-devtools/qemu/qem=
u_2.0.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">similarity index 81%<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">rename from meta/recipes-devtools/qemu/qemu=
_2.0.0.bb<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">rename to meta/recipes-devtools/qemu/qemu_2=
.1.0.bb<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">index 9a530a6..abf8dfc 100644<o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in">--- a/meta/recipes-devtools/qemu/qemu_2.0.0=
.bb<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;&#43;&#43; b/meta/recipes-devtools/qem=
u/qemu_2.1.0.bb<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">@@ -5,14 &#43;5,11 @@ LIC_FILES_CHKSUM =3D =
<a href=3D"file:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac\SRC_URI=
&#43;=3D">&quot;file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac \<o:p=
></o:p></a></pre>
<pre style=3D"margin-left:.5in"><span class=3D"MsoHyperlink"><a href=3D"fil=
e:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac\SRC_URI&#43;=3D"> <o:=
p></o:p></a></span></pre>
<pre style=3D"margin-left:.5in"><span class=3D"MsoHyperlink"><a href=3D"fil=
e:///\\COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fbac\SRC_URI&#43;=3D">&nbs=
p;SRC_URI &#43;=3D &quot;&lt;/a</a></span>&quot;file://qemu-enlarge-env-ent=
ry-size.patch \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\Qemu-Arm-versatilepb-Add=
-memory-size-checking.patch">file://Qemu-Arm-versatilepb-Add-memory-size-ch=
ecking.patch</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\pcie_better_hotplug_support.p=
atch">file://pcie_better_hotplug_support.patch</a> \<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> SRC_URI_prepend =3D <a href=3D"http://wiki=
.qemu-project.org/download/$%7bBP%7d.tar.bz2">&quot;http://wiki.qemu-projec=
t.org/download/${BP}.tar.bz2&quot;</a><o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-SRC_URI[md5sum] =3D &quot;2790f44fd76da5de=
5024b4aafeb594c2&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">-SRC_URI[sha256sum] =3D &quot;60cc1aa0cad39=
cec891f970bed60ca8a484f071adad4943123599ac223543a3b&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;SRC_URI[md5sum] =3D &quot;6726977292b4=
48cbc7f89998fac6983b&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&#43;SRC_URI[sha256sum] =3D &quot;397e23184=
f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802&quot;<o:p></o:p></p=
re>
<pre style=3D"margin-left:.5in"> <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">&nbsp;COMPATIBLE_HOST_class-target_mips64 =
=3D &quot;null&quot;<o:p></o:p></pre>
<pre style=3D"margin-left:.5in"> <o:p></o:p></pre>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<pre style=3D"margin-left:.5in">-- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">___________________________________________=
____<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">Openembedded-commits mailing list<o:p></o:p=
></pre>
<pre style=3D"margin-left:.5in"><a href=3D"mailto:Openembedded-commits@list=
s.openembedded.org">Openembedded-commits@lists.openembedded.org</a><o:p></o=
:p></pre>
<pre style=3D"margin-left:.5in"><a href=3D"http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-commits">http://lists.openembedded.org/mailman/=
listinfo/openembedded-commits</a><o:p></o:p></pre>
</blockquote>
<pre style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></pre>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
<br>
<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
<br>
<br>
<o:p></o:p></p>
<pre style=3D"margin-left:.5in">-- <o:p></o:p></pre>
<pre style=3D"margin-left:.5in">Regards,<o:p></o:p></pre>
<pre style=3D"margin-left:.5in">Neil | Kai Kang<o:p></o:p></pre>
</div>
</body>
</html>

--_000_969F26A8BAB325438E7EB80D3C3134FB2F2C0D6CIRSMSX105gercor_--
