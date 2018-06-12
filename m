Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 831ED78B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:32:08 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id d19-v6so21712628oti.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MwlF6Hu6VZmfw+HSwCYXLA3nfmLnV/VRQPuE6TW4SdU=;
	b=n+UuGy0micvvmZuVcwpq8XWR9BPDDxunRF0ASa83el3iqWp7Vjr/tdZi7YFdpW5QXr
	KXiBPuhAt7SDL7P2OQ1O5xZbOx4iOD5kNB1R6DHycTBXWU4QfZg4aANlmvUr7PAOLTyy
	vL+s5vxWdw9UE5islKN9wJXRFrGihPUeXo5DH06KXsCdKaCmre4P6/raJ3GyXMkEwvKc
	3i05yMo39bL1TcvK7k5e+NqigEDQLmzw66NAJ97pvQ8STWJaZYjI59Rtu1enOBB+cSKL
	8C5nbgue7RM3CrnuEaKJE8xWPKf7lODQyiNM/rgtfC8qfbQb/XWuLQfx5Z6vI3L5Yn7x
	0aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MwlF6Hu6VZmfw+HSwCYXLA3nfmLnV/VRQPuE6TW4SdU=;
	b=NOTy/jlTVaIgq4K4FbPBoUmefqkjsyvKphy2rn0dOdgmh9KYq8DNGLrm+rLD2W0cRr
	KWB2jW/Ll811uwmbQlc2kB/8vA3nR8XH4LmAEWt05bTk2+tdzprMvbdIE+n1WJqp2fES
	gBB59BuuvT25nHEX230ZNLF4n/fmN1OY1TErvA+zsPcit8edQ40iLufwiQSN1G0dXDQB
	Rzy4+706inHCJurmGkELbeFCAKGsGvYyvc9Z7N+ihSKyYc8R4MyHgal388AghMOVmYrf
	+wOby0rI34Eqvw2VBM+4TJRTlhWx++nUb0eatcn3b1QKU5FDToxAUoO7cXdrYA0MKfgO
	eYUQ==
X-Gm-Message-State: APt69E2gxgzLDxRLfzQmGZzKNek1kCPV9B/cmwlxA5YlZI82kwJ5SH8a
	42i/khjJKjgKN2EEewt/HXGetBMvvnsWcMykuMg=
X-Google-Smtp-Source: ADUXVKJypPSqIBX/Jsb1p2eV7/VeHRTm+T9Iq5A5jEm5uCntztRDfmERgDVWwO3xhgduyTvixqza5DUxWoxuiUFZHCk=
X-Received: by 2002:a9d:4609:: with SMTP id
	y9-v6mr1652446ote.259.1528795929506; 
	Tue, 12 Jun 2018 02:32:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 02:32:09
	-0700 (PDT)
In-Reply-To: <CAJTo0LZPfg6AX_1UF08LrnYp=vtQtJZRrRxLpDCtVPC6jEud5Q@mail.gmail.com>
References: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
	<CAJ86T=U9SjuBJ07aNq_ATukCxCQoEuAo6g4mUso6f71W-sU8cA@mail.gmail.com>
	<CAJTo0LZPfg6AX_1UF08LrnYp=vtQtJZRrRxLpDCtVPC6jEud5Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Jun 2018 12:32:09 +0300
Message-ID: <CANNYZj9_ySuHaqHzA8c=Dhbt=fkEnj8eD0HOcRHpyb7RzW4s_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Andrej Valek <andrej.valek@siemens.com>
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
X-List-Received-Date: Tue, 12 Jun 2018 09:32:08 -0000
Content-Type: text/plain; charset="UTF-8"

I would nominate Andrej Valek <andrej.valek@siemens.com> :-)

Being listed in maintainers.inc is indeed not an obligation to fix
other people's specific issues or work on recipe enhancements in
general. Maintainers are expected to act on AUH version upgrade
emails, and look at filed bugs; neither is time consuming.

Alex


2018-06-12 1:17 GMT+03:00 Burton, Ross <ross.burton@intel.com>:
> They get the AUH upgrade mails, and will be the default assignee for
> bugs in triage.
>
> For something like busybox this isn't a huge amount of work.
>
> Ross
>
> On 11 June 2018 at 23:13, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Mon, Jun 11, 2018 at 3:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Do we have anyone willing to take over?
>>
>> Does having a designated maintainer actually achieve anything in practice?
>>
>>> Ross
>>>
>>> On 11 June 2018 at 23:03, Armin Kuster <akuster808@gmail.com> wrote:
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta/conf/distro/include/maintainers.inc | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>>> index 628edac..08d7e1b 100644
>>>> --- a/meta/conf/distro/include/maintainers.inc
>>>> +++ b/meta/conf/distro/include/maintainers.inc
>>>> @@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
>>>>  RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>>  RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>>  RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>> -RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
>>>>  RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
>>>>  RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
>>>>  RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

