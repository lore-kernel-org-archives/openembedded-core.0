Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C15B2719CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:52:31 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id t196so31767960lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KZ5MnfERvEIToUpBzWFOIjh+UC/IF0YToFRxtDDFtaw=;
	b=vSelDgSDhjmlkV2K6cHnQU2pVaI23R6z9eIL+GPtm2PGkj2YddIafwbIdqT0+7Jmur
	+WESYamij90eu5b6JFO0uyKnUZMrDNIfjzqAjwPE6RRnVRUIcZfjBj2BsvH7JjaNx2VX
	jSa1i7hBxpNVl6xExzh8L2xAojghTFMeDO2TNQIwvyvzkt5aP99Z7MxGakn0PnD1eMzg
	SBi5lDB6OeateBJIl00BxMi30gRhc44ds+YpnvhUrK8ir97YwwfGwWORnl4N8lhWz7kj
	mC6oEnW2xsiWrK/OLesr+I+qv3dy2coJr8Vzt2mT1242jqBy3zQ5unJmJqF0DBd83Y9U
	idZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KZ5MnfERvEIToUpBzWFOIjh+UC/IF0YToFRxtDDFtaw=;
	b=fpFcF19C8ktPNDZ+Nc7lpiRnQdSz5JsDr4peX4o8T0xaZFJGWuTa0+In8h57lYz0Rh
	4A8bbnQbG7SPNBldNLrUnvfM5SqGS54FnA/5mzKzxTZawHtODI3gSqwY3PHRhDfm4kJY
	9hByEwgKjtQzuHft+Y1EzOdClVOpBan80siAHxp+m9Hv3xekfS9q80d5zkHADSeKLANu
	YJKTIjRyN4HgKn72ssTQzhmuugwsN1268/+Eljfjnm6/TFuhyuUtboYDyY1wntWizDic
	9PDOslOw8xp3noTYqKpSBkAaCmWlmZ41nFxZ8cUsU5g/UWsIkR6ZXie83U5aVa31/uW2
	SDoA==
X-Gm-Message-State: AKaTC03Kon1jPuO+JH9PTe1D1gm734yfJcts7EX/KsH0WXf7mKVH9Ds7OKgcrddXeJ1YWQ==
X-Received: by 10.25.40.211 with SMTP id o202mr1420609lfo.183.1480002752035;
	Thu, 24 Nov 2016 07:52:32 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	5sm8382045ljf.18.2016.11.24.07.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 07:52:31 -0800 (PST)
To: Patrick Ohly <patrick.ohly@intel.com>, ed.bartosh@linux.intel.com
References: <1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
	<fa1edaed-1498-160e-2015-8b7882c04877@mender.io>
	<20161124132315.GA14497@linux.intel.com>
	<1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
	<20161124145136.GA31813@linux.intel.com>
	<1480001047.6873.49.camel@intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <b7f31252-d444-2a6a-5572-ec032d5c68e2@mender.io>
Date: Thu, 24 Nov 2016 16:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480001047.6873.49.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 15:52:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 24/11/16 16:24, Patrick Ohly wrote:
> On Thu, 2016-11-24 at 16:51 +0200, Ed Bartosh wrote:
>> On Thu, Nov 24, 2016 at 03:43:18PM +0100, Kristian Amlie wrote:
>>> On 24/11/16 14:23, Ed Bartosh wrote:
>>>> Would this way be less intuitive?
>>>> --exclude-path data/*
>>>> --exclude-path data
>>>>
>>>> We can go even further with it allowing any level of directories:
>>>> --exclude-path data/tmp/*
> 
> Just to clarify, that is meant to also match data/tmp/.hidden-file,
> right? I.e. fnmatch() without the special FNM_PERIOD flag.

Yes, I think that makes the most sense, even if it breaks with shell
defaults.

-- 
Kristian

