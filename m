Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF3E72F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 19:17:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so3868544wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PF7nWEqex5DiNenV/r3AljE60yvMuWPhlZshJ9tXC2g=;
	b=Kwx3uAlSshCu69RxQs/uHpoJPqwlNqhHKqs8DK9vKJYVX4bcOEXlwi80Uo9TWCzwzR
	p0jg7NTurOPeoNWX8qoRwBK9Gfu0AS/bbG7fNCyjUzNR1wo4sZmQ2Or9nODsuuv4luHL
	PZFjy7K3u9rmvnIDYowX3kapUqzdAYjSEyOIrxr/3LUzdzFLuCcuAl5yYxOKGBSYShLz
	W6ddEE+yQiBFF+7mHu90y5glSgsosAjw0VDEuaHY9whM0nZUrCkwrV/ry5YzbqfIW9xa
	64iIoZPPegjJgByUGw4o/fErNn5msQOE1J4JwjUl5VjNVe/t7BKIXhABjdUq1u65AkGt
	XjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PF7nWEqex5DiNenV/r3AljE60yvMuWPhlZshJ9tXC2g=;
	b=V78kKyL1nP7dsJf525qF1nJGmqtaMXONOVmi+/63PC2qgNwpCzkX4zuRB6+s/Bh8cG
	IbNhGQENZoKp8v51NBilISIrNzfKIzfnPUcbYtPA1bHkUTW3efGHxqc5sJshPraGUO9i
	Lud6NbYk8EVZOAfyymRjgCHRhQagOWsKWTonp61ktEqRqjpJVZ/N7ORHM6KJCpUMv+kL
	KWGfRUUwKjAuWZpJwvxS3Zbg/evOJdiOfsgXBOsEgQObvppnTN6UjEi9mR8gCgDPpzWE
	mPIhX6IqwHKc5oa4/LQaxIf4otMJzrhPWOhCz5/x4qsic3xiG048ZUDvOzr/cb4yUqCz
	21pg==
X-Gm-Message-State: AMke39mS1LrZr0X7HfD6520ApVVO6kbaPM1f0BJliQgJRiWuCqbLxghb6TarJSeNZJ/ErTju1mEfllwzlovEjQ==
X-Received: by 10.28.8.130 with SMTP id 124mr162099wmi.65.1488309475030; Tue,
	28 Feb 2017 11:17:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Tue, 28 Feb 2017 11:17:54 -0800 (PST)
In-Reply-To: <CAMKF1sp+=6Ot3q5PkQN9Cqv95EGPCK5RQ11EkvhGCrTqo9atHA@mail.gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp+=6Ot3q5PkQN9Cqv95EGPCK5RQ11EkvhGCrTqo9atHA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Feb 2017 11:17:54 -0800
Message-ID: <CAJ86T=XYuWtMBwFPrQ6wod7s_Jm6qnpVkek1QQt9i2X8Wks10g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Tue, 28 Feb 2017 19:17:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 5:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jan 27, 2017 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Andre McCurdy (2):
>>   bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
>>   systemd: check "ldconfig" distro feature when setting PACKAGECONFIG
>>
>>  meta/classes/package.bbclass              | 5 +----
>>  meta/conf/bitbake.conf                    | 2 +-
>>  meta/recipes-core/glibc/glibc-package.inc | 9 +++------
>>  meta/recipes-core/systemd/systemd_232.bb  | 2 +-
>>  4 files changed, 6 insertions(+), 12 deletions(-)
>
> This changeset looks good.
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Ping.

>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

