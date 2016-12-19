Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8273E77399
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:53:25 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id q68so30054548qki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mI0Orsn5xMd+TQhEXyhtTzkh2UQJjOh46tAqifDCbu4=;
	b=Bc96BlCL96KJ1+o7iNsKLOFUts/GdAlhU9VOPwNuTj7msh+UeSzYWjOIrOxmQEXsnI
	v90o9GwRHM5ZzO7rwQX1d+DWR3pAe5VKfHHVe7s/JkXwEElT9jrCqIHwVvAENYas192V
	iyDik3YQ8PGZnXweZUU4t9OaQyr8JqbrGe+5DvF8i/Z0wdt26b4RKR09dYT9jZSPECG0
	6JLH5Bi6wSUDyNjs44j8GVybSJ3bbdJKDgP4klHivVLWxObn1HBwm7WUczdy7bcXsDtG
	7djSSyOzHT5tXp5s8cjLJUph9Ci0J1fIwS4ofEYT2tLWVkTPxJ+a601G20tcsbW5TBaj
	T3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mI0Orsn5xMd+TQhEXyhtTzkh2UQJjOh46tAqifDCbu4=;
	b=ApNkfe+I0zUKvjVRb+1NDmYXyrEb1xKWm0O+OklCw//OYm+u2mTQeo5Oo33rfugD4p
	LcFNjfTonYK7HQyKwk3J9FglmPjggdCBs2Oz+9rbA7DYOKvtgQaZpGy9qZ/sHgN3c86J
	eAgg2f7jZoMGXxnnU/sANHaJvvgeDyPT/QZiYuC7lkNVP6IddLq3NQD5MEtjE25MBwvE
	6ra1MqDTCmrHkBluPTl1nMc0WJQNuZ9RcOepOizkkPLWCZKHr8LzjBQGRjxRNzzy8XWq
	is/T+iyybeHY0g09mf6zZJPYiVimMiVY8EgzOsyeTC1LGlmSnpMzISCUMQ8OaDgr52dY
	2N/g==
X-Gm-Message-State: AIkVDXIx57dyct4Ke7wU9TW/BqnF+y2s/ebg8MHr1JGpee+rYh8gi7KJ74tmIN63wjjURfMsuDDiVBLenql9k8J9
X-Received: by 10.55.106.134 with SMTP id f128mr2755188qkc.121.1482184407092; 
	Mon, 19 Dec 2016 13:53:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 13:53:06 -0800 (PST)
In-Reply-To: <CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 21:53:06 +0000
Message-ID: <CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 21:53:26 -0000
Content-Type: multipart/alternative; boundary=001a114fddf613a675054409f30c

--001a114fddf613a675054409f30c
Content-Type: text/plain; charset=UTF-8

Definitely works here:

$ rm tmp-glibc/ -rf ; bitbake util-linux-native -C unpack
Parsing recipes: 100%
|#################################################################################################|
Time: 0:00:04
Parsing of 866 .bb files complete (0 cached, 866 parsed). 1321 targets, 68
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.32.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "debian-8"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp
meta-selftest
workspace         = "mut:5484568d66cc8c888f5611970242e0689fc4d672"

NOTE: Tainting hash to force rebuild of task
virtual:native:/home/ross/Yocto/poky/meta/recipes-core/util-linux/
util-linux_2.29.bb, do_unpack
WARNING:
virtual:native:/home/ross/Yocto/poky/meta/recipes-core/util-linux/util-linux_2.29.bb.do_unpack
is tainted from a forced run:00
Initialising tasks: 100%
|##############################################################################################|
Time: 0:00:00
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 100 tasks of which 91 didn't need to be
rerun and all succeeded.

Ross

On 19 December 2016 at 21:47, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 19 December 2016 at 21:42, Trevor Woerner <twoerner@gmail.com> wrote:
>
>> A fresh build in a new directory fails readily:
>>
>
> Ah, interesting, because I can't replicate that. :/
>
> Can you share the do_configure log?
>
> Ross
>

--001a114fddf613a675054409f30c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Definitely works here:<div><br></div><div><div>$ rm tmp-gl=
ibc/ -rf ; bitbake util-linux-native -C unpack</div><div>Parsing recipes: 1=
00% |######################################################################=
###########################| Time: 0:00:04</div><div>Parsing of 866 .bb fil=
es complete (0 cached, 866 parsed). 1321 targets, 68 skipped, 0 masked, 0 e=
rrors.</div><div>NOTE: Resolving any missing task queue dependencies</div><=
div><br></div><div>Build Configuration:</div><div>BB_VERSION =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;1.32.0&quot;</div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>NATIVELSBSTRING =C2=A0 =
=3D &quot;debian-8&quot;</div><div>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;i586-oe-linux&quot;</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D &quot;qemux86&quot;</div><div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;nodistro&quot;</div><div>DISTRO_VERSION =C2=A0 =
=C2=A0=3D &quot;nodistro.0&quot;</div><div>TUNE_FEATURES =C2=A0 =C2=A0 =3D =
&quot;m32 i586&quot;</div><div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;&quot;</div><div>meta</div><div>meta-poky</div><div>meta-yocto-bsp</div=
><div>meta-selftest</div><div>workspace =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;mut:5484568d66cc8c888f5611970242e0689fc4d672&quot;</div><div><br></div><=
div>NOTE: Tainting hash to force rebuild of task virtual:native:/home/ross/=
Yocto/poky/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.29.b=
b">util-linux_2.29.bb</a>, do_unpack</div><div>WARNING: virtual:native:/hom=
e/ross/Yocto/poky/meta/recipes-core/util-linux/util-linux_2.29.bb.do_unpack=
 is tainted from a forced run:00</div><div>Initialising tasks: 100% |######=
###########################################################################=
#############| Time: 0:00:00</div><div>NOTE: Executing SetScene Tasks</div>=
<div>NOTE: Executing RunQueue Tasks</div><div>NOTE: Tasks Summary: Attempte=
d 100 tasks of which 91 didn&#39;t need to be rerun and all succeeded.</div=
></div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On 19 December 2016 at 21:47, Burton, Ross <span =
dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div cl=
ass=3D"gmail_quote">On 19 December 2016 at 21:42, Trevor Woerner <span dir=
=3D"ltr">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoern=
er@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D"m_-5033074302890118263:41e" class=3D"m_-5033074302890118263a3s m_-5033=
074302890118263aXjCH m_-5033074302890118263m1591909ba5caa759">A fresh build=
 in a new directory fails readily:<br></div></blockquote></div><br></span>A=
h, interesting, because I can&#39;t replicate that. :/</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Can you share the do_confi=
gure log?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span>=
</div>
</blockquote></div><br></div>

--001a114fddf613a675054409f30c--
