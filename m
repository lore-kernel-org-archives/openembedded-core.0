Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 043AE60191
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 11:12:48 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m83so1829598ioi.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wmujX0vL2NOtEv76OI7FcZxv0Rqe+AB9taPQqLmOxq8=;
	b=HPGRybeeZugxyXYFmMObFiu8aHuX4O3ylJekalRORK0/8jSDO3WUvaoyNRmGuKPvLW
	kz/W2/pz76rA/lsqPPJq8vtd+gbWIkNLk6F+t9X3sdXKpOILVveaEA7ebEHo0ZnjctwW
	Wa7TGYPKwuIj7hsnjeSlM/OBMpGarmjcxOOXeNHW/0QRuGOQH24xh6OfSp/znwWfzohA
	HOHqM7YhFr5RNdKW9pWWzeCDmVfpk50GmCN/5dL3Ly16tsiS5Ssim+AiwCbJRq1gIacD
	dCha+YEZPe1uISK/8GXiDsrfwsZUGYoe0AHyr0/ccjhctXycHbBavn1YEs7upPIn8Hk9
	SfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wmujX0vL2NOtEv76OI7FcZxv0Rqe+AB9taPQqLmOxq8=;
	b=UmA9m/wRfA9hnzYLmPrxRdn7oIXEAbw8SrxM2FSZIjiUSSpHcZWuVflGeYtpa4LEAH
	RR18RUi6kMlbjNH/FHibJ8LLgqWQrdo5CEmIbFPRqoHfcBx1OyVEYqCTGNnfIj/0WGX9
	oMg5yOVUJOY8KJ3bCCNFxhWCeOlxCt3+7AtVejdDX9O8EUTxEXgQ8SHfcHJueiea+foa
	qo1/NbomqfHb62QU6gytejwpfEorNGrXX+GPHtKvEhjA1tN51LE+Ow+/FrGALFmLr8PC
	u87vmMCd5WmYqgtFWr0Rus+S/eIXoI82pg8K8S1mTK6B4NJB1qk1C1GBRXd954ZS0fLo
	LJHw==
X-Gm-Message-State: AElRT7HRPYDl4HgdxArcyluVALrU3KPITpgll1Co67XHl93r1+ID6YFa
	Y0UsAklyxU6yuO90Ba1x33p4KlL9gjZM0xSAXvA9dg==
X-Google-Smtp-Source: AG47ELszU7/Ms93eDx8n4GyJP6XmO27jIeHIZUzbRhGpflC0aUzNWBTColpsEd8SyyB/AjMXHTVye9r1ovK/d1BRPts=
X-Received: by 10.107.161.200 with SMTP id k191mr14744026ioe.270.1521544369882;
	Tue, 20 Mar 2018 04:12:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 20 Mar 2018 04:12:28 -0700 (PDT)
In-Reply-To: <CA+chaQdVBZTfp+jSuCwYufQQz2izdt-Z3OoafdRvAUmrtuP=Lw@mail.gmail.com>
References: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
	<20180317112607.28536-1-Martin.Jansa@gmail.com>
	<CAJ86T=VWaJOesaUHM_k=x-+ip044=0SqFhMA4MfNExsz_VYeWw@mail.gmail.com>
	<CA+chaQdVBZTfp+jSuCwYufQQz2izdt-Z3OoafdRvAUmrtuP=Lw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Mar 2018 11:12:28 +0000
Message-ID: <CAJTo0LayEiw3bpXB7a-mKiGbi3uOJhFhYt=+4aV84dTSuVoJ3w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] iputils: add PACKAGECONFIG for libidn and disable it by default
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
X-List-Received-Date: Tue, 20 Mar 2018 11:12:49 -0000
Content-Type: multipart/alternative; boundary="001a113e9198ad62800567d627aa"

--001a113e9198ad62800567d627aa
Content-Type: text/plain; charset="UTF-8"

On 20 March 2018 at 10:19, Martin Jansa <martin.jansa@gmail.com> wrote:

> And v1 just got merged to master, I'll send v2 with change of the default
> if other agree.
>
> I don't have strong opinion, yes it might be broken, but it was enabled
> since the update to 20161105 and nobody was complaining and adding
> PACKAGECONFIG usually shouldn't change the options currently used (I've
> meant to disable it by default, just because Khem's request).
>

Argh, how did that happen.  Swore I marked v2 to merge :(

Sorry.  Please rebase and send v2.

Ross

--001a113e9198ad62800567d627aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 March 2018 at 10:19, Martin Jansa <span dir=3D"ltr">=
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">And v1 jus=
t got merged to master, I&#39;ll send v2 with change of the default if othe=
r agree.<div><br></div><div>I don&#39;t have strong opinion, yes it might b=
e broken, but it was enabled since the=C2=A0<span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">upda=
te to 20161105 and nobody was complaining and adding PACKAGECONFIG usually =
shouldn&#39;t change the options currently used (I&#39;ve meant to disable =
it by default, just because Khem&#39;s request).</span></div></div></blockq=
uote><div><br></div><div>Argh, how did that happen.=C2=A0 Swore I marked v2=
 to merge :(</div><div><br></div><div>Sorry.=C2=A0 Please rebase and send v=
2.</div><div><br></div><div>Ross</div></div></div></div>

--001a113e9198ad62800567d627aa--
