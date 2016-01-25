Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 078B77705C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 20:00:53 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id t15so43711392igr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 12:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/jI+8RiX7T+yy4V3Mtlxjx9Fnify4pn/gU88SOJMMzY=;
	b=0LouJROpw87WymNxwpM380/wooZDaJNdVl6KHTaVhDb0JWjR0Gh2WglMwnfjS1iUXQ
	/oqJ9ws7KFETykj83zGdGZF5kr+7nyjxX2tQkAL/mUv2Yz3c69b2VapM8A7XjRfvumO4
	R/IeMqk1dBsR25ECc7p31Ob2tWu3hfm/YB86XJZRWtjIDQrw/C3q7BrBtXGCNIgP4EqO
	eQLyGMVw+N9dUzzZJG2/41LxNOvqs28YYNflQc2nPhap+r1030bjU93M1lOhxPdvR2CA
	X0Pd7AbYNu7dXOBctOvumiUwzJUzx2AIZsqEQwfXTZuJxEZmkIuOzsqkbZNaYiv7/vyx
	E9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/jI+8RiX7T+yy4V3Mtlxjx9Fnify4pn/gU88SOJMMzY=;
	b=UfYOIyiTpE1eEtZKWl9dLLWQyR/xLXjDUslak06jkcSIXT1g92Kt3tJi4NEQMQv2j9
	HsG5W3cPqvor3QmyuWP1QaRD7KM/gpN5EMVxptoD5SmT7wkpOdd1lr/jWAsT8RSj4imz
	PpZBfKa6gb0K/AlyHMD5gLDT2hmWKRbUho/VWt68NNrB0ddY2LVpQJEbltZuutC49SLO
	0JeDLKJJJfon5RdJ/Nh9UKbsmovkcLknbyhfEfECUPynqOKpToHx1PEFQ2J/t7nWRcVA
	Rqo8tKg+Db4IZ2G6FvM/VVPdazz6r5jCtuyfrxQF7ZFunZCQYMcOCq90K/u3/gySm/HN
	wpYQ==
X-Gm-Message-State: AG10YOQqIkVcnwUINANiPxt3JhEaS37AGODyYz9XJOCre0TYVp8Gn+whVmSe/btQa3zMixC27k94xY3bGIbplw==
MIME-Version: 1.0
X-Received: by 10.50.79.196 with SMTP id l4mr19739403igx.11.1453752054150;
	Mon, 25 Jan 2016 12:00:54 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 12:00:53 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 12:00:53 -0800 (PST)
In-Reply-To: <cover.1453750404.git.akuster808@gmail.com>
References: <cover.1453750404.git.akuster808@gmail.com>
Date: Mon, 25 Jan 2016 12:00:53 -0800
Message-ID: <CAMKF1spu4YOg9fHP329ssM2B3SO4AVyPsuRo1f1XvU317nVY2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4][fido] Glibc security fixes
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
X-List-Received-Date: Mon, 25 Jan 2016 20:00:59 -0000
Content-Type: multipart/alternative; boundary=089e01183f48c77fa7052a2e06ed

--089e01183f48c77fa7052a2e06ed
Content-Type: text/plain; charset=UTF-8

Patches are ok. I was wondering if BACKPORTS variable was good enough for
cve patches too. Anyway the patch name ha cve informations
On Jan 25, 2016 12:35 PM, "Armin Kuster" <akuster808@gmail.com> wrote:

> noticed this did not hit the patchwork. resending.
>
> Please consider these for the next fido update.
>
> The following changes since commit
> 9845a542a76156adb5aef6fd33ad5bc5777acf64:
>
>   openssh: CVE-2016-077x (2016-01-20 17:08:30 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akuster/fido_glibc_cve_fixes
>
> http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/fido_glibc_cve_fixes
>
> Armin Kuster (4):
>   glibc: CVE-2015-8777
>   glibc: CVE-2015-8779
>   glibc: CVE-2015-9761
>   glibc: CVE_2015-8776
>
>  meta/recipes-core/glibc/glibc/CVE-2015-8776.patch |  176 +++
>  meta/recipes-core/glibc/glibc/CVE-2015-8777.patch |  143 ++
>  meta/recipes-core/glibc/glibc/CVE-2015-8779.patch |  282 ++++
>  meta/recipes-core/glibc/glibc/CVE-2015-9761.patch | 1452
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.21.bb             |    4 +
>  5 files changed, 2057 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761.patch
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e01183f48c77fa7052a2e06ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Patches are ok. I was wondering if BACKPORTS variable was go=
od enough for cve patches too. Anyway the patch name ha cve informations</p=
>
<div class=3D"gmail_quote">On Jan 25, 2016 12:35 PM, &quot;Armin Kuster&quo=
t; &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt;=
 wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">noticed this=
 did not hit the patchwork. resending.<br>
<br>
Please consider these for the next fido update.<br>
<br>
The following changes since commit 9845a542a76156adb5aef6fd33ad5bc5777acf64=
:<br>
<br>
=C2=A0 openssh: CVE-2016-077x (2016-01-20 17:08:30 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> akuster/f=
ido_glibc_cve_fixes<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/fi=
do_glibc_cve_fixes" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopr=
oject.org/cgit.cgi//log/?h=3Dakuster/fido_glibc_cve_fixes</a><br>
<br>
Armin Kuster (4):<br>
=C2=A0 glibc: CVE-2015-8777<br>
=C2=A0 glibc: CVE-2015-8779<br>
=C2=A0 glibc: CVE-2015-9761<br>
=C2=A0 glibc: CVE_2015-8776<br>
<br>
=C2=A0meta/recipes-core/glibc/glibc/CVE-2015-8776.patch |=C2=A0 176 +++<br>
=C2=A0meta/recipes-core/glibc/glibc/CVE-2015-8777.patch |=C2=A0 143 ++<br>
=C2=A0meta/recipes-core/glibc/glibc/CVE-2015-8779.patch |=C2=A0 282 ++++<br=
>
=C2=A0meta/recipes-core/glibc/glibc/CVE-2015-9761.patch | 1452 ++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.21.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.21.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A05 files changed, 2057 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch<=
br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch<=
br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch<=
br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761.patch<=
br>
<br>
--<br>
2.3.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--089e01183f48c77fa7052a2e06ed--
