Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E89977727B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 22:02:35 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id z8so825035ige.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=X4CEgyJTTn4sUipgiGA5wk1PN1U1P6BsB6ay+2AxILI=;
	b=TdHxkrv2/omNz4HvnfbOO1hsbPG6YO53dNjp0iEy6AxBBiYIuEODMZNUoX1tTymUmj
	X4bdZZgT37A3d2sOrCQfwAspbqWOBgUBA93G8Vu8zO3jh2xESg18PBxg2ng8CFf5lf7C
	7crsXiJ3J5/Tv497UlLpybdfqLI27RVw3zAjgdt/lBvG9oONFLOe6UQ4rH1Aln0saKpH
	D8rsZj96bzXC8mXiNQSEKYvlAJ1qrN+pFMrBbClKRyzZjZrv2ls88qEW8no1UxBcSp/s
	xN4OSbHCR/1cX8q3+DBCcMByFDQlQ/eBRJrEi6+jy0rB0HARRFLDeZDPK4Ao0taGKroT
	HXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=X4CEgyJTTn4sUipgiGA5wk1PN1U1P6BsB6ay+2AxILI=;
	b=UN97AXK8mvU9F0pNr59XuEnvWq5M/naEs45MFlkn1WAlZDrYdCLq813iKv8MJVkFzc
	09sG2gmJFEIRzQimrVM5+59d+wF3Y7rXFPTBitKsZVbO7iJ4u/CgsUaOXzfjI3hdIoHa
	E5l9vPBMIyTtC9ABMGOtKcZty9leT0uu9v57XzyTCSfIpcMW1PGJ5lO2+cIDawbsZhhT
	LLapt1HuY0I/KP43M8izd226HGBDt7fvUpfqVdgYZv3Jo49EpbnvOmbitwXA97fsQfWH
	I7+b0uDV2cug4R/cdfndBVs0wwrSCP2rjPj8SSH1BqVt2qld0Dek3ka72PuZyNcW04nG
	kjGw==
X-Gm-Message-State: AG10YOR8la/1pJM0mqF5KvBumReyjaVCDyfcA/2igS84X4XMzPtaMfNpXAjbuDmzArMI20ESkWrqYhuS7FRBiA==
X-Received: by 10.50.64.179 with SMTP id p19mr176531igs.25.1456351355829; Wed,
	24 Feb 2016 14:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20160224165105.15082xiuxuncffsw@astoria.ccjclearline.com>
In-Reply-To: <20160224165105.15082xiuxuncffsw@astoria.ccjclearline.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 24 Feb 2016 22:02:01 +0000
Message-ID: <CABcZANntxYc_G9ctctpgUMeB1SDZtA6wOWgZbOCzd4UH4tgG_A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	openembedded-core@lists.openembedded.org
Subject: Re: trying to summarize the flexibility in bbappend'ing to kernel recipes
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
X-List-Received-Date: Wed, 24 Feb 2016 22:02:36 -0000
Content-Type: multipart/alternative; boundary=047d7bd75cec3b8494052c8b39fb

--047d7bd75cec3b8494052c8b39fb
Content-Type: text/plain; charset=UTF-8

A bbappend basically concatenates to the recipe in bitgbake, so it can do
anything the recipe can do, within reason, so yes, use of filespath and
overrides works the way it's always worked with recipes.

