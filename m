Return-Path: <max.oss.09@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8B22F6C45B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 13:08:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so1568936ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zkOBsCJkZiKM0PyU/KVaM+fl2BOcBot257GoOws8/CE=;
	b=f9M8pcUlwqO9cDHJdPPturQuR3lUZoiLLWf80LZBvL/Z3xHbqn5ucrtRexU3OJnhpB
	P7wzUGcOkbZ7YIumsbKQw4uvXfBavYlHlwzcC9f2GefNXbnjQOYQ1Yrl8pxeiun6sR6Z
	5ZOwkOXHxDlk18WrvpPYqNyOGHd9eWIgQSE8Rzulc6Vdp6JMF9gM8/lDLOP13FiV0RKa
	xyLsaiQTzgafn9Flt0BBzz1Xg1wN76zOamRYQsP7pya+8R1D+4b42gniggARHTxIt7UB
	SnWvWsftkqZ6vG2yku66chkP2Iq30bVPy3xjJoIA+VX+vofUjjW4KlMPury+pBtFuUl5
	3zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zkOBsCJkZiKM0PyU/KVaM+fl2BOcBot257GoOws8/CE=;
	b=OK2CiT2RR2Dqc9R+VsnlJV3AXLqcUTePCmtEDy+jDdYHBzcXfEXBq6Ly4HGEJBMwla
	SFQeGLOVofv0ZRuuPpRnziriSJWai4tTTxIEbLcwa2r4K4ugpWHNwA3l6PokzQM+57QG
	QR66MgOMPkgwf6QfLWA9qRLqZUSyr4egVFrBtgmMPuy56xCMMOaadgHph6EvfJ/0ekde
	Amf/uhn8USfAEhlo3edgI1T+peGeZdjn358w4UvCFK1hdva+EoLva3JFGoMsUM731Ukd
	GjxMtSD02B68TBzqpkSUOU7x9AP5KzX97hxH7KuKMDLBqQTiL7nihclprFFH+yfmuNV1
	jgTQ==
X-Gm-Message-State: AA+aEWZknbkjHIttHhd34u/ZWyKrycJ/7+HRLGE0The+hX82omeZs9eZ
	0zXdw7zbDO6iDqeoFP5Uqy7HRj+w1dtlRIOpoQkLXQ==
X-Google-Smtp-Source: AFSGD/WSfqZAXvS93AQfFxnEdO8wP2B91t1dED/+sTkvuSyupWH+IyPURjOJf69v3ev03KD/8x3JGsnM3Hi6z1iVb5A=
X-Received: by 2002:a2e:5418:: with SMTP id
	i24-v6mr1298147ljb.51.1542719305815; 
	Tue, 20 Nov 2018 05:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20181107132406.61577-1-max.krummenacher@toradex.com>
In-Reply-To: <20181107132406.61577-1-max.krummenacher@toradex.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 20 Nov 2018 14:08:14 +0100
Message-ID: <CAEHkU3V07kJFjTHSoDbFyi1=e71xSfR+P7zv3Ouh2nk9tNKm4Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [rocko][sumo][PATCH 1/1] mobile-broadband-provider: fix SRC_URI
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
X-List-Received-Date: Tue, 20 Nov 2018 13:08:26 -0000
Content-Type: multipart/alternative; boundary="000000000000361b84057b185436"

--000000000000361b84057b185436
Content-Type: text/plain; charset="UTF-8"

Ping.

Any comments on this backport request?

Max

Am Mi., 7. Nov. 2018 um 14:25 Uhr schrieb Max Krummenacher <
max.oss.09@gmail.com>:

> From: Anuj Mittal <anuj.mittal@intel.com>
>
> Fixes build for older versions of git which don't follow redirects
> properly if the .git suffix is missing.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 77c353cc9bdfbf1b6453b2579b72726db05eb69c)
> [Fixup for rocko/sumo context]
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                              |
> 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> The inital patch 8382cdc088 changing the gnome git repo URL was
> backparted to rocko and sumo, however the follow up patch was not.
>
> This provides the backport of 77c353cc9b.
>
> Max
>
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/
> mobile-broadband-provider-info_git.bb
> b/meta/recipes-connectivity/mobile-broadband-provider-info/
> mobile-broadband-provider-info_git.bb
> index 57f521a6c4..b595d5700c 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/
> mobile-broadband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/
> mobile-broadband-provider-info_git.bb
> @@ -7,8 +7,7 @@ SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
>  PV = "20170310"
>  PE = "1"
>
> -SRC_URI = "git://
> gitlab.gnome.org/GNOME/mobile-broadband-provider-info;protocol=https"
> -
> +SRC_URI = "git://
> gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
>  S = "${WORKDIR}/git"
>
>  inherit autotools
> --
> 2.13.6
>
>

--000000000000361b84057b185436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ping.</div><div><br></div><div>Any comments on this b=
ackport request?</div><div><br></div><div>Max<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">Am Mi., 7. Nov. 2018 um 14:25=C2=A0Uhr sc=
hrieb Max Krummenacher &lt;<a href=3D"mailto:max.oss.09@gmail.com">max.oss.=
09@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Anuj Mi=
ttal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mi=
ttal@intel.com</a>&gt;<br>
<br>
Fixes build for older versions of git which don&#39;t follow redirects<br>
properly if the .git suffix is missing.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
(cherry picked from commit 77c353cc9bdfbf1b6453b2579b72726db05eb69c)<br>
[Fixup for rocko/sumo context]<br>
Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@tora=
dex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://mobile-broadband-provider-info_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">mobile-broadband-provider-info_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
The inital patch 8382cdc088 changing the gnome git repo URL was<br>
backparted to rocko and sumo, however the follow up patch was not.<br>
<br>
This provides the backport of 77c353cc9b.<br>
<br>
Max<br>
<br>
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/<a hr=
ef=3D"http://mobile-broadband-provider-info_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mobile-broadband-provider-info_git.bb</a> b/meta/recipes-conn=
ectivity/mobile-broadband-provider-info/<a href=3D"http://mobile-broadband-=
provider-info_git.bb" rel=3D"noreferrer" target=3D"_blank">mobile-broadband=
-provider-info_git.bb</a><br>
index 57f521a6c4..b595d5700c 100644<br>
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/<a href=3D"h=
ttp://mobile-broadband-provider-info_git.bb" rel=3D"noreferrer" target=3D"_=
blank">mobile-broadband-provider-info_git.bb</a><br>
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/<a href=3D"h=
ttp://mobile-broadband-provider-info_git.bb" rel=3D"noreferrer" target=3D"_=
blank">mobile-broadband-provider-info_git.bb</a><br>
@@ -7,8 +7,7 @@ SRCREV =3D &quot;befcbbc9867e742ac16415660b0b7521218a530c&q=
uot;<br>
=C2=A0PV =3D &quot;20170310&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/mobile-br=
oadband-provider-info;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">gitlab.gnome.org/GNOME/mobile-broadband-provider-info;protocol=3Dhttps</a=
>&quot;<br>
-<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/mobile-br=
oadband-provider-info.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=3D=
https</a>&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools<br>
-- <br>
2.13.6<br>
<br>
</blockquote></div>

--000000000000361b84057b185436--
