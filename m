Return-Path: <avery.brian@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2E9B60053;
	Mon,  5 Dec 2016 19:22:58 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id w194so16716663vkw.3;
	Mon, 05 Dec 2016 11:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H52BFBY5kaS1m3UI8M4N1N2q3K+lmXqLGZk2mppYMaI=;
	b=LzzIox0MhG5pUQB+A8GQlPazYmj4xGZV/E4X6FOUXp+f7E3YRlrHQKzp7Zwqarhjhv
	KBMpphXVXaiG/jyIpgAXJOM1DLRz3PXTxOWBEF+F0QZXSX5gjUkCNMMqA/Zr1of6V8IO
	uNq/H8WIYc4duOht9V5BlLb1PJHgombKj0CGDnoLxxI3Q8b4OwHnMpfbA16MitRKqbT7
	3zg8I/KImsOr+/eCPdEV+XOzH5mXUZY0SDxmTwi4W5TqOTqk1HuHfgkRXbQ/2tICdasp
	PVT8/vUsfGdATjGIF1+2FS+B75ghSTEHeWNNh7EhRdNweqwcNgJAT5Ue8M3CEVT56Yvt
	GWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H52BFBY5kaS1m3UI8M4N1N2q3K+lmXqLGZk2mppYMaI=;
	b=cNKHAGomrvNXqppwnTXtKvJTx7wi8JsuRLeqVfhLPjQ5nzhLTiYTSfwiqg2TGhJlEx
	fLbbR3JeiL4cnWtBX37EzqPfZHDh8n/sKx2fTdOMQmKadsNiJosioyglQuiJa4hFon9R
	55+TpmfSwNt8+J/8BDATEbUmFGgVmffMOTlb447vJH7VY6xUulYSIp1Xe6MKmFFB+qW1
	BdovJWDCKZ1xc5EHr022qVyVGVcSZX+u5KB6Kg+Yn21HDX5+NwoarnX8n5U4TJYNk/S8
	AdczkAPeKrVox/UpQ24ygzlrovcfexNdTndZ77lMCewQT3sMoxQK3U77eaIWBS4unDEi
	RnPQ==
X-Gm-Message-State: AKaTC01J/gM3zQ2Rwyhu6FlGGpDm5czDJFxkxthqoaNKnVqpuIpfYAOxEPRSsV7vi+MPFEGZ2Eg1VbIwJl2GgA==
X-Received: by 10.31.97.1 with SMTP id v1mr22327325vkb.108.1480965779801; Mon,
	05 Dec 2016 11:22:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.60.199 with HTTP; Mon, 5 Dec 2016 11:22:59 -0800 (PST)
In-Reply-To: <CAMKF1spKHmuzxvW=JtWp7LPRFfDkb24A4sdUp7-hL1dqU16Mgg@mail.gmail.com>
References: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
	<CAMKF1spKHmuzxvW=JtWp7LPRFfDkb24A4sdUp7-hL1dqU16Mgg@mail.gmail.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Mon, 5 Dec 2016 11:22:59 -0800
Message-ID: <CAKV_0ej9ETbSwzqYR0fO4Jme5FkdVt5T40b_c57D7=P+toHxKQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] RFC BuildAppliance future
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
X-List-Received-Date: Mon, 05 Dec 2016 19:23:00 -0000
Content-Type: multipart/alternative; boundary=001a114da5103acdca0542ee3773

--001a114da5103acdca0542ee3773
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excellent Questions!



Dogfooding =E2=80=93 Good point.  The
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9502 bug is intended to
address that. With this, we can build and test container images just as we
can do with the Build Appliance. As an added win, those folks building
Busybox based minimal sized containers would have a different way to do
that...



OS availability: Docker is available for Windows, Mac, and Linux.  Were
there fears about specific Linux distributions?



It does not seem to be too much harder to try Docker on Windows than it was
to try Virtualbox.  That being said, Docker is moving/changing more quickly
so it may have more bumps in the road but more features too=E2=80=A6



Windows explained more in depth or one of those bumps=E2=80=A6:

  The answer is a little complicated, so please bear with me.  There are 2
