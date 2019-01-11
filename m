Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0F507C140
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:19:23 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id l14so12560226ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 08:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2w03ateoQTPAk2k8hm0LQLwnWxArdHOVj0S2Gaw2OzY=;
	b=Xa/YVdHMRpHNmF9A5ncMNl7X0FP/Jpcmhpxz+eG0wfIHGk6QwYv5rZwQ0ZmCvfw4z3
	YWcqAcfbNjdvmnZVTJmPCw4QDPCXRb/RfEiMOVsPcQUQODHeIt5qbbVet0b6WEOswyHb
	9FVG2e5f+C/cZs0p/t0LUGhl1qSZkRqlcYl2lUnB5gWFd8FRfePu6C0MthPUekNV18zc
	RhFSeg6EUBacnSKHqfQHEzP5tfIOIn8nQQj7LZkPvtfUbmg45TwoSPHXfZYCQ56mqah3
	5VZV46joNGDDPtKQm1TNsMcg0bJFDQLjeHHKPjjDb4R6srnYGllJdLZfp3b95ljtn+o7
	w7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2w03ateoQTPAk2k8hm0LQLwnWxArdHOVj0S2Gaw2OzY=;
	b=DkPZObdOQLxjWCKIQ/P+So1+j6xr40IACUhUf2//Rd6jbBF4uUoAUXLNTQrU2OU2+c
	xEbu8AmiUvqaRgWaRbC7Q5jyvsWnGpY3RPhlKttqg0Km/YFVyvgRAf36tkIz/UtBIz47
	C4158vTsOC+ey9NCZT9CNHj/lhuK0ueQNm+cr0KD2gffMp5vkjAVN6shFIeXxchxmKe1
	d4R9rbRGgGyJEwLYRkVbV8nw1v5WhF20o+WgWPHT32LICH//rNshPzzh49vdxnBpnH4D
	BfCzWgc1JwxRSCwy7T4P6H7kymyAZSk8IKOhHyAX4hTqnZseiMAX91vilcoiTe8EGJQV
	3dtg==
X-Gm-Message-State: AJcUukck03vXC4jhDkqHjuE5R4mxoxGTZiy88DB0t+RN0vKzy0kG4OBS
	A/4FRPY/kQpPq0Sd7a3W8VLQffWaRVEPgHA3U9fmoXRg
X-Google-Smtp-Source: ALg8bN49iHJacABM2Ppv0IcaN3c9+DKCzFe5VZZjfr0JilDmMRFnmHra6MKyxvuWiBevg83ZrLatn/fQ2bOfLnFJeyM=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr8880931iog.270.1547223564601; 
	Fri, 11 Jan 2019 08:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20190111160559.27939-1-richard@nod.at>
In-Reply-To: <20190111160559.27939-1-richard@nod.at>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2019 16:19:13 +0000
Message-ID: <CAJTo0Lb-HTRsEoOWM9ES9YbeXVtTfnGueJ4P1kvaTpmOsPFGsQ@mail.gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky: add OpenSUSE LEAP 15.0 to SANITY_TESTED_DISTROS
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
X-List-Received-Date: Fri, 11 Jan 2019 16:19:23 -0000
Content-Type: multipart/alternative; boundary="000000000000f4d6cd057f310e39"

--000000000000f4d6cd057f310e39
Content-Type: text/plain; charset="UTF-8"

We'll switch this when the autobuilder is building on 15.0.  Currently the
15.0 worker is there but disabled, presumably it's not up and running yet.

Ross

On Fri, 11 Jan 2019 at 16:06, Richard Weinberger <richard@nod.at> wrote:

> All my build systems (and containers) run LEAP 15.0.
> So far everything worked fine, let's get rid of the warning. :-)
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  meta-poky/conf/distro/poky.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-poky/conf/distro/poky.conf
> b/meta-poky/conf/distro/poky.conf
> index f5de8f2335d1..d560ed3a3fa3 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -73,6 +73,7 @@ SANITY_TESTED_DISTROS ?= " \
>              debian-8 \n \
>              debian-9 \n \
>              opensuse-42.3 \n \
> +            opensuseleap-15.0 \n \
>              "
>  #
>  # OELAYOUT_ABI allows us to notify users when the format of TMPDIR
> changes in
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f4d6cd057f310e39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;ll switch this when the autobuilder is building on =
15.0.=C2=A0 Currently the 15.0 worker is there but disabled, presumably it&=
#39;s not up and running yet.<div><br></div><div>Ross</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Fri, 11 Jan 2019 at 16:06, Richard=
 Weinberger &lt;<a href=3D"mailto:richard@nod.at">richard@nod.at</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">All my build systems (and containers) run LE=
AP 15.0.<br>
So far everything worked fine, let&#39;s get rid of the warning. :-)<br>
<br>
Signed-off-by: Richard Weinberger &lt;<a href=3D"mailto:richard@nod.at" tar=
get=3D"_blank">richard@nod.at</a>&gt;<br>
---<br>
=C2=A0meta-poky/conf/distro/poky.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.c=
onf<br>
index f5de8f2335d1..d560ed3a3fa3 100644<br>
--- a/meta-poky/conf/distro/poky.conf<br>
+++ b/meta-poky/conf/distro/poky.conf<br>
@@ -73,6 +73,7 @@ SANITY_TESTED_DISTROS ?=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debian-8 \n \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debian-9 \n \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opensuse-42.3 \n \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opensuseleap-15.0 \n \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0#<br>
=C2=A0# OELAYOUT_ABI allows us to notify users when the format of TMPDIR ch=
anges in<br>
-- <br>
2.16.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000f4d6cd057f310e39--
