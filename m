Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8CF71A00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:42:06 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id t184so79680722qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 04:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8Z636o+kZrPiYDOJQM82Q9x88f7prRQD0x4JBny3Pgc=;
	b=d+hh45EKjowrMA6H9rIccYUV9mMPq3ieH2eMC4b7FO/ebi3ngmAJAwtFdJYsiijG/u
	IPhKGtuh9VMW1ZN5SYObvBoqCfSL4a7VzEYPtS0w1Xm9VQUQRDnRevQSHd3Wy8c8dy1m
	DO+lLUdN3AAOhEwg9bcDoVyJf2vUWLHpS5zd+5raBzBxwuiLvgnx1Va8TMqW9d6s9anP
	YngNjPG9PRLJekEqHgz4rrBmZ8DAM6Fp4Fob56FwuPvL4i7PWLg3vohIX3hgMJLRKVBa
	E/WzH/PEy6gtwEu47GpX5Z2telAAvy4w04MbfybBCOnx92ERm4/8HRX/E+toV6+7z9Xq
	JQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8Z636o+kZrPiYDOJQM82Q9x88f7prRQD0x4JBny3Pgc=;
	b=PMp4K5FvAqX+W2sJSmgxE4oN08mpTElpFxicgkz7h0pahEpXaAeH+wnsFi59sy/JWa
	J4fC7VUazWogQW5puxc0hN7UfE8jh2Ijr+5ShDZ1kd6eLAuuBPcKjFINXBsJM1GWN2Yp
	IVrs0dXFYQ9XSyjZ+e0PInUOVsWsSZpXRcTcegDQdvQoMwVD4EP1mhZG1sFihbUSME6C
	ZB5Q8rHHwEFmDZJu2smEtkVMoUFo43ESuzfNUs3cubIr8I2ZZyMBT48nIspAH6isA31Z
	OiHPYKYcfCIp2/IO2K+Ch48xX7UKMGMkeDuY1TemRQZX1CPYI0MsJ6FK8Dw7R3MGr6/6
	KBWw==
X-Gm-Message-State: AIkVDXKIFpMv7G1tkzRmGUee1CedKgAgnP8EgDXCSsWW7pkoGniGrLzFODxWnz2BPXZ1lUiG3DyvccykcPaoxrmM
X-Received: by 10.55.106.134 with SMTP id f128mr4845087qkc.121.1482324127763; 
	Wed, 21 Dec 2016 04:42:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 21 Dec 2016 04:41:47 -0800 (PST)
In-Reply-To: <88c4f824-4fdf-b6bc-3c16-07d1bcbf8fd1@windriver.com>
References: <1480413407-22659-1-git-send-email-zhe.he@windriver.com>
	<88c4f824-4fdf-b6bc-3c16-07d1bcbf8fd1@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Dec 2016 12:41:47 +0000
Message-ID: <CAJTo0LbTceaJQfSKVOBp2JqBmuh87CvHGy8i_137yiqUUf5Wvw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Fix pci-assign
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
X-List-Received-Date: Wed, 21 Dec 2016 12:42:12 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6142f6505442a7b06

--001a114fddf6142f6505442a7b06
Content-Type: text/plain; charset=UTF-8

Now in my staging branch, sorry.

Ross

On 21 December 2016 at 07:01, He Zhe <zhe.he@windriver.com> wrote:

