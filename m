Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id F224C72EA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 11:02:45 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id q11-v6so2159825oic.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RTd/zJVpTGoHIKgR3cFaIrwTgSoUp5Hj72LnBixmZP0=;
	b=OATkR6Mjpl0d5LxucnBYd0Rwb5tj41yOwqojh1fTFDc+AT+UFUY3/X3EkQyrNYzRSa
	92lCqxs1pmmf2ElYcSiR4leGKYpwBDMhjGPA41x5e3XIA/PKaKrZcKiYgYWNJUNikB6P
	U6ESh2CWGS+L+A6pAJTCAqzmlBTZfBSptxYDmsbbSTim2hPZarYCZHvYrPRbrwwk1LSb
	KdvxmP4vOUOTkhNIOzxKuwyxTTbbaBIQJZpPcb8GXIgdNVIK9i+IC0kqVg+w93g1OtjK
	1xo3HV8RqVoZiZMn3QTZp4KY7oQzK1U5yYRrF7ZBEKSXf5B9bJyDgVF5cZrwvbfKtNkB
	STZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RTd/zJVpTGoHIKgR3cFaIrwTgSoUp5Hj72LnBixmZP0=;
	b=t4bI7HxvHsefV2iRYmKvurbeCh+eD/eTo8BR5aMm61vdXEQCGf0MirMDuFLEAi3AcX
	otd8VLYyJwemig/t2lNkDt5v2OrlIl0QVme573NNXj5PyXm1+21RorxBnIm8r7kAfy2D
	1A1Zmzryrg4g+VBsDSQU8Xn4KLTREZRoggUY9SYuXRr2t6cTisbuXAfpe4jK2HVXn6Nz
	N+aMKDElu3T611oOCcsdps8YKFdBvDjRBeMiC9Yq11bwG0+UWki6hYxc01cWDF+0D0MD
	QghSxOq9k5hp1wdaOy8m7LZGsHxX5QdAJaBDcV6rOfm+NClfNvCssznbWDGsFQcuujZq
	5VYQ==
X-Gm-Message-State: AOUpUlFYpnDSrU97ufwBfBJy/G83U03SJDZcvA++Wlqg/Qr6oxAe+bPF
	amagqbEyrXtpLTu5XkhbfUPRlMy2X0Cnlh8XxZ0=
X-Google-Smtp-Source: AAOMgpfZxeAYDMMrOqw3Z9EUJg8JCBJkhQVP9doYgcsIGPjjxQD8YjhaivmYeCMnKmODssk6KGuRdt84sXKK7A1h8ag=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr1576799oih.38.1532602966969; 
	Thu, 26 Jul 2018 04:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 04:02:46
	-0700 (PDT)
In-Reply-To: <de82bfbc618d5bd3414f0c6942779bab2a866524.camel@linuxfoundation.org>
References: <20180725164107.8891-1-kai.kang@windriver.com>
	<30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
	<0ca7463e-1966-0956-f21d-d23058a7a4ff@windriver.com>
	<de82bfbc618d5bd3414f0c6942779bab2a866524.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jul 2018 13:02:46 +0200
Message-ID: <CANNYZj_mvE_aezb7jfzHps3Q0cXw6dxqxX1-LZT3X0u2CYYdUQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Thu, 26 Jul 2018 11:02:46 -0000
Content-Type: text/plain; charset="UTF-8"

2018-07-26 11:07 GMT+02:00  <richard.purdie@linuxfoundation.org>:
> Requiring that all variants of openssl build in order to build ca-
> certificates will have huge build time impact as it will need to build
> both multilib toolchains.
>
> At that point we'd probably be better either building allarch recipes
> twice (which I don't like), or, banning non-allarch dependencies from
> allarch recipes. If a recipe needs a non-allarch dependency we'd make
> it non-allarch. We may just have to accept the latter...

Another issue is that whatever solution ends up being merged it needs
to be understandable by a human. I remember I ripped out a large chunk
multilib-related renaming of packages (probably dealing with the same
issue) when transitioning from rpm5 to rpm4, and the reason was,
essentially, that I was not able to understand what the code is doing
and why.

Alex

