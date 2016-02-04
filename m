Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 49962731E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 03:30:30 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id rs20so5385050igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 19:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:from:to:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=cQyNlFycuUJG7WHBHawkArzFyCApJ7taCKevF94x9eQ=;
	b=ne75ffAtn+mtHVZqO5/VpSJSupyzwUPKjCLrPQnOeCmCEvEsM+AvzHJlD3MCooCzu9
	Uux1rLsnBZHTI7K8Y7RlQGGRKw0oHMHZyanxGGS9hj3MuEUEq09MtLI/YQ+G4vVwGSZ8
	9KYVSxaTkMFnWBfO9zvzz55KWCPNJUZj3xqd4yyeEyjrylgKk/FOB/LmtrXAFI8atz5q
	hfnHWRbgb7gGxU5yoxXGpjEfWCFEPttaU1gzJ408FmcHjth9ruNdP+epjuKyJcGUGq2g
	/C91dpXwZgXPumyIeAaUAoDOZvLIIO3CtnrTrrGFVeH+NkD7iUnoB2/mr8mJbiR/DpuL
	9q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:from:to:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=cQyNlFycuUJG7WHBHawkArzFyCApJ7taCKevF94x9eQ=;
	b=UivR4BDHD6L0PyzECTzAA7PO2y8muuaW5/KHzpCCidYhZqPRB2mMhw6t1xYBLVBxFg
	e9yuI2KwClkqMYI5LTYvXE7cMj3Kh756I7gXTC954fitkb0m/A+k5FOy0AckiGthwYo7
	94fQ4ePZNTF3CcX/75w4DjcnflzAso93MFoqkSVLodkEgbtt0sn+AkPzvGSYC2fPcCfL
	dnKPixtDFyKZMPDnZk6Ymoq/1E1XPqsi2h9SIR0SwsSuwtlfVO7zo8W9EBdf1ODWE/7j
	PjWedVGX4+9gHAYw/FkQf9WrDDAAyyaJgzW4BoYbF2c2gZyP3z+vfBf1s5+JZhc52J3k
	oBpw==
X-Gm-Message-State: AG10YOSvV+Qz5/Dqr71S0gKpROmzfCbnO+MrXzbbd4itl0bEs+uXqoo1AJ/KGKj9yL/13A==
X-Received: by 10.50.183.34 with SMTP id ej2mr1019656igc.51.1454556631802;
	Wed, 03 Feb 2016 19:30:31 -0800 (PST)
Received: from [192.168.141.106] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.googlemail.com with ESMTPSA id
	l94sm4172544iod.13.2016.02.03.19.30.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 19:30:31 -0800 (PST)
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
	<56B2C02C.90607@gmail.com>
	<1F06A159-1BC5-4008-92D0-B7939CE41A17@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <56B2C5D5.9040502@gmail.com>
Date: Wed, 3 Feb 2016 22:30:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1F06A159-1BC5-4008-92D0-B7939CE41A17@gmail.com>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Thu, 04 Feb 2016 03:30:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/16 22:08, Khem Raj wrote:
>
>> On Feb 3, 2016, at 7:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> On 02/03/16 15:32, Martin Jansa wrote:
>>> This could be caused by chromium using own bundled binutils where the version doesn't match, I've solved it in our recipe by:
>>> +GYP_DEFINES_append = " linux_use_bundled_gold=0"
>>> +GYP_DEFINES_append = " linux_use_bundled_binutils=0"
>>
>> w00t!! awesome. works for me :-)
>>
>> So it looks like we both have working chromium recipes, yet the upstream one doesn't work. What version are you building? For what arch (which archs)? x11/wayland?
>
> please submit your patch for meta-browser

Any patch I submit is guaranteed to be rejected. It only supports x11 
and has only been tested on x86_64. If nothing else it would have to be 
named chromium-x11_<version>.bb, or something like that. I've actually 
removed the wayland/ozone stuff from my recipe.

Considering each build of chromium takes me 2.5 hours (just for chromium 
alone!) it makes it hard to care about environments I'm not using.

The only way chromium builds for wayland is when another project (ozone) 
is added to the mix. But, in my tests so far, not every release of 
chromium builds successfully with every version of ozone. So although 
building for x11 is easy and works for just about each release, building 
for wayland is much more hit-and-miss (and has less chance of success).

>>
>> I have a working recipe for 50.0.2636.0, but I'm only interested in x86_64 and x11. wayland+ozone is a whole other mess ;-)
>>
>> At some point it'll probably be easier if we build chromium with llvm-clang, the same as google is doing. Is that possible?
>
> you can try using meta-clang

Okay. So if I have an image and everything in that image is built with 
gcc except for chromium, meta-clang will know what it needs to add to 
the image so that one clang-built package can run?

