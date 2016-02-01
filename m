Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB45772A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 19:13:50 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l66so85167145wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mxUursH1E3Hr6iG9JL10QRTqsZAmye0GhcPMKrWFB5s=;
	b=v5QaETCxsD09jmAnNq27MSahImioVUsrtsVH9DOxKcsDLhxtTlf71HP/5116/OY4Hr
	fdGAtddCP0myj6dIBgRnWy5rcl2m8aC7WhvjTeZCIn97hqOP/leVyegA4NU2UR0NMu8Q
	nMtMZgu4e7NzUJTflfNHKFv4Z+mcpfiZchuomwE5MkcBse6dOw2bw3pA+Cp9fI2JzRYc
	7RTXmG3VCV0SfDoQW+N4cnNbbJuGMYlJQD8ufyS7/TQZcH+MYY/BIVIYtjmj9fdrK+s0
	vzcsr8WfqA1kQP9/ZI35/KG7EWzzRpDkRW5b0y5KmfBJHMbu6ZpAdThHqSfCUTpZN15p
	rz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=mxUursH1E3Hr6iG9JL10QRTqsZAmye0GhcPMKrWFB5s=;
	b=bwMBYEt0TxOkHhoYfv2oc35Ful1WRsJYKG1vPK1qDpYaWFMdj0kP1+03wP/Nr4y22o
	gFu0AM1ZEvG6lWlgmkX7SqcRY2ZIh/3iwEWpqy5+p5AcWnYHdMsYfiF8+xjo17l+QdLr
	0+XP55QWR1js4nUztrVlzcDdz/MlITgA7iwYjdaKPuLr1bA0s1RYBZxk+9gA+Z7LYVUy
	BLZuMVNoAxLMUypm7zj6Bq6xlH7VOjkwHm8wKtwxLuqp7n3+sIOsn3BqXTyAZ0vTMXtZ
	PcKHRxquQC2f279rF8bLuF7FASO1QDy82byk91wjQvyPRByva8e5RlliqUK/HNQ48DOJ
	5jLg==
X-Gm-Message-State: AG10YOSlvLzFK6d7siZdDkSUr3+1GoJf8L12CTIccwslzPD1g1j99JxqVFahdDjCUKhsBgN+bc5Hn+iFAbutSQ==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr24291952wjc.3.1454354030739;
	Mon, 01 Feb 2016 11:13:50 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 1 Feb 2016 11:13:50 -0800 (PST)
In-Reply-To: <CAJTo0Lb=CFOCeSkS9DUv-RhYeYHHXFa=CDe5uP2t46pUHH-K6Q@mail.gmail.com>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
	<61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
	<855A5CD7-3AD7-45F7-972F-E25D5F23EEA0@gmail.com>
	<CAJTo0Lb=CFOCeSkS9DUv-RhYeYHHXFa=CDe5uP2t46pUHH-K6Q@mail.gmail.com>
Date: Mon, 1 Feb 2016 11:13:50 -0800
Message-ID: <CAJ86T=WmEHWzm4FTYCtv3d_FK80G02ikx70T5Od4jovjg12=UQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Mon, 01 Feb 2016 19:13:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 2:21 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 January 2016 at 18:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Lets just wait and point our recipes to new github repo,
>
> If you can find the sha corresponding to the directfb-1.7.7 tarball then
> we'll certainly update the SRC_URI, separately from the "should it be
> removed from oe-core" discussion.

Note that building DirectFB directly from git sources adds an extra
dependency on the 'flux' tool, for which there's no recipe in oe-core
right now.

  https://github.com/deniskropp/flux

> (https://github.com/deniskropp/DirectFB/issues/2, the bulk of the 1.7 branch
> and tags are missing)
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

