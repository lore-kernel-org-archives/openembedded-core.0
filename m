Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12FB0607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 09:00:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6290oQE015431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 02:00:50 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Thu, 2 Jul 2015 02:00:49 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] qemu: CVE-2014-3689
Thread-Index: AQHQtJJOXS0rOUs3/0ehzEjkj5UyZp3H4cpA
Date: Thu, 2 Jul 2015 09:00:48 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF11F5FB2@ALA-MBB.corp.ad.wrs.com>
References: <1435819358-9462-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1435819358-9462-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: CVE-2014-3689
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
X-List-Received-Date: Thu, 02 Jul 2015 09:00:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Thursday, July 02, 2015 2:43 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] qemu: CVE-2014-3689
>=20
> From: Li Wang <li.wang@windriver.com>
>=20
> Issue: LIN7-2153

Sorry, this should be removed, please ignore this.

Thanks,
Jackie

>=20
> the patch comes from:
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-3689
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D83afa38eb20ca27e30683edc=
7729880e091387fc
>=20
> vmware-vga: CVE-2014-3689: turn off hw accel
>=20
> Quick & easy stopgap for CVE-2014-3689:  We just compile out the hardware=
 acceleration functions
> which lack sanity checks.  Thankfully we have capability bits for them (S=
VGA_CAP_RECT_COPY and
> SVGA_CAP_RECT_FILL), so guests should deal just fine, in theory.
>=20
> Subsequent patches will add the missing checks and re-enable the hardware=
 acceleration emulation.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Don Koch <dkoch@verizon.com>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../qemu/qemu/qemu-CVE-2014-3689.patch             | 46 ++++++++++++++++=
++++++
>  meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.pa=
tch
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch b/m=
eta/recipes-
> devtools/qemu/qemu/qemu-CVE-2014-3689.patch
> new file mode 100644
> index 0000000..a0c3931
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch
> @@ -0,0 +1,46 @@
> +qemu: CVE-2014-3689
> +
> +the patch comes from:
> +https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-3689
> +http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D83afa38eb20ca27e30683ed=
c7729
> +880e091387fc
> +
> +vmware-vga: CVE-2014-3689: turn off hw accel
> +
> +Quick & easy stopgap for CVE-2014-3689:  We just compile out the
> +hardware acceleration functions which lack sanity checks.  Thankfully
> +we have capability bits for them (SVGA_CAP_RECT_COPY and
> +SVGA_CAP_RECT_FILL), so guests should deal just fine, in theory.
> +
> +Subsequent patches will add the missing checks and re-enable the
> +hardware acceleration emulation.
> +
> +Cc: qemu-stable@nongnu.org
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Don Koch <dkoch@verizon.com>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +---
> + hw/display/vmware_vga.c |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c index
> +591b645..99a97fe 100644
> +--- a/hw/display/vmware_vga.c
> ++++ b/hw/display/vmware_vga.c
> +@@ -29,9 +29,11 @@
> + #include "hw/pci/pci.h"
> +
> + #undef VERBOSE
> ++#if 0
> + #define HW_RECT_ACCEL
> + #define HW_FILL_ACCEL
> + #define HW_MOUSE_ACCEL
> ++#endif
> +
> + #include "vga_int.h"
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-
> devtools/qemu/qemu_2.3.0.bb
> index ec1b101..917febe 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
> @@ -18,6 +18,7 @@ SRC_URI +=3D "file://configure-fix-Darwin-target-detect=
ion.patch \
>              file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fiel=
ds-CVE-2015-4106.patch \
>              file://10-xen-pt-add-a-few-PCI-config-space-field-descriptio=
ns-CVE-2015-4106.patch \
>              file://11-xen-pt-unknown-PCI-config-space-fields-should-be-r=
eadonly-CVE-2015-4106.patch \
> +            file://qemu-CVE-2014-3689.patch \
>             "
>  SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.bz2=
"
>  SRC_URI[md5sum] =3D "2fab3ea4460de9b57192e5b8b311f221"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

