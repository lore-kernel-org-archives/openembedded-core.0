Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B75256E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:39:02 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f6-v6so2143356plo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zTM9ECV8Cz2ZCXH5bkodfpjXWXwgp2lGkX9s/9V5qKI=;
	b=cP+hJPNpkLjT8Cb8C6HhkRocgEP/XlQbMx0DJzD1P3bYi0Ws7tcaGr3PjJzJCV6ToI
	fli0sIeX0fxHK1U/+BzVEWO9D//nXd96hMoYTkGE9LDq1f0sJ8OY3RKoVF5jyVF4PCh2
	8bVFK+ABB/WAoDnnb5URUQwNEhcD9RzTujc292PNgCEHGcjExOwyaALn0NIv76Gp+wmQ
	mJPDJN2Rb/JPwWrwhqLoSUJlCC0ys5iteUfU2nMHxH4w81j1Jp8fiwxLGKVGyv/Z0L5d
	zA0ZEtnEPVN/Ffdl3gBJxZTCEtqPbwY62U37Q9SrnZvU2ZwNsxYy5433RGJMP4Ree3/K
	zleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zTM9ECV8Cz2ZCXH5bkodfpjXWXwgp2lGkX9s/9V5qKI=;
	b=D9odQQFQn5vF+j7er1YIcQEbPvygCaX2FDRj6y9pAky2Ukq2tqrxXg3vfBNlGHY2up
	IjjhSRJbywgTk4nCS1akoBIveOm9ijiV1EASSYstBTTvjQZrXUEiGvG9hbeXLK4qtiQX
	D+7ZrnxFnRBa8vQ9D82MbQX90lemoIw/RMeQwj4Q/RiHwyVZeF1A3yrU4ElP3VJAvpRS
	PoyWQhShFIsu7UTWSCqc+wqN/IdjQChEZHvmrDzV+yPYL8xmIOIoHCAX9i7ErvHMlYgs
	M9h/a/47JDCxZeCiyX+hlyQcierJe+Bc7RCewHy9rfAjfUCtmfo5uJWqxyPqp3H4z/ko
	VPyg==
X-Gm-Message-State: AOUpUlFFkfozlVfHCAdXj43Q6CCdglLFA/IRHoa28twdCovwPxrgoXEh
	cyMvEpq4tKoRWacECELi4BEN/Wxj
X-Google-Smtp-Source: AAOMgpcNpb32/II8HDezYCtgyeJuUDQPaTyH6kQnd+c9lHj7ZWNOZankYaPOmrGI35bSN2qOIFF1Ag==
X-Received: by 2002:a17:902:1703:: with SMTP id
	i3-v6mr18419182pli.263.1531791543376; 
	Mon, 16 Jul 2018 18:39:03 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:7d41:3be:d05:72ba])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm65367125pfl.126.2018.07.16.18.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:39:02 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	Alistair Francis <alistair23@gmail.com>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
	<CAJ86T=ULkG-857p6d4XMLo+rPxjwQxxK7x20mCkqxRsxSNTAjg@mail.gmail.com>
	<CAKmqyKPM+dbsKuF1PinvhVuuQ-ersVygS-R0YW0U=pHbY=D7bw@mail.gmail.com>
	<CAJ86T=UobqEgPdQWgV0hg4wWyx0ZpvCu0kGtxhvvwXKdvPWv8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <79334d98-d203-ffa7-a5e4-49f905367c08@gmail.com>
Date: Mon, 16 Jul 2018 18:39:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UobqEgPdQWgV0hg4wWyx0ZpvCu0kGtxhvvwXKdvPWv8w@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Enable coredump if it is in PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Jul 2018 01:39:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/16/18 5:00 PM, Andre McCurdy wrote:
> On Mon, Jul 16, 2018 at 4:22 PM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Mon, Jul 16, 2018 at 4:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Jul 16, 2018 at 3:50 PM, Alistair Francis
>>> <alistair.francis@wdc.com> wrote:
>>>> Previously if coredump was enabled in PACKAGECONFIG the user would still
>>>> need to modify the conf file to enable it. Now the config will be
>>>> enabled if coredump is enalbed in the PACKAGECONFIG.
                             ^^^^^^^
another typo

>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>   .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>>>>   meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>>>>   2 files changed, 26 insertions(+)
>>>>   create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
>>>> new file mode 100644
>>>> index 0000000000..4cbc19cdc5
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
>>>> @@ -0,0 +1,21 @@
>>>> +#  This file is part of systemd.
>>>
>>> If this file is part of systemd, why does it need to be added to
>>> oe-core? Isn't there a copy somewhere in the systemd source directory
>>> which could be used?
>>
>> The file is included by default, but by default the coredump config is disabled.
>>
>> At first I was modifying the systemd source to enable it but I thought
>> that this would be a better approach as it allows explicit editing
>> instead of a diff which needs to be maintained.
> 
> A diff doesn't need to maintained until it fails to apply - and then
> it generally NEEDS to be maintained, or at least reviewed.
> 
> If you unconditionally over-write a file then there's not warning when
> your version becomes stale.
> 
> However, if you don't like patching, then an alternative could be to
> use sed, e.g. something like:
> 
>    sed 's/^#\(\(Storage\|Compress\|ProcessSizeMax\|ExternalSizeMax\).*=.*\)/\1/'
> -i ${D}${sysconfdir}/systemd/coredump.conf
> 
>>>> +#  systemd is free software; you can redistribute it and/or modify it
>>>> +#  under the terms of the GNU Lesser General Public License as published by
>>>> +#  the Free Software Foundation; either version 2.1 of the License, or
>>>> +#  (at your option) any later version.
>>>> +#
>>>> +# Entries in this file show the compile time defaults.
>>>> +# You can change settings by editing this file.
>>>> +# Defaults can be restored by simply deleting this file.
>>>> +#
>>>> +# See coredump.conf(5) for details.
>>>> +
>>>> +[Coredump]
>>>> +Storage=external
>>>> +Compress=yes
>>>> +ProcessSizeMax=2G
>>>> +ExternalSizeMax=2G
>>>> +#JournalSizeMax=767M
>>>> +#MaxUse=
>>>> +#KeepFree=

We also need an easy way to make these values configurable during build, 
since machines may not have these kind of resources to offer and would 
like to use smaller value set.

>>>> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
>>>> index 3efca33e73..db2848fd65 100644
>>>> --- a/meta/recipes-core/systemd/systemd_237.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_237.bb
>>>> @@ -276,6 +276,11 @@ do_install() {
>>>>                          chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>>>                  fi
>>>>          fi
>>>> +
>>>> +  # If coredump was enalbed, enable it in the config
>>>
>>> Typo.
>>
>> Thanks, I'll fix it.
>>
>>>
>>>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>>>> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/
>>>
>>> Installing from the meta layer directly to ${D} is not the typical
>>> approach and may cause unexpected problems (e.g. the recipe won't get
>>> rebuilt if the file is changed, etc).
>>
>> What is the preferred approach?
> 
> Add the file the SRC_URI and then install from ${WORKDIR}. There are
> many example of that if you read through recipes in oe-core.
> 
>> Alistair
>>
>>>
>>>> +  fi
>>>>   }
>>>>
>>>>
>>>> --
>>>> 2.17.1
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

