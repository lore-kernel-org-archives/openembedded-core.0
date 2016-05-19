Return-Path: <kad@kad.name>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id D04DF6067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:19:29 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id rc4so7677454igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=OXEKhcDwy2dqVhsrAV5YdkTrVxwvpmi0gNFhL9oPdGs=;
	b=rBQlmfhIvRpvyJDsR7iWx90f8EjMnE8yCpcDQFIcN0hfrkT6mN4fblEOVJkL+ieQpf
	FxwuSxmSB9AtBVifqA1xlR4mTC0tJq8YSnjIAh95YCG04TW9jy0RYn0BlHSAyDFiJ/Rr
	GtFjkk67ChFD1K/iCtU8ywIFK//zibST7vWXSum4kIbk5eqyKLwSunOMDEcKf11rFxW6
	IEBJyX8wizrY9epsqMVZ0qmt6lnK1u+Vn2oUXCi4DDd8NmmuPCUpIsU5e+r/AiiEYLI+
	EoCoEfdFdH8+mXQ9/UMXFjs7vhE/6EulUVZRg0HYiyN2fr1DQi6lPW57ugzD/LN7ntfm
	Iy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=OXEKhcDwy2dqVhsrAV5YdkTrVxwvpmi0gNFhL9oPdGs=;
	b=TEK6OmkSccwwkScxtCE7C1Bes+94CNBtums4e38lkELGDlIFXo+O07zaprXKzJhzQU
	Bt3wNf/dBFBJwScVcXu6fjR7oIqYCQOsZcsp38kIdHIDtjcFZUFBKXxaOeEx3AextJYb
	YBC9HPGQrW+qzzhjU4nK4AoEsM14ITEvYzI4y69fIPM2YYS4WDGTVnh76d3hGPwUNfn7
	orDDFJ2cspMJXcsfZ6G78TgcGMU3FYtF6Byfjh+4V/rL5cSihxmGMMjyMjlMQt+3DfDa
	W79dLHmZD04jTODTfHleY+HP8Vz1a2Xsa1EizcnDoFOrsYgROdpTLPyzrt0gxGUmRbrF
	YDmA==
X-Gm-Message-State: AOPr4FWgfItXMSXjKM79dACrRLD2D0zQOhRM1WHunqnWDSAWTDEFmToQeKGHaOlUgSW3UTVOLLihcAgPVasrxQ==
MIME-Version: 1.0
X-Received: by 10.50.117.71 with SMTP id kc7mr973589igb.1.1463667567936; Thu,
	19 May 2016 07:19:27 -0700 (PDT)
Received: by 10.107.19.219 with HTTP; Thu, 19 May 2016 07:19:27 -0700 (PDT)
In-Reply-To: <CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
	<20160504070139.GB10864@linux.intel.com>
	<CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
Date: Thu, 19 May 2016 17:19:27 +0300
Message-ID: <CANFkWpnwa1guuPHCFi-=swK5f4AOrjn_qwKFbNCToTD9+6p1OA@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Thu, 19 May 2016 14:19:32 -0000
Content-Type: multipart/alternative; boundary=089e013a031474e9bf053332a921

--089e013a031474e9bf053332a921
Content-Type: text/plain; charset=UTF-8

On Wed, May 4, 2016 at 9:55 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> >
>> > Also, the convention is to add do_deploy before do_build, not before
>> > do_package, otherwise do_deploy's checksum is included int he checksums
>> of
>> > do_package and subsequent tasks, even though its output isn't used by
>> any
>> > subsequent tasks.
>>
>> I also found this a bit unusual to put the tool into deploy/tools.
>> That's why I isolated this change. I think it requires some more
>> testing, but the rest of patchset can be accepted without it.
>
>
> Yeah, putting it there does require some discussion in general.
> Personally, I'm in favor of such a thing, because we don't want to put
> generated convenience tools in the sysroot, since we tell people explicitly
> to not use sysroot contents directly.
>
> Regarding getting it built for the image, I'd suggest adding something
> like IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like
> IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =
> "bmap-tools-native:do_deploy". Then you wouldn't need the 'before
> do_package', and it'd fix the from-sstate usage.
>

We had some private conversation with Richard about deploy/tools, I'll try
to summarize results of our discussion here:

