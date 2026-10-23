Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4998.1792755275529980363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=UBUag0+z;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tZrIdXjx;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 804F214000E9
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:34:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 Oct 2026 07:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792755274;
	 x=1792841674; bh=ryyWGe/q9XJVX59W0KP9COg/QkynYE36dr/tLUiVJ0A=; b=
	UBUag0+z8NeFbYRbruPqsizNnCRECF2kcLe+xXDTfQ/At3OoEggzE82hNQp0bDXE
	Ah1cnBIluBoB54FR8x+iYH9lPNbRGe4oVO6a159Z42MwSnOo6sl+sKlhieVlBxxI
	+7y1L5mJGFuXIfW2U/TWvSpZNPjRNo34pdYYaLUDB38iajtD73j7qspK8xI8tVEk
	f/wxhsnJ8tTTfrJEE1eljSZzafL3uO3sQ6Wj0SuitKYXPgS4gNd5tyFbltRxDX4D
	10SVrvIFC0zgmsQiHdZa7mGmJxd7qzlxsCbGC6MD8KC4i7vV6K4cb4h+nYnrokbc
	yN+aZr3tCEXj4DpOE2SoZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792755274; x=
	1792841674; bh=ryyWGe/q9XJVX59W0KP9COg/QkynYE36dr/tLUiVJ0A=; b=t
	ZrIdXjxAZbR8Sipz19faVuwNLTCmxZkWiqGrXd/OaK7PxFaPBCUWuc3465XUyok+
	CUF+07wvXOLtObgG0hr+Kz3Va58r0MPXK6utiQyCMsoQK6Yp1ZA05wq1e/30QrOS
	6T2yvSBj9LGuuyQwZQHvplGWhj+bWp5GikiNwxpnMrXkUbTodg4Ba+fI5udxJAlK
	WC0Ap3fSSJpIflc2zmEetAl9Y4CI+nuvqHbT6sTYNzwArJ6zKdqs4JQeNJi37a8V
	I++bo7Wm010e8f4i5RtQIim6wfzhk0mFtLRTV8tMIUtP6qvMng4Vln5vVeFTczQI
	DYe9tBRA7abAW5w2pnzWA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792755274; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:lW6pZ4QO3kEULESEP+gGubnaLxwg0KJOYUj+Op1nymlcsGn
	kvrM+KmYTh76n8TMnKwOHvHBu/ay8SfXTngWz0xx/+6GWVxX0zjZTWWl1qBwijLf
	aeNElbjTGoA1hbv0n8x2+d3ZS9JqGpg9B9OH7WU6Z5O7onSbKAA8wqCl/c6A6r2u
	+tMEQ8Wo6qBUd40Hr2gwn39z47CT/1628pUE4TKt0YLL3iky4mAQsiFBClgBfsQx
	lzhieJG/xFeTd6TCbH9rM7zZHm8nup8qfDGsZdbabFC+xRVSSW+x+RtNGOVVqC/j
	UqmChc0KN+sKboMrRIvV/4WrdzKPzPr7qeonhWg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:0tZndCh/hePvOMeB+8vGKsuUgTsUPPNCoQrf+EL9IdY=:ZqQUWpFPVgGR+Iiw7iZStaQBRbhHxlP4rf2P6gY42Z4=;
X-ME-Sender: <xms:SkbbanChvTG-Ut3tzqm1leydAZz5XGyKbsN8cDnqUuZA-jXTnKRqzQ>
    <xme:SkbbakgdN-MCUSrlNkUoo-XKuh8gclXZlueAocvXqgxvJz7BP8qAmPuo6WpqoaTyz
    SPU5yjPGv6SgpNwxGwhHP_KjzNfCLVaIasbt_CzW4xuIcC_KHMpqQ>
