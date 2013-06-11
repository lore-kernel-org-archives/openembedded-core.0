Return-Path: <ross.burton@intel.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6E16A6AA0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:55:22 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj3so4465895pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lAgVAGtGk923t8/oTC3vUQKyo+hiYYQGzSgaWUMFssE=;
	b=fjVL7jKcCTjmjWt/i3Qnz4FbGAl4NZ6kUPDj/0NVvzHu5dM524xwyAblx3++N3Mpu4
	xrXD/KQaNtm3QlzzwPRGXBGIYigT3agHsYldR122YhtsJpsBsM0NOyagvNQJH/KZe3cF
	LVyyJ/crxGbsl0h3BGGyp2cVgBNzWdAvOuyyYeBCfdZU/E8JHk/INQAtnueay6knAvyt
	lCDBA/ZHXaoS0G+lkQ91yq2rohPV9Dppvv+Izgj/HjqZe0idMo3DwF4Lc6GY3aubyPbf
	lV9pL33+qgn4GsQvSdZfsy2NNIchGoI90/zlJ2tNXKCr4DOvfGwkgMkU0rgToFV+wkvA
	PY/Q==
X-Received: by 10.68.28.232 with SMTP id e8mr12643228pbh.94.1370966123844;
	Tue, 11 Jun 2013 08:55:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Tue, 11 Jun 2013 08:55:03 -0700 (PDT)
In-Reply-To: <1370965423.27750.86.camel@phil-desktop.brightsign>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
	<1370963003.27750.80.camel@phil-desktop.brightsign>
	<CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
	<1370964404.27750.83.camel@phil-desktop.brightsign>
	<CAMKF1sp=uG4hOUrEgXjcni+e0e3+vXPwOqG9BExXigZBh0uRZA@mail.gmail.com>
	<1370965423.27750.86.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2013 16:55:03 +0100
Message-ID: <CAJTo0Lar_K_5xRmcE7Zi0zZBd-44=uHLmaJJomfL-tHA3LMqxA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmts3SqCgHitxjRowx0IeVYv6xADMhFHN/KkZqS5P7KK1qJ6HvFadUkJ2Zm8eZyCjivqWlV
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 15:55:22 -0000
Content-Type: text/plain; charset=UTF-8

On 11 June 2013 16:43, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-06-11 at 08:40 -0700, Khem Raj wrote:
>> yeah now I see the code build is going to build RRECOMMENDS automatically hmm.
>> Do BAD_RECOMMENDATIONS work with rpm ?
>
> I think you mean "with smart", and as far as I know the answer is no.

Only rootfs_ipkg respects BAD_RECOMMENDATIONS:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3916 <-- bug for rpm
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4120 <-- bug for dpkg

Ross

