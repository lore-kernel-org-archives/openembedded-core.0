Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1434D76DE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:29:09 +0000 (UTC)
Received: by qkbs184 with SMTP id s184so6896643qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mFa7nzlXzB+m0KSYL8qYlZ8K9dMfoM6zRSG+xFXCxcc=;
	b=hXuYqz74bnNRTJrh2k0pOD3GUR0zgN7qqBKpBd/jryuMoQUNmrLCWGINP045OJpueA
	Cf75EuYgQmOVYoppR4zEoheJYLhMF2pU0sA8FTPhelMLfewBrDoYewOtRRODqy2oIbXv
	xrdsQNh4TdSlsd+JPLeSLLa8Yi9Qqca78eMXjgRK7EjrSUPdv1/Ofwvs8o3uDbM2Nuex
	Tc4uBjm/RQRXUYFnJ1i/D67pptQHC1vFF3SRBDZ6f/OVyETtg8Jwwj5kx7McVUDRM+FL
	KAi4IM6g0lITNf2kCv6UdkyUNmAWJ/yRrmYh6yl300NIoVRHFi448hR1l2ZfmqwJJeEY
	Nl3w==
X-Gm-Message-State: ALoCoQkb5yYAySuz33qyYnaJL1x+EnrVeuVllJwa8xEOW4v+K2kaZvncciEbj/pY1PmwLrQB7vUK
X-Received: by 10.55.195.66 with SMTP id a63mr9336393qkj.67.1441031349703;
	Mon, 31 Aug 2015 07:29:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Mon, 31 Aug 2015 07:28:50 -0700 (PDT)
In-Reply-To: <CAP9ODKpznObiFaXkxOPmRBA9vfpmeoz2620sSwjUbmevX2cEPQ@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
	<1440851805.32588.9.camel@linuxfoundation.org>
	<CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
	<CAP9ODKpznObiFaXkxOPmRBA9vfpmeoz2620sSwjUbmevX2cEPQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 31 Aug 2015 16:28:50 +0200
Message-ID: <CAP71Wjwg3g-rv4H1u7F=owP8XW5B6QOLyeF2TTsP1a2dCHsGBw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Mon, 31 Aug 2015 14:29:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 4:12 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>> compared to 'regular' ext4 images , fastboot added the (convenient)
>> ability to support sparse images, to reduce the size of what is
>> transmitted over the USB, when flashing (and reduce the size of
>> writting to eMMC). For devices with 8GB+ eMMC that is a big deal
>> whether we flash a raw ext4 image, or its sparse'd version. More info
>> about fastboot sparse format at [1].
>
> It does help for images it seems; did you see if someone has propose a
> patch for e2fstools to enable this?

no, i haven't seen anything there. Note that it would be a
fastboot-specific sparse format.

