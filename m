Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wj0-f176.google.com (mail-wj0-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 609B171AC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:37:55 +0000 (UTC)
Received: by mail-wj0-f176.google.com with SMTP id qp4so174123877wjc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ma2xATemaF5BUM3SDcrRunr4gmCQH7Em0W9PgPcXPDE=;
	b=vQVacZ3ta6c50rWMnCwWMeotmJYbVcUqdBc6CFqjl+Klk1KbM03vNeFUFGBX045//N
	mKg5NnGWMhGbgJfPqcuwlpwvTQSqjf6CPM8OKZd3pbhOusD58ZI8l9x+BexdZqviQiYJ
	kJi7caw/RglI6ErK0xvM9h1e2kYodDBX2rN0t4VXz8DKVXDlUwVYvKaCGybjH6CDxbEc
	11GpkMiw31EWMNDtyk0s9mNGeQzc/ev+dDWNesdVfmYmu7R1qqhcNbj56SQdnj60zgs/
	92F8RwCiLCj6MMFB10sKsUmJbFS9U54xALys1CLSPwA0Yrp2JxCe5UapM53cqBEJdN0a
	L+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ma2xATemaF5BUM3SDcrRunr4gmCQH7Em0W9PgPcXPDE=;
	b=YoSPQBh5YuQvhY6A9Ssp65eKV1VB+tdEh3ezdh7EHosTXSakSyz0H4VqjsX8vc/DWU
	ybGvlYQgqJ6ipAJ6yYnzgDqt0AYPUe0atWsCb9qakffZhG/7wNZMfF5O5BIjBAn8oFMp
	EnZ0WbuiiF0mUJP2KcIn3Ejfj2Y40F2ar2qt1Ivz38UOAUzH64OvP6mdA1i5R69FvV12
	x4CWKYzZr+ekwqVso5oE6IfsOWgOfZ7askq2DmKsBfdxpZvp0dWfZshhE3D3V9gk5fLa
	6OuehOXreETuOYi5N20Lv24npCDBGMalm9iA/fwnL14zzpWh4GXEsAjeGYVEd/4AJBa0
	aadw==
X-Gm-Message-State: AKaTC01SlzeFGPZa0wxyhWeN6VXtv0mSWXQgdiG8OSNn9VhwIgo3GBUS/gXdHxOzaDzJsIyEPqe5ZPdTymZzyQ==
X-Received: by 10.194.148.4 with SMTP id to4mr28186137wjb.194.1480513077095;
	Wed, 30 Nov 2016 05:37:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Wed, 30 Nov 2016 05:37:36 -0800 (PST)
In-Reply-To: <420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 30 Nov 2016 14:37:36 +0100
Message-ID: <CAD4b0_LBW6co3DXMbwh1NB8jUNOWm1o4vcy_S-OtxkMJ6kubFg@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Wed, 30 Nov 2016 13:37:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2016 at 2:30 PM, Kristian Amlie
<kristian.amlie@mender.io> wrote:
> On 28/11/16 12:18, Ed Bartosh wrote:
>> I'd appreciate if you also do the following before sending v2:
>>  - check that your code doesn't regress pylint checks
>
> Is there an official process here? Sorry, it's not very well documented.
>
> Just running pylint3 manually on the scripts/lib/wic folder gives
> identical results, however, running on rootfs.py alone, the rating
> increases:
>
>   Your code has been rated at 5.67/10 (previous run: 2.26/10, +3.41)
>
>>  - add test case for your code to meta/lib/oeqa/selftest/wic.py
>>  - check that your code doesn't break oe-selftest --coverage -r wic and
>>    doesn't regress test coverage
>
> In the interest of saving me some build time, am I correct in assuming
> that I need the "qemux86-64" MACHINE target for this to work? It appears
> to be dependent on syslinux which has COMPATIBLE_HOSTS set to non-arm
> only. Sorry, I'm a bit new to this framework.

You can either build for qemux86-64 or you can try patches from this series:
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129187.html

Basically, you should be interested in these:

  oe-selftest: enforce en_US.UTF-8 locale
  oeqa/utils/commands.py: allow use of binaries from native sysroot
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image

This is how you add a test:
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129192.html

Running tests is as simple as:

 oe-selftest -r wic.Wic.test_your_test  # runs single test
 oe-selftest -r wic.Wic                 # runs all wic tests

Regards,
-- 
Maciej Borzecki
RnDity

