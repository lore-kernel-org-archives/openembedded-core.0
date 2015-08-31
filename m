Return-Path: <niqingliang2003@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB6C76D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 15:07:10 +0000 (UTC)
Received: by iog7 with SMTP id 7so37645961iog.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QmtBFYpvTA7FdQ1MCR38XZ4LTcWwf5l6N6aqH1LMkCk=;
	b=iP7uO3ctAGYsWYALSZm+TLCdknjFZQexvbtesbaYYRe2mR851bFCn71vRSaKGmyKhI
	hld15509fQG8hS1dYqnCWFwGGrenYCgJlEBfPWnN3GsW/m3BAcO21jNTTRx/6LKUtjn8
	m6ubfR5/PVkd5A9vo+xrFZdvxk99F7DKhCHy9sVhyflvYKar546HJmr2Egxs65EHxRpQ
	9TBZA/Hz6h+S9jh6ZCdAQbu9UnvQpCr73Is4A4lXsekL9XEcMxF3zxfHN76M0Psh63zl
	gNFcTigOMn3U2UhsyXYdUQ+cWYZBL6M9zDtaJpssth1jfPiDxlVnv4G+aftRXvO9NfNM
	bM8w==
MIME-Version: 1.0
X-Received: by 10.107.27.210 with SMTP id b201mr16246538iob.126.1441033629435; 
	Mon, 31 Aug 2015 08:07:09 -0700 (PDT)
Received: by 10.36.21.200 with HTTP; Mon, 31 Aug 2015 08:07:09 -0700 (PDT)
In-Reply-To: <CAP71Wjwg3g-rv4H1u7F=owP8XW5B6QOLyeF2TTsP1a2dCHsGBw@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
	<1440851805.32588.9.camel@linuxfoundation.org>
	<CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
	<CAP9ODKpznObiFaXkxOPmRBA9vfpmeoz2620sSwjUbmevX2cEPQ@mail.gmail.com>
	<CAP71Wjwg3g-rv4H1u7F=owP8XW5B6QOLyeF2TTsP1a2dCHsGBw@mail.gmail.com>
Date: Mon, 31 Aug 2015 23:07:09 +0800
Message-ID: <CADwFkYfJn7SAhQMqpgz4NQW5V0PZi4z2_RONydy7ZN54frZ9pQ@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 31 Aug 2015 15:07:13 -0000
Content-Type: text/plain; charset=UTF-8

can we compile android system using oe?
the Makefile system of android is too complicated to load/use.

On Mon, Aug 31, 2015 at 10:28 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Aug 31, 2015 at 4:12 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>> compared to 'regular' ext4 images , fastboot added the (convenient)
>>> ability to support sparse images, to reduce the size of what is
>>> transmitted over the USB, when flashing (and reduce the size of
>>> writting to eMMC). For devices with 8GB+ eMMC that is a big deal
>>> whether we flash a raw ext4 image, or its sparse'd version. More info
>>> about fastboot sparse format at [1].
>>
>> It does help for images it seems; did you see if someone has propose a
>> patch for e2fstools to enable this?
>
> no, i haven't seen anything there. Note that it would be a
> fastboot-specific sparse format.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

