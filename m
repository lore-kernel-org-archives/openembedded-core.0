Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 080D073091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:39:14 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b16so7202364qte.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xlzjCFTWMb4hNprE6zauGzv1LQQS0ezl+Xsy0X1QYQA=;
	b=Y01qRlLrAdCSqvw9dNVYPzbQZ4qG6jcQRoHYIS25AJ9VLFRZ9MZGk/OfbriQWKZlIs
	icMFdXrfuQWwJspSDZI5w5OsXIDWNUPPH89q+NR6ppZkYx0gjkTbU67RasZNXHEskJdT
	M817PfV9SgQhDbYAVlczEQdTpo4a02Jlb7cEi/wUiia9w2NviJ7uI1VrmagQNgRknW+p
	kPp/rF5A7ZH2YI0iU4N7L800V+1dEUnaxjybiS2HZ7zKpYs8O0YXKFzsCxUx2c6Tt6z7
	Sr/gIB+aVsRLtaDcso7TiYTKbbsAYGcl90USoDPLSHTYxguINMbnLx/YPDY7LObHJBIt
	0VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xlzjCFTWMb4hNprE6zauGzv1LQQS0ezl+Xsy0X1QYQA=;
	b=ZFYqvClDy9yddTE3KUQDCf/ReMNqAT+BeCXq23te6xqKMzVG+znbbmLpwHufmdshUO
	CArpiVg700Pn9mOix8SLsml/91Fw5Ed8aqCCckdvpL5MoOs0c0YzyQZXUdJgJ6leruGL
	14nYSDpihg6LRR0MO7QrlbLTPTDiJ1zdKOL788AQPUvnir49XJv5YhVw9LWjDt3zwBI8
	GebxzW2Nn/yy6dAjJF5VRRZYirjJxZVYgdb0I5neX5u9e0CnKHU2QckAivL+NWg/07tT
	J7we2sXE01nvfvHN0D/POCI+8yAQTsG9fNnrn5iCS+WPKghKWbgW50z9kroqIv+BDpX5
	sigQ==
X-Gm-Message-State: AMke39mzL3FRsoV73jX3h1W907iifJUc8YwJRw28rwj/JDwchhrspWk+ylWMKYq1vHyd03XVOo2Wq7CP9JK+deE8
X-Received: by 10.237.54.1 with SMTP id e1mr29676439qtb.68.1487781555702; Wed,
	22 Feb 2017 08:39:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 08:38:55 -0800 (PST)
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 16:38:55 +0000
Message-ID: <CAJTo0LZT_D4gXYRY__zWuDCY9zOKaHL1tmgqppP5=8qJzijn+Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] wic: fix for #11017
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
X-List-Received-Date: Wed, 22 Feb 2017 16:39:15 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf021a3250549212364

--001a1142dcf021a3250549212364
Content-Type: text/plain; charset=UTF-8

Hi Ed,

Something in your latest patchset is breaking selftest:

https://autobuilder.yoctoproject.org/main/builders/nightly-wic/builds/626/steps/CreateWicImages/logs/stdio

The broken commit is somewhere in ross/mut-wic.  Can you verify that I
didn't leave something out, or otherwise chase this?

Ross

On 21 February 2017 at 15:23, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Hi,
>
> This patchset improves handling of wic native tool dependencies and
> fixes minor bugs in the wic code.
>
> The following changes since commit 9a0ddad5e178d16f302af2d05c3236
> 8572849fd3:
>
>   wic: pluginbase: use global dictionary (2017-02-20 11:58:28 +0200)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib ed/wic/wip
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip
>
> Ed Bartosh (6):
>   wic: use 2 sysroots to find native executable
>   wic: use image recipe sysroot as default
>   wic: exec_native_cmd: improve debug message
>   wic: exec_native_cmd: fix undefined variable error
>   wic: add WKS_FILE_DEPENDS variable
>   wic: raise WicError instead of calling logger.error
>
>  meta-selftest/recipes-test/images/wic-image-minimal.bb |  2 +-
>  meta/classes/image_types_wic.bbclass                   |  2 ++
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py       |  4 ++--
>  scripts/lib/wic/utils/misc.py                          | 13 +++++++++----
>  scripts/wic                                            |  2 +-
>  5 files changed, 15 insertions(+), 8 deletions(-)
>
> --
> Regards,
> Ed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142dcf021a3250549212364
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>Something in your latest patchse=
t is breaking selftest:</div><div><br></div><div><a href=3D"https://autobui=
lder.yoctoproject.org/main/builders/nightly-wic/builds/626/steps/CreateWicI=
mages/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightl=
y-wic/builds/626/steps/CreateWicImages/logs/stdio</a><br></div><div><br></d=
iv><div>The broken commit is somewhere in ross/mut-wic.=C2=A0 Can you verif=
y that I didn&#39;t leave something out, or otherwise chase this?</div><div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 21 February 2017 at 15:23, Ed Bartosh <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bar=
tosh@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Hi,<br>
<br>
This patchset improves handling of wic native tool dependencies and<br>
fixes minor bugs in the wic code.<br>
<br>
The following changes since commit 9a0ddad5e178d16f302af2d05c3236<wbr>85728=
49fd3:<br>
<br>
=C2=A0 wic: pluginbase: use global dictionary (2017-02-20 11:58:28 +0200)<b=
r>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> ed/w=
ic/wip<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Ded/wic/wip" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject=
.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>ed/wic/wip</a><br>
<br>
Ed Bartosh (6):<br>
=C2=A0 wic: use 2 sysroots to find native executable<br>
=C2=A0 wic: use image recipe sysroot as default<br>
=C2=A0 wic: exec_native_cmd: improve debug message<br>
=C2=A0 wic: exec_native_cmd: fix undefined variable error<br>
=C2=A0 wic: add WKS_FILE_DEPENDS variable<br>
=C2=A0 wic: raise WicError instead of calling logger.error<br>
<br>
=C2=A0meta-selftest/recipes-test/<wbr>images/<a href=3D"http://wic-image-mi=
nimal.bb" rel=3D"noreferrer" target=3D"_blank">wic-image-minimal.bb</a> |=
=C2=A0 2 +-<br>
=C2=A0meta/classes/image_types_wic.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0scripts/lib/wic/plugins/<wbr>source/bootimg-pcbios.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0scripts/lib/wic/utils/misc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++----<br>
=C2=A0scripts/wic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A05 files changed, 15 insertions(+), 8 deletions(-)<br>
<br>
--<br>
Regards,<br>
Ed<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1142dcf021a3250549212364--
