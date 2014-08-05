Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 44C8360017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 20:09:45 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so1013233yho.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=52uyRVTAMsdbm32Kzl0KPKSrOT65uljuCdOVfHNtOqs=;
	b=FYpy2nVm/LIWEHNp5MY/beK/XbBBvAqzeV5cbArbIJzQftel8/FbDQ8IIeutzyoOz9
	qUkfxanHhjuNWNeumTPFa1onrOGA39aKxBCYIdA/pSaHa1+tz3RMDVW2umRN9TlKsoHF
	0qN3TGnNxyhMKZsKBUyaKNrf42f2geO/MWZ4h3NC8BeBxklhFKbQVzub19wdGFkjCzny
	iu61+zZ/c4z3Tu9/3Xv9l3eM+Z5rdGsNmOdcqKCHJkuqDymKqV6MUAsug+v0qGUqdYwI
	rtxvX3eZyxXWBwomM8oxRqqJ1R6XjdrF4y0hiFz/SQdxyFvoiHnSaCgmUXp1Qyb/07yl
	rWhg==
MIME-Version: 1.0
X-Received: by 10.236.216.16 with SMTP id f16mr9535633yhp.90.1407269386985;
	Tue, 05 Aug 2014 13:09:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Tue, 5 Aug 2014 13:09:46 -0700 (PDT)
In-Reply-To: <53E129D4.3050402@windriver.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
	<53E129D4.3050402@windriver.com>
Date: Tue, 5 Aug 2014 17:09:46 -0300
X-Google-Sender-Auth: Wm3CgUygWY_w1Bh3WXAb5CQnhPk
Message-ID: <CAP9ODKqt79-1XkYDi01Wn-ZT5f13e4s=BhF08=zj8B==Hcjkpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Tue, 05 Aug 2014 20:09:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 5, 2014 at 4:00 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 14-08-04 02:40 PM, Ben Shelton wrote:
>>
>> From: Richard Tollerton <rich.tollerton@ni.com>
>>
>> $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
>> its size to ~5k.
>>
>> Natinst-Rally-ID: TA44427
>> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
>> Natinst-ReviewBoard-ID: 58620
>
>
>
> This is a good series of patches; thanks for sending them.
>
> It would be nice if you could remove your company's ID tags
> from the commit log. For example, you create and use could use
> a YP bugzilla ID ( https://bugzilla.yoctoproject.org/ ) and
> then match that up in your internal process.

I don't think we should ask for this. I saw several of us to include
Id tags in past commits (I also did) and I think it is fine. We
shouldn't ask an extra step for people to be able to track it (open a
YP bugzilla ID issue for example).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

