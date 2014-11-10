Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id C62AF65CED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 15:50:55 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id w8so5594929qac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 07:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=e2fp/WZRHT5h6nS5HCI2zDTVuc27URu57WoBHtykmYw=;
	b=Jd0uAr4IxiHWroGY4XMX48DzTOsQ1FXlumVd2lz4MXg+8zbmh33KwJp8xuy5JgoSxJ
	Hf+5zk7bFBk2JVYrSoSB0gnqDPRWoctHcrwQH8K1NQIp/muUFfU9/abp+56IMjfWt99G
	s1RY5/vlY7JsfiziLbr8OCmiCKI9Gm/VJwGrYfdsnHTXHxN9LbOVBmpz6AGXZSL5hWT1
	sw3WRPt1SoqDjOVx7l/ycp+1RlqLXzMa+BSRadqrIGiRasjOvQ73U/1uQNc0DB0wNDuA
	vUt1aDs4W3Bc2IuVVMQ3UOJyDMjkAaJVECtg64enf9jtTYOiB2ALCRKFBDtxUBiroyN7
	2WuQ==
X-Received: by 10.140.30.2 with SMTP id c2mr42811814qgc.32.1415634655707; Mon,
	10 Nov 2014 07:50:55 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Mon, 10 Nov 2014 07:50:15 -0800 (PST)
In-Reply-To: <CAJTo0Lbf8q3z+dAZzpOu0Rgt4MVKjiCJ9fePOdZoTuK2Yf6ZyA@mail.gmail.com>
References: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
	<CAJTo0Lbf8q3z+dAZzpOu0Rgt4MVKjiCJ9fePOdZoTuK2Yf6ZyA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 10 Nov 2014 15:50:15 +0000
X-Google-Sender-Auth: RP1zPTd0yRoiGkDhVlZCNurOQ0k
Message-ID: <CANyK_8fduuFa5=4aoF-3Zjd8zBpRr6ZZCSgj=9nNzKARoKzOeg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: Upgrade to v0.2.3
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
X-List-Received-Date: Mon, 10 Nov 2014 15:51:04 -0000
Content-Type: text/plain; charset=UTF-8

On 10 November 2014 15:27, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 31 October 2014 10:34, Paul Barker <paul@paulbarker.me.uk> wrote:
>>
>> The patches for opkg have been rebased using git so that they apply
>> cleanly onto
>> the new release.
>
>
> Something appears to be broken with 0.2.3:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-core-sdk:
>  * perl-module-config * perl-module-config * (repeat)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/97 is
> a build on the autobuilder using current master, and
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/96 is
> master plus your two opkg patches.
>
> Ross

I'll try building core-image-sato-sdk myself tomorrow and see if I can
reproduce this locally. I've probably introduced new bugs while
solving old bugs in the dependency resolution code.

I probably need a more comprehensive pre-release test for opkg. I
currently build core-image-minimal, rebuild a few packages then check
'opkg update && opkg upgrade' works as expected. I'll expand that to
build core-image-sato and core-image-sato-sdk for multiple
architectures for the v0.2.4 release.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

