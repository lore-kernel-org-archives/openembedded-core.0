Return-Path: <yamane07ynct@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 368DA7F8E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 10:33:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i11so1413827ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rif3oVWN0RVj/3zqpjwUVTt1M4M4J8TFV1PR3WxaqlI=;
	b=XZNs0kw8S8fum1HVXMYSLuUiXXcuXMkKnzdHIwwSef9FXF1ArL6DO5099qNANuZJLu
	FcOv7p7NY+xvDzAB9evoFo/Rs4KIoTuM6ZCsuZwMdXSH8Rxavk7YOwtsdvrkbUH2X2+C
	Vzd1Q5vWYRmWshZkh6LZrr6QJlFcK4fbDal+m0OEavfix1UtvmIHFJL+P3h4OfQ6UqRk
	DrmuaV2QGawhz5XHvw8sUSeCU0ByGPiMSa1XjkPNacZZ9HmUB3hFQFxK2Eb7SAoFcR3X
	6ExafomjTZCSQs+9EyPADltKifC4wMkHi4EUh8WDnsunPObzuYB6zQ4lFUyDKCI5ipZN
	q/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rif3oVWN0RVj/3zqpjwUVTt1M4M4J8TFV1PR3WxaqlI=;
	b=V+FrOWCbRdGSqrh+Ua/BCpTX/HWzE8uFJtkxsBnnUF1kefSHisSAIbGFCoSZ8uo8FP
	wSWum+knziFcPGq++uuvY5tN492F6KP2GvcN/pp+uZb7KyJrfiQLi/mzvHbEdDoo+ZNY
	18Ka4xBlwE10C8VOYlgW+/qpORF8XNIKnvMfa4AgPtBaboEVAIkiW7q6Xi05CkeA8Iyn
	03sG+50I+P4yVlYM9c/+MDlixWCAgKKVbowu6eEqrgLxGNTAdNQJR16jA41lehSMkwZ+
	mnPHiZYa3gTocrk2NbViUxyaPbKfMBsy/0Fzi7f6YLG1e9E7GUHVREUzCC+TVOIkxbCT
	OSOA==
X-Gm-Message-State: APjAAAVcUX8ZAwTnZKX+aDiXR0ec4g36dG36SRZEr688R7diXiqvNtiy
	D0APIzYD5XxY3InF+tlTNEhF8XLHTNEHOLd9ZEA=
X-Google-Smtp-Source: APXvYqzC0wz8rNTip27M1hjgZP8sDoUmrGd94JOZnXQKkYRDjQ0LmoEaK/lkgrVvFGmTmGq/0FZ8ILbroejerLpNv0Q=
X-Received: by 2002:a6b:8d43:: with SMTP id p64mr979453iod.215.1576665202747; 
	Wed, 18 Dec 2019 02:33:22 -0800 (PST)
MIME-Version: 1.0
References: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
	<CAO5Uq5Qh6qeb6-xeVF1L5rossans0zWVjGiBuwnS_Gb8mt_JUg@mail.gmail.com>
In-Reply-To: <CAO5Uq5Qh6qeb6-xeVF1L5rossans0zWVjGiBuwnS_Gb8mt_JUg@mail.gmail.com>
From: Daisuke Yamane <yamane07ynct@gmail.com>
Date: Wed, 18 Dec 2019 19:32:46 +0900
Message-ID: <CAHZ3=rqQDDsC+ezk7M-meRNQ3gmV=hA=kucWMP_47J_kgASSUw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] u-boot-fw-utils: Backport a patch for out-of-tree builds
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
X-List-Received-Date: Wed, 18 Dec 2019 10:33:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2019=E5=B9=B412=E6=9C=8818=E6=97=A5(=E6=B0=B4) 18:56 Alex Kiernan <alex.kie=
rnan@gmail.com>:
>
> On Wed, Dec 18, 2019 at 8:43 AM Daisuke Yamane <yamane07ynct@gmail.com> w=
rote:
> >
> > This patch fixs the following error when ${S} !=3D ${B}:
> > | cp: cannot create regular file 'tools/version.h': No such file or dir=
ectory
> >
> > Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
>
> I don't think backporting this makes sense as we'll only be dropping
> it in January when 2020.01 gets released. I'd just move to the -rc5
> tag which includes this upstream change and then apply your other out
> of tree fixes on top of it.
Right.
I'll resend patches after updating u-boot, so please discard my patch-set o=
f v3
as I only fixed header of backporting patch according to patch test.