X-ME-Received: <xmr:Skbbank1EB_ecsyuK3-q-trs6MdIFHDnz2oQEIdPz7K7UmtEuHDVYCJGJoMBRT9_LvAeodLoYWRxSWtW6f027AOk1RfTyIpihrci2aXqAAlz>
X-ME-Proxy-Cause: dmFkZTEbA40eHjzIxOdHjxJWmmRNMemzLraivN0ronq4ky6tLKt0wkmsWAQeF+n9jXL0Da
    8CL9JDsy/fo5P9ac1ZC43TNs4mYOQ9ukiOVqIS9giDKQSlZgUvrq4EI2w6Z7NkugOjLFFF
    ylrpr4v0TaBIp/X+NSvVwsxIotVQpocQtF//o+etMQBztkXUtzrLaRlMJVaDoCk2Fkuwfd
    UJ84tQGCX4qW+O5tIABhUV69V1h0r2KJprpfsAffqOx+5JBADh9ArdwulzwCeqPwyQlOW8
    XVskM+oBnz4jZr+Z51zkHSAL8CwfJj4ulzTNZG6T5ezAfP4SdyhtcpptekLINS0RohCOrT
    n0KcsHFEGX4go/p1HqHi5mzFT2Up+x9dWaIlYdwtYAxmVMwyLsdZ1avag224beGbMxt1AE
    +fPXJcLHH1ned8VF+gSVhmU485x66HoqXlHRulD3WDz4ZPos3cSHL9R3KP82zsJ4b/Y9EY
    hzzGGipyIL66uhLB8Vo9jmWNge6cRLK6r8Us6A1u+N4nwvHSJhsDLQg90WQRWQi7lYC1VJ
    O6h1M6ihbEIF1nPcUNOdMSVct9/By2NhbRtTGgA+XZTaQik/9hBsH55bJ6hVDZz5mNronG
    QLQr+kY5hxVcbZMeNSuO6A/3fIIWJbtXsh38dNzbu0/Ua3mzMpYTiTokqwmQ
X-ME-Proxy: <xmx:SkbbaoqIndzwemlqX4xDlxyM8e1jnnnxaE3y0adak6jCbwTLioGD6Q>
    <xmx:SkbbaoFUOLBJGNV5ftD_sAM2IJVpjdnsb4WLbgf4Qz9sovZWuEnJDQ>
    <xmx:Skbbaswuarc6hi7jD90q5LIb0dHujyxw8ktSPQfQWUbvbC1pJ1JffQ>
    <xmx:SkbbalpIPBJ7edNdvY3IwOa91CqeGw9OXBS_JPf8jqirHIOaN2SHIg>
    <xmx:SkbbaimgrLsHoeHg1vuPckkaaDkRM7vFRdeqldC_Z_qiqaEthDcG6UDv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 07:34:33 -0400 (EDT)
Message-ID: <d35ce037b83bad3100142b3715e793b2f41d6474.camel@pbarker.dev>
Subject: Re: [PATCH 1/4] systemd: add ukify packageconfig
From: Paul Barker <paul@pbarker.dev>
To: Tan Siewert <tan.siewert@9elements.com>, 
	openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, Patrick Williams
	 <patrick@stwcx.xyz>
Date: Fri, 23 Oct 2026 12:34:32 +0100
In-Reply-To: <20261023-systemd-optimisations-v1-1-0cce103e54df@9elements.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
	 <20261023-systemd-optimisations-v1-1-0cce103e54df@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248548

On Fri, 2026-10-23 at 12:51 +0200, Tan Siewert wrote:
> systemd gates ukify via allowed(), so it is built and installed unless
> explicitly disabled.
>=20
> Add a packageconfig option that is enabled by default when the efi
> DISTRO_FEATURE is set. It can still be removed if wanted, which may be
> useful when using meta-tpm, which may include ukify implicitly.
>=20
> Signed-off-by: Tan Siewert <tan.siewert@9elements.com>

[snip]

> @@ -405,7 +407,7 @@ PACKAGE_BEFORE_PN +=3D "\
>      ${PN}-networkd \
>      ${PN}-rpm-macros \
>      ${PN}-udev-rules \
> -    ${PN}-ukify \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'ukify', '${PN}-ukify', '', d)=
} \

Does the package really need to be removed here? If it is empty then
do_package should not create it. If there are still files that would
otherwise end up in ${PN}-ukify then removing the package entry may
cause them to be silently included in a later package.

Best regards,

--=20
Paul Barker

