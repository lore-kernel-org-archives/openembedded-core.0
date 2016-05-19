Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B2B976057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 15:32:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n129so236319042wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CA43fUkvthPJp82LtRgmZ+mUUOoZoQGOwp5HhoikJ/w=;
	b=exE0whEIDHVvmPxur3rMTbGzr/NhfcPmULxHd5I9FfdNWHr4YmyiXz7EQ4yFWaOvGt
	I6jqOd9CgcU5lseeY2U7eIlwaemKSImFacXx79jwRTWSPDyIOzDP/WeNTLmSgkPRQY7A
	MwKyS5Gdhr1ykipBBPENuDUEAy1hXmBxyhrW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CA43fUkvthPJp82LtRgmZ+mUUOoZoQGOwp5HhoikJ/w=;
	b=WDtOhTzKkS/aqGMG7UY2rtNv55a50TMf+7WEHi9n3/7BAekdzUV8xZjp5w5EaAKOmx
	2t0JDucNq3hVWpG6kaIN7599IZ96LzekTVqO1BydUwO5RXAkQhvCoa7sr4QaPNso16yM
	116cI6GTu0XqHUDTiTKnRFy41CVms7FC4ctdvjIrLgJHfCupZ6qBai7Q3hNSku0RlaEc
	TQeBg3pyxYmdsvRqAeH2aDQ8i5y9FK1noosNj6lNSnP+prC+RhLLujYedQii1vAsrn+U
	iCWK6xmIeg3KTdSbKhbp+XgAWe65i/hzVpd8aMdNB0Nnbz8jDVvRs8aakfpnSxu4SEnx
	2ttg==
X-Gm-Message-State: AOPr4FUcsAcUXB0yxiXkTKiM7JfOMOJKLRiOlKGbRw/6TTNngHErOj4rMLawUwQNZPAvh4SMe1Nwl44B73FL3GAn
X-Received: by 10.194.114.228 with SMTP id jj4mr14246489wjb.121.1463671942548; 
	Thu, 19 May 2016 08:32:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.2.2 with HTTP; Thu, 19 May 2016 08:32:02 -0700 (PDT)
In-Reply-To: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 19 May 2016 17:32:02 +0200
Message-ID: <CAP71WjzOUk7fOVkBf2MCZizSW3mSYivYrNsa3XBkqhBCGX4ZWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Thu, 19 May 2016 15:32:23 -0000
Content-Type: text/plain; charset=UTF-8

hi there,

On Mon, May 2, 2016 at 5:56 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Upstream in 5.33 btmgmt was moved from experimental to common READLINE section,
> in commit e4f0c5582f1fe3451d5588243adba9de1ed68b80, but this was never updated
> in the recipe.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

ping.

i haven't seen any feedback on this one, and I don't see it in -next..

thanks!

