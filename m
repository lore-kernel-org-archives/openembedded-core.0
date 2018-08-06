Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3184374CB8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:53:51 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id m11-v6so21681604oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O3pJZEarQD8ejbogXz2lSKNS9OxZv6Ec7upKDqNGnes=;
	b=kgnrnDUsOfhVcvKI12m55tNghFBTo9Ah6Kd/1nEEmoaPK7FphOfpWEWsr9oplg8mFD
	1MjWcLdcoww7Pe6vrkt5h5vn/BIhPIsAabDNS0JO818KksELch87eCS4LCrv5Q06gPhY
	bRimYTugBGLcojlnTVkPBkmfOlOYmPVlOixthtg4dRxPvjPWOVvA6r2Uf/9wPWlPzRPH
	voZF6Yg/1mNAWg8y9xX3xtzOOVLnVmT4GnreV6I3dpiT3oZCz79olzOYTQJiPBUu+rSG
	rfBpgP4yxQRMKjVLpbjNl4PWWUAYe3zBngdiB/hrBKoyv2t61lEr+GGJY+VY6C6QlvKR
	ngVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O3pJZEarQD8ejbogXz2lSKNS9OxZv6Ec7upKDqNGnes=;
	b=bda2p1hXsILK73vW6UHnXH6cssquStLZlSpW21NQXTHrPmI5pw7UdiGUY5B96tZZwP
	reZ0tnPhxdErsGcTKFZgVfs9Qc3UWNff8DkFttNYNGHSMPkWPw/bXfilubIdcI9lbBMY
	yzF0PLYS80PE2i4h8TZRUwmt9YE0xxYScSF0h2E8BIYbOsHZ8wl5sXjdD9WoFIlgw97t
	mpokm6lmTmpqMVXQQMz9jF6BeOsJP2XDmjupb9wmp0my5SESw1mS1Pn38l8HquiDvtde
	HLG2VHUu5tjMgHsPFwaKLAyB0xdQOKi0Zb3xZL3m/wq2Wuu3ogyE3EwsRiAZ5Y7Rw4bd
	mt0w==
X-Gm-Message-State: AOUpUlFQZFptXaMXYtgDEh7ezkN8EDt72jUli8m9a12bxudSv4x8PUjI
	NnAhTYfPeJf8v/bjSu3xXa7/657IohNRL7PkGFm+oA==
X-Google-Smtp-Source: AA+uWPwJfKjoe99enwx0SDOymkn8H6ROJBkOSatBHt2CX0CIWIsdpV3jvUapAxeADfNJYPrtlvKAKWpWOGwGZv8o9P0=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr14525971oib.320.1533556432309; 
	Mon, 06 Aug 2018 04:53:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 04:53:31 -0700 (PDT)
In-Reply-To: <CAJO0J4iJube2+fJYJtLm7cvhonsL+h8PCttzAtvkbT09p87KjA@mail.gmail.com>
References: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
	<20180806113257.13841.9729@do.openembedded.org>
	<CAJO0J4iJube2+fJYJtLm7cvhonsL+h8PCttzAtvkbT09p87KjA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 12:53:31 +0100
Message-ID: <CAJTo0LbrWv62_ibiYhHuBMgui4RwPF7uxk8NeGzEftx2zVg1LA@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbbWV0YS1vZSx2Ml0gY29udGV4dC5weTogRG8gbm8uLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Mon, 06 Aug 2018 11:53:51 -0000
Content-Type: text/plain; charset="UTF-8"

If you have patches to the oe-core, the docs, and meta-poky, then they
need to go to the right lists so the maintainers can see them.
Specifically the documentation maintainer doesn't read oe-core.

Ross

On 6 August 2018 at 12:51, Paulo Neves <ptsneves@gmail.com> wrote:
> Can anybody help me sort out this changeset?
> As this was my second attempt at submitting my changes with errors on
> not using the correct mailing list I checked the patchtest-oe and I
> saw that I would need to split my series into 3 mailing lists
> [oe-core, doc, poky]. The splitting would need the commit to be broken
> and it would also lead to quite strange singular commit patches in the
> different mailing lists. For example the context code[oe-core] which
> invokes controllers in meta-yocto-bsp would not work. Are some of the
> changes I made forbidden?
>
> On Mon, Aug 6, 2018 at 1:32 PM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
>> == Series Details ==
>>
>> Series: "[meta-oe,v2] context.py: Do no..." and 3 more
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/13399/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Patch            [meta-oe,v2,1/4] context.py: Do not mask exceptions needlessly.
>>  Issue             Series sent to the wrong mailing list [test_target_mailing_list]
>>   Suggested fix    Check the project's README (meta-oe,v2,1/4) and send the patch to the indicated list
>>
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>   Suggested fix    Rebase your series on top of targeted branch
>>   Targeted branch  master (currently at 1c4d9f46d5)
>>
>>
>>
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>> Otherwise we would appreciate you correcting the issues and submitting a new
>> version of the patchset if applicable. Please ensure you add/increment the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

