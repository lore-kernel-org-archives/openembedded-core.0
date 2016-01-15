Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 588ED738AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 20:07:28 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id q21so36094588iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sFJ7nwwdt5h06giXe3PHveJoSl0CzfzHTQ8bmoOPvsE=;
	b=NZdtVTUIWQoT2+AOCiWbWygFy2IqAaTJS/PnqAVac3CcDBh+vCrHNav0+zHUpLub8c
	j3TLy9reNUjSvo1CcXW6d68OlSJEeXV4gt00vyvg5pE4b1gUjA1+lSw8HJNQlKiPKUe8
	0xsTe9MDDuxPX/eHqfthKVZJXj/Yhue4D58ZMLlmYCJ+6Nki1cz8sl85mo4A8Y4idlxf
	ZAMP2Q1g0mcSrZvz6vzHX20n9s0R1G6lrs3dAWvH7WDEMW+O8ODd9HWWebf/hICZZKi3
	Ond0ivEVa02Bt0HKZyVQhZSm5KdrXvxvhihcllNeoEWCffqZuEqQQq/L4Gh6JXJ/BYVQ
	yq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sFJ7nwwdt5h06giXe3PHveJoSl0CzfzHTQ8bmoOPvsE=;
	b=bKPPI26iFc9BJezA8uSnSBk1OM3c4muXURdnBKMjlh4QSAYU3XRfX15Rwu+nhncdUj
	rX8VAQIvAblGaynfxJdiv1mrCcoLtZ5BE7PA3U/WgPEIqzj73XPvx8ciH7n+xO6r/l7o
	mLWVoHqKXwckLFK3YWYPOhJrUBNDoKqy3CWvJWpArb6ORm1ze1Uy9njKgXAAVYmjdlD5
	eNs+8vRi6P3bpp51QV4OGF2VrSnOFvmu6FCEHwXijVCKi8Es3gc9yQFwiviiDhr7Jz0e
	WzOD4jrGLBlImaZ6ARoJf129PxmqwsfY/GbHa0rMUJsVVbWEvSkiAJjBupnEQrizfS+9
	Tr2Q==
X-Gm-Message-State: ALoCoQmBOUoXFuKHLa07LlEkkjrkjv9k05c6BkDXYDYT3BZrbjClVMiZBppy0aK55bVrUVfPzfuDxHk0oCNIlkLsvU4yGXDCxw==
X-Received: by 10.107.28.80 with SMTP id c77mr13352955ioc.98.1452888449541;
	Fri, 15 Jan 2016 12:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.104.194 with HTTP; Fri, 15 Jan 2016 12:07:10 -0800 (PST)
In-Reply-To: <5698BA9F.4020809@windriver.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<1cb0662447098b5f24ec3e02e471a3e288a69a04.1447371049.git.chris_larson@mentor.com>
	<5698BA9F.4020809@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 15 Jan 2016 13:07:10 -0700
Message-ID: <CABcZAN=Y3UnMXjxVdxeYALSuR190YXPEp5bFnK44OsT0X87YDg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] opkg-utils: add update-alternatives PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Jan 2016 20:07:30 -0000
Content-Type: multipart/alternative; boundary=001a11409b18eef26a052964f389

