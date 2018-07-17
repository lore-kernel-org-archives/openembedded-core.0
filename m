Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC12574F78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 00:00:51 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id q12-v6so26013933ual.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ez+jhoDVHNM7IM07g0YHkgyE1K8cPvfsxawXvmKV9QE=;
	b=W8vZuq+k4MakNKFS59B60nPNm2a1e47qKOlemiO6y/FTeoBD+u+pt8ksUj9S2rdaey
	gFrQFDSVlt/H6Qykrua5Vn1GaPguq4/k5K0VKutnhTLU8LmfRtU3BlWLVFyGmUuc8p/P
	xM+gYw57n3mWv12EU0zrNWvXsnDQjc259kJgzICZxGQjE+VDVsikgTq2QOAbTb5i5lQm
	ckppON3NnXBJIFQ6IzAbyTSu2AgoG/ZVOwRCE19DhrChnO0XEQvEXUjqrt8bh01HRks2
	5gSwKvhCdjaR+VWWr9x9Onbk1cLGTnMNEEFFpX+/bNNWUjBBpejxY0gV2LJL9n07SOR0
	jSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ez+jhoDVHNM7IM07g0YHkgyE1K8cPvfsxawXvmKV9QE=;
	b=DZbnCNpSqstDSnRhz7fbsFU7wmEnMo4YzAy04JbKPYe+Zq1JiCmOJ+LfjyUhslvFhw
	9j6ajqP3OjAXFivufBeJyXnaZJ+NOS/XLyRKe+x5QpcGL5kNnO00keipfw0+CAPCeqGL
	QUhAl0ewINhndHGpUxqng73CJHEvwo4loRinXrNNE771dKLDYJQ48E6HRqjajApCxXyY
	9R9bzmiRQdBHCl5fk7egNfL2Kd5m7KorKqZNq5flf8BrxZDbdSC1qC0/oJxqZRXags5c
	Cklg/jDdw1LBeDGU8YpVhV3PUgeDVh06PpQ7jtRGPYMp0W6I2hTiUjEYmhEtS6K6CMVd
	Uxsg==
X-Gm-Message-State: AOUpUlFaotKo2YfPfOeU/1WOtch9bvzAMGd1JppPk928veT/SwSoBwda
	meehp3snioQW+u6NXPE+ZAr+n6dv4geYQKgLpic=
X-Google-Smtp-Source: AAOMgpeZsbe9TUgTbJqWF4ZXErz/3QhY5bACK477y6tB5/GK4DbmsVYfnPexHr13YUwulNPrE61BLS1iDmk2Xs6Gc80=
X-Received: by 2002:ab0:6654:: with SMTP id
	b20-v6mr2725428uaq.193.1531785652597; 
	Mon, 16 Jul 2018 17:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 17:00:52 -0700 (PDT)
In-Reply-To: <CAKmqyKPM+dbsKuF1PinvhVuuQ-ersVygS-R0YW0U=pHbY=D7bw@mail.gmail.com>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
	<CAJ86T=ULkG-857p6d4XMLo+rPxjwQxxK7x20mCkqxRsxSNTAjg@mail.gmail.com>
	<CAKmqyKPM+dbsKuF1PinvhVuuQ-ersVygS-R0YW0U=pHbY=D7bw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 16 Jul 2018 17:00:52 -0700
Message-ID: <CAJ86T=UobqEgPdQWgV0hg4wWyx0ZpvCu0kGtxhvvwXKdvPWv8w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 00:00:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 4:22 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Mon, Jul 16, 2018 at 4:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Mon, Jul 16, 2018 at 3:50 PM, Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>>> Previously if coredump was enabled in PACKAGECONFIG the user would still
>>> need to modify the conf file to enable it. Now the config will be
>>> enabled if coredump is enalbed in the PACKAGECONFIG.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>>>  meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>>>  2 files changed, 26 insertions(+)
>>>  create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
>>> new file mode 100644
>>> index 0000000000..4cbc19cdc5
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
>>> @@ -0,0 +1,21 @@
>>> +#  This file is part of systemd.
>>
>> If this file is part of systemd, why does it need to be added to
>> oe-core? Isn't there a copy somewhere in the systemd source directory
>> which could be used?
>
> The file is included by default, but by default the coredump config is disabled.
>
> At first I was modifying the systemd source to enable it but I thought
> that this would be a better approach as it allows explicit editing
> instead of a diff which needs to be maintained.

A diff doesn't need to maintained until it fails to apply - and then
it generally NEEDS to be maintained, or at least reviewed.

If you unconditionally over-write a file then there's not warning when
your version becomes stale.

However, if you don't like patching, then an alternative could be to
use sed, e.g. something like:

  sed 's/^#\(\(Storage\|Compress\|ProcessSizeMax\|ExternalSizeMax\).*=.*\)/\1/'
-i ${D}${sysconfdir}/systemd/coredump.conf

>>> +#  systemd is free software; you can redistribute it and/or modify it
>>> +#  under the terms of the GNU Lesser General Public License as published by
>>> +#  the Free Software Foundation; either version 2.1 of the License, or
>>> +#  (at your option) any later version.
>>> +#
>>> +# Entries in this file show the compile time defaults.
>>> +# You can change settings by editing this file.
>>> +# Defaults can be restored by simply deleting this file.
>>> +#
>>> +# See coredump.conf(5) for details.
>>> +
>>> +[Coredump]
>>> +Storage=external
>>> +Compress=yes
>>> +ProcessSizeMax=2G
>>> +ExternalSizeMax=2G
>>> +#JournalSizeMax=767M
>>> +#MaxUse=
>>> +#KeepFree=
>>> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
>>> index 3efca33e73..db2848fd65 100644
>>> --- a/meta/recipes-core/systemd/systemd_237.bb
>>> +++ b/meta/recipes-core/systemd/systemd_237.bb
>>> @@ -276,6 +276,11 @@ do_install() {
>>>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>>                 fi
>>>         fi
>>> +
>>> +  # If coredump was enalbed, enable it in the config
>>
>> Typo.
>
> Thanks, I'll fix it.
>
>>
>>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>>> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/
>>
>> Installing from the meta layer directly to ${D} is not the typical
>> approach and may cause unexpected problems (e.g. the recipe won't get
>> rebuilt if the file is changed, etc).
>
> What is the preferred approach?

Add the file the SRC_URI and then install from ${WORKDIR}. There are
many example of that if you read through recipes in oe-core.

> Alistair
>
>>
>>> +  fi
>>>  }
>>>
>>>
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

