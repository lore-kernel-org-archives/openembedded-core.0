Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id B478274197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 08:07:42 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so691738qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 01:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WPn76JEWA6lM0dOEKm+TiQ4fTYyCt+zG9Qh/mjmPgpA=;
	b=fgBZefgyyEB3m9aFcx4gpmlM6GAtjTmUBzqUU20PIWGjiYIXp2T3mYTvQi4pyYYn6J
	Bx12JKPWtYzqxaRFaSd/2NhpgmZs1fHrExrnfwmLntVBF8QRlfLFgc9o+ND4BXzjGb3O
	nwMcFZClUzWQ3h1NsbvkcWQIjS3GvYOvNcc8ZHGaU9oTmVYLimguLStecUQKJtYuY2rm
	nTVAecoarWHX3bcHiWm8EINjXpJv9plPvI4EZat4e1p6yKjCM/jsZd9rrbvI9nEt9QPv
	UX+vbUyGizN/yTNvrgKdBHVrgFLoD7ht9VSw4LwH6wVdNNbY+12OX9iuM2c3UjjqTKtQ
	56pg==
X-Gm-Message-State: ALoCoQmtOi04Zgj+jyyuy4zcqsoBbHCobrUA2+IiWH8unLPZb1hC2qvz6tbFM6y8xmXXou/2vz2W
X-Received: by 10.55.214.70 with SMTP id t67mr41656394qki.61.1441786062464;
	Wed, 09 Sep 2015 01:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Wed, 9 Sep 2015 01:07:23 -0700 (PDT)
In-Reply-To: <92D7A469-14E6-4E5F-835E-C90FF3300346@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
	<c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
	<CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
	<92D7A469-14E6-4E5F-835E-C90FF3300346@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Sep 2015 10:07:23 +0200
Message-ID: <CAP71WjzWEfWq-7NL3Qu-HVCHFXCvrDK=H06qRcSkPZajO4ztUw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Wed, 09 Sep 2015 08:07:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> why are you adding a patch sent to freedreno mailing list (so I would
>> assume against xf86-video-freedreno), in the xf86-video-omap recipe,
>> is that a typo?
>
> thats where it was sent to. since thats the same list omap driver is using as well.
>
>

hmm. really? I can't find any info about that. how did you figure this out?

Note: I saw your patch on the freedreno ML, and actually the patch
also exists on the -freedreno driver as well... probably that file was
just copy/pasted.. in any case, from your email sent to freedreno it's
not obvious at all that you are targeting -omap driver. so if you can
confirm that -omap patches need to be sent on the freedreno list, then
at least you might want to resend with [omap] in subject to avoid
confusion..  I will test/submit the same patch for -freedreno on my
side.

