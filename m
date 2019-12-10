Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id D31287FC5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:17:28 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r14so9270053qke.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5t0H140/nTDck9ntXr9/VsLfVeXWZpwnsgQf0ZMEdrk=;
	b=enWLu/bogqJ3CnYb3/qzTDZr3UI8vmu/OsP42NDajrEbIiK9yTp4mf0ZRUtlpVRHsL
	ryJFbzyVFhppmxGraokAoMvUVlzXxhptmEoS/kL7CD5i7a3HcLa55sZW8Wlser6dTVdi
	ERhA2sodoe6thWDBFVaFA5Dq4r4FOICA5AaTMr3P6e1/HzlKP6H2I4aAIwFunWtipBWp
	dQtLiVdaZz6JaELGcoEoEde8MwJvAdPBUnUBKHkjc5YmYH+8NkwsWjzkxNsfaoDhmbMn
	rdvXhl1RKuaouKZe2t24/A12PDSDLBdVy1W0rc4vr7aRu8qhOHXQYibK1NVOouY1JS7Y
	42XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5t0H140/nTDck9ntXr9/VsLfVeXWZpwnsgQf0ZMEdrk=;
	b=AqqSxbDerueZpU+775JTLAdIGg2GcvjDQEHtjI1POdOxvMWDYrnzWBJ+BFcpyEdaqS
	6b1kNLr5OmrbgeZgFz7s5Ax+Ji1y6p+3nAhuOo4CbYSuDP4rd2esaguLhwzncpIqLlFI
	dpkhlS23asVqAfqj6D+xe5OuwUExQp1OjOP6I4whtDxeOod+mGEj9wtC4vDMGKlnR/mY
	HEDf2tKP01/o83Za8EjNjWOXKF7sa9jMOfkejydQz5JrnSU5b1VSOG2+YHHycxvBzdKM
	hm0aFuZ0CbVZ23PA9gR8QUcV1H+CHifKg6h022eM/fU/GUnoJbroljS9xyi/t6Q+piuJ
	dl+g==
X-Gm-Message-State: APjAAAW3bctQlJ0mYK4frDErkpBmoiyDq027ZqsulEI951J5B3XJa8Rp
	2gW7Ig8R9uDolbRPrEKacBQytsU6vnBompsnCqU=
X-Google-Smtp-Source: APXvYqzLBgVa5L/qEP9hQiP0jUdgN1htxeJlB7vjdcmmByeYUEUd3Zatl4MmAuA5Aoc2OD4XnGZTgmVR20bMRX0mZAY=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr9705013qkh.9.1576005449336; 
	Tue, 10 Dec 2019 11:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<b33a0156-ac10-b53d-7d27-75fe07d9fa7b@intel.com>
In-Reply-To: <b33a0156-ac10-b53d-7d27-75fe07d9fa7b@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 11:17:02 -0800
Message-ID: <CAMKF1sq-VV9bdP+MqV5Wk4pM3PopbT_gGjnKFXU+NEHTgtmneg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Tue, 10 Dec 2019 19:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 5:44 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 03/12/2019 22:06, An=C3=ADbal Lim=C3=B3n wrote:
> > +inherit siteinfo python3native setuptools3
> >
> >   DEPENDS_append =3D " meson-native ninja-native"
>
> Considering setuptools3 inherits distutil3 which adds a load of tasks,
> shouldn't this just be a DEPENDS +=3D python3-setuptools3-native?
>

right, we dont need the tasks so class is unnecessary

> Ross

