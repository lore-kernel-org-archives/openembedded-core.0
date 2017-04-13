Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9BE77E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:53:46 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j137so4051966vke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gxjVcyPbjviVpp40ls90SnJdchqOX/cZnvVUg38IM6I=;
	b=VzZBDNAoaX5MOFTzNymkMHKrRKRcnRmJfM88o0ddvHs7SxaOVlhtXJWug+Z0P7u8WW
	Ih7FJtMoF2QDMbMtDZdMZXLHr0nb9bJTeGZYsqERvc8Qua8ajWeYbbCjj8trkBjejOvV
	M/PEaun4SnTOGbfpWMTpFd/qUOnniAaG2C7s908KXACTOVi2pm+T/U4CCF98FPAiSB2D
	4YbW7swEgrlxHtjGbdG6ruovvdnGwdPkgkFn/MyfnDjQNjr82MFhD11FkVGCMbjpajUc
	x45frTzsc6eRDKN0bT5eaJeYsRtHiTNkcEIYUWEGCb87gLquex/Xp64/rZCakPmK9iuT
	POEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gxjVcyPbjviVpp40ls90SnJdchqOX/cZnvVUg38IM6I=;
	b=GP6H6XTy2wVtQamtHeYM3ce7Cru+kCWNfA2BuiIm5fpzttpQFwV0YzxGA3uxX672AC
	8JQNrwBq5e9DcQ/OzON65LzPo1CvFbJuw6umZzSvtN3abX3YqSJo57g/9zFDIxg5slS7
	xlDc3KzitQOkG1b3y96d91pwVnPRtNFYAYKjXKzDM9cPJgqFNMMgqkgJQr4t9sRMX7U6
	Uva9ltBf0a6OUJ8xPe4gBcO5IP9PPriWg9oyjXwtndAYv8I1liUVeFKITNoe/9wvQ0Yy
	GMSEDnxAhITLiixxtY83uxKXdXxYvrz7xgUG2R7gdzATf9dAyl8t/duZVO6Ki5eD+Veo
	tJXg==
X-Gm-Message-State: AN3rC/7MJ1JXgqSwIm7otyQ8SPHAM+1d6Z5vaHdi/ZKgSecmv9mq46Wc
	Ql0e5WPgYALy1h9Xll4Az6qLRim8Xw==
X-Received: by 10.31.3.9 with SMTP id 9mr1282397vkd.64.1492098827301; Thu, 13
	Apr 2017 08:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Thu, 13 Apr 2017 08:53:46 -0700 (PDT)
In-Reply-To: <CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 13 Apr 2017 17:53:46 +0200
Message-ID: <CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 15:53:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 5:49 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Some recipes like firefox depend on unzip even outside the do_unpack task=
:
> https://github.com/OSSystems/meta-browser/commit/1e9c2d21cd4757b8d2352c2f=
f5aa72f3409d59f9
> https://github.com/OSSystems/meta-browser/commit/bd2c39ddba00a3e0171e30ee=
4a4585b56122990a
>
> but I agree these cases should be fixed by DEPENDS in the recipes which n=
eed
> it instead of adding unzip globally for all.
>
> On Thu, Apr 13, 2017 at 5:47 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
>>
>>
>> On Thu, Apr 13, 2017 at 8:44 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> fixes do_unpack for *.zip-files:
>>>
>>> | /bin/sh: unzip: command not found
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  meta/conf/bitbake.conf | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index af3937a..1ea0dea 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -461,7 +461,7 @@ HOSTTOOLS +=3D " \
>>>      mktemp mv nm objcopy objdump od patch perl pod2man printf pwd pyth=
on
>>> \
>>>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
>>> sleep \
>>>      sort split stat strings strip tail tar tee test touch tr true unam=
e
>>> uniq \
>>> -    wc wget which xargs \
>>> +    unzip wc wget which xargs \
>>>  "
>>
>>
>> unzip-native is already added to the depends of do_unpack in
>> base.bbclass.. there should be no need to use an unzip on the host at al=
l.
OK - but why do I see this error in do_unpack?

Andreas

