Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3C70B6FAC8;
	Wed,  2 Apr 2014 17:28:20 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lh14so775487vcb.34
	for <multiple recipients>; Wed, 02 Apr 2014 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lJTE4a6zxGAuiHeNHSkpqw7CQm+tUrXL+AdhQk2Uvxs=;
	b=Hok1JGE//qEplPS9qWd+FHEacZmNPJ+sIPcrYhykQOvt1q76VG4twGarKFiTX6NxjD
	GSWfrpGHaZe7vE/PDYLGvBZUGcHSYEVtTUnWRbvQYwq+2HgdNgfg8wegO5RryYZkkh6v
	vKSBfqFD/esXN6f0CZ1WaNNCpZVXNiUJ2yUXVz9bLg7v7zA5JA61jjZXGZLNHfhdTG/p
	aZmLW2yr0HBK4GLSuUS9pud3IlwDvbwTa5pLgfNGTtdFcLuF6pYJB49vdbTBEKwVZqXn
	XuGqY2dLs/eV8UkDqV4OlOEyFqJeewdEN0k6KnO7cjhXL656vJ8AiKZAvEb+EyWfrZ9W
	4oDA==
X-Received: by 10.52.171.115 with SMTP id at19mr1895453vdc.48.1396459701518;
	Wed, 02 Apr 2014 10:28:21 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 2 Apr 2014 10:27:40 -0700 (PDT)
In-Reply-To: <CAMKF1sorF5M0oxq9gaZEDeV5Td2pydEE0zZjqJdM8n0hyGbuyQ@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
	<CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
	<CAMKF1spno7Np8FXr3JXw3_W72+vRkchzZ8J5X+3e4RCFY+6nLg@mail.gmail.com>
	<CANyK_8f_V247P1UWaeG-7YwBq4MrHQ=+69NOgW8LUZ4_Xgx2qA@mail.gmail.com>
	<CAP9ODKp-+31rJmK6uY1QA6nvG4hDuNT79JVeeivY5XeOCu2etw@mail.gmail.com>
	<CAMKF1sqOCs_OYkZU2ng9FmViPyJx1AjdViSquZWzbgFT=XZdoA@mail.gmail.com>
	<CANyK_8fC4kkDgqovwuTx5kN0Y2hcyDT7HStii4hxz_CN3D=atA@mail.gmail.com>
	<CAMKF1sorF5M0oxq9gaZEDeV5Td2pydEE0zZjqJdM8n0hyGbuyQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 18:27:40 +0100
X-Google-Sender-Auth: iGHKUVnyANwBlVQQPlQ5WRPR_IU
Message-ID: <CANyK_8caB3XLyY5QvDdDGF5i8kQbN7GV+zBz1x7OzxkzV7P6mg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Wed, 02 Apr 2014 17:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 April 2014 18:13, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Apr 2, 2014 at 10:03 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> You've fixed util-linux in a different way to me, I added qsort_r to
>> musl
>
> this won't fly in musl community.
>
> whereas you've removed it's use from util-linux. I'm not bothered
>> which one we use if both work. We do now have 4 people looking at
>> util-linux fixes: Me, you and Robert Yang (as util-linux-native
>> doesn't build on Centos 5.10 due to the same qsort_r usage) here in
>> oe-core and Karel Zak from upstream (as they want to fix it for their
>> next release). I think we need to pick one fix (probably yours if it's
>> tested and working in another distro) and get it applied to oe-core
>> master.
>
> yes, I think not using qsort_r is common solution for all these issues.

Ok, sounds good. Could we split this out and send it to the mailing
list on its own for now? It's much better than the patch that's
currently in oe-core.

>
>>
>> Your latest commit "glibc-2.0: Fix build issues that arise on musl"
>> should say glib not glibc. Other than that, your glib fix is better
>> than mine (I did add <string.h> but didn't add the
>> '--with-libiconv=gnu' option, instead I set musl as the provider of
>> virtual/libiconv).
>
> in order to build a lot of software we would need some sort of iconv
> implementation
> letting musl to provide it is probably ok too but I wanted  to take
> the tested path to get
> to an image to build and then we have a known baseline and we could
> experiment more.

I'd like to see both as options but I agree we should get an image
working in the simplest way possible first.

I'm really impressed with how fast this is moving forward so don't
take my comments as in any way negative!

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

