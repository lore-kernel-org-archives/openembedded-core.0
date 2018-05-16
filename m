Return-Path: <daniel.diaz@linaro.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9722274832
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 21:20:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t11-v6so4865644wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FkTAVc54M9KmAfufa2WVDAozGS7GBr9rgaJW2TUIeAw=;
	b=U55f3cfr28IOkkCkahnQm1WdwthPdsbj+SipW/8Klq3IZFEQt33H+ajsOsljMhPIDu
	m/yx3/smlm6haAwalizhw1XX1/2DcFFEOjUALwdIAiKiTBVIIEj/LOM557AfUxEjwAvj
	y+uN1Qd+huwvRxhZ5PmByKAsWcQnpLH3AGqy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FkTAVc54M9KmAfufa2WVDAozGS7GBr9rgaJW2TUIeAw=;
	b=XhwcYpuJ5yx8tb2TW8qN+XoBPLGAoUg0b4rrYLlGFUzQsBJl03LZd9ObpU1gNNSull
	vDIPnHRkLY7OxKpNwnQ0UYxIEnsr1x/mkkJPw9BgzFBmCHiBETEYAUjOP98xjV78mMu7
	CGxMAh0yCwBUs3rUSgi81dVTPXPWWlh+Qwz47xv1GCuNRzxI+z9Z1qHFgzHTcNsvPch/
	I5WL6EBTEzPNy+GnTMNWq7mKrP4XKMaVgirvhU9i4rWWjR9NMl2FMo84viQCM0FSABMM
	UpIw4VnbQrY2c6kySCZerdW/gnzlEp6u1Z/3c9/JC+FDgqohua+lz65+NC7v46zUBfac
	UF5Q==
X-Gm-Message-State: ALKqPwftl4GWrYeyZMayeeAghLyyKzVamzJM4onl3eTeYJGVqYYZB+0i
	XzsdegY4XqPIeMPqB4Di2rltF+zvVClqpgVl8IAK4g==
X-Google-Smtp-Source: AB8JxZqOuHOwAWjbLYU/O5Gr0H+XV4whS9LBfrugJBh5EsAyeRn+gr6+twG6fJbYo+uJOw80W5IV5g9xJIwInNl9t2s=
X-Received: by 2002:a2e:9c90:: with SMTP id
	x16-v6mr1457776lji.13.1526505606838; 
	Wed, 16 May 2018 14:20:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ea07:0:0:0:0:0 with HTTP; Wed, 16 May 2018 14:20:06
	-0700 (PDT)
In-Reply-To: <3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 16 May 2018 16:20:06 -0500
Message-ID: <CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Wed, 16 May 2018 21:20:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 April 2018 at 15:43, akuster808 <akuster808@gmail.com> wrote:
> On 04/06/2018 10:08 AM, Daniel D=C3=ADaz Rodr=C3=ADguez wrote:
>> Ping on this series for Morty.
> This needs to be ported to Pyro first. I do it this weekend and morty too=
.

Ping on this series for Morty.

--=20
ddiaz

