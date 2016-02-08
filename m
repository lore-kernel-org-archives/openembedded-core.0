Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 19DE973CF7;
	Mon,  8 Feb 2016 04:24:28 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id y9so105907639qgd.3;
	Sun, 07 Feb 2016 20:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ey7Kz8YDQSzOZIYdrTHvbb82ajcEX4zhlXDZQe6/S1g=;
	b=ScYI+H2ItmwF5oFz6oH9Sy/vDc6KpTLe+RbOZuBhwy74KEMAvg28qz3DT+MEGkVgqc
	fAf3XNSOEqNRMSI4G37cYpFWonrJaLul4bafBBNF3GC6sdb0XgAkAaN2n5Y6JsHFdyQ6
	ymftAUTBo93WJIlgXpMGkjk7v5TFOuFRhrpHgQG3fiYxDr99/IxsgTAkfta3Zif7Ejhw
	CUOo0wYKU+1ilDO6zZg3QK5IyXfOkvLXo6XBsB55YgMbhKsYCbquOnOgExEhFzvSKFnn
	02Q5enPq0NCzPtO7QEKpXGExoRCF3zRmeQn+/T0BBrmSn8doZSQpa8d4FsBQGM5jvG8I
	Gsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ey7Kz8YDQSzOZIYdrTHvbb82ajcEX4zhlXDZQe6/S1g=;
	b=bCR0aQ5s3UsSvl2HWSHvUdCEf2t8C9dfLdAefEMJV/p4KfzcxNz9IrslF6/4lh/ApK
	gdbVyLTb2Jv29oWJUIm/uEjXweFuT1vhTWB5LMJGMCBI8Zx8QSecTtSiK8sY9K2U/pUX
	rUq1NIVTj5ucLhsDDqz0z9VTN04KRnKSLzkxyGUKtpF25eBhaoo8IEhLjNI1YgcIBTHR
	gI2nVIUkfytM7Xy9XubuqXTH3kHR4JNFnFX4GlkliaFhDUzuxfLCPd2A1MUuaJE0SCCA
	/sy2T9IfG1rjX/dmPoNA+/kgYQUKBBbEI+zlHsCBq5gjj67SIAQWmGf+s80fEMBIcWRY
	3i3Q==
X-Gm-Message-State: AG10YOThzqUfpgNHIBKOgGHdhl31c0QSzRabE+Om8Kk2NvOzgj8Ds3vEAWzmn1tsE2+YQULCjcPKc8ihDOPTOw==
X-Received: by 10.140.238.8 with SMTP id j8mr30037840qhc.76.1454905469081;
	Sun, 07 Feb 2016 20:24:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 7 Feb 2016 20:23:59 -0800 (PST)
In-Reply-To: <1454885003.27087.344.camel@linuxfoundation.org>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
	<1454885003.27087.344.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Feb 2016 20:23:59 -0800
Message-ID: <CAMKF1sp+AHfBt68dFWEGwUFb+r88RgrhLZzC+a5E7DO-sY=xTg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Armin Kuster <akuster@mvista.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Stable branch rules [Was: Re: [PATCH][jethro] glibc-locale: fix QA warning]
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
X-List-Received-Date: Mon, 08 Feb 2016 04:24:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 7, 2016 at 2:43 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-01-31 at 11:55 -0800, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd
>> -in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is the
>> same as the user running bitbake. This may be due to host
>> contamination [host-user-contaminated]
>>
>> fix type
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Enough is enough.
>
> I cannot tell whether these patches are in master or not or whether
> master needs them or not. Master needs this one, its not in master, its
> only being proposed for jethro. Its a mess.


We should always check fix into master or ensure that master does not
exhibit same problem
If master needs fix then it should flow into stable branches via master.
In cases where master does not show the problem or has the isssue
fixed due to some other indirect
change which is too intrusive for stable branches, a patch for stable
only should be proposed.

In some cases we may offer to defer, master fixes if we are certain
that another pending chnages e.g. recipe upgrades can fix it
for master, I would still recommend that we propose it for master
still and recipe upgrade accounts for it later by removing this
change. At least we will have a cherry-pick chance to newer stable branches.

>
> I am therefore not taking any more stable branch patches at all until
> we amend the stable branch rules to state that pull requests and
> patches clearly state which branches need a fix, or clearly state why
> they don't.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture

