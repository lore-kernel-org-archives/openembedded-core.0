Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C9A61731CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:51:34 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so25340761wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2+TqUO5XwryUGZmnq84ggrz9cXRVJCPghDz5wwkRtA8=;
	b=Rtxq+QCcX5UZahJmyas+c1PC0IWkuTDC/hxuuJjSivGaT+Kefy4xUS3bUbZjZ6bJYa
	jhVrxiDedn4VN+Cr0gCBl53JQykr5qxSCyeUz+TxXXCix2I9yYy87f9K/dBS4HFL/5Ad
	NC7lmk/gTdCCi3FvCJamBP2Fsc3/cDdOEvIWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2+TqUO5XwryUGZmnq84ggrz9cXRVJCPghDz5wwkRtA8=;
	b=DehByoUxg0LwJ7jCA+ck5MyMg8HOWB80KZuXB2pHD8TXtg1RHmTdoMI9HdELJPChMb
	e9QqZnCYyIuAxDag8NW1M+eggqQple2IXzjdbv9X9j4FsLoQdeX3GcKODYEoTXVdxSuz
	b9phHHTbkUQ211DW0Ukqd+6dv5OZOkQ0t8/3MTMsk6DDjwl+S9Wovma5NewT4WfNMsny
	67LCI149pX9Isuvo5WZypxESgUP3+TPt2R5cCyaHp+WkUDmyUmIWC+N8zMO0A7p70ocW
	dGtgbe2nImNBxs3975TAyxsDuzixFq2kZ/eDaOkJrJOFQ03KicSxwys5QIhAkI4DPcbb
	xrtA==
X-Gm-Message-State: AG10YOSUZgvsEaT/DdssMrrKoU9pFmM6HFLuU29mcTPYOlljL5ABQGBJm/FegtAoiBCcG+H+2jgY3loaNv/ikZeM
X-Received: by 10.28.194.68 with SMTP id s65mr339811wmf.65.1455108694681; Wed,
	10 Feb 2016 04:51:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Wed, 10 Feb 2016 04:51:15 -0800 (PST)
In-Reply-To: <30C6E750-ADC7-4C26-96B6-CFE4136B2944@gmail.com>
References: <CAP71Wjy4XmN6Ffu=reiNyR+_MDaSbGHwGU0DxRRz2msfQ_rgkg@mail.gmail.com>
	<30C6E750-ADC7-4C26-96B6-CFE4136B2944@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 10 Feb 2016 13:51:15 +0100
Message-ID: <CAP71WjycygcoL=yjc7qMTxEA4HmVbLjtTkYPK_r4eZsrTMn8kg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: issues with gcc 5 + mesa
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
X-List-Received-Date: Wed, 10 Feb 2016 12:51:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 9:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> I am seeing this error on my board when compilng core-image-x11 based image:
>>
>> root@ifc6410:~# glxgears
>> Running synchronized to the vertical refresh.  The framerate should be
>> approximately the same as the monitor refresh rate.
>> [   50.359341] Alignment trap: not handling instruction f4008a1f at [<b6cf3f84>]
>> [   50.364408] Unhandled fault: alignment exception (0x801) at 0x000cd5bc
>
> alignment exception, you say its armv7 which should support unaligned access, so why is this error showing up
> do you have it disabled in kernel ?

fwiw.. and in case someone hits that too, gcc 5.2 + mesa 11.1 doesn't
exhibit the same issue, and everything works fine.

