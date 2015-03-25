Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id C8BA26E245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:13:55 +0000 (UTC)
Received: by lbcmq2 with SMTP id mq2so15919815lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kcgekqQ/juUhrISv/+kp9h0jBiueFtZDj4RGQaH+578=;
	b=B+i+E2flWHLzvhHAyW47AiMAmbvYVxCyw/fax+o7RVZy33oVxgldLyxpZ6IPRRN8rz
	1/zCAxDYL+rDACTevqoMmR8RcerZn5KrqiLLxuUSIizlWXSBmvw9G2cCqNgJavD6M+dF
	Nm7QwTLAHleYj8K5nzjMKpQpAsD005/y+SXYD6B4CGYZqY6smvau2jp2D7CKgrcfOlZd
	BzfLGr/xhL0OtcXLUZ5DEEAlxTifEBh+Olss1uOQXxHxLdikTmCKTh8YVk7cloWbg+HL
	wDLaIXl4Ti/6mcCYpZcIOrtbBrpmvASFJ/xX6M1U32n4usVbsP7Xis3eUDOzkQQXihsa
	dfXw==
MIME-Version: 1.0
X-Received: by 10.152.8.15 with SMTP id n15mr8086345laa.41.1427285636124; Wed,
	25 Mar 2015 05:13:56 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Wed, 25 Mar 2015 05:13:56 -0700 (PDT)
In-Reply-To: <1427275585.14020.39.camel@linuxfoundation.org>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
	<1427275585.14020.39.camel@linuxfoundation.org>
Date: Wed, 25 Mar 2015 08:13:56 -0400
Message-ID: <CADkTA4NKxxge6-vqyHka3PnEA9shUW3WHyWX-v4T9L2FDeyD0Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 25 Mar 2015 12:13:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 25, 2015 at 5:26 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-03-24 at 14:57 -0400, Bruce Ashfield wrote:
>> Hi all,
>>
>> Here is the latest linux-yocto consolidated pull request. It is a mix of
>> kernel version -stable imports (CVEs and fixes), kernel configuration
>> changes, a documentation update and kernel configuration enhancement.
>>
>> The -stable updates are routine, and I build/boot tested them here
>> (with my fixup commits being evidence). These are ready for a round of
>> autobuilder/soak testing.
>
> Something in here broke lttng-modules causing cascades of failures on
> the autobuilder so I've updated it to the latest code on the 2.6 stable
> branch and am retesting.

Gah. I built and booted here, but can't think of any reason why that didn't
trigger and fail here.

I've started my own build as well, with a completely clean starting point.

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

