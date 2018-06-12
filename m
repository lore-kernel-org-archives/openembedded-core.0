Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 79FCE78CE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:35:07 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id c15-v6so17430858otl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uSx/cbB7KTzaudi4+g93/VO3ofVOoO5EpmCTQvAhsmU=;
	b=H+AH5vxC2lkb/zddOuQLdtm7aTA3pgmojrb7K4byHnf2p8HdXS0hkZjXaFeHDO/EV0
	qC9ESDmAXVo+Z4wKcNwr/0V9ZfMJbpP3knkjUCSFhTBRm3prLlh4n966iW/Csb5+DPce
	JXyvmBwawmGioHjEU8IlL0QZhOV96mnZfoUPh8k/UgVjPtwxwbmpmn/eKcjjBxISRr8U
	sqiBrpMX8u8SAL75uB0BHuwaOxbecvoYYdz+uORj3wuXAQgIlS+26RfVjToCr0vW9SLx
	iWBxNxIEqwCkIy6s31wSgusdh4H5xjgLn9yYDzFHhI5cNtFfi3zTcBN6zNZeXTHUhnsS
	h5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uSx/cbB7KTzaudi4+g93/VO3ofVOoO5EpmCTQvAhsmU=;
	b=K4ZBV2kGgwEKxHSxSK2KaYL3nc6CJEwApjvbrd/aum7aJ1BqPCXk+6KOs8vLuzDw4/
	bZhY1h+5p07PzjOLANZs7Z2Ic7mN5/y7+b+zzGg/1XuSA0wogRldpA+DcTNz+FKnnBWo
	AUlEeDTzws4ORdzyBsjtp4QHOdpcDovLWenpYgjyOr3kYcQ8uAKzCr/EtIXL6wxN4Pp3
	0SWn39rZLlya+g0B7ZFgM417UD87HEx1cAOZmATHOA0YEtwRzaDD5cdkD+otqYSu5XuQ
	+U2mSPWLNw6YqQyl1K2MF5/W5SuUIo7gfIGkHmfDE4L1IEIQDeLea6x+wn53keZsIz15
	uYCg==
X-Gm-Message-State: APt69E08BQCX64TPJymgQ5+6vxO9lpBQf4wk5DX1OTZFmiO0xh7ienVR
	BeZGmHPddlhUZ7+c22uB0x411Ht5Ht9b5sDDP+jAGg==
X-Google-Smtp-Source: ADUXVKLBo66TKZ/7m2ypMDN0BajB4j4+GrOuIV0jI1kp1eJDo65rzzWb8b+6vMaMTqns3i3c+hILG7/FWKbO6STXkT0=
X-Received: by 2002:a9d:357:: with SMTP id 81-v6mr1938469otv.119.1528796108546;
	Tue, 12 Jun 2018 02:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 02:34:47
	-0700 (PDT)
In-Reply-To: <CANNYZj9_ySuHaqHzA8c=Dhbt=fkEnj8eD0HOcRHpyb7RzW4s_g@mail.gmail.com>
References: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
	<CAJ86T=U9SjuBJ07aNq_ATukCxCQoEuAo6g4mUso6f71W-sU8cA@mail.gmail.com>
	<CAJTo0LZPfg6AX_1UF08LrnYp=vtQtJZRrRxLpDCtVPC6jEud5Q@mail.gmail.com>
	<CANNYZj9_ySuHaqHzA8c=Dhbt=fkEnj8eD0HOcRHpyb7RzW4s_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jun 2018 10:34:47 +0100
Message-ID: <CAJTo0LZJM1oyX=3evGj8GS6nF2fCy-LHzX8L7WvKrnzdj-sx_Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: remove myself as maintainer.
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
X-List-Received-Date: Tue, 12 Jun 2018 09:35:07 -0000
Content-Type: text/plain; charset="UTF-8"

I spoke to Andrej earlier and he has agreed, the patch to change
ownership is on the list now.

Thanks Armin for being the maintainer, and thanks Andrej for taking over!

Ross

On 12 June 2018 at 10:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> I would nominate Andrej Valek <andrej.valek@siemens.com> :-)
>
> Being listed in maintainers.inc is indeed not an obligation to fix
> other people's specific issues or work on recipe enhancements in
> general. Maintainers are expected to act on AUH version upgrade
> emails, and look at filed bugs; neither is time consuming.
>
> Alex
>
>
> 2018-06-12 1:17 GMT+03:00 Burton, Ross <ross.burton@intel.com>:
>> They get the AUH upgrade mails, and will be the default assignee for
>> bugs in triage.
>>
>> For something like busybox this isn't a huge amount of work.
>>
>> Ross
>>
>> On 11 June 2018 at 23:13, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Jun 11, 2018 at 3:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> Do we have anyone willing to take over?
>>>
>>> Does having a designated maintainer actually achieve anything in practice?
>>>
>>>> Ross
>>>>
>>>> On 11 June 2018 at 23:03, Armin Kuster <akuster808@gmail.com> wrote:
>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>> ---
>>>>>  meta/conf/distro/include/maintainers.inc | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>>>> index 628edac..08d7e1b 100644
>>>>> --- a/meta/conf/distro/include/maintainers.inc
>>>>> +++ b/meta/conf/distro/include/maintainers.inc
>>>>> @@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
>>>>>  RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>>>  RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>>>  RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>>> -RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
>>>>>  RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
>>>>>  RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
>>>>>  RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

