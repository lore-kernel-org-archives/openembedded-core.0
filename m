Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E261A73DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:46:55 +0000 (UTC)
Received: by qkch123 with SMTP id h123so95657928qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=imPtWuBZXhq012J26ZOGZJJfT4wbSQrU5qk24Wp/mFY=;
	b=P8UTQL4aVurbDslotNrFW3gNFluNGcwsKJITRjVmMVyg74aSFy+EOw/K8Q6eRbJfNN
	V7LZkFo7pYxcJEVE1pv6ijTPGbQ4OfYvkL2LlnhdjP1Fi2NGbjZmsIiunJ0a85MtWrbI
	6jJLEUrdBTiFYGPvrAPVrLucy7aGjai8jVORahhw1XcR1bpp71tXN2GfsGHD6gJF0EZd
	NFNQPFcqQmm8ZIqPqxc8PfJawZ963G9tzKlIuoe86J6xj6R0rpxRq8cShJztVdT5PU80
	P00EHHw6yDTiwzVJ1WaLA8W5J9xPcuaj52tJ0/zGoMhA+Lszw0CwBpdV3tLjs7W3UauN
	KmDQ==
X-Gm-Message-State: ALoCoQkZvPGgDegxB+i2YtMlyAkaNF8BSLg+bFOu/68OYMAfuoPA8jJt2zLCwSzn5I/LJIp4nTZd
X-Received: by 10.55.201.141 with SMTP id m13mr62165389qkl.68.1440514015307;
	Tue, 25 Aug 2015 07:46:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 25 Aug 2015 07:46:35 -0700 (PDT)
In-Reply-To: <ceae3553f28d4f66d289d37cf9fac273516747f0.1440420666.git.jussi.kukkonen@intel.com>
References: <cover.1440420666.git.jussi.kukkonen@intel.com>
	<ceae3553f28d4f66d289d37cf9fac273516747f0.1440420666.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 15:46:35 +0100
Message-ID: <CAJTo0LaX2VQi-z_D9drb7j=RKW7k8p68Ur9CL4nGDJ7uZN_OFw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Tue, 25 Aug 2015 14:46:57 -0000
Content-Type: multipart/alternative; boundary=001a1149adfa2d4952051e23ce19

--001a1149adfa2d4952051e23ce19
Content-Type: text/plain; charset=UTF-8

