Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 61EA676D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:12:11 +0000 (UTC)
Received: by wibq14 with SMTP id q14so1689378wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=gSvRppMQduubYSbXPbyUjcO9Zs4WuuDDykJ86TSMVG0=;
	b=LRzEcWU4wdZyOSUH73+7/J5qP2OOBoOwF2hkqn5hJ+CqnoZMMxCbg9s28flatJxIuu
	GhrXQIovqImpzdaxrR/lBQ+ljubM4gibIMTmALrUBna7uR8eQ+fs6XJm28RIrIrw5aNk
	+oZpByBkNTWKH3nLyVaeZiRaWIPLpZ3wUunSX9ZFaP3cfKunBk5MyM8YkwLjeZSVGs58
	2coRky1HrBJh6hNbExq842vHco2dFuQo0C70uXHnKmTYmPr9B4MHcPq9VGtMBSYH+bmC
	VvX7D6mF4w1ENnuTb/gvor4XSs5MotA2Rd/OH+BvqZh6LNBK2EHkvGpdb18rMdAaD0dP
	H+Rg==
X-Gm-Message-State: ALoCoQkBv3I0NAHUI5f3TLslltuTt6Q/2NMfeq8d/qIUL282ieMok6EY7tApoPtP+/E0E4Une9Ze
X-Received: by 10.180.83.40 with SMTP id n8mr20386660wiy.14.1441030331558;
	Mon, 31 Aug 2015 07:12:11 -0700 (PDT)
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com.
	[209.85.212.182]) by smtp.gmail.com with ESMTPSA id
	j7sm22418238wjz.11.2015.08.31.07.12.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 07:12:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wicjd9 with SMTP id jd9so1591762wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:12:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.149.208 with SMTP id uc16mr5678347wib.7.1441030330683;
	Mon, 31 Aug 2015 07:12:10 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Mon, 31 Aug 2015 07:12:10 -0700 (PDT)
In-Reply-To: <CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
	<1440851805.32588.9.camel@linuxfoundation.org>
	<CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
Date: Mon, 31 Aug 2015 11:12:10 -0300
Message-ID: <CAP9ODKpznObiFaXkxOPmRBA9vfpmeoz2620sSwjUbmevX2cEPQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Mon, 31 Aug 2015 14:12:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:38 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Sat, Aug 29, 2015 at 2:36 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> Assuming that make_ext4fs is a tool to create an ext4 file system,
>>> what's the difference between that and our mke2fs which is used to
>>> create ext4 file systems?
>>>
>> We've worked quite hard to land the ext4 rootfs creation code into
>> upstream e2fsprogs. I'd like to understand if we're missing anything for
>> that to work with fastboot. If we are, I suspect it wouldn't be hard to
>> add and should save maintenance of a separate tool (support in e2fsprogs
>> means we get any other ext* improvements for free).
>
> thanks for the feedback.
>
> I sent this as RFC , because I wanted to initiate a discussion... I
> decided to simply move existing recipes from meta-smartphone/android
> for that purpose.
>
> compared to 'regular' ext4 images , fastboot added the (convenient)
> ability to support sparse images, to reduce the size of what is
> transmitted over the USB, when flashing (and reduce the size of
> writting to eMMC). For devices with 8GB+ eMMC that is a big deal
> whether we flash a raw ext4 image, or its sparse'd version. More info
> about fastboot sparse format at [1].

It does help for images it seems; did you see if someone has propose a
patch for e2fstools to enable this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

