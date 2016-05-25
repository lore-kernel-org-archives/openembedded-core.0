Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 799346FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:05:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n129so172972858wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4e439gJqTwpokPKDCI46K7hg8PYwkXMW1yrq1pE8PPM=;
	b=CK9x8+OjzQXMIxspEb1EOB7WCeCQg4NCVCGaRn/jmGaplCkKySiEFKDJUhhiudljYl
	8luBM7yESRR2DqnEDGwAzOfPvpmeWHtMXgRqy+Us+ajX1WfoLuJWfOLPA7uoAjGkEOX/
	Xa2LWedOMYagp9c8sB+bMoLHHWQHZghsvE+7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4e439gJqTwpokPKDCI46K7hg8PYwkXMW1yrq1pE8PPM=;
	b=DCLYNvIGAHpa/kNU2RXBcTGoB3ykpFfBEkal5y4mk9A1Z6RU/Jm3Lh5LnTtYVdAyUJ
	D4T4O5x3GPtwOCsT5KAKp90gX/7hctlM2udAWLiNahb0uv6FPGcqd9WQ4AaxmxQSh9g5
	2w6yDTYpIOh3DPrSnJjS3Ndhw2chR1CyOZF1bquQ4cN2fiH/MuJpZt6A2WLHhc0k3YF6
	zg0eT/hU/TZdsnvBqQz4N2Zl8FpyQuP2t2inhTDlQwUmh29wRlBqwHiRn1O00zpbCVw3
	3YhE6i4EpiPOg56ytF9siBkdTJgwBl/a1JT7jKToBirrIa7q5jciBXeDUEtCZKgE2CJ2
	UKQg==
X-Gm-Message-State: ALyK8tIqY2Lni/lNH3Dexc4hohFkrmhxB8M16SHBrGWP/NMSD+YsWsjiZq7mIDR4EgOI5jd1YrhVfX+fXq0kOTxO
X-Received: by 10.28.139.137 with SMTP id n131mr2534018wmd.13.1464170757228;
	Wed, 25 May 2016 03:05:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.20.105 with HTTP; Wed, 25 May 2016 03:05:37 -0700 (PDT)
In-Reply-To: <CAJTo0Laf6FBjdTYL1sMBsOqO4vjT4G26eY-VWaP-7ACadLFCFw@mail.gmail.com>
References: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71WjzOUk7fOVkBf2MCZizSW3mSYivYrNsa3XBkqhBCGX4ZWg@mail.gmail.com>
	<CAJTo0Laf6FBjdTYL1sMBsOqO4vjT4G26eY-VWaP-7ACadLFCFw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 25 May 2016 12:05:37 +0200
Message-ID: <CAP71WjwwMDoKOG45tAxy+Fkh7euqO3dQ_ySOCp7VY=OhiSHh6w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 25 May 2016 10:05:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2016 at 5:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 May 2016 at 16:32, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> i haven't seen any feedback on this one, and I don't see it in -next..
>
>
> It's in mut and I should be sending a consolidated pull soon.

thanks, i see that it got merged now !

the same patch is needed on krogoth and jethro (and applies as-is in
both branches), should I send a separate patches or can it be picked
up?

