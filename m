Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id F24016FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 01:56:48 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id y10-v6so1746953uao.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 18:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iKkUiD+dFTH0t5ohas28nBYyT/9n0eP4lPrfcQ2pb1s=;
	b=irB20Sfc6haMv4jJs4vc5cYSDDHbnMTDlxWMcKD2sm6wPipxtGeqylPRgpm3WWrMmt
	Wy3M068F12dMAbMXpWd7FddXt+QDu6KNjnGu/V4/3MZS1BMyl5xQMYSHk7IiEn5R07kx
	znqjAAZbJdCqyXI0/C50Z09QGIB6IRtDxx1Ptgtrmz38qeFi4cAVhcKIGcs31vz4nPqf
	u7NFeOrGVVLlndyOPn0QhehJ8djb7EVxzxzIvvdhhjFUy9/Wfl3pODtCFqwOCMyk5/b9
	ykVIO9/HjkMJjhZm/i2F0Qbc3nvQAZ5GHb37Dpx647BJCAt/Se+ebx7Ze5udR3itkeU6
	jXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iKkUiD+dFTH0t5ohas28nBYyT/9n0eP4lPrfcQ2pb1s=;
	b=j2SNu0UJuv6jaHLaebdw1HfICAEB5AecmGxhpzxoxO2SrO/xzFU87c9O+IUFWvSXhq
	8qMWyN/SESKDIc1ajZHZzCfViwUdlagfTP8YsF/7mPOmrykimC+i2XtlEYbjiusuxflk
	YQyuaeSBmqHM9r4Cmq3Si14GUme/iv5r+e1BOrRsrlJuTEq8oGJ3a1/AxE2T1BB6BqTG
	gwR5zG7kyuf/oLH/BCMAouqawr0k2Sa2R4w6cSFz2HUbtSrVLlLu/GX+Fp7j1dQ7zGc5
	R8yCp8SmszQiPj1k0KQT8D7QmyWGzTA0brlrZn2uTsjQLhjBnund0cXXliVUaIbsd79j
	SfWQ==
X-Gm-Message-State: AOUpUlHeyif8tpzG5zsdzJ4qQNPUoDGAeplar0RlPYVy8KHoHHpJj0n4
	hPmg828cYV66677oNgc8k94NFrBhbYV4YOoqb7Q=
X-Google-Smtp-Source: AAOMgpcA3yKZnlLqZrw+ijm07W8Csn89e2mv4UNfiQPKP6N4upTLvnhyBy5MiJa4+WGy1R/Wy649zn8o6ue8D7tKci8=
X-Received: by 2002:a9f:3f8c:: with SMTP id
	k12-v6mr10520193uaj.38.1532397409778; 
	Mon, 23 Jul 2018 18:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 23 Jul 2018 18:56:49 -0700 (PDT)
In-Reply-To: <CAKmqyKNrUdU9wcUH8no9J_XNE=4ztujQ95tap7Zk5HBWv9XT9g@mail.gmail.com>
References: <20180718225304.28673-1-alistair.francis@wdc.com>
	<CAJ86T=XuEUrsb8gZAXmh3m+sXFpU2T=bXqNRhjLYUNCH9DNtDg@mail.gmail.com>
	<CAKmqyKNrUdU9wcUH8no9J_XNE=4ztujQ95tap7Zk5HBWv9XT9g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 23 Jul 2018 18:56:49 -0700
Message-ID: <CAJ86T=WiP390poQ2=7zuedrmfipMY8ojGuFfjcXw_Br8UPktwA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Allow custom coredump config options
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
X-List-Received-Date: Tue, 24 Jul 2018 01:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 23, 2018 at 4:16 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Wed, Jul 18, 2018 at 4:48 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Jul 18, 2018 at 3:53 PM, Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>>> If the user has enabled coredump let's allow them to customise the
>>> config options.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  meta/recipes-core/systemd/systemd_239.bb | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>>> index 7822548993..a625d060a9 100644
>>> --- a/meta/recipes-core/systemd/systemd_239.bb
>>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>>> @@ -279,6 +279,18 @@ do_install() {
>>>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>>                 fi
>>>         fi
>>> +
>>> +  # If coredump was enabled, enable it in the config.
>>> +  # This just sets the default, but can be used to customise the values.
>>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
>>> +    sed 's|#Storage.*|Storage=external|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#Compress.*|Compress=yes|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#ProcessSizeMax.*|ProcessSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#ExternalSizeMax.*|ExternalSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#JournalSizeMax.*|JournalSizeMax=767M|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#MaxUse.*|MaxUse=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>> +    sed 's|#KeepFree.*|KeepFree=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
>>
>> How does this allow the user to customise the config options?
>
> They can edit the sed command line and have different options.

Editing the sed commands won't help users who prefer to customise
their builds via a .bbappend or by over-riding variables from
local.conf.

For users who edit recipes directly, providing a place-holder may not
be very useful either since those users can edit the recipe to their
liking and add any sed commands etc they need anyway. So this change
would be useful to quite a narrow audience.

>> By forcing the options to the _current_ default values you are
>> creating a maintenance problem - ie you'll still be forcing these
>> values even if/when the upstream defaults are changed.
>
> That is a good point, is there a usual way to allow edits to config
> files like this?

There are a few different ways. If an upstream reference config file
is really unusable then it might be OK to patch it from the recipe.

Perhaps the ideal case though is for the configure process to provide
control over any key values etc in the files which get installed. e.g.
instead of shipping and installing a fixed "options.conf" file, the
upstream source would ship an "options.conf.in" file which would get
transformed into "options.conf" as part of running the configure
process, based on configure options or auto detection etc in the
configure script. Configuring a build via configure options is
generally the preferred approach (better than patching or running sed
on output files etc).

