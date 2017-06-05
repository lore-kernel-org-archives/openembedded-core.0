Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2DD77F38
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:30:50 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c10so31098818qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pzmm111lGudXlsNXCfY1f21Vih8GiTZ8alZOyx2tMGc=;
	b=ReKp1aOWEmCEaJDjsR7JFmcN9/BNmmZyGyhvxRZ4+c9mhS2AekMkNaLICvzCA1rcW/
	T5Z6yipg2pHeiDBUk6dqlV3UIQZabWBnKb2X4WPxHkFwDmBPdYrNd2Rac8kJkuFtMQYi
	xf67hfHBv9+ciOK5pP2a5kYQqImrDzDM26yO2/9jUZOPZKEl5up5xemUvHK77xM7uIx2
	rIHJPLArsXeG6ir89Riv4OI8orIgE4Q7Vz6exj9axG4/Vf76R924qsvJDBeNMcJx/jF+
	BhkqiaCxV2r5Jp8+T9qY/ZMCAT4ls5S1ht9+ffUkIX5e2zMYoihsrICCJoKQ25k/hxUQ
	efzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pzmm111lGudXlsNXCfY1f21Vih8GiTZ8alZOyx2tMGc=;
	b=gOesnTjKVgjmBbN2QSsPvs5F0Hr+nivmj/HIj3XFvxHItxiPMb98b1mUBiWmRIvl5z
	F5wuFHjBcpHFl6+H0XDG8mEhK7+rziK6XHQoZQDoIXVH1c2Sux7jRxAYe7VGdAerrvbU
	6ac1S68nrJ6PfeP0xDOCFLaK9SyV2h8C+D2EYgt/rdMHKRy/JwauUGQSGSoVPuGhffm/
	Z/QMaM3O1gkw46WIcUsouoQT8cHllxWeF1fNjvm2r0yZsLV7eTPDDte1psKOBN6NqEMu
	jFsc421iyCViIdwDP3+l+DVX5g7R+ZxAs5tnseXRKEcrtbHdaHgxDTdOKKd8BIXsNNrC
	3LGw==
X-Gm-Message-State: AKS2vOztEdmEFvLnQ5zHQUGmvD5SLapN7V5hc07c97jSnnAj4tfzfguY
	J+qxUcvNSA7VFIFlYJ7oPUwW7+5Tiata
X-Received: by 10.200.58.38 with SMTP id w35mr2177996qte.93.1496669451239;
	Mon, 05 Jun 2017 06:30:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 06:30:30 -0700 (PDT)
In-Reply-To: <6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
	<6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 14:30:30 +0100
Message-ID: <CAJTo0LbvaQZk-+Xh_n2ejY_mUAt5gQdyvP7-xWCGZ8FC0Xcqyg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] libunwind: update to 1.2
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
X-List-Received-Date: Mon, 05 Jun 2017 13:30:50 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10cfcd1020551368202"

--94eb2c0ca10cfcd1020551368202
Content-Type: text/plain; charset="UTF-8"

On 1 June 2017 at 02:57, Randy MacLeod <randy.macleod@windriver.com> wrote:

> Are those machines not even built before master-next is becomes master?
>

Built, yes.  But only a variety of image builds and not world, so I suspect
this isn't actually enabled out of the box.

I wonder if that 1.2.1 is coming out shortly.

Ross

--94eb2c0ca10cfcd1020551368202
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 June 2017 at 02:57, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2x8=
" class=3D"a3s aXjCH m15c615f9f20b48eb">Are those machines not even built b=
efore master-next is becomes master?<br></div></blockquote></div><br>Built,=
 yes.=C2=A0 But only a variety of image builds and not world, so I suspect =
this isn&#39;t actually enabled out of the box.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">I wonder if that 1.2.1 is coming =
out shortly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--94eb2c0ca10cfcd1020551368202--
