Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBD27600F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 23:23:12 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so31435269ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSc+lC6lQK5RWwTq8fFmj2esHmrAqydzpTJW8xVBt5M=;
	b=QrUNY1OTKkWBVG1W8eOdn1Avj6WT2j426Mkg0XAre2uM7B1UPH66iYAUWenP2PzhGn
	5Sx1aXiAKU5HFsAyacDiPLckTMgtylvuOUq1f8BZX0igc0WmMDO492fmTbtKUedAVEGK
	3dfx6nQCLRwNp5dHtfYHGfhtlHDHVxRHOLZjli1CBPVDBR2yiZC8Vr5SJ69jD6f5uypm
	3f+sFGYhHA9eKpMecZapn90EpuzM0qVgWpaoUO8mpi5fsL2NQs+Ri6fIwRj6AxGN9Nnv
	AM6o3d90e3ogY4jWZEMnV2+qY2S/oOZ/aYU0939Csj6tq7u4Gl2Uxx5E4R+H9TIQNM1g
	pIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSc+lC6lQK5RWwTq8fFmj2esHmrAqydzpTJW8xVBt5M=;
	b=MZXdfK3mfiAPUFvM8uO28VhrqqWZizHviFwB48TEu76arl1stdrc5JZv7nueuVkoAw
	8AcNNRQ+ilY4nLobndOAx3wSxgmPve1/tpXSeZHJ7R81r5EtjU4X60qtbuDkPkKWXfja
	y9cxcRb447MWOdm7bxFgtFq5KVjjlZOfKFXF5SrgDK+gzmq9uY9SIoW8GhLroemlCmJo
	8DdMa5xYLbDt4qkwgIs4G5/T67s2tY5+eS2UcR55CIfJSEIlivDsSKvXfEhLS+FPM7Jz
	ZaUBBvjsCpu+0HnhwHXhPaXjAmUYBhusyxPyNflQ/0oiaT4iiltLoeDp0ua6HHSJqkPl
	LFYw==
X-Gm-Message-State: AOUpUlH7FCi1ys9Tkkubv3naIRaugMncWJbB61C/tmbBPaUiuWUBOco8
	uZd9b70bNf5Ib6xaOd9S5TdUHEf53D15OmK9p+c=
X-Google-Smtp-Source: AAOMgpcNC3u9V24n3IZ8SswnG9Iysi1yHYwWAtugQlWaFrUpStXPUvOwHzv7jKuocp9k4yf0XEzu23m5/FOy/9X4FTU=
X-Received: by 2002:a2e:4951:: with SMTP id
	b17-v6mr11132052ljd.67.1531783392802; 
	Mon, 16 Jul 2018 16:23:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 16:22:42
	-0700 (PDT)
In-Reply-To: <CAJ86T=ULkG-857p6d4XMLo+rPxjwQxxK7x20mCkqxRsxSNTAjg@mail.gmail.com>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
	<CAJ86T=ULkG-857p6d4XMLo+rPxjwQxxK7x20mCkqxRsxSNTAjg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 16:22:42 -0700
Message-ID: <CAKmqyKPM+dbsKuF1PinvhVuuQ-ersVygS-R0YW0U=pHbY=D7bw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Mon, 16 Jul 2018 23:23:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 4:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jul 16, 2018 at 3:50 PM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
>> Previously if coredump was enabled in PACKAGECONFIG the user would still
>> need to modify the conf file to enable it. Now the config will be
>> enabled if coredump is enalbed in the PACKAGECONFIG.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>>  2 files changed, 26 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>>
>> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
>> new file mode 100644
>> index 0000000000..4cbc19cdc5
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
>> @@ -0,0 +1,21 @@
>> +#  This file is part of systemd.
>
> If this file is part of systemd, why does it need to be added to
> oe-core? Isn't there a copy somewhere in the systemd source directory
> which could be used?

The file is included by default, but by default the coredump config is disabled.

At first I was modifying the systemd source to enable it but I thought
that this would be a better approach as it allows explicit editing
instead of a diff which needs to be maintained.

>
>> +#  systemd is free software; you can redistribute it and/or modify it
>> +#  under the terms of the GNU Lesser General Public License as published by
>> +#  the Free Software Foundation; either version 2.1 of the License, or
>> +#  (at your option) any later version.
>> +#
>> +# Entries in this file show the compile time defaults.
>> +# You can change settings by editing this file.
>> +# Defaults can be restored by simply deleting this file.
>> +#
>> +# See coredump.conf(5) for details.
>> +
>> +[Coredump]
>> +Storage=external
>> +Compress=yes
>> +ProcessSizeMax=2G
>> +ExternalSizeMax=2G
>> +#JournalSizeMax=767M
>> +#MaxUse=
>> +#KeepFree=
>> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
>> index 3efca33e73..db2848fd65 100644
>> --- a/meta/recipes-core/systemd/systemd_237.bb
>> +++ b/meta/recipes-core/systemd/systemd_237.bb
>> @@ -276,6 +276,11 @@ do_install() {
>>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>                 fi
>>         fi
>> +
>> +  # If coredump was enalbed, enable it in the config
>
> Typo.

Thanks, I'll fix it.

>
>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/
>
> Installing from the meta layer directly to ${D} is not the typical
> approach and may cause unexpected problems (e.g. the recipe won't get
> rebuilt if the file is changed, etc).

What is the preferred approach?

Alistair

>
>> +  fi
>>  }
>>
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

