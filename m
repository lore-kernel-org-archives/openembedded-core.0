Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id CBDED70031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 13:37:46 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id u186so73731544ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wonOdvHSPsUcbk4turE5ETT3ky/AN5BVvHuLwyiMoDs=;
	b=vZODUNOik2Gbsqx/7Kbw236XfsmsuuCEAjMtqGmRNOma/aGBAtw/ambxTko+RZ0Qqv
	jS3eSMSxxG+hAHo4OEnBY0vWfd9jvStl04ujdxSryi0r3lzE5zhgOQuh7S6ZshWWAN3o
	XDGjUdYp7nZQ4wghvoPCZzYMHkumYTGcrgQmNH2tYFQK5Z87NM0yhn8y0KIVG6IFKDgm
	h56PjrOVyjZ7HLwDIRIDsPzkBjpjbQtldrpwh9D0E+uAUvOSSlCEAv7ExSRP+RUvz2OL
	W/ugRV5WNUw2G6KMKFBqhEIsXlL4lBvzcPpSsvu1d2yb+8uWoSnl76KBkyObRoo2BHTU
	8Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wonOdvHSPsUcbk4turE5ETT3ky/AN5BVvHuLwyiMoDs=;
	b=CLoUN4eFYE+eY8E3jyntzVuytsj0XEhXK3uB/umGqqorTU6Z6/D+mvh9Uwl3s87HeI
	TwOj1vDsFsAxdqBkNuAHn2zyjirfTSzKfOoMfo/0RyF5KL+WhgUCN5ehrkXh2xm3GgnO
	ACeaRAG6VAgLQGGn2OWQ6T0uW+xEKr3/KcDIMBGWE0qi6daChDfF6lFIhY4+PVUfG4qI
	fKjFK3JClKQVGPo4v+sylnOefSQSsUOmfxO4DpzuRTfBMMq7mZzRFbWX/ZjDoWVqTEHD
	7az0tmhqEnLaCZpsVoMyBwHi75KBJTEITfEUAEVMIqYsUyWgVxvjRZjpZgRIfCUnmPZx
	bcVQ==
X-Gm-Message-State: AEkoouuujD9S11oORhR19drY6YYGxi74DPNltemnM8M8RtveMxoGWbSVjy4oU/wmdR/zi1I1/4jVm1JAdMudETFs
X-Received: by 10.36.87.140 with SMTP id u134mr18815832ita.38.1470663467004;
	Mon, 08 Aug 2016 06:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 06:37:26 -0700 (PDT)
In-Reply-To: <CAKmqyKNKe=H+GA=EwT=b50vnWKp=K68XJCeiSd4M_UAdEOmF_A@mail.gmail.com>
References: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKOviCTZBEnTXgSsWk2s+H6NJHAW490dPLkxy+Lz3Yuj2w@mail.gmail.com>
	<CAKmqyKNKe=H+GA=EwT=b50vnWKp=K68XJCeiSd4M_UAdEOmF_A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 14:37:26 +0100
Message-ID: <CAJTo0LaD0Rj5O+mJYvv0JbFnjeFUiD_S55MAkMdN9X8J-cuJ1Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: qemuzynqmp: Add Linux boot support
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
X-List-Received-Date: Mon, 08 Aug 2016 13:37:48 -0000
Content-Type: multipart/alternative; boundary=001a1135018c89208305398f858e

--001a1135018c89208305398f858e
Content-Type: text/plain; charset=UTF-8

Sorry, staged in my branch now.

Ross

On 3 August 2016 at 21:31, Alistair Francis <alistair.francis@xilinx.com>
wrote:

> Ping^2!
>
> On Wed, Jul 27, 2016 at 11:02 AM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
> > Ping!
> >
> > On Wed, Jun 15, 2016 at 1:43 PM, Alistair Francis
> > <alistair.francis@xilinx.com> wrote:
> >> Add support to direct boot Linux instead of just booting u-boot.
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> >> ---
> >>  scripts/runqemu          | 3 +--
> >>  scripts/runqemu-internal | 2 +-
> >>  2 files changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/scripts/runqemu b/scripts/runqemu
> >> index de05035..d52ea15 100755
> >> --- a/scripts/runqemu
> >> +++ b/scripts/runqemu
> >> @@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
> >>  QEMUZYNQ_DEFAULT_KERNEL=uImage
> >>  QEMUZYNQ_DEFAULT_FSTYPE=cpio
> >>
> >> -# Default to booting u-boot as a direct Linux boot isn't supported yet.
> >> -QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
> >> +QEMUZYNQMP_DEFAULT_KERNEL=Image
> >>  QEMUZYNQMP_DEFAULT_FSTYPE=cpio
> >>
> >>  setup_path_vars() {
> >> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> >> index ea1a307..ecc5e63 100755
> >> --- a/scripts/runqemu-internal
> >> +++ b/scripts/runqemu-internal
> >> @@ -514,7 +514,7 @@ config_qemuzynqmp() {
> >>      QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net
> user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
> >>      QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial
> mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
> >>
> >> -    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp
> $DEPLOY_DIR_IMAGE"
> >> +    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd
> $ROOTFS"
> >>  }
> >>
> >>  config_qemumicroblaze() {
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1135018c89208305398f858e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, staged in my branch now.<div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 3 Aug=
ust 2016 at 21:31, Alistair Francis <span dir=3D"ltr">&lt;<a href=3D"mailto=
:alistair.francis@xilinx.com" target=3D"_blank">alistair.francis@xilinx.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping^2!<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Jul 27, 2016 at 11:02 AM, Alistair Francis<br>
&lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xilinx.=
com</a>&gt; wrote:<br>
&gt; Ping!<br>
&gt;<br>
&gt; On Wed, Jun 15, 2016 at 1:43 PM, Alistair Francis<br>
&gt; &lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xi=
linx.com</a>&gt; wrote:<br>
&gt;&gt; Add support to direct boot Linux instead of just booting u-boot.<b=
r>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fra=
ncis@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br=
>
&gt;&gt;=C2=A0 scripts/runqemu-internal | 2 +-<br>
&gt;&gt;=C2=A0 2 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/scripts/runqemu b/scripts/runqemu<br>
&gt;&gt; index de05035..d52ea15 100755<br>
&gt;&gt; --- a/scripts/runqemu<br>
&gt;&gt; +++ b/scripts/runqemu<br>
&gt;&gt; @@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=3D<wbr>cpio<br>
&gt;&gt;=C2=A0 QEMUZYNQ_DEFAULT_KERNEL=3DuImage<br>
&gt;&gt;=C2=A0 QEMUZYNQ_DEFAULT_FSTYPE=3Dcpio<br>
&gt;&gt;<br>
&gt;&gt; -# Default to booting u-boot as a direct Linux boot isn&#39;t supp=
orted yet.<br>
&gt;&gt; -QEMUZYNQMP_DEFAULT_KERNEL=3Du-<wbr>boot-qemuzynqmp.elf<br>
&gt;&gt; +QEMUZYNQMP_DEFAULT_KERNEL=3D<wbr>Image<br>
&gt;&gt;=C2=A0 QEMUZYNQMP_DEFAULT_FSTYPE=3Dcpio<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 setup_path_vars() {<br>
&gt;&gt; diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<b=
r>
&gt;&gt; index ea1a307..ecc5e63 100755<br>
&gt;&gt; --- a/scripts/runqemu-internal<br>
&gt;&gt; +++ b/scripts/runqemu-internal<br>
&gt;&gt; @@ -514,7 +514,7 @@ config_qemuzynqmp() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QEMU_NETWORK_CMD=3D&quot;-net nic -net nic -ne=
t nic -net nic -net user,net=3D10.10.70.0,dhcpstart=3D<wbr>10.10.70.1,host=
=3D10.10.70.101&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QEMU_SYSTEM_OPTIONS=3D&quot;$QEMU_<wbr>NETWORK=
_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.<wb=
r>dtb&quot;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_SYSTEM_<wbr>OPTIONS $QEMU=
_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_SYSTEM_<wbr>OPTIONS $QEMU=
_UI_OPTIONS -initrd $ROOTFS&quot;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 config_qemumicroblaze() {<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1135018c89208305398f858e--