--001a11409b18eef26a052964f389
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 15, 2016 at 2:23 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
> I've afraid this patch can't work well, when opkg-utils doesn't provide
> virtual/update-alternatives, then chkconfig would be built and there would
> be dependency loops for example,
>
> PACKAGECONFIG = "python"
> $ bitbake core-image-minimal
>
> [snip]
> ERROR:
> Dependency loop #1 found:
>   Task 747 (/buildarea/lyang1/poky/meta/recipes-support/libpcre/
> libpcre_8.38.bb, do_packagedata) (dependent Tasks ['libpcre, do_package'])
>   Task 2067 (/buildarea/lyang1/poky/meta/recipes-extended/slang/
> slang_2.2.4.bb, do_package) (dependent Tasks ['gcc-runtime,
> do_packagedata', 'pseudo, do_populate_sysroot', 'slang, do_install',
> 'libpcre, do_packagedata', 'libtool-cross, do_packagedata', 'glibc,
> do_packagedata', 'rpm, do_populate_sysroot'])
>   Task 2064 (/buildarea/lyang1/poky/meta/recipes-extended/slang/
> slang_2.2.4.bb, do_packagedata) (dependent Tasks ['slang, do_package'])
>   Task 1876 (/buildarea/lyang1/poky/meta/recipes-extended/newt/
> libnewt_0.52.18.bb, do_package) (dependent Tasks ['slang,
> do_packagedata', 'gcc-runtime, do_packagedata', 'pseudo,
> do_populate_sysroot', 'libnewt, do_install', 'libtool-cross,
> do_packagedata', 'glibc, do_packagedata', 'popt, do_packagedata', 'rpm,
> do_populate_sysroot'])
>   Task 1873 (/buildarea/lyang1/poky/meta/recipes-extended/newt/
> libnewt_0.52.18.bb, do_packagedata) (dependent Tasks ['libnewt,
> do_package'])
>   Task 1405 (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/
> chkconfig_1.3.58.bb, do_package) (dependent Tasks ['gcc-runtime,
> do_packagedata', 'pseudo, do_populate_sysroot', 'glibc, do_packagedata',
> 'libnewt, do_packagedata', 'chkconfig, do_install', 'popt, do_packagedata',
> 'gettext, do_packagedata', 'rpm, do_populate_sysroot'])
>   Task 1402 (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/
> chkconfig_1.3.58.bb, do_packagedata) (dependent Tasks ['chkconfig,
> do_package'])
>   Task 853 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/
> bzip2_1.0.6.bb, do_package) (dependent Tasks ['gcc-runtime,
> do_packagedata', 'bzip2, do_install_ptest_base', 'bzip2, do_install',
> 'libtool-cross, do_packagedata', 'glibc, do_packagedata', 'pseudo,
> do_populate_sysroot', 'chkconfig, do_packagedata', 'rpm,
> do_populate_sysroot'])
>   Task 850 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/
> bzip2_1.0.6.bb, do_packagedata) (dependent Tasks ['bzip2, do_package'])
>   Task 750 (/buildarea/lyang1/poky/meta/recipes-support/libpcre/
> libpcre_8.38.bb, do_package) (dependent Tasks ['libpcre,
> do_install_ptest_base', 'libpcre, do_install', 'gcc-runtime,
> do_packagedata', 'pseudo, do_populate_sysroot', 'libtool-cross,
> do_packagedata', 'glibc, do_packagedata', 'bzip2, do_packagedata', 'zlib,
> do_packagedata', 'rpm, do_populate_sysroot'])


Afaict it should work for the native case, just not target, if you use the
chkconfig-alternatives-native recipe. In meta-mentor we have that recipe
for target as well, to cover both cases, I'll see about submitting that.
We've been using the chkconfig update-alternatives implementation for a few
releases now.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11409b18eef26a052964f389
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jan 15, 2016 at 2:23 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
I&#39;ve afraid this patch can&#39;t work well, when opkg-utils doesn&#39;t=
 provide<br>
virtual/update-alternatives, then chkconfig would be built and there would<=
br>
be dependency loops for example,<br>
<br>
PACKAGECONFIG =3D &quot;python&quot;<br>
$ bitbake core-image-minimal<br>
<br>
[snip]<br>
ERROR:<br>
Dependency loop #1 found:<br>
=C2=A0 Task 747 (/buildarea/lyang1/poky/meta/recipes-support/libpcre/<a hre=
f=3D"http://libpcre_8.38.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8=
.38.bb</a>, do_packagedata) (dependent Tasks [&#39;libpcre, do_package&#39;=
])<br>
=C2=A0 Task 2067 (/buildarea/lyang1/poky/meta/recipes-extended/slang/<a hre=
f=3D"http://slang_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">slang_2.2.=
4.bb</a>, do_package) (dependent Tasks [&#39;gcc-runtime, do_packagedata&#3=
9;, &#39;pseudo, do_populate_sysroot&#39;, &#39;slang, do_install&#39;, &#3=
9;libpcre, do_packagedata&#39;, &#39;libtool-cross, do_packagedata&#39;, &#=
39;glibc, do_packagedata&#39;, &#39;rpm, do_populate_sysroot&#39;])<br>
=C2=A0 Task 2064 (/buildarea/lyang1/poky/meta/recipes-extended/slang/<a hre=
f=3D"http://slang_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">slang_2.2.=
4.bb</a>, do_packagedata) (dependent Tasks [&#39;slang, do_package&#39;])<b=
r>
=C2=A0 Task 1876 (/buildarea/lyang1/poky/meta/recipes-extended/newt/<a href=
=3D"http://libnewt_0.52.18.bb" rel=3D"noreferrer" target=3D"_blank">libnewt=
_0.52.18.bb</a>, do_package) (dependent Tasks [&#39;slang, do_packagedata&#=
39;, &#39;gcc-runtime, do_packagedata&#39;, &#39;pseudo, do_populate_sysroo=
t&#39;, &#39;libnewt, do_install&#39;, &#39;libtool-cross, do_packagedata&#=
39;, &#39;glibc, do_packagedata&#39;, &#39;popt, do_packagedata&#39;, &#39;=
rpm, do_populate_sysroot&#39;])<br>
=C2=A0 Task 1873 (/buildarea/lyang1/poky/meta/recipes-extended/newt/<a href=
=3D"http://libnewt_0.52.18.bb" rel=3D"noreferrer" target=3D"_blank">libnewt=
_0.52.18.bb</a>, do_packagedata) (dependent Tasks [&#39;libnewt, do_package=
&#39;])<br>
=C2=A0 Task 1405 (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/<a=
 href=3D"http://chkconfig_1.3.58.bb" rel=3D"noreferrer" target=3D"_blank">c=
hkconfig_1.3.58.bb</a>, do_package) (dependent Tasks [&#39;gcc-runtime, do_=
packagedata&#39;, &#39;pseudo, do_populate_sysroot&#39;, &#39;glibc, do_pac=
kagedata&#39;, &#39;libnewt, do_packagedata&#39;, &#39;chkconfig, do_instal=
l&#39;, &#39;popt, do_packagedata&#39;, &#39;gettext, do_packagedata&#39;, =
&#39;rpm, do_populate_sysroot&#39;])<br>
=C2=A0 Task 1402 (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/<a=
 href=3D"http://chkconfig_1.3.58.bb" rel=3D"noreferrer" target=3D"_blank">c=
hkconfig_1.3.58.bb</a>, do_packagedata) (dependent Tasks [&#39;chkconfig, d=
o_package&#39;])<br>
=C2=A0 Task 853 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/<a href=
=3D"http://bzip2_1.0.6.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.6=
.bb</a>, do_package) (dependent Tasks [&#39;gcc-runtime, do_packagedata&#39=
;, &#39;bzip2, do_install_ptest_base&#39;, &#39;bzip2, do_install&#39;, &#3=
9;libtool-cross, do_packagedata&#39;, &#39;glibc, do_packagedata&#39;, &#39=
;pseudo, do_populate_sysroot&#39;, &#39;chkconfig, do_packagedata&#39;, &#3=
9;rpm, do_populate_sysroot&#39;])<br>
=C2=A0 Task 850 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/<a href=
=3D"http://bzip2_1.0.6.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.6=
.bb</a>, do_packagedata) (dependent Tasks [&#39;bzip2, do_package&#39;])<br=
>
=C2=A0 Task 750 (/buildarea/lyang1/poky/meta/recipes-support/libpcre/<a hre=
f=3D"http://libpcre_8.38.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8=
.38.bb</a>, do_package) (dependent Tasks [&#39;libpcre, do_install_ptest_ba=
se&#39;, &#39;libpcre, do_install&#39;, &#39;gcc-runtime, do_packagedata&#3=
9;, &#39;pseudo, do_populate_sysroot&#39;, &#39;libtool-cross, do_packageda=
ta&#39;, &#39;glibc, do_packagedata&#39;, &#39;bzip2, do_packagedata&#39;, =
&#39;zlib, do_packagedata&#39;, &#39;rpm, do_populate_sysroot&#39;])</block=
quote></div><br></div><div class=3D"gmail_extra">Afaict it should work for =
the native case, just not target, if you use the chkconfig-alternatives-nat=
ive recipe. In meta-mentor we have that recipe for target as well, to cover=
 both cases, I&#39;ll see about submitting that. We&#39;ve been using the c=
hkconfig update-alternatives implementation for a few releases now.<br>-- <=
br><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11409b18eef26a052964f389--
