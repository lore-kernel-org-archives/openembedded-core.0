Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 871B375A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 17:57:18 +0000 (UTC)
Received: by igpw7 with SMTP id w7so16268513igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 09:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=snA3DhAb7E9kZBcjekeQfaxfYbeCnuVYCx7FWot+gi4=;
	b=PdyW/0UxCdMCXq785sFjkUhuxXZI+s5We6okU2bhnk8lj3sC4cMGjTgV9xSriOzehp
	ZsfqSsdcJOtVhG55JHvKJbjr8DHzoP2CcaoYQLA8CdRsqYJmQLh8EpayovIgUDvDhmAG
	4cdKGqGVPf6QoFVkZV29GfgrDBsts5TI7fwbG9xmKpu+34c8jdIwBvkdwo7+fqQemETE
	V38BSzpvkMV8FIHZBwi+WfMnOi6fVW8Hi+l9NhP2VtJumdv5wOIsJ9v1qJD5Xb1PvpsF
	SQVINyl/lMI5Bt4ZUa1yrfubLUKbaRjNFZNXyObBs1YaejdmKY93YWvEdo5mEX1JThrm
	RMVg==
X-Received: by 10.50.20.67 with SMTP id l3mr4389450ige.75.1446746238135; Thu,
	05 Nov 2015 09:57:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 5 Nov 2015 09:56:48 -0800 (PST)
In-Reply-To: <CABcZANk1pdUdzYycZuOgPUoWMC4yXPFKUuL1umqiOmC6bKK-4w@mail.gmail.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<37C467A4-7065-4F95-B666-94ABB1E7248B@gmail.com>
	<CABcZANk1pdUdzYycZuOgPUoWMC4yXPFKUuL1umqiOmC6bKK-4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Nov 2015 09:56:48 -0800
Message-ID: <CAMKF1sp3Nms5j6psF65uDrJvMF74MhDYf1rk2OCV_mxTbxduJw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 17:57:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 8:27 AM, Christopher Larson <clarson@kergoth.com> wrote:
>>
>> >
>> > export MAKE = "make"
>> > -EXTRA_OEMAKE = "-e MAKEFLAGS="
>> > +EXTRA_OEMAKE_LEGACY = "-e MAKEFLAGS="
>> > +EXTRA_OEMAKE = "${EXTRA_OEMAKE_LEGACY}"
>>
>> may be this should be a weak assignment.
>
>
> That's the habit, but this is bitbake.conf. Anything a recipe does will be
> long after this.

True, however ?= will convey that its overridable.