Thing this, that content under deploy/tools/* supposed to be exported to
"release" directory, and should not be used by any other tool during normal
build/development process.
Those are for usage on another host, where bitbake and content of sysroots
are not usually available.
bmaptool is a good example as stand-alone binary that require only python2
and nothing else to run.
Another example is dfu-util-static, which is also, not dependant even on
host's libusb even it runs on other host.

So, in general, it's for static/standalone binaries that are supposed to be
published as part of "release" of the build, same like deploy/images/*

For any classes, any internals of build process, they never should depend
on content of deploy/* and use *-native tools and binaries out of sysroot.
E.g. wic require bmap-tool, it should be dependant on presence of
bmap-tools-native installed into sysroot, and should be using both modules
and binary out of this sysroot.

This is the way how I'm using it inside Ostro Project:

description in our image type class:
https://github.com/ostroproject/meta-ostro/blob/master/meta-ostro/classes/image-dsk.bbclass#L32
https://github.com/ostroproject/meta-ostro/blob/master/meta-ostro/classes/image-dsk.bbclass#L131

actual  usage of bmaptools modules from sysroot:
https://github.com/ostroproject/meta-ostro/blob/master/meta-ostro/lib/image-dsk.py#L16


-- 
br, Alexander Kanevskiy

--089e013a031474e9bf053332a921
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, May 4, 2016 at 9:55 PM, Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
extra"><span class=3D""><br><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><sp=
an>&gt;<br>
&gt; Also, the convention is to add do_deploy before do_build, not before<b=
r>
&gt; do_package, otherwise do_deploy&#39;s checksum is included int he chec=
ksums of<br>
&gt; do_package and subsequent tasks, even though its output isn&#39;t used=
 by any<br>
&gt; subsequent tasks.<br>
<br>
</span>I also found this a bit unusual to put the tool into deploy/tools.<b=
r>
That&#39;s why I isolated this change. I think it requires some more<br>
testing, but the rest of patchset can be accepted without it.</blockquote><=
/div><br></span>Yeah, putting it there does require some discussion in gene=
ral. Personally, I&#39;m in favor of such a thing, because we don&#39;t wan=
t to put generated convenience tools in the sysroot, since we tell people e=
xplicitly to not use sysroot contents directly.<br><br clear=3D"all"><div>R=
egarding getting it built for the image, I&#39;d suggest adding something l=
ike IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like IMAGE_=
DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =3D &quot;=
bmap-tools-native:do_deploy&quot;. Then you wouldn&#39;t need the &#39;befo=
re do_package&#39;, and it&#39;d fix the from-sstate usage.</div><span clas=
s=3D""></span></div></div></blockquote><div><br></div><div>We had some priv=
ate conversation with Richard about deploy/tools, I&#39;ll try to summarize=
 results of our discussion here:</div><div><br></div></div>Thing this, that=
 content under deploy/tools/* supposed to be exported to &quot;release&quot=
; directory, and should not be used by any other tool during normal build/d=
evelopment process.</div><div class=3D"gmail_extra">Those are for usage on =
another host, where bitbake and content of sysroots are not usually availab=
le.</div><div class=3D"gmail_extra">bmaptool is a good example as stand-alo=
ne binary that require only python2 and nothing else to run.=C2=A0</div><di=
v class=3D"gmail_extra">Another example is dfu-util-static, which is also, =
not dependant even on host&#39;s libusb even it runs on other host.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So, in genera=
l, it&#39;s for static/standalone binaries that are supposed to be publishe=
d as part of &quot;release&quot; of the build, same like deploy/images/*</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For any =
classes, any internals of build process, they never should depend on conten=
t of deploy/* and use *-native tools and binaries out of sysroot.</div><div=
 class=3D"gmail_extra">E.g. wic require bmap-tool, it should be dependant o=
n presence of bmap-tools-native installed into sysroot, and should be using=
 both modules and binary out of this sysroot.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">This is the way how I&#39;m using i=
t inside Ostro Project:</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">description in our image type class:</div><div class=3D"g=
mail_extra"><a href=3D"https://github.com/ostroproject/meta-ostro/blob/mast=
er/meta-ostro/classes/image-dsk.bbclass#L32">https://github.com/ostroprojec=
t/meta-ostro/blob/master/meta-ostro/classes/image-dsk.bbclass#L32</a><br></=
div><div class=3D"gmail_extra"><a href=3D"https://github.com/ostroproject/m=
eta-ostro/blob/master/meta-ostro/classes/image-dsk.bbclass#L131">https://gi=
thub.com/ostroproject/meta-ostro/blob/master/meta-ostro/classes/image-dsk.b=
bclass#L131</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">actual =C2=A0usage of bmaptools modules from sysroot:</div><d=
iv class=3D"gmail_extra"><a href=3D"https://github.com/ostroproject/meta-os=
tro/blob/master/meta-ostro/lib/image-dsk.py#L16">https://github.com/ostropr=
oject/meta-ostro/blob/master/meta-ostro/lib/image-dsk.py#L16</a><br></div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div><br></d=
iv>-- <br><div class=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--089e013a031474e9bf053332a921--
