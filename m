Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 800F778B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 16:34:39 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id w13-v6so3672048ote.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H1nU6p1y+yTrDoDeVbKefVz1uEI9Gfb3wP7cMKkYgo4=;
	b=NUBIQTMSUw1MKzlIfSFq5soQQYn3hl5lamOEpDGjXxtZr/0/4JcfBwFwlABYH18WMd
	KarwviGzkwtXT/3IOYtWs5honx6cxQzL58u1SHYQVmhZueVw2iF0DOoIWV2Duf3fc7AU
	a+xoyY0Ht89qP/0ABNGfTORzYZONQideBogPXojndDe0KvEYYdprqHL6UtDjrR6pW8ze
	dOMsS4XpC3SGLDNXkVtGEjlITSIwBm1RSzfHxSaEvr+IYybTmlXIe3hr8fyRbc4xzggo
	xooGKYAAySk2fNRDZLVpi3Lf4RFGNOmfZEaD4KYaKwWdcnlh+9cRIYa0rxQtGJ+W2S4o
	cgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H1nU6p1y+yTrDoDeVbKefVz1uEI9Gfb3wP7cMKkYgo4=;
	b=RQuI88mMcEFcQESFEja5QIzoy3ghbYYo4CrNyfy0mkJ++5IlBcExP2HLmjgcGLjlrj
	rAPZoGaXGeyfDv1KlBuiByeq3bHOzwBMmyQ/eu4LsY4ly1dP1hhiNDAhSw9A4k2b4dEy
	1Gn4UmPXLzjAfnPGM+d7OoSHeiSmq6ZWKX/Kqbs0//NxrKogvNmmrSDAD9T2mNIVOusm
	gGWYziresuiQoBzw+tK6lDZUzMkTIp2LvQL67G1UN8wMe/McUn+YyCbyeTxgeRQ78QQL
	SmIzsFhE2neM/W1EdLhrVHNpbPTdL3tIyKtWveaSSpnhNbiDI2KMrI6MNxxRR9iEuv92
	bXTQ==
X-Gm-Message-State: APt69E0EYyNNXYQ0qxpMJOgzI9qKVFTylRIhmoEwXU7OU9WqILklaXwr
	u4MhU5t16j/QyNOIi36P6+6Pz6A7/kUH9ztC2pLL+Q==
X-Google-Smtp-Source: ADUXVKJR0s0rlR9gzPhBqPZsuImjUDCfNowmTYay52drRlX2cRU4/ojyv5EDYC13FkaGBXnpLpxlKirYhvNBRrPB7RM=
X-Received: by 2002:a9d:307:: with SMTP id 7-v6mr3805809otv.300.1528907680542; 
	Wed, 13 Jun 2018 09:34:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 09:34:19
	-0700 (PDT)
In-Reply-To: <108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
	<CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
	<62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
	<108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 17:34:19 +0100
Message-ID: <CAJTo0LYxERWufiGVoMnq8V+B0r3WaK46GCtTmgQFaPYRLibPMg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Wed, 13 Jun 2018 16:34:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 1 June 2018 at 16:15, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/28/2018 07:25 AM, akuster808 wrote:
>>
>> On 05/23/2018 04:01 AM, Burton, Ross wrote:
>>> This is breaking a number of other bits of X:
>>>
>>> - xf86-video-intel (was DRI1 removed or disabled in 1.20?)
> DRI 1 is still there.

https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=359477215092ac1b602ad1e2f17a28963d9224c2
claims otherwise.  Trivial enough to disable in our recipe, I'll send
a patch shortly.

Ross

