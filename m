Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE72744DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:58:32 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u11so6740235wri.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 16:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gkGCZhG9ZsN3eTgMhnOZs7N2ca6ybntqyZQzy5d5Uws=;
	b=AkL8Rgmw6lnYlXVYMP6G8u97TaMeSNuzPM/iD6sjWPRVaqXAeiePQj5qT2EZBtXrJ2
	gSxDAlOzBVtGHiG78P67w4eiPcMjiAhye6P1HDsitID5rtaJblukiTUJFAAlnzXaC81y
	b8+eXrjFZ8xCdeuIU4OesbclDxKMmDIuwyVbG1FU+IU8cvZi9hSxVd41D1mUInmUz29n
	dAr47Zsx3cuMSLEYLx6NJj49P2HC7/27o0baQZU3Atum44dsPWYiAefrXlXgx0O8mnTc
	ornYzDtwDUsvs3ng3n+CnQWAmDiExFAxyCczZoFfRZWAAnyf3XVq+YaKxF1DVYuAxa1c
	wKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gkGCZhG9ZsN3eTgMhnOZs7N2ca6ybntqyZQzy5d5Uws=;
	b=h83ihJ032079yV8Z323kHoC/pScJVE5VQbMgh75qObblvBHn3kNrHTgT3ixWwDL0Tz
	7ibQGVHeyPfxijLKkFZ9k9o5ojIEP3DCX126kp2HnsHanY0RkmRVfami8OCxZTx6drIZ
	k3sETCIdJFnrPCfS5su5zI0fu1fB3gH/O9VM9okqVlD7BwF5P7nkmVyELCNll9JWOFAU
	a82uMRA2yWzf8ynnwUpgGWsm9Y6JY7fSoJMycSSrA03jR7j42nUVHpLMN2Yu9wot4u87
	Wvqr0Jt9YITaQTVoX3S04GgnEIshoKiUq6ISmHVNqvf4l7M2b2mVycvKfmx80NeXgOEZ
	r1+Q==
X-Gm-Message-State: AElRT7F2yEZl+uNU0T8WYy7kGuJapt9YWLrgmjfvpDFKFLiSeVEiRI7L
	Y8Air1KwedviVK+33ofX8gl1Iwkvc5j2Ob97914=
X-Google-Smtp-Source: AIpwx4/TVELhUPltsFYphZHD4pwiKX6VGrR730SLL2sX8fnlhI9NOhYJVNVQ9ttVqJpbRGBU4AKrmPD7km3PvFV9SjM=
X-Received: by 10.223.177.213 with SMTP id r21mr8271472wra.89.1522367912996;
	Thu, 29 Mar 2018 16:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Thu, 29 Mar 2018 16:58:32 -0700 (PDT)
In-Reply-To: <54bd76e3-bde3-f0fd-0f69-5a9f930266c5@intel.com>
References: <20180329231918.25272-1-california.l.sullivan@intel.com>
	<CAJ86T=VbYnLPa=JZiYVC0zpr06Gzgvm0+NdCBjSMCusEF=Zhgg@mail.gmail.com>
	<54bd76e3-bde3-f0fd-0f69-5a9f930266c5@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 29 Mar 2018 16:58:32 -0700
Message-ID: <CAJ86T=UGdR+zdigFrH2S1CN68tJSk=r3UwGZy+vX3o-vkph1mA@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: set default KERNEL_IMAGETYPE(S)
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
X-List-Received-Date: Thu, 29 Mar 2018 23:58:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 4:55 PM, Cal Sullivan
<california.l.sullivan@intel.com> wrote:
> On 03/29/2018 04:36 PM, Andre McCurdy wrote:
>> On Thu, Mar 29, 2018 at 4:19 PM, California Sullivan
>> <california.l.sullivan@intel.com> wrote:
>>>
>>> With the change from assuming kernels will be named "vmlinuz"
>>> everywhere, to instead using KERNEL_IMAGETYPE, we require that
>>> KERNEL_IMAGETYPE is set to something. Instead of setting the default in
>>> multiple individual files, set it in default-distrovars.inc.
>>>
>>> Also set KERNEL_IMAGETYPES, as we will eventually be switching away from
>>> KERNEL_IMAGETYPE.
>>>
>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>> +
>>> +KERNEL_IMAGETYPE ??= "bzImage"
>>
>> Isn't bzImage x86 specific? Setting it as the default also disagrees
>> with meta/conf/documentation.conf:
>>
>>    KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
>> usually set by the machine configuration files and defaults to
>> 'zImage'."
>>
>> It might be nice to have an arch specific default (e.g. bzImage for
>> x86, vmlinux for MIPS and zImage for everything else?).
>
>
> Doing so would require a nasty setVar python block due to overrides taking
> priority.
>
> E.g.,
> KERNEL_IMAGETYPE_x86 ??= "test1"
> KERNEL_IMAGETYPE = "test2"
> results in KERNEL_IMAGETYPE getting "test1".
>
> That or accept the difficulty of overriding it afterwards.

How about:

ARCHDEFAULT_KERNEL_IMAGETYPE = "zImage"
ARCHDEFAULT_KERNEL_IMAGETYPE_x86 = "bzImage"

KERNEL_IMAGETYPE ?= "${ARCHDEFAULT_KERNEL_IMAGETYPE}"

> This patch is primarily in order to set /any/ default globally so that
> getVar calls on it don't break parsing.
> Its still customary to set the variable in machine confs as well.
>
> I can send a v2 that sets the default to zImage instead. That way it matches
> the docs, though I don't know how accurate they were previously.
>
> Thanks,
> Cal
>

