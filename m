Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D59361573
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 01:08:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so26174415wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 17:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=UpBEXR6tXK5dKbn5Nlmh3lcC21M8M23+IZiSg3v+ock=;
	b=PLOYH2AXKtXueG1ELpBuTos1z2+7bvnAa1bugmycJxy13NhxtHk4XJNXMWoZh1bj2/
	mQc4trNwT1MqColMU2pnjee0t2KUfAmoS9ljOlkI1w8BYhttW+cDLXj8wbQBtUt06kCO
	GP6bDvwzM8/NBYktsTDDJfVKJFJ0+Jm2tM7ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UpBEXR6tXK5dKbn5Nlmh3lcC21M8M23+IZiSg3v+ock=;
	b=XP3KaXpmE2H9HZBC7KUqqVdhurOBxPAIQgY7orN7KNQGu3FKfcMPWJMZ0zQ2Xhz+Ut
	w9yeUoo+Z0JgIFPPuNyw3LkWOzEiycS+ijav+gy4XCiAfm6GzzD7TG8g6rFfFIn/NeA7
	Yf0nvvGgVPHBU5JGT41LGa8zGXbiLYXGIP9FhNzpFr2J5d+3A636b7I0b8a49Wsafo7O
	nhmIFmSmjf8AKW5Mm2cW2tdrxKvgGMJvY9U66Ogwc8EbyX8QUp2tYNRNFZu8xNEb4n4T
	M4kx9L6UrUrwGabOE2BgJVgOhVjjd3/+mrgs7CAsRu2Jzi4/gz5cwq+I2SdtMtmf1QzA
	hFjQ==
X-Gm-Message-State: APjAAAVih3Cu9bQnh27c9ZTjpqWyjFOQlYQXAAS7+qWx8Jxo5X/tn1mG
	/xa0h0Uq833fnmyBqJ2GwIPya/068XEykwKi92bn/n4AyJFnDRlvXHneYifv0G18t8pqC7BQSXq
	oiM9b7aufyDgz/GXBhiqNTGiQ5m/v6N1j6Atlf3zxui+twVwqjf70P+rMDEFNU/09di6Q9IrmyF
	tCfHQFnu5ycOjmOs2dHlmS/RJY53o=
X-Google-Smtp-Source: APXvYqznOpAZKYikmcuT1Y2rPwBcOyAZgotcao0eDr3smPYei2hwyVjwsHDJmTqeH26pyIiUaNP8Fg==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr31965642wrr.393.1582074496358; 
	Tue, 18 Feb 2020 17:08:16 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id o77sm736568wme.34.2020.02.18.17.08.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 17:08:15 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20200218224455.14551-1-scott.branden@broadcom.com>
	<20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
	<CAJ86T=XXS=3Mzj3sc_M3UjCar6-+EHR8ZkkA6LJm+VrLsdsXYw@mail.gmail.com>
	<9dde2b9f-e709-a7dd-df85-70af5e720af6@broadcom.com>
Message-ID: <6868a2dc-13c0-dad0-c3ca-ec29ca085d94@broadcom.com>
Date: Tue, 18 Feb 2020 17:08:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9dde2b9f-e709-a7dd-df85-70af5e720af6@broadcom.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 01:08:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2020-02-18 4:26 p.m., Scott Branden wrote:
> Hi Andre,
>
> On 2020-02-18 3:36 p.m., Andre McCurdy wrote:
>> On Tue, Feb 18, 2020 at 3:19 PM Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org 
>>>> <openembedded-core-
>>>> bounces@lists.openembedded.org> On Behalf Of Scott Branden via
>>>> Openembedded-core
>>>> Sent: den 18 februari 2020 23:45
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink 
>>>> support to
>>>> iproute2
>>>>
>>>> Add devlink support to iproute2 recipe.
>>>>
>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>> ---
>>>>   meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> b/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> index fc31b8444e..98793af88e 100644
>>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>>>> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion 
>>>> pkgconfig
>>>>
>>>>   CLEANBROKEN = "1"
>>>>
>>>> -PACKAGECONFIG ??= "tipc elf"
>>>> +PACKAGECONFIG ??= "tipc elf devlink"
>>>>   PACKAGECONFIG[tipc] = ",,libmnl,"
>>>>   PACKAGECONFIG[elf] = ",,elfutils,"
>>>> +PACKAGECONFIG[devlink] = ",,libmnl,"
>>>>
>>>>   EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} 
>>>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>>>> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 
>>>> 'devlink', '', d)}                                               \
>>>>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 
>>>> 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>>> You can simplify the above to:
>>>
>>> EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} 
>>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>>>                  ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', 
>>> d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>>>
>>> but I also recommend to reformat it to make it more readable:
>>>
>>> EXTRA_OEMAKE = "\
>>>      CC='${CC}' \
>>>      KERNEL_INCLUDE=${STAGING_INCDIR} \
>>>      DOCDIR=${docdir}/iproute2 \
>>>      SUBDIRS='lib tc ip bridge misc genl 
>>> ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
>>>      SBINDIR='${base_sbindir}' \
>>>      LIBDIR='${libdir}' \
>>> "
>> You could take the cleanup one step further by merging the recipe and
>> the .inc file (and then including CCOPTS='${CFLAGS}' directly in the
>> definition of EXTRA_OEMAKE).
> Sounds like a more involved change that should be taken up in an 
> unrelated cleanup exercise?
Actually, I see the reason to keep the inc file is so that you can 
support different versions of iproute2 if needed.
Each recipe version would just require the inc file.


