Return-Path: <bill.randle@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0776069C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Dec 2017 03:29:14 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id h9so10733798oti.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 19:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I81JEBEo1BY05r0MZwbmXEbONpZa0n5DmFSaGeGGPnM=;
	b=jKXqNYDEbpmDkElpDbShl6i8CBMchAWYkrz1s72+C4gavy4Nwnfr71yf5UUfc6yTCz
	o8vF+/3tFfXhrxHSuN7FBGLzy7zl5HlrwkFCsUeRgHsXg3mYNurK65cxflqZsauzOrn2
	2+KYCjvf1+GkphZBhAMnE94c5R0dWbUip5UBR4au0SaH6WRYsxU10c9OmiJamM5coHSv
	TXFFoVbmBayZGDictpNUkdi2vE1XPuW39/cm4mB3E4GIGpJsgZsC5UWMTHswN39ieza2
	sb8JAT1twOH6hGchLkdUMOzrGT2//1Pp84s7NijJzt4cSIN4X2Vom4TPy7uCK52nVTM+
	ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I81JEBEo1BY05r0MZwbmXEbONpZa0n5DmFSaGeGGPnM=;
	b=r/xIQXzu5cv3lMTY1pSpfgTdj1rwBLxKiz3xI2yMr8QyUWjK8kVKEPFpj7pYlGYmkM
	oSiQQj7iahMnGJ8P55QFJ00AOa85UCRCqXvulLYkxrKVFSG6x6ZUUCn0l4VFUSFG/C17
	Ov7kwrpQspUdZWhezoD5v90LouuA6JsGjz0VdxsKpqzwX+rKxiJOp3gVB8vfYWDD64Lt
	HRtxqOcMnXBK8+buf/k9j7pa4wKQ8x454uew5JLif78PIsL2DEeo+eaGA0BXH0jHNgVm
	BhCPd4m7V2F/7DMh0eW+zBGvpEO5QqifiD4b+rd/LluebvBqAQvVF2/XolNqLCY4c/pg
	0FPg==
X-Gm-Message-State: AJaThX52IFbizjy7Z7CeCa8MB9+PC6Y2HJ9xbxkfHj5He1qMYFxocpn2
	52nGottJYiWPbs6PBGg3Dg4/oPMzEctKARLTovM=
X-Google-Smtp-Source: AGs4zMaEPLPsj8vwF4pf3TMYraEGTHrFlWuzZt4ROjYrTzDvrOnI4e0jUl32TwlnKyiFoVyQaxESyj0wGbiZeWNGZcI=
X-Received: by 10.157.46.86 with SMTP id c22mr26911528otd.213.1512790155894;
	Fri, 08 Dec 2017 19:29:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Fri, 8 Dec 2017 19:29:15 -0800 (PST)
In-Reply-To: <1512755197.19417.115.camel@linuxfoundation.org>
References: <20171208164454.7802-1-ross.burton@intel.com>
	<CAJTo0La3_94Rg1LXJ9N81Ss4yoFvm3b3unJ5xt6-wc4p4-BFyQ@mail.gmail.com>
	<1512755197.19417.115.camel@linuxfoundation.org>
From: Bill Randle <bill.randle@gmail.com>
Date: Fri, 8 Dec 2017 19:29:15 -0800
Message-ID: <CA+n--H8LH9EtqS667sGtFiPiAWoLm5JtG2syN_MvVvoY_ckhpg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lrzsz: remove
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
X-List-Received-Date: Sat, 09 Dec 2017 03:29:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 8, 2017 at 9:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-12-08 at 17:05 +0000, Burton, Ross wrote:
>> I've had people from the past
>
> What are you suggesting? ;-)
>
>>  suggest that this is still useful for deeply embedded environments
>> where a serial line is the only form of communication, so I'm
>> retracting this and will instead clean up dependencies so it doesn't
>> end up in all images.
>
> To be clear, if you have a device you're doing board bringup on and
> serial works but network doesn't this does provide a useful way to get
> files in/out. That isn't an entirely unknown situation for OE users. It
> would also potentially allow us to improve the serial test runner used
> by poky-tiny.
>

I agree. Please don't drop this. On a previous project (FPGA based
co-processor board), x/y/zmodem was the only way to transfer files to
the target since it did not have a network interface at all - just
serial.

    -Bill

