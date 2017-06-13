Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 912596FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:11:29 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id q97so152882840wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xGYVVPk/3n9L4PhSMvqyrlUKvioh5UwcqLl7AS5EVqs=;
	b=Ul9YBXyBhE25gwBFqOasmpa/d0s6XPnIRrGuLI/R9EMn+qqpPhCwPYpVdjtmQYDN5h
	5z2bCaY3kHQF7JwmD5gtUYGN4xWdXx9gR/0hVnhRsGjj1LyoALpdKuLQv6UkLa11Jwc2
	HWZRvUPyAd2j93o9H63woJ0lPz7e+cCUB4q4OuMasrXxSD0tENV9A/UCwUh3r5Gzg224
	rkLFlZHqOuQ/fsP1g71Y+yaRikjqZ3rnPyGVWtPPUBYeCtibRAbXdv8WtJgH9C2IzGuS
	8eavt2DNv2s/B7P0tmv93HuJ3AoHU9R426Z690pGti6YTHSXBR8qFOk4ytnPxZFKX9AP
	uu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xGYVVPk/3n9L4PhSMvqyrlUKvioh5UwcqLl7AS5EVqs=;
	b=KnJZRXPdLTRjaxtsmh2pt3EK1q1rKSYnbnd+a2Av/LWfI0liuhwOZU26haxCQm4rtj
	PSSYDhvVw/vXFdB14E+UQFSVlWlggcJHp807OtcjpERPJQ+3o/9ZFbjDS8SA2fi/hEyQ
	K5by0gqzgTFv4EXkXl/FkgfFHBuNCNBXNLA84tXaENEn4z3MVruiRuKiVGCMUd2dhTUG
	wPsIwbQGVhC030wo0CvnJ9iDSyDU9mSg9TPyzbBuWSl+t35ReajDiG9BQzagkWtRobwu
	jLvTqXWNTV3k6tVDWHUvdhrHTcHaxzUdtXy/G6KljZq8hfvEtdKZlSjyJfdUokNUb3MZ
	eIbg==
X-Gm-Message-State: AKS2vOxkYrZDJeD+PH2aYa9NxIwqsmn5dMGcNJLLxPICXkzv/XYLF/0H
	EUSUEXPZ6yPu23EkYylHfLBUbw+AFw==
X-Received: by 10.80.137.36 with SMTP id e33mr717516ede.67.1497373890376; Tue,
	13 Jun 2017 10:11:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 13 Jun 2017 10:10:59 -0700 (PDT)
In-Reply-To: <CAJTo0LbO4-dU4-=JTc2akzCQ_PqKzB7fTUtwPmA2-P+CaVyxEw@mail.gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
	<a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
	<CAJTo0LbO4-dU4-=JTc2akzCQ_PqKzB7fTUtwPmA2-P+CaVyxEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2017 10:10:59 -0700
Message-ID: <CAMKF1srN+hjKPreaiBHo8v-oJy_0ZgZ2FfzfM3DZU2z4ykNOVA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] ovmf: Update to latest
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
X-List-Received-Date: Tue, 13 Jun 2017 17:11:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 9:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 June 2017 at 15:59, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fix build with gcc7
>>
>> clang can not compile it therefore mark it gcc only recipe
>
>
> This doesn't apply to master, can you rebase?
>

ok.

> Ross

