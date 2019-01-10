Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1DC7C0A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 23:14:46 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b20so9488045lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 15:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HdyarXXIrzhj8YtaxMZt8db/QTCq6z73ANk10ohPD7k=;
	b=g0fB7vtnB15ZeW/cSCF6CtE0rg2zAWozKVrllLw14QOY/yukQCgRts3uJ7M/y2KePe
	6DrGtm82BzyjdExb9w9Ba1yxBLrSZIrA4u61vfsPVeNIJnQbrmHwJ0Qt5w/NwWFPoiPy
	nalPTcIJLjPSSYj2NoZh66oVX+PKvGIqTFmrrjCrMfzZgJnw5UgpvXuSCnvru8oxCKN/
	j7mQxl4Gdmy3daHLtnXZJuIKZCurbWBXM2xilzdsmHfIWn72L/JoEJqYm/E3b5fWLQ6o
	wjKoWYTkvDjJJ0tKpsQZZjE2PZea96i51WKdmCKTfB1DAMvgTRL50/eB+W3ohoYjqoU1
	FKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HdyarXXIrzhj8YtaxMZt8db/QTCq6z73ANk10ohPD7k=;
	b=WOnZIc09jrV0gBwqSQ8Gp7Iqltcb54rOuiUARuAuXI7KUA4gpaxOPs0Iq2XftHAzvJ
	/alyq1WwL41EimxkdiOVq1SFukzCuNMgnzxx8s5Zvv99zJy80Gg98KATJ8t1QXpziA+R
	TqAtR3A5HG4kYTJRS68cM/cuwfveZxRAmETAaujaPkIMJwc0PcY/YZbafef733IKjZO5
	zqUTdbuH/ImlQVTtD25Tf2XLqXBXFGkvwQe+PFywxfNRNX+QHjyqzIyiGXwbkWC49ekQ
	rgECMqo4MXfo7D7ycwZeBSNJb6Hpz2plmI7rV/JGKRzYO47/gA0AVgcWKLxcE0WBisUz
	U+Ww==
X-Gm-Message-State: AJcUukcLA1hyIQUN3QSzcLXjT88Hh17XSVRf+zVtmmSrdH2DOFw7bHHa
	SJr5TXfo5jG4ZotLASqdJYndsw9lsJ+ByjvOaR8=
X-Google-Smtp-Source: ALg8bN6zyuZ++mbTwqrOQV8H2AOKAH45IDFyx3oenrG0bJt4sHQNLzmxgR7TGrj/WlbYcii5WPpPdgZ+OqkLixRaRj8=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr7205224lfb.132.1547162086656; 
	Thu, 10 Jan 2019 15:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
	<CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
	<CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
	<CAJTo0LavX1oxCPyK=g84LiaBsveo=n2bMOndEHWFPBhHPBRJ6w@mail.gmail.com>
In-Reply-To: <CAJTo0LavX1oxCPyK=g84LiaBsveo=n2bMOndEHWFPBhHPBRJ6w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Jan 2019 15:14:20 -0800
Message-ID: <CAKmqyKMpV3Po2oknYimYn=u4+Cv=s9cLki+gn7_-wM1P_XynyA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 23:14:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 3:04 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 10 Jan 2019 at 22:09, Alistair Francis <alistair23@gmail.com> wro=
te:
>>
>> > Whilst the assertion that people will be using libinput with a display=
 is true, this turns on a debug mode (and promptly pulled gtk+3 into the de=
pendency tree).  Is this something that is universally useful?  I'm leaning=
 towards thinking it should remain as-is.
>>
>> I would argue that it is universally useful and that libinput is not
>> really useful without it.
>
>
> libinput isn't useful without a graphical debugging tool?  That seems qui=
te a stretch.

I meant that libinput isn't useful without the gui support.

I think that this is worth having the extra packages as libinput is
not really useful without gui support.

Alistair

>
> Ross

