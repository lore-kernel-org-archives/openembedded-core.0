Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 336ED77BE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 12:48:48 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id u138so23201041wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DS8Lp+N4jTE0E7OGZBJQWeCoFlc6b7fwjUz0IHNDjaw=;
	b=ycKSFr8FoL6wDbbkt+lvLl0gG0sGsFfI9INHOGHSRHcDrqf0btTGZaN/M5DHfLMCYW
	xoIRaC5h3/qgAPX9NzPLoYUZlbtpRb9qBl0COs2PcHJJumA3DOxT2bZScMjKd/vAJwo5
	zZEJMzVcNuH8ux5NQFijWWQj2zGROyygqaRIR1g1n8o9NE5qjcvY2o5zkHWv/ct7uknf
	ajrIMcyzbJSiT/JDiadP+079jp3s6qVwZZzJY9F+JyArExYJbQDEb63sWJ9WXRRTKTYk
	I95uJQrp8WcvrmM2MYPI0Koi83U6NXPl0iecJMAqDoHKAy9vGRlgJltCjT02lYCz9pVW
	upKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DS8Lp+N4jTE0E7OGZBJQWeCoFlc6b7fwjUz0IHNDjaw=;
	b=tnqUF3E5wn87BJBFhLTFqcdNcqW7ZNYHkeK1nXkdWutM5lrZQjYj6H37i9ksTOMs+I
	jIXulpIzr0UcK6Y/Uu+Yvfg5oLte0uGnq0xTsEVP27fp60N1hYHdq56SS6MwwSYPPJF4
	EOsV8XkLEvvpfQF6dzA5MNrRH0Bjd4XPU9LHP/8knLmsV/sg/6tiFipECuM6jFwDVXae
	LwksuJpv613ieh/VykMKIAOWfrU+s/Od0c+cQ6ZYiOTwO6Wkq57XIe8ZhCQyKDFaGhBp
	1oZCybij3UjEpw2ZEuPtPhtnUrkoINNcFlq/pWF3k+wrIA+Q0y9n456FSZBPBYo6+BA2
	tKCg==
X-Gm-Message-State: AMCzsaWOuzu2p6D2DEbAY0UNjC1IxhS6zOmN0nfhVsDdO1waD+N3ao36
	Hbxv2lD+3ehFRVZ1TtfFHHwnENHy5Hwvi0waiSYAPA==
X-Google-Smtp-Source: AOwi7QCz4r76maXqpazmESueA0CIyWUZOGgtd7+aZmp8I8kkWGqDfAqYfm9sWKmJ03puJtxjoIoX5rcD3xY7HyxARzY=
X-Received: by 10.223.171.5 with SMTP id q5mr10412852wrc.48.1507553329781;
	Mon, 09 Oct 2017 05:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Mon, 9 Oct 2017 05:48:49 -0700 (PDT)
In-Reply-To: <CAJTo0LZ8OkfLxgCLZi9-d2vpXUtWFo6jROedC01zid7fx=FX3A@mail.gmail.com>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
	<CAJTo0LZ8OkfLxgCLZi9-d2vpXUtWFo6jROedC01zid7fx=FX3A@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 13:48:49 +0100
Message-ID: <CAPyrkgzum8JGfqsP2tu+7bjG8-J-UNBMgJPhLK08o7i0YXWHqw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix building on armv6
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
X-List-Received-Date: Mon, 09 Oct 2017 12:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 October 2017 at 13:21, Paul Barker <pbarker@toganlabs.com> wrote:
>>
>> This patch is backported from the upstream git repository to fix buildin=
g
>> libgcrypt on armv6 platforms such as raspberrypi.
>
>
> Is this fixed in 1.8.1?  We've a pending upgrade for that waiting for
> master, if so then this would be rocko-specific.
>
> Ross

Yes this change is in 1.8.1. I backported just the single patch as I
assume it's too late for a version bump in rocko now.

I still see rocko =3D=3D master in the git repository so I didn't include
a [rocko] tag.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

