Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B04A47E3FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 13:19:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 198so9371921wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8qvJU2HyMnZv40GsxbUdFjXe9/goNIdKfcDD0qeysTw=;
	b=dKNhuSSu/Z06iSGuuxr2t+/QjGNygddsyceZYtsIlO0y/z4hzc2gjB0b9WGUKbeGjj
	xgpBzQjfUgXkcK7JE5YbmcKyJp78oB49QaAIakaRgW+v+vv8RwdTITR4D5a4Xefj/cXD
	xYIDJ+vuCuNbtLA2i6w2pORoisV1PlPI2+5g0u7lEbBcQFwWWn+X6aaL6/O68ra6A8iF
	ksPkuEcj2vva8xXXZWojVw9u75qHVkr2UU7fyqLIEQwe8K1VEbwQElZnXAvlwI11bjwK
	6KdbN68Cv5DIF1+eMmOwyHCX9BXoiVpf1tpLeLpdeH8LtkjWcruPfBeKaKvT6b2gUYQC
	N7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8qvJU2HyMnZv40GsxbUdFjXe9/goNIdKfcDD0qeysTw=;
	b=TKeCmwzzdD8zTt4ATnp2P3hJytqzvybRVvPYZK1taWBmVuJIsl2N+cqNf07+zQYLgl
	jITh/r4UGWw7BrBmTSG/RPgRITRNS7U1IRNAISfiHPVH/ybFO6OjozI9yWPREXG83d8P
	5PiAPRL6u7GthEEUHe5yDqQdCGCVqCRpNDhxHLrdMijMKsxxYNG9pPEeegyfr0LoHnac
	Jc/Fczrf0UjbVDTOYwt8ytPnawyzHL/B93FN1O5A8HKIvBr0VLs/81VSLHVPPeez/UeC
	/cwfuI3y5f6f8GiuAdYEUEC7UHM9b4+O+YIcD743VlosHry9l12k8eoCBy4+/16u/OcP
	CmMg==
X-Gm-Message-State: APjAAAUztaGX/t3K2ECvk0pqxiNfngy0Ru7fAGGwj9wpW3jc5+DAFAKZ
	D15RfrlL49h0haO2PVenfRRwJbjFrQwHAwvgbPM=
X-Google-Smtp-Source: APXvYqyGcjBu4bCnfi2KDJ23+qmjnNBw6NG+Z4pShURtuSC+jYet6ZIZ9u4OIagOulWJSElBWC6aTojW8F3cXDrWhyw=
X-Received: by 2002:a1c:7ed2:: with SMTP id
	z201mr15850740wmc.113.1558703966083; 
	Fri, 24 May 2019 06:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
In-Reply-To: <CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 24 May 2019 15:19:13 +0200
Message-ID: <CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Fri, 24 May 2019 13:19:26 -0000
Content-Type: multipart/alternative; boundary="000000000000355eea0589a20c8c"

--000000000000355eea0589a20c8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wouldn't that break the alsa-utils-scripts? Since ALSA_UTILS_PKGS is being
depended by both alsa-utils and alsa-utils-scripts.

I did that in V1, but as Richard Purdie pointed out, it will break the
alsa-utils-scripts build.

//Ming Liu

Burton, Ross <ross.burton@intel.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:42=E5=AF=AB=E9=81=93=EF=BC=9A

> On Fri, 24 May 2019 at 07:38, <liu.ming50@gmail.com> wrote:
> > -SUMMARY_alsa-utils-alsabat      =3D "Command-line sound tester for ALS=
A
> sound card driver"
> > +SUMMARY_${MLPREFIX}alsa-utils-alsabat      =3D "Command-line sound tes=
ter
> for ALSA sound card driver"
>
> Why not replace alsa-utils-alsabat with ${PN}-alsabat?
>
> Ross
>

--000000000000355eea0589a20c8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wouldn&#39;t that break the=C2=A0alsa-utils-scripts? Since=
 ALSA_UTILS_PKGS is being depended by both=C2=A0alsa-utils and=C2=A0alsa-ut=
ils-scripts.<div><br></div><div>I did that in V1, but as Richard Purdie poi=
nted out, it will break the alsa-utils-scripts build.</div><div><br></div><=
div>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt; =E6=96=BC 2019=E5=B9=B45=E6=9C=8824=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:42=E5=AF=AB=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 24 May 201=
9 at 07:38, &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">l=
iu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; -SUMMARY_alsa-utils-alsabat=C2=A0 =C2=A0 =C2=A0 =3D &quot;Command-line=
 sound tester for ALSA sound card driver&quot;<br>
&gt; +SUMMARY_${MLPREFIX}alsa-utils-alsabat=C2=A0 =C2=A0 =C2=A0 =3D &quot;C=
ommand-line sound tester for ALSA sound card driver&quot;<br>
<br>
Why not replace alsa-utils-alsabat with ${PN}-alsabat?<br>
<br>
Ross<br>
</blockquote></div>

--000000000000355eea0589a20c8c--