On Wed, Feb 24, 2016 at 3:00 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>    let's see if i can explain this properly -- i want to enumerate all
> possible ways to .bbappend to a kernel recipe if i have multiple
> target machines and multiple kernel recipes. so let's imagine the
> following scenario -- i grab a layer that has two recipe files for
> two versions of the kernel, *and* i have two target boards. so ...
>
>   * linux-4.0.bb
>   * linux-4.1.bb
>
> and i have two target machines, "mach1" and "mach2", and the combination
> of all of these involves various patches. so what are my possibilities?
>
>    first (as long as i understood chris larson properly), i can define
> two separate .bbappend files:
>
>   * linux-4.0.bbappend
>   * linux-4.1.bbappend
>
> or i can define a single wildcard .bbappend file that covers both:
>
>   * linux-4.%.bbappend
>
> so far, so good.
>
>    next, in these .bbappend files, SRC_URI can refer to any of:
>
>   * .scc files
>   * .patch/.diff files
>   * .cfg files
>
> so each of my two .bbappend files can enumerate a different set
> of files to be applied to that version of the kernel. but wait ...
> there's more.
>
>    in each .bbappend file, i can conditionally include files in the
> SRC_URI, as in:
>
>   * SRC_URI_mach1 += mach1.patch
>
> so depending on the target machine, i can conditionally include
> any of patch files, cfg files or scc files.
>
>    in addition, i can take advantage of FILESEXTRAPATHS, that i once
> wrote up here:
>
>    http://www.crashcourse.ca/wiki/index.php/Poky_bbappend_FILESEXTRAPATHS
>
> so that i have a ridiculous set of possibilities as to which patch
> files will be applied depending on the:
>
>   * architecture
>   * distro
>   * target machine
>
> am i making sense so far? because there will be more coming shortly.
>
> rday
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bd75cec3b8494052c8b39fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A bbappend basically concatenates to the recipe in bitgbak=
e, so it can do anything the recipe can do, within reason, so yes, use of f=
ilespath and overrides works the way it&#39;s always worked with recipes.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Feb 24, 2016 at=
 3:00 PM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjd=
ay@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
=C2=A0 =C2=A0let&#39;s see if i can explain this properly -- i want to enum=
erate all<br>
possible ways to .bbappend to a kernel recipe if i have multiple<br>
target machines and multiple kernel recipes. so let&#39;s imagine the<br>
following scenario -- i grab a layer that has two recipe files for<br>
two versions of the kernel, *and* i have two target boards. so ...<br>
<br>
=C2=A0 * <a href=3D"http://linux-4.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">linux-4.0.bb</a><br>
=C2=A0 * <a href=3D"http://linux-4.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">linux-4.1.bb</a><br>
<br>
and i have two target machines, &quot;mach1&quot; and &quot;mach2&quot;, an=
d the combination<br>
of all of these involves various patches. so what are my possibilities?<br>
<br>
=C2=A0 =C2=A0first (as long as i understood chris larson properly), i can d=
efine<br>
two separate .bbappend files:<br>
<br>
=C2=A0 * linux-4.0.bbappend<br>
=C2=A0 * linux-4.1.bbappend<br>
<br>
or i can define a single wildcard .bbappend file that covers both:<br>
<br>
=C2=A0 * linux-4.%.bbappend<br>
<br>
so far, so good.<br>
<br>
=C2=A0 =C2=A0next, in these .bbappend files, SRC_URI can refer to any of:<b=
r>
<br>
=C2=A0 * .scc files<br>
=C2=A0 * .patch/.diff files<br>
=C2=A0 * .cfg files<br>
<br>
so each of my two .bbappend files can enumerate a different set<br>
of files to be applied to that version of the kernel. but wait ...<br>
there&#39;s more.<br>
<br>
=C2=A0 =C2=A0in each .bbappend file, i can conditionally include files in t=
he<br>
SRC_URI, as in:<br>
<br>
=C2=A0 * SRC_URI_mach1 +=3D mach1.patch<br>
<br>
so depending on the target machine, i can conditionally include<br>
any of patch files, cfg files or scc files.<br>
<br>
=C2=A0 =C2=A0in addition, i can take advantage of FILESEXTRAPATHS, that i o=
nce<br>
wrote up here:<br>
<br>
=C2=A0 =C2=A0<a href=3D"http://www.crashcourse.ca/wiki/index.php/Poky_bbapp=
end_FILESEXTRAPATHS" rel=3D"noreferrer" target=3D"_blank">http://www.crashc=
ourse.ca/wiki/index.php/Poky_bbappend_FILESEXTRAPATHS</a><br>
<br>
so that i have a ridiculous set of possibilities as to which patch<br>
files will be applied depending on the:<br>
<br>
=C2=A0 * architecture<br>
=C2=A0 * distro<br>
=C2=A0 * target machine<br>
<br>
am i making sense so far? because there will be more coming shortly.<br>
<br>
rday<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--047d7bd75cec3b8494052c8b39fb--
