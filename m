Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id EE540607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:48:28 +0000 (UTC)
Received: by lagv1 with SMTP id v1so75021479lag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=N16Fc7DAmLvRGEG0x5cY9g0BuyRAWJJl9QAlSrxHIr0=;
	b=0fbxPeJT2pcim1fK45c0hL66HFcdT5oU36Ni5Pd2izc1UlLvK0WLZIsndhg1iKaWvm
	O+NCfWG/E/7rGzNBp5WuNXU6npinT59GaPW+x7908V99VvUbYBxx0AkKdYyo/5vxzPhj
	h7FTtcd4hUXdkhFj44vubeDnhQKmIcr6MZHMpA8N35eSff+ZtwvtfSQnbNBIuWGSYTxu
	I/b5fKNiqebYgvKXmvRsN1DCHgcjpwqDYNCtWjxNd3BXpMIh1xTxcmQqTsaEbGThvubA
	9ifQlKsIKG1w2FzKb/T0DDel9zuJLCcP73hVLdNgzDjayxDAriaNnt28zWlN4tRYu77U
	jJNw==
MIME-Version: 1.0
X-Received: by 10.112.163.35 with SMTP id yf3mr3291694lbb.107.1432129708728;
	Wed, 20 May 2015 06:48:28 -0700 (PDT)
Received: by 10.152.90.230 with HTTP; Wed, 20 May 2015 06:48:28 -0700 (PDT)
In-Reply-To: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
Date: Wed, 20 May 2015 15:48:28 +0200
Message-ID: <CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 13:48:29 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 13:55, Laszlo Papp <lpapp@kde.org> wrote:
> Hi,
>
> I am a bit confused why busybox passwd does not work with daisy. It
> used to work with dylan. When I try to use "busybox passwd", I am
> getting the following output:
>
>     passwd: applet not found

is the password applet built?
Check your busybox .config.
Is passwd listed when you invoke plain busybox and have the help-text
printing turned on?

Sometimes code around bsearch is miscompiled but this should not be
the case for your setup, i suppose.

thanks,
>
> Is something wrong with the busybox maintainer script or somewhere
> else? For instance, "busybox pwd" can be located as well as some other
> applets that I have quickly run.
>
> Apparently, this does not seem to be in the migration guide either, so
> I presume that I am doing something wrong, but what exactly?
>
> Fwiw, "busybox passwd" works just fine on my desktop, too, as expected.
>
> As for completeness, "passwd" does work (without the busybox prefix),
> but that is not what I am aiming for. I am always trying to be
> explicit because I always want to use busybox's applet, no matter
> what.
>
> So what can I do to overcome this?
>
> Ys, L.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