> Ping.
>
> Zhe
>
>
> On 11/29/2016 05:56 PM, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > Fix iommu pci device assignment failure.
> >
> > "qemu-system-x86_64: -device pci-assign,host=02:00.0: No IOMMU found.
> > Unable to assign device "(null)""
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> >  ...sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch | 71
> ++++++++++++++++++++++
> >  meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  1 +
> >  2 files changed, 72 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/
> qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-
> MSI-X-cap-and-table-with-PCIDevi.patch b/meta/recipes-devtools/qemu/
> qemu/0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> > new file mode 100644
> > index 0000000..03472dd
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0001-pci-assign-sync-MSI-
> MSI-X-cap-and-table-with-PCIDevi.patch
> > @@ -0,0 +1,71 @@
> > +From 6baa545df93253fced4fc0d52b14b98447e00473 Mon Sep 17 00:00:00 2001
> > +From: Peter Xu <peterx@redhat.com>
> > +Date: Mon, 28 Nov 2016 15:02:44 +0800
> > +Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDevice
> > +
> > +Since commit e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn"),
> > +kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fetch
> > +MSI info. This requires that we setup MSI related fields in PCIDevice.
> > +For most devices, that won't be a problem, as long as we are using
> > +general interfaces like msi_init()/msix_init().
> > +
> > +However, for pci-assign devices, MSI/MSI-X is treated differently - PCI
> > +assign devices are maintaining its own MSI table and cap information in
> > +AssignedDevice struct. however that's not synced up with PCIDevice's
> > +fields. That will leads to pci_get_msi_message() failed to find correct
> > +MSI capability, even with an NULL msix_table.
> > +
> > +A quick fix is to sync up the two places: both the capability bits and
> > +table address for MSI/MSI-X.
> > +
> > +Upstream-Status: Backport [https://lists.gnu.org/
> archive/html/qemu-devel/2016-11/msg04649.html]
> > +
> > +Reported-by: Changlimin <address@hidden>
> > +Tested-by: Changlimin <address@hidden>
> > +Cc: address@hidden
> > +Fixes: e1d4fb2d ("kvm-irqchip: x86: add msi route notify fn")
> > +Signed-off-by: Peter Xu <address@hidden>
> > +Signed-off-by: He Zhe <zhe.he@windriver.com>
> > +---
> > + hw/i386/kvm/pci-assign.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
> > +index 8238fbc..87dcbdd 100644
> > +--- a/hw/i386/kvm/pci-assign.c
> > ++++ b/hw/i386/kvm/pci-assign.c
> > +@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(PCIDevice
> *pci_dev, Error **errp)
> > +             error_propagate(errp, local_err);
> > +             return -ENOTSUP;
> > +         }
> > ++        dev->dev.cap_present |= QEMU_PCI_CAP_MSI;
> > +         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSI;
> > +         /* Only 32-bit/no-mask currently supported */
> > +         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSI, pos, 10,
> > +@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(PCIDevice
> *pci_dev, Error **errp)
> > +             error_propagate(errp, local_err);
> > +             return -ENOTSUP;
> > +         }
> > ++        dev->dev.cap_present |= QEMU_PCI_CAP_MSIX;
> > +         dev->cap.available |= ASSIGNED_DEVICE_CAP_MSIX;
> > +         ret = pci_add_capability2(pci_dev, PCI_CAP_ID_MSIX, pos, 12,
> > +                                   &local_err);
> > +@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_mmio(AssignedDevice
> *dev, Error **errp)
> > +         dev->msix_table = NULL;
> > +         return;
> > +     }
> > ++    dev->dev.msix_table = (uint8_t *)dev->msix_table;
> > +
> > +     assigned_dev_msix_reset(dev);
> > +
> > +@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_mmio(AssignedDevice
> *dev)
> > +         error_report("error unmapping msix_table! %s",
> strerror(errno));
> > +     }
> > +     dev->msix_table = NULL;
> > ++    dev->dev.msix_table = NULL;
> > + }
> > +
> > + static const VMStateDescription vmstate_assigned_device = {
> > +--
> > +2.8.3
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> > index cef181d..9da5134 100644
> > --- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> > +++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> > @@ -13,6 +13,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch
> \
> >              file://0002-fix-CVE-2016-7423.patch \
> >              file://0003-fix-CVE-2016-7908.patch \
> >              file://0004-fix-CVE-2016-7909.patch \
> > +            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> \
> >  "
> >
> >  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114fddf6142f6505442a7b06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now in my staging branch, sorry.<div><br></div><div>Ross</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 D=
ecember 2016 at 07:01, He Zhe <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.h=
e@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Ping.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Zhe<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 11/29/2016 05:56 PM, <a href=3D"mailto:zhe.he@windriver.com">zhe.he@wind=
river.com</a> wrote:<br>
&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windri=
ver.com</a>&gt;<br>
&gt;<br>
&gt; Fix iommu pci device assignment failure.<br>
&gt;<br>
&gt; &quot;qemu-system-x86_64: -device pci-assign,host=3D02:00.0: No IOMMU =
found.<br>
&gt; Unable to assign device &quot;(null)&quot;&quot;<br>
&gt;<br>
&gt; Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.=
he@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...sync-MSI-MSI-X-cap-and-<wbr>table-with-PCIDevi.patch | 71 +++=
+++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.7.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 72 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0001-pci=
-assign-sync-MSI-<wbr>MSI-X-cap-and-table-with-<wbr>PCIDevi.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0001-pci-assign-sync=
-MSI-<wbr>MSI-X-cap-and-table-with-<wbr>PCIDevi.patch b/meta/recipes-devtoo=
ls/qemu/<wbr>qemu/0001-pci-assign-sync-MSI-<wbr>MSI-X-cap-and-table-with-<w=
br>PCIDevi.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..03472dd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/qemu/<wbr>qemu/0001-pci-assign-sync-MSI-<w=
br>MSI-X-cap-and-table-with-<wbr>PCIDevi.patch<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +From 6baa545df93253fced4fc0d52b14b9<wbr>8447e00473 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat=
.com</a>&gt;<br>
&gt; +Date: Mon, 28 Nov 2016 15:02:44 +0800<br>
&gt; +Subject: [PATCH] pci-assign: sync MSI/MSI-X cap and table with PCIDev=
ice<br>
&gt; +<br>
&gt; +Since commit e1d4fb2d (&quot;kvm-irqchip: x86: add msi route notify f=
n&quot;),<br>
&gt; +kvm_irqchip_add_msi_route() starts to use pci_get_msi_message() to fe=
tch<br>
&gt; +MSI info. This requires that we setup MSI related fields in PCIDevice=
.<br>
&gt; +For most devices, that won&#39;t be a problem, as long as we are usin=
g<br>
&gt; +general interfaces like msi_init()/msix_init().<br>
&gt; +<br>
&gt; +However, for pci-assign devices, MSI/MSI-X is treated differently - P=
CI<br>
&gt; +assign devices are maintaining its own MSI table and cap information =
in<br>
&gt; +AssignedDevice struct. however that&#39;s not synced up with PCIDevic=
e&#39;s<br>
&gt; +fields. That will leads to pci_get_msi_message() failed to find corre=
ct<br>
&gt; +MSI capability, even with an NULL msix_table.<br>
&gt; +<br>
&gt; +A quick fix is to sync up the two places: both the capability bits an=
d<br>
&gt; +table address for MSI/MSI-X.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://lists.gnu.org/archive/h=
tml/qemu-devel/2016-11/msg04649.html" rel=3D"noreferrer" target=3D"_blank">=
https://lists.gnu.org/<wbr>archive/html/qemu-devel/2016-<wbr>11/msg04649.ht=
ml</a>]<br>
&gt; +<br>
&gt; +Reported-by: Changlimin &lt;address@hidden&gt;<br>
&gt; +Tested-by: Changlimin &lt;address@hidden&gt;<br>
&gt; +Cc: address@hidden<br>
&gt; +Fixes: e1d4fb2d (&quot;kvm-irqchip: x86: add msi route notify fn&quot=
;)<br>
&gt; +Signed-off-by: Peter Xu &lt;address@hidden&gt;<br>
&gt; +Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe=
.he@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + hw/i386/kvm/pci-assign.c | 4 ++++<br>
&gt; + 1 file changed, 4 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c<br>
&gt; +index 8238fbc..87dcbdd 100644<br>
&gt; +--- a/hw/i386/kvm/pci-assign.c<br>
&gt; ++++ b/hw/i386/kvm/pci-assign.c<br>
&gt; +@@ -1251,6 +1251,7 @@ static int assigned_device_pci_cap_init(<wbr>PC=
IDevice *pci_dev, Error **errp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp,=
 local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;dev.cap_present |=3D QEMU_PCI_CA=
P_MSI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;cap.available |=3D ASSIGNED=
_DEVICE_CAP_MSI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only 32-bit/no-mask currently su=
pported */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_add_capability2(pci_dev=
, PCI_CAP_ID_MSI, pos, 10,<br>
&gt; +@@ -1285,6 +1286,7 @@ static int assigned_device_pci_cap_init(<wbr>PC=
IDevice *pci_dev, Error **errp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp,=
 local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;dev.cap_present |=3D QEMU_PCI_CA=
P_MSIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;cap.available |=3D ASSIGNED=
_DEVICE_CAP_MSIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_add_capability2(pci_dev=
, PCI_CAP_ID_MSIX, pos, 12,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;local_err);<br=
>
&gt; +@@ -1648,6 +1650,7 @@ static void assigned_dev_register_msix_<wbr>mmi=
o(AssignedDevice *dev, Error **errp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;msix_table =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 dev-&gt;dev.msix_table =3D (uint8_t *)dev-&gt;msix_tab=
le;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0assigned_dev_msix_reset(dev);<br>
&gt; +<br>
&gt; +@@ -1665,6 +1668,7 @@ static void assigned_dev_unregister_msix_<wbr>m=
mio(AssignedDevice *dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;error unmapping =
msix_table! %s&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;msix_table =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 dev-&gt;dev.msix_table =3D NULL;<br>
&gt; + }<br>
&gt; +<br>
&gt; + static const VMStateDescription vmstate_assigned_device =3D {<br>
&gt; +--<br>
&gt; +2.8.3<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.b=
b" rel=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.7.0.bb</a> b/meta/recip=
es-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">q<wbr>emu_2.7.0.bb</a><br>
&gt; index cef181d..9da5134 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.7.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.7.0.bb</a><br>
&gt; @@ -13,6 +13,7 @@ SRC_URI +=3D &quot;file://configure-fix-Darwin-<wbr>=
target-detection.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-fix-CVE-20=
16-7423.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-fix-CVE-20=
16-7908.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-fix-CVE-20=
16-7909.<wbr>patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pci-assign-sync=
-<wbr>MSI-MSI-X-cap-and-table-with-<wbr>PCIDevi.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_prepend =3D &quot;<a href=3D"http://wiki.qemu-project.or=
g/download/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.=
qemu-project.org/<wbr>download/${BP}.tar.bz2</a>&quot;<br>
<br>
--<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">_______________________=
_______<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114fddf6142f6505442a7b06--