On 24 August 2015 at 13:55, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> * Build system changed to cmake.
> * Patch build system to not check for perl (we use host
>   perl which won't be found)
>

Two failures on the builders.

If multilib is enabled, almost nothing gets packaged:

ERROR: QA Issue: libical: Files/directories were installed but not shipped
in any package:
  /usr/lib
  /usr/lib/libical.so
  /usr/lib/libical.a
  /usr/lib/libicalss.so.1
  /usr/lib/libicalss.a
  /usr/lib/libicalvcal.so.1
  /usr/lib/libicalss.so
  /usr/lib/libicalvcal.so.1.0.1
  /usr/lib/libical.so.1
  /usr/lib/libicalss.so.1.0.1
  /usr/lib/libical.so.1.0.1
  /usr/lib/libicalvcal.a
  /usr/lib/libicalvcal.so
  /usr/lib/cmake
  /usr/lib/pkgconfig
  /usr/lib/.debug
  /usr/lib/cmake/LibIcal
  /usr/lib/cmake/LibIcal/LibIcalTargets.cmake
  /usr/lib/cmake/LibIcal/LibIcalConfig.cmake
  /usr/lib/cmake/LibIcal/LibIcalConfigVersion.cmake
  /usr/lib/cmake/LibIcal/LibIcalTargets-noconfig.cmake
  /usr/lib/pkgconfig/libical.pc
  /usr/lib/.debug/libicalvcal.so.1.0.1
  /usr/lib/.debug/libicalss.so.1.0.1
  /usr/lib/.debug/libical.so.1.0.1

($libdir is /usr/lib64)

Also a build failed very mysteriously:

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/mips32r2-poky-linux/libical/1.0.1-r0/build/src/libical/ical.h:1140:1:
error: expected ',' or '}' before 'typedef'
 typedef struct icalparameter_impl icalparameter;

(http://errors.yoctoproject.org/Errors/Details/14845/)

Another build failed with resource issues so it's possible that this is a
transient error due to resource limits being hit.

Ross

--001a1149adfa2d4952051e23ce19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2015 at 13:55, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":3xq" class=3D"" sty=
le=3D"overflow:hidden">* Build system changed to cmake.<br>
* Patch build system to not check for perl (we use host<br>
=C2=A0 perl which won&#39;t be found)</div></blockquote></div><br>Two failu=
res on the builders.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">If multilib is enabled, almost nothing gets packaged:</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">ERROR: QA Issue: libical: Files/directories were installed=
 but not shipped in any package:</div><div class=3D"gmail_extra">=C2=A0 /us=
r/lib</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/libical.so</div><div =
class=3D"gmail_extra">=C2=A0 /usr/lib/libical.a</div><div class=3D"gmail_ex=
tra">=C2=A0 /usr/lib/libicalss.so.1</div><div class=3D"gmail_extra">=C2=A0 =
/usr/lib/libicalss.a</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/libica=
lvcal.so.1</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/libicalss.so</di=
v><div class=3D"gmail_extra">=C2=A0 /usr/lib/libicalvcal.so.1.0.1</div><div=
 class=3D"gmail_extra">=C2=A0 /usr/lib/libical.so.1</div><div class=3D"gmai=
l_extra">=C2=A0 /usr/lib/libicalss.so.1.0.1</div><div class=3D"gmail_extra"=
>=C2=A0 /usr/lib/libical.so.1.0.1</div><div class=3D"gmail_extra">=C2=A0 /u=
sr/lib/libicalvcal.a</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/libica=
lvcal.so</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/cmake</div><div cl=
ass=3D"gmail_extra">=C2=A0 /usr/lib/pkgconfig</div><div class=3D"gmail_extr=
a">=C2=A0 /usr/lib/.debug</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/c=
make/LibIcal</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/cmake/LibIcal/=
LibIcalTargets.cmake</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/cmake/=
LibIcal/LibIcalConfig.cmake</div><div class=3D"gmail_extra">=C2=A0 /usr/lib=
/cmake/LibIcal/LibIcalConfigVersion.cmake</div><div class=3D"gmail_extra">=
=C2=A0 /usr/lib/cmake/LibIcal/LibIcalTargets-noconfig.cmake</div><div class=
=3D"gmail_extra">=C2=A0 /usr/lib/pkgconfig/libical.pc</div><div class=3D"gm=
ail_extra">=C2=A0 /usr/lib/.debug/libicalvcal.so.1.0.1</div><div class=3D"g=
mail_extra">=C2=A0 /usr/lib/.debug/libicalss.so.1.0.1</div><div class=3D"gm=
ail_extra">=C2=A0 /usr/lib/.debug/libical.so.1.0.1</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">($libdir is /usr/lib64)</div><=
br>Also a build failed very mysteriously:<br><br>/home/pokybuild/yocto-auto=
builder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/mips32r2-poky-li=
nux/libical/1.0.1-r0/build/src/libical/ical.h:1140:1: error: expected &#39;=
,&#39; or &#39;}&#39; before &#39;typedef&#39;<br>=C2=A0typedef struct ical=
parameter_impl icalparameter;</div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_extra">(<a href=3D"http://errors.yoctoproject.org/Errors/Details=
/14845/">http://errors.yoctoproject.org/Errors/Details/14845/</a>)</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Another build =
failed with resource issues so it&#39;s possible that this is a transient e=
rror due to resource limits being hit.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1149adfa2d4952051e23ce19--