different versions of Docker for Windows.  The original version is known as
=E2=80=9CDocker Toolbox=E2=80=9D https://www.docker.com/products/docker-too=
lbox.  This is
basically Docker running in a minimal VirtualBox Linux VM.  They made a
separate host binary called docker-machine to help manage the images. This
is, in my opinion, a little clunky and does add some complexity when
switching from Docker running on Linux to Docker Toolbox running on
Windows. The clunkiness is largely due to the VirtualBox VM being =E2=80=9C=
between=E2=80=9D
the host and the Docker Engine. This version is targeted to people whose
Windows version does not meet the requirements specified below.



  If you have 64bit Windows 10 Pro, Enterprise and Education (1511 November
update, Build 10586 or later) and Microsoft Hyper-V, then you can download
=E2=80=9CDocker for Windows=E2=80=9D https://docs.docker.com/docker-for-win=
dows/.  This is
a Docker implementation for Windows that relies on Hyper-V and a much
smaller vm.  It is also better integrated into the host environment so that
the discontinuity between the host side and the Docker  Engine is no longer
as jarring.  For example, you get a disk tray icon for Docker, can set up
http proxies for it, can manage how much memory and how many cpus it will
get=E2=80=A6


This (https://docs.docker.com/docker-for-mac/docker-toolbox/) is nice page
that addresses the difference between the newer hypervisor approach and the
older "Docker Toolbox aka VirtualBox" approach.  The page is discussing it
from a Mac perspective but if you replace xhyve with Windows 10 Hyper-V,
the page is relevant to Windows as well.



The Mac implementation is functionally equivalent to =E2=80=9CDocker for Wi=
ndows=E2=80=9D
and is called =E2=80=9CDocker for Mac=E2=80=9D
https://docs.docker.com/engine/installation/mac/.  It runs on a modified
xhyve hypervisor.



The Linux implementation runs as a container and uses the same kernel as
the host.



Thanks for the feedback and if I missed or shortchanged something please
let me know,

-Brian


an intel employee

On Mon, Dec 5, 2016 at 10:42 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Dec 5, 2016 at 10:04 AM, Brian Avery <avery.brian@gmail.com>
> wrote:
> >   Please note, this is going out to 3 lists in an attempt to insure tha=
t
> no
> > one who would be impacted by this change misses it. Implied spam apolog=
y
> > included.
> >
> >   The Yocto Project currently provides a virtual machine image called t=
he
> > Build Appliance
> > (https://downloads.yoctoproject.org/releases/yocto/yocto-2.2/build-
> appliance/).
> > This image can be run using either VirtualBox or VMware. It enables you
> to
> > build and boot a custom embedded Linux image with the Yocto Project on =
a
> > non-Linux development system.  It is not intended for day to day
> development
> > use, but instead, is intended to allow users to =E2=80=9Ctry out=E2=80=
=9D the tools even
> if
> > they do not have access to a Linux system.
> >
> >   We are considering replacing the VM based Build Appliance with a set =
of
> > containers (https://hub.docker.com/r/crops/poky/, or if you want a user
> > interface (https://hub.docker.com/r/crops/toaster-master/ ).  These
> > containers currently provide most of the functionality of the Build
> > Appliance and should shortly be at feature parity with the Build
> Appliance.
> > We are actively adding to and supporting the containers as some of our
> > developers are using them in their day to day development in order to
> > benefit from the host isolation and ease with which other distributions
> can
> > be tested.
> >
> >   This is an RFC to see what features in the Build Appliance are
> important
> > to you but would not be provided by the container solutions.  If the
> > community would be just as content using the container approach as usin=
g
> the
> > VM based Build Appliance image, then we=E2=80=99d be better off depreca=
ting the
> > Build Appliance and applying those resources elsewhere.  If there are
> > important features the Build Appliance provides which the container
> solution
> > does not, or cannot provide, we=E2=80=99d love to hear what they are!
>
> Personally, I dont use build appliance but I think using containers is a
> good
> step forward, provided, we can address all build host OSes that
> virtual appliance
> could.
>
> Build appliance is also a sort of "eat your own dog-food" for ensuring
> that we
> are doing ok on preparing cloud images for deployment. Hopefully we wont
> lose that testing, may be we can add another image to cover that.
>
> >
> > Thanks in advance for any feedback,
> >
> > -Brian
> >
> > an Intel Employee
> >
> >
> > _______________________________________________
> > Openembedded-architecture mailing list
> > Openembedded-architecture@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-architectur=
e
> >
>

--001a114da5103acdca0542ee3773
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
















<p class=3D"MsoNormal"><span style=3D"background-image:initial;background-p=
osition:initial;background-size:initial;background-repeat:initial;backgroun=
d-origin:initial;background-clip:initial">Excellent
Questions!</span><span style=3D"font-size:10pt"><span></span></span></p>

<p class=3D"MsoNormal"><span>=C2=A0</span></p>

<p class=3D"MsoNormal">Dogfooding =E2=80=93 Good
point.=C2=A0 The <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D9502">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9502</a>
bug is intended to address that. With this, we can build and test container=
 images just as we can do with the Build Appliance. As an added win, those =
folks building Busybox based minimal sized containers would have a differen=
t way to do that...</p><p class=3D"MsoNormal">=C2=A0<span></span></p>

<p class=3D"MsoNormal">OS availability: Docker
is available for Windows, Mac, and Linux.=C2=A0 Were there fears about spec=
ific Linux distributions?<span></span></p>

<p class=3D"MsoNormal"><span>=C2=A0</span></p>

<p class=3D"MsoNormal">It does not seem to be
too much harder to try Docker on Windows than it was to try Virtualbox.=C2=
=A0 That being said, Docker is moving/changing
more quickly so it may have more bumps in the road but more features too=E2=
=80=A6<span></span></p>

<p class=3D"MsoNormal"><span>=C2=A0</span></p>

<p class=3D"MsoNormal">Windows explained more in
depth or one of those bumps=E2=80=A6: <span></span></p>

<p class=3D"MsoNormal">=C2=A0 The answer is a little complicated, so please
bear with me.=C2=A0 There are 2 different
versions of Docker for Windows.=C2=A0 The
original version is known as =E2=80=9CDocker Toolbox=E2=80=9D <a href=3D"ht=
tps://www.docker.com/products/docker-toolbox">https://www.docker.com/produc=
ts/docker-toolbox</a>.=C2=A0 This is basically Docker running in a minimal
VirtualBox Linux VM.=C2=A0 They made a
separate host binary called docker-machine to help manage the images. This =
is,
in my opinion, a little clunky and does add some complexity when switching =
from
Docker running on Linux to Docker Toolbox running on Windows. The clunkines=
s is
largely due to the VirtualBox VM being =E2=80=9Cbetween=E2=80=9D the host a=
nd the Docker
Engine. This version is targeted to people whose Windows version does not m=
eet the requirements specified below.<span></span></p>

<p class=3D"MsoNormal"><span>=C2=A0</span></p>

<p class=3D"MsoNormal">=C2=A0 If you have=C2=A0<span style=3D"color:black;l=
etter-spacing:0.25pt;background-image:initial;background-position:initial;b=
ackground-size:initial;background-repeat:initial;background-origin:initial;=
background-clip:initial;background-color:rgb(250,250,250)">64bit Windows 10=
 Pro,
Enterprise and Education (1511 November update, Build 10586 or later) and
Microsoft Hyper-V, then you can download =E2=80=9CDocker for Windows=E2=80=
=9D <a href=3D"https://docs.docker.com/docker-for-windows/">https://docs.do=
cker.com/docker-for-windows/</a>.=C2=A0 This is a Docker implementation for=
 Windows
that relies on Hyper-V and a much smaller vm.=C2=A0
It is also better integrated into the host environment so that the
discontinuity between the host side and the Docker=C2=A0 Engine is no longe=
r as jarring.=C2=A0 For example, you get a disk tray icon for
Docker, can set up http proxies for it, can manage how much memory and how =
many
cpus it will get=E2=80=A6<span></span></span></p><p class=3D"MsoNormal"><sp=
an style=3D"background-color:rgb(250,250,250);color:black;letter-spacing:0.=
25pt"><br></span></p><p class=3D"MsoNormal"><span style=3D"background-color=
:rgb(250,250,250);color:black;letter-spacing:0.25pt">This (</span><font col=
or=3D"#000000"><span style=3D"letter-spacing:0.333333px"><a href=3D"https:/=
/docs.docker.com/docker-for-mac/docker-toolbox/">https://docs.docker.com/do=
cker-for-mac/docker-toolbox/</a>) is</span></font><span style=3D"background=
-color:rgb(250,250,250);color:black;letter-spacing:0.25pt">=C2=A0nice page =
that addresses the difference between the newer hypervisor approach and the=
 older &quot;Docker Toolbox aka VirtualBox&quot; approach.=C2=A0 The page i=
s discussing it from a Mac perspective but if you replace xhyve with Window=
s 10 Hyper-V, the page is relevant to Windows as well.</span></p>

<p class=3D"MsoNormal"><span style=3D"color:black;letter-spacing:0.25pt;bac=
kground-image:initial;background-position:initial;background-size:initial;b=
ackground-repeat:initial;background-origin:initial;background-clip:initial;=
background-color:rgb(250,250,250)"><span>=C2=A0</span></span></p>

<p class=3D"MsoNormal">The Mac implementation is
functionally equivalent to =E2=80=9CDocker for Windows=E2=80=9D and is call=
ed =E2=80=9CDocker for Mac=E2=80=9D <a href=3D"https://docs.docker.com/engi=
ne/installation/mac/">https://docs.docker.com/engine/installation/mac/</a>.=
=C2=A0 It runs on a modified xhyve hypervisor. =C2=A0<span></span></p>

<p class=3D"MsoNormal"><span>=C2=A0</span></p>

<p class=3D"MsoNormal">The Linux implementation
runs as a container and uses the same kernel as the host.<span></span></p><=
p class=3D"MsoNormal"><br></p><p class=3D"MsoNormal"><br></p><p class=3D"Ms=
oNormal">Thanks for the feedback and if I missed or shortchanged something =
please let me know,</p><p class=3D"MsoNormal">-Brian</p><p class=3D"MsoNorm=
al"><br></p><p class=3D"MsoNormal">an intel employee</p>

</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec=
 5, 2016 at 10:42 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">O=
n Mon, Dec 5, 2016 at 10:04 AM, Brian Avery &lt;<a href=3D"mailto:avery.bri=
an@gmail.com">avery.brian@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0Please note, this is going out to 3 lists in an attempt to=
 insure that no<br>
&gt; one who would be impacted by this change misses it. Implied spam apolo=
gy<br>
&gt; included.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0The Yocto Project currently provides a virtual machine ima=
ge called the<br>
&gt; Build Appliance<br>
&gt; (<a href=3D"https://downloads.yoctoproject.org/releases/yocto/yocto-2.=
2/build-appliance/" rel=3D"noreferrer" target=3D"_blank">https://downloads.=
<wbr>yoctoproject.org/releases/<wbr>yocto/yocto-2.2/build-<wbr>appliance/</=
a>).<br>
&gt; This image can be run using either VirtualBox or VMware. It enables yo=
u to<br>
&gt; build and boot a custom embedded Linux image with the Yocto Project on=
 a<br>
&gt; non-Linux development system.=C2=A0 It is not intended for day to day =
development<br>
&gt; use, but instead, is intended to allow users to =E2=80=9Ctry out=E2=80=
=9D the tools even if<br>
&gt; they do not have access to a Linux system.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0We are considering replacing the VM based Build Appliance =
with a set of<br>
&gt; containers (<a href=3D"https://hub.docker.com/r/crops/poky/" rel=3D"no=
referrer" target=3D"_blank">https://hub.docker.com/r/<wbr>crops/poky/</a>, =
or if you want a user<br>
&gt; interface (<a href=3D"https://hub.docker.com/r/crops/toaster-master/" =
rel=3D"noreferrer" target=3D"_blank">https://hub.docker.com/r/<wbr>crops/to=
aster-master/</a> ).=C2=A0 These<br>
&gt; containers currently provide most of the functionality of the Build<br=
>
&gt; Appliance and should shortly be at feature parity with the Build Appli=
ance.<br>
&gt; We are actively adding to and supporting the containers as some of our=
<br>
&gt; developers are using them in their day to day development in order to<=
br>
&gt; benefit from the host isolation and ease with which other distribution=
s can<br>
&gt; be tested.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0This is an RFC to see what features in the Build Appliance=
 are important<br>
&gt; to you but would not be provided by the container solutions.=C2=A0 If =
the<br>
&gt; community would be just as content using the container approach as usi=
ng the<br>
&gt; VM based Build Appliance image, then we=E2=80=99d be better off deprec=
ating the<br>
&gt; Build Appliance and applying those resources elsewhere.=C2=A0 If there=
 are<br>
&gt; important features the Build Appliance provides which the container so=
lution<br>
&gt; does not, or cannot provide, we=E2=80=99d love to hear what they are!<=
br>
<br>
</div></div>Personally, I dont use build appliance but I think using contai=
ners is a good<br>
step forward, provided, we can address all build host OSes that<br>
virtual appliance<br>
could.<br>
<br>
Build appliance is also a sort of &quot;eat your own dog-food&quot; for ens=
uring that we<br>
are doing ok on preparing cloud images for deployment. Hopefully we wont<br=
>
lose that testing, may be we can add another image to cover that.<br>
<span class=3D"im HOEnZb"><br>
&gt;<br>
&gt;=E2=80=A8Thanks in advance for any feedback,<br>
&gt;<br>
&gt; -Brian<br>
&gt;<br>
&gt; an Intel Employee<br>
&gt;<br>
&gt;<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt; _______________________=
_______<wbr>_________________<br>
&gt; Openembedded-architecture mailing list<br>
&gt; <a href=3D"mailto:Openembedded-architecture@lists.openembedded.org">Op=
enembedded-architecture@<wbr>lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-architecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>architecture</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a114da5103acdca0542ee3773--
