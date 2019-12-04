Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 60B507F815
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 22:07:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z3so1090239wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 14:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=FZAKxB0HBNWtp2cFGHvYixqXDx68C04Bp+msNi2FsvI=;
	b=h0ENRROlGhrmp0vl0lj0jDFYAuI726lT+dGw+ffn6iFZltkH5ocYl2MZbmgMTh4BCu
	x8DsxTIJsAYTPNHhAA2/xpd67j+59BMyeZy/YtPbBZdkuKOgYUbaLgYBzZ8HAu4RI6lS
	rJeDtx06a0Uq1RxMRGP2dpZMwk9J22yVNFtlNQIr1EUNwMx7obbKRf3OsVty3ikprSFV
	jjL7cwif8P75fI3ddDk7FXyq1ethLMRFZATuXw4ZtOVQLGtq+24/sO6TobiKQKglfmza
	JJQ1Jr7trrJ9YSohQFRZlyzkHjBQKpEbjUQdY8FlZ+V9zUN9DuoLxJebtGZF46hEQKTZ
	Ipjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=FZAKxB0HBNWtp2cFGHvYixqXDx68C04Bp+msNi2FsvI=;
	b=ZK6yn32pTqt1CHsnLlxmvHs56pFKFwsRKV6zN7krHRMrwwPx7cvE1QWojpKBVMDUtG
	86ykX09ZrUVcn2ezx7HL1Y9H0p547OA0OdXcBp8VemT5VcmfdB8AOniTFMg4x5LmFCOo
	rpDLxNYBegv4S7z+tgqxYHrBfcZ0zTrsrJ/gYhmYzu2R1yM4ifLetPwkEguVEn4+spNJ
	ZaVudzDdcrwn5UOKT56kGdZIUP3Emo0gCPUWuq5C8rK6TF0GwtrqG1JyAZkHsDwGPhP6
	/R/9klVZKiZC2EDazXcGncLmpCYktJza2o3QH7LdHPqjlPQOnVDKPaCqFGsGqkbCrm9S
	D8ow==
X-Gm-Message-State: APjAAAXtMZqJLPHr1t2eAFslw4M6ywupeHBtDA/RBRCRIjBkQdcNVk0D
	JyibhAeywuIaWW7QTvpYRPc=
X-Google-Smtp-Source: APXvYqwF00KLS2iLuaOChFgCVJ00uqeNahVSntRcgeAK1aDuFAlC2mZF7UKdiAZ2MbaIGGkdTSoa/A==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr6247922wrv.250.1575497236908; 
	Wed, 04 Dec 2019 14:07:16 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:25b3:1485:4ba7:3624?
	([2a02:2450:1011:56f:25b3:1485:4ba7:3624])
	by smtp.gmail.com with ESMTPSA id
	w17sm10082909wrt.89.2019.12.04.14.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 14:07:16 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <CA+_Aqitgf4Q+p2C3n7t_GCo=zygsmC5zMEjJnCT3=QDs5Nq8wg@mail.gmail.com>
Date: Wed, 4 Dec 2019 23:07:15 +0100
Message-Id: <1CD180C7-0F85-4006-BFBC-9AF386C66F66@gmail.com>
References: <20191204184028.14813-1-anibal.limon@linaro.org>
	<CANNYZj8dQGgwgOCg_NohqU4H5eLwAK-aFowLa-ywFpf7-YU3ZQ@mail.gmail.com>
	<CA+_Aqitgf4Q+p2C3n7t_GCo=zygsmC5zMEjJnCT3=QDs5Nq8wg@mail.gmail.com>
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] meta/recipes-graphics/waffle: Add inherit setuptools
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
X-List-Received-Date: Wed, 04 Dec 2019 22:07:16 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-7419AF9E-1342-44C3-B871-43E18207BE56
Content-Transfer-Encoding: 7bit

--Apple-Mail-7419AF9E-1342-44C3-B871-43E18207BE56
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

But inheriting setuptools does bring in the target python as well, and it=E2=
=80=99s the target python that fixes the issue, not setuptools.

Alex

> On 4 Dec 2019, at 21.51, Anibal Limon <anibal.limon@linaro.org> wrote:
>=20
>=20
>=20
>> On Wed, 4 Dec 2019 at 13:15, Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>>> On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro=
.org> wrote:
>>=20
>>> -inherit meson features_check lib_package bash-completion
>>> +inherit meson setuptools3 features_check lib_package bash-completion
>>=20
>> I don't think you actually need setuptools3 here, just target python3 dep=
endency is enough.
>=20
> Actually doesn't need python3 it needs python3-native with setuptools, not=
 need to depend of python3 for the target.
>=20
> Anibal
> =20
>>=20
>> Alex

--Apple-Mail-7419AF9E-1342-44C3-B871-43E18207BE56
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">But inheriting setuptools does bring in the=
 target python as well, and it=E2=80=99s the target python that fixes the is=
sue, not setuptools.<br><br><div id=3D"AppleMailSignature" dir=3D"ltr">Alex<=
/div><div dir=3D"ltr"><br>On 4 Dec 2019, at 21.51, Anibal Limon &lt;<a href=3D=
"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote:<br><=
br></div><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, 4 Dec 2019 at 13:15, Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr">On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mai=
lto:anibal.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">-inherit meson features_check lib_package bash-completion=
<br>
+inherit meson setuptools3 features_check lib_package bash-completion<br></b=
lockquote><div><br></div><div>I don't think you actually need setuptools3 he=
re, just target python3 dependency is enough.</div></div></div></blockquote>=
<div><br></div><div>Actually doesn't&nbsp;need python3 it needs python3-nati=
ve with setuptools, not need to depend of&nbsp;python3&nbsp;for the target.<=
/div><div><br></div><div>Anibal</div><div>&nbsp;</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=
<br></div><div>Alex<br></div></div></div>
</blockquote></div></div>
</div></blockquote></body></html>=

--Apple-Mail-7419AF9E-1342-44C3-B871-43E18207BE56--
