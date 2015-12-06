Return-Path: <matt@madison.systems>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89611601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 18:22:48 +0000 (UTC)
Received: by lbpu9 with SMTP id u9so5944793lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JS/mQT1iaHAcY51gJ2QLBWhiyXTLn9Jd1/a8cZL6Rc0=;
	b=PL4mooNsBlss3BMIze8NcWq+ZAP/AibQou4qC62M9NAKAU/IKzTMvFIKbIi1T5dSoH
	XyaFEvWYQ7tWpZYvOh9NtdBldNo29SSC6JCp0sRIVLubIuolsNQdHsEoC04fU0zJLzZb
	ta/7pNYjmbYDeaZCIPObyoQFsYfnPIKFz6/r5ptSc+ujfb8MOBEIhaWAM81/4Q/Quh1Q
	rXNJubqB9xmQf8tdpDZbhCrwlINmPPAcelvNd/VODvWZhzKzr9MfJmeQ+B2eZwiq3ae/
	7Or7x5BjMx+A2777Jb9BpQ71uyPMwO2aPgbT/kdyS4U8lXSapIcj9Y+xLGd5dtUvaFhe
	nCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JS/mQT1iaHAcY51gJ2QLBWhiyXTLn9Jd1/a8cZL6Rc0=;
	b=BLWzStJyoVNfsnGmHO6aHyQLIpo4VmNWZ7kznqtwpq0Shao0/RjL6Pc6lCZUZ39Q1L
	ueTGG8UgjyT6BLsJ5Hnc2ER2mXApKSf3SVdLvc39+I8ZHJwoR+f1rR6Ygeok2KpLFfZl
	TaI09qFCLpeg0bqr1QlixcSW/EhZGaOYIKmSaGZa9bYmTCGfju4fI/pInz/gPMjJjZ4X
	4IWXLvseUqHeDaSx9S+aA9cdpcughTBBViYJSh0l1Z/p9IPWOTMT53lKZ2FYC+pUWErQ
	OZGn4B2S0zm+EpvgnJw4pvgiQwdwLK7nlUxMijg45+nZV4Ul4ILaxpW+/G6HazeyDd/S
	9wxg==
X-Gm-Message-State: ALoCoQnO7eueng/ggIBcdaaIvdUjhB1jTZ5+UN1JcMfcn12pui2NhiIQmqv5mq1+CzFcZvEPsPHX
MIME-Version: 1.0
X-Received: by 10.112.123.208 with SMTP id mc16mr11918656lbb.107.1449426168275;
	Sun, 06 Dec 2015 10:22:48 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Sun, 6 Dec 2015 10:22:48 -0800 (PST)
In-Reply-To: <CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
	<CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
Date: Sun, 6 Dec 2015 10:22:48 -0800
Message-ID: <CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Sun, 06 Dec 2015 18:22:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 6, 2015 at 9:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> See:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112919.html
>
> I think it fixes the same issue.

Close, but not quite, I think.  It doesn't look like it addresses the
ordering mismatch that occurs due to the -vfp include being processed
before the -neon include, resulting vfpv4 preceding neon in
ARMPKGSFX_FPU when both are enabled.

Thanks,
-Matt

>
> On Sun, Dec 6, 2015 at 6:09 PM, Matt Madison <matt@madison.systems> wrote:
>>
>> I was trying some multilib ARM builds and ran into an issue.  For
>> armv7ahf-neon-vfpv4, PACKAGE_EXTRA_ARCHS is coded as
>> "armv7ahf-vfp-neon-vfpv4",
>> but the ARMPKGSFX_FPU suffix was getting constructed as "-vfp-vfpv4-neon",
>> resulting
>> in 32-bit packages not getting found due to the name mismatch.
>>
>> The following patch fixes this by changing ARMPKGSFX_FPU.  I'm not sure if
>> it
>> would be more correct to change the PACKAGE_EXTRA_ARCHS settings, but the
>> 'neon-vfpv4' more closely aligns to the tune names, so I took this route.
>>
>> Matt Madison (1):
>>   feature-arm-neon.inc, feature-arm-vfp.inc: fix vfpv4 suffix ordering
>>
>>  meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
>>  meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

