Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5967C719
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:43:41 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v62so7707128otb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wRtc4A5S83ISP0h3mUpSBfU6PsLsHh8TbIA0BKuw8mU=;
	b=RP3gRHn36g5FWnrmM8AVyewXaKe/AaOQMt1kHBINnMa6SMHxMK4aYnMg1Tm0pzmEm5
	L6axa15BJSa69l5KY/Dk0RWqwfVpfB4bjTH1kLuIPvKarOGiIIZSxB27J11u3bsynACN
	vkEGT7ZjUGHZSU0kutt+0qBMVk+WAKo4P/pzhsWPKxSwzYIomR2Y7RBH+tVV7iBT0uWN
	IqOuSmSB3cpSUmJCGAWKDTtacvcqMm485iB8joCuijXnyiVffq7SVOhIL/o8cNho2waM
	0LtgdjWcTPNKODsIhbFT+NNsIdT7HinolhIYQHSTBmeHatL2aTBlPcPTy8a1Nq3566S+
	k2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wRtc4A5S83ISP0h3mUpSBfU6PsLsHh8TbIA0BKuw8mU=;
	b=owWs01X0BgZ643mENgnLvXmYcMleEcV2tTzDhIJDH4+lqAxSOaW8xUqev5gXAPUJEM
	C4gXlPgAjXApkRbxajCI46DYuAGpv083ut5JBAACbof5XM7ULJbll1cf1WBIu+UHssOg
	0ZGTtsEXMwnEKI07HHzRxSPLzOPflZH+EhJs+7SoxnnfYoBtT0wv34P4Hwzl91KLef1L
	X0Dk7rMG7B6S8+KAK/cKUgBZnZGxRfIDA17RTLa8VZ56mlI0ob7xCMYP1cEV3wSWl+LT
	/l5USbEZfEZRMellJUefMHTC3edGCJtxzAJip0aNx9eqOv6VnhkImpTsQDwmoC7vKFzc
	whew==
X-Gm-Message-State: AHQUAuZ27us/T8JJx6D2rV9DBnojjkS+pNWsQprM7ZpkRJraQYBJ4TAe
	+PBsUkUdhvlOJlwHiDAF8Weyj/G+MnlVen7+roI=
X-Google-Smtp-Source: AHgI3IZFzZ7rSGdwLzNv7O2F/BKZ/eUpyGL4pgDH7gwfAsFteX7DKsYDgbaiiQlAj3D2hDyJyWhMprr/xNXUYzTAVDU=
X-Received: by 2002:aca:30c2:: with SMTP id w185mr5814259oiw.163.1550238222841;
	Fri, 15 Feb 2019 05:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
	<CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
In-Reply-To: <CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 14:43:31 +0100
Message-ID: <CANNYZj8-i-HQFyHoiHaJj9XW_pMSq2muP9g=vhkN9ukZXh-dBw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:43:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 14:29, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

>
> I am NOT against the switch. I am against in a single commit doing
> multiple changes at the same time.
>
> So AS MAINTAINER of the recipe, I nack this commit.

I have to point out that as the maintainer you are supposed to be
doing the maintenance work. So if you feel that strongly about the
issue, please take the patch, split it as you see fit, and send it,
within reasonable time.

I am not going to do it: this split, when done properly, would require
separate rounds of testing of the commits, and I've already spent more
time on it than I really want to.

Alex

