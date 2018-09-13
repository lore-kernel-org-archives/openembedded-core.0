Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id B6CFB792BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 12:27:44 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id v44-v6so1032452ote.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zTfZPVFaEIm8X5g42//ecfFdLyuUSeL/KJkW3SEfGQ=;
	b=LhG+jOsoq0NQnTOMxjoHNLxvUVtJw3JKwa1hwjFETrFAXdglSl8WAKd084QmoawnsD
	6pdQ6QUyRwqqtyGu4+2Xii9Na/UoUoWUx1kq34sFBvVKju9trOZAEeZQPeJsP75a9Hjo
	EZXVkI6yTa+lD/sXKmaB6oWD9NgHXWRS3P7IVyMqEdQrSB+jaArR4oW2efjat5ryLALn
	aGgCBmRwDfS4QyAe/e6cnSAPV9I2U7I1IM6sj9xRYPUosAYJvXrXk/btQrTeWTu6Xu4/
	C5Yy69kiIjXOOd3umAbrP2XhzpVs3G6zNppu7XMSuraPokQL6PSEQJK5tpRZksrOCcTh
	NQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zTfZPVFaEIm8X5g42//ecfFdLyuUSeL/KJkW3SEfGQ=;
	b=Hiy7kwW3xr5Ihbxuv6HRMkQhEIMK1SpLU9qWKA0EVDMCAkG4ceEyV3zdMhiKGXdn6t
	EIb3SFcs02syD54YfLF/LZFyLZPuyrnhOjGY+MB5InNc8TYQwJPVQd2UjSfzwvkb0TiY
	Or8jeDjyyJvs0Cx95N5Hr6l/eeGCz0pMFgnWlguf4bLZlyVJvf2hLeeV3nR/iQzqGD24
	jKGYRZZJMbaUAcNWcPP3H/UHOnXBhUxez9bYeCx44Xw4ZyIMHHCqQmgMwVTuWbb23tiy
	nma/Owu9VQnGxb+QRzg8QgMoEpjPgR/BaJ/1g5msFf7S7uE0DEKB4IUp3mfoNCODDR2i
	Q7Ew==
X-Gm-Message-State: APzg51BsBykMvIRWAxQJewzA1BD6zv1CyfcHMQsuE29Wqxn1q8QkH22o
	+qgEPH6hu80BU7Cn0piYPBvjPH0k535IDvNxMWg=
X-Google-Smtp-Source: ANB0VdbNTczpahZxbqz24a+d4MdHFq6oJnxBjiMCVcJP6aO1dMb1Bv8oOKCRcQhbgx6kd7u1x+6HmufgVyGyxKc7IbA=
X-Received: by 2002:a9d:2811:: with SMTP id
	m17-v6mr988360otb.254.1536841665674; 
	Thu, 13 Sep 2018 05:27:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 05:27:45
	-0700 (PDT)
In-Reply-To: <CAJ86T=U96L46iLVd3mA7nsK8v=G9XcOj9tJivTGVcmVO1WaXZA@mail.gmail.com>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
	<0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
	<CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
	<CAJ86T=U96L46iLVd3mA7nsK8v=G9XcOj9tJivTGVcmVO1WaXZA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Sep 2018 14:27:45 +0200
Message-ID: <CANNYZj_++nm8Ag+5FhkjeFOcLx+qVgGSfmf0cNpCcurad3AsgQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Thu, 13 Sep 2018 12:27:45 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-13 3:13 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> It's deliberate that including openssl10 in an image will at least
> cause openssl 1.1 to built as the openssl10 libcrypto depends on
> openssl10-conf and that's now provided by the openssl-conf package
> from openssl 1.1
>
> So the expected outcome of adding openssh to a minimal image would be
> for the image to include libcrypto10 and libssl10 from openssl10 and
> openssl-conf from openssl 1.1. Is that what you see?
>
> (As a potential cleanup, we should perhaps remove openssl10-conf and
> have libcrypto10 RDEPEND directly on openssl-conf, to make it a little
> clearer that we expect to use the openssl 1.1 config for all versions
> of the openssl libs).

Good news everyone! Upstream openssh has finally gave into user
pressure, and added 1.1 support in the master branch. So the issue is
moot; we just need to wait for them to tag a release (no backports
please).
https://github.com/openssh/openssh-portable/commits/master

This will make oe-core entirely free of openssl10 dependencies.

Alex

