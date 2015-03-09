Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 18A38738ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 08:11:29 +0000 (UTC)
Received: by labgf13 with SMTP id gf13so44602304lab.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 01:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0f3Qh2G2sV55LzrDMlCqD3AdwJ5D/xUGzgsRkuhLs5w=;
	b=C8efuj4Jp69pcirIehs51ubq9eyq1lU/gzgsPaBh0/BTlBKIjY5d2VYll0kyTiWYb+
	PjadVyZQTMsXHwjq5BV3N7jWPFGt7hM0wTZrSog4EcHM9PmRx9QrQsxxjVG2l/j/gIFm
	HpXw1axuYHkW6Zi92gAtDar68lCzKBsW2F2Rkod/BBLwqzPDl8+isfyK8ddlL/iudrn8
	X/DmcYSiADSUGHB9Gwp0Eo+SDo44yO/vLr51Mxe2fEEEETXqSTcxLX7XxWJPt6kVZIgP
	HVY2jB0PfJMkP7sobCSPhjlLv/m5/POzw5j8WHnpgRlF8S0ZZ64fnS3j7PL/l8HNI6Ks
	Ye/w==
X-Gm-Message-State: ALoCoQm29PhngEq3kJQQU+Xkh6Tq/h89pH5tUfiei4JvkPVIKwPg/6sliuBVCgkv5+Yynw9xmpNg
MIME-Version: 1.0
X-Received: by 10.152.45.37 with SMTP id j5mr24682572lam.31.1425888689274;
	Mon, 09 Mar 2015 01:11:29 -0700 (PDT)
Received: by 10.112.225.172 with HTTP; Mon, 9 Mar 2015 01:11:29 -0700 (PDT)
In-Reply-To: <CAC1BbcRkNO_U+XFmzoLwDUV+7Gn8NC5-JUXOqfVTwHOt_osrag@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
	<081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
	<CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
	<CAC1BbcRkNO_U+XFmzoLwDUV+7Gn8NC5-JUXOqfVTwHOt_osrag@mail.gmail.com>
Date: Mon, 9 Mar 2015 13:41:29 +0530
Message-ID: <CAFoFrHbNUfefWimW+jO9ts+rpKJ5ax0eD4FJEfsF3tUpAGjnyQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Mon, 09 Mar 2015 08:11:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi Bernhard Reutner-Fischer,

On 5 March 2015 at 21:48, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 5 March 2015 at 15:06, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>
>>>>if d.getVar('TARGET_ARCH', True) == "aarch64":
>>>>               return
>>>>
>>>>Does it make sense ?
>>>
>>> At least the parser should grok it.
>>> The change itself does not make sense to me either way.
>> I did this change because it does not make any sense to build the ISO
>> image for aarch64 architecture.  The HDD image should be sufficient.
>> Correct me if I am wrong.  I find a dependency of syslinux package to
>> build ISO image (isolinux.bin).  I have skipped the syslinux package
>> dependency @luvOS distribution.  The syslinux package contains lot of
>> x86 assembly code. That's the reason I just want to skip the ISO image
>> build for aarch64 architecture.
>
> COMPATIBLE_HOST of syslinux should have prevented you from building
> syslinux for aarch64 in the first place, no?
>
> My assumption is that building this part of bootimg class for aarch64
> is wrong, you should have gotten an error when you attempt to build
> the HDD-image for non-i386 compatible targets.
> So, maybe, NOHDD should be (automagically) set based on
> COMPATIBLE_HOST or something like this?
> But then i don't really see why your aarch64 is the first to encounter
> this so maybe your config is just wrong instead?
>
> Not my homework though ;)

Yes, I do agree.  I did my homework.  I have missed a patch in this
series.  I will push the modified patches next series by
today/tomorrow.  Can we please continue the discussion on my next
series.  Probably you can give me few more points on my next patch
series.

>
> thanks,

