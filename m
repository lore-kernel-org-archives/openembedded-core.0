Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB4A74983
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 14:11:07 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id e5-v6so20410614lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2id1/q6i16rTi5UCFUvnXKi+QhKT1uz9Ii8QCtYe6nI=;
	b=AiCJxW5iLxy66TIl7hzxHqNzVom6ctyAVCEUuv4bhpf5ln60zcuO55subkcF3iw+Tt
	hz2J1Q9eK57bbC0FaxFyUmc/0FzY7HTTGOa0bdjYhoZrzUwKNLarlTjFiLgULBT7fepz
	DLfGtE208ioVDCXQotF5PQ5JNU5po3dwgSAqfgh2YOV1lODyv3n0hIjyz5LWf/BWl8um
	cxsduZruaYJKqKCvHb53d4GzNGgTWzPrJxu3VD73v4QSqO0LbaKrwwuUeOwF8gCH8zRx
	dm+XUZZn28QI9f/jteqMbuCpRHslWoeHq+oPDwom6Kxhn59jF/kyY3L36MZTflPNGfhv
	unVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2id1/q6i16rTi5UCFUvnXKi+QhKT1uz9Ii8QCtYe6nI=;
	b=mTwDvFocLhgPe4ZNZKccWlYy8gLL+KE1oHvgufnRpNNDvS8rOkJ5O+W+cVdCQNGzZt
	2QEb0rpBSqduLANpaUIPohgvVWnFUFC0trjB5VD5SaKYXPQM+sbzde46K9qcXwXzoQNu
	a2Xy/ADuA1+nFGEujYvisiCU1NI59hyORfZjjEeq6TESt5JzHwF4Thu0/ygOxcCdVtVK
	xT7HcntDIDko7GTnThV+56vIc18WhsYvGRxKPTgvV1mDk3oN/0khrZBjuwfcZ1/8OMtA
	yxvNnSlYNzyAqRD3JvAJtNm0SX3LRPdeBpEjLEOHlFUSLSHErO8nqFecLLDrV+5xBkRi
	QXuQ==
X-Gm-Message-State: ALQs6tAWdqkgcDsowZX+aPy0j+eXrOrSfsAetzfVhFx5zHWBscpeO4QM
	4/GoA/ns1UK9Y/BUixRV+DopThS6rHuyM/l3uuA=
X-Google-Smtp-Source: AIpwx49hxXU63mmAvgiU6viz0KodTp5tzuiZWkzsCmEBsU+1DQhLgPj9KoL/cLVxEJCzjbsB8IxC6dUT2/Q+t0/A8vs=
X-Received: by 10.46.154.145 with SMTP id p17mr8625166lji.28.1522764668378;
	Tue, 03 Apr 2018 07:11:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 07:11:07 -0700 (PDT)
In-Reply-To: <1522763949.11431.235.camel@linuxfoundation.org>
References: <20180403042331.24524-1-net147@gmail.com>
	<CADkTA4PPm8GXxWAEk_yigy-7=xY1-ARfjKJW2CW__qbypDsizQ@mail.gmail.com>
	<1522763949.11431.235.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 10:11:07 -0400
Message-ID: <CADkTA4MU2uOHG8L5SoiSOPrf-r25cnpLy+UTOR=VsDauSMz4eA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 03 Apr 2018 14:11:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 3, 2018 at 9:59 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-04-03 at 08:58 -0400, Bruce Ashfield wrote:
>> On Tue, Apr 3, 2018 at 12:23 AM, Jonathan Liu <net147@gmail.com>
>> wrote:
>> >
>> > Set KBUILD_BUILD_VERSION=1 to avoid build version being incremented
>> > on
>> > every build. It is visible in the output of "cat /proc/version"
>> > after
>> > the hash character.
>> It is possible that someone might actually want this feature, for
>> debug or
>> different build variants.
>>
>> So this would be better as a variable that can be overridden.
>
> Surely users can override it in this form (like the USER/HOST variants
> already there)?

I've never used the user/host variant, so I don't know.

How can you override an exported variable in a shell function in a
bbclass ? I've never tried.

I know for a fact, that I wouldn't want this on by default, hence my comment.

Bruce

>
> Cheers,
>
> Richard



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

