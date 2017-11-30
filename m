Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4D13578448
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 16:20:56 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 9so14049087wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hBtqIP0KDjlvss+TrlqRt5i6HKsIT5p34QoyYHy8jCY=;
	b=Fyfd34GP6tFvH1H+h5LysyqpXVlZ4XqdhBUXvAE6J49UZADGdc2e2ud9jI2M8K1bq+
	HsjRJ/DGO1iJo5t95VKKrLHh9A6D3z+PCz1GTf1eokaoqql2HxHK07kS9+sWndnUPF9F
	kKG8dkVVKq5HNFqo+Y3XdpoHCCt+adqoR0EO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hBtqIP0KDjlvss+TrlqRt5i6HKsIT5p34QoyYHy8jCY=;
	b=msp7DE1Vt9tCPI25LIeXuG/0CwI7eT0isWDsJdAQznCABQStLjpgsrJ6WBIY2ZxcFm
	uDPyHIK5QY8+drP/Al0uA9dyYNd+OjtsK/VnQE+uVcVa1bmDfAkUVF44j0Gqkq8dLqw3
	rUoyrocz1asVB/9ekSn6FpPSXqP69rPN4oE7CVM+QbJsKlL6xV3x//sRt5wpV0ccLD4R
	BrBjJyMeBXQNW0+MGLrRSWnXc7mfe6BNonjUOHZfQIoP8QO8+boCg5LhKwo6albwfSHX
	Q6qSElgnfzjOVPXwyD8y2Wvb0DnZgDG1L9N4e3C8wmkz5YvebmWuZwjjp3tHW373zX0i
	xIcg==
X-Gm-Message-State: AJaThX5f88k9uFM65gb66cmP7OOh0+skhvds6nM8ZIwL6sdJpubFN67C
	LaPqwUQqcLlXeyTavNdojkYtNVfYV/daJxYT/LCIgQ==
X-Google-Smtp-Source: AGs4zMa6hY8bKkVeyg9kiZhLXrPo0xsy9eY61nwRhCu2TVJwWpWL0UrDy09DwlQI0puI9dskOci9yjjBMB0rTHwiaEA=
X-Received: by 10.28.69.8 with SMTP id s8mr1036585wma.65.1512058856970; Thu,
	30 Nov 2017 08:20:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.42 with HTTP; Thu, 30 Nov 2017 08:20:36 -0800 (PST)
In-Reply-To: <CAP71WjyFa=7NAAOZC5mJPvWMB5eiJoq=UBn0p3ODP603hWE74A@mail.gmail.com>
References: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
	<03bbafa0-af61-6f17-44d5-0e3b91219e0b@gmail.com>
	<CAP71WjyFa=7NAAOZC5mJPvWMB5eiJoq=UBn0p3ODP603hWE74A@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 30 Nov 2017 17:20:36 +0100
Message-ID: <CAP71WjxxCE1FpDBohsLMvMUHO1jSESyDiztMsEjJ2LH4QUQG6w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, ed.bartosh@linux.intel.com
Cc: =?UTF-8?Q?Artur_M=C4=85drzak?= <artur@madrzak.eu>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Thu, 30 Nov 2017 16:20:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2017 at 4:48 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Wed, Nov 8, 2017 at 4:46 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 11/08/2017 03:04 AM, Nicolas Dechesne wrote:
>>> From: Artur M=C4=85drzak <artur@madrzak.eu>
>>>
>>> The WIC's 'part' can now give a name for GPT partition in WKS file.
>>> It's similar to '--label', but is naming partintions instead file syste=
ms.
>>> It's required by some bootloaders to partitions have specified names.
>>>
>>> Backport from master, without it WIC cannot be used on Qualcomm based m=
achines.
>> This is adding new functionality to a stable release.  What other
>> machines need this to work?
>
> that's one way to look at it. I am looking at it as "this patch fixes
> WIC for my board" ;)
>
> More seriously.. +Ed , who indicated the patch was a good target for
> backport on the list already.

back on this topic. Any chance to get this WIC patch into rocko?

>
>>
>> - armin
>>>
>>> Signed-off-by: Artur M=C4=85drzak <artur@madrzak.eu>
>>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 9b60e3466ed7cff0cea10815851eb1304002eb52)
>>> ---
>>>  scripts/lib/wic/help.py                  |  2 ++
>>>  scripts/lib/wic/ksparser.py              |  1 +
>>>  scripts/lib/wic/partition.py             |  1 +
>>>  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>>>  4 files changed, 15 insertions(+)
>>>
>>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>>> index bd9c62e2e8..2ac45e052e 100644
>>> --- a/scripts/lib/wic/help.py
>>> +++ b/scripts/lib/wic/help.py
>>> @@ -970,6 +970,8 @@ DESCRIPTION
>>>                              This option cannot be used with --fixed-si=
ze
>>>                              option.
>>>
>>> +         --part-name: This option is specific to wic. It specifies nam=
e for GPT partitions.
>>> +
>>>           --part-type: This option is specific to wic. It specifies par=
tition
>>>                        type GUID for GPT partitions.
>>>                        List of partition type GUIDS can be found here:
>>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>>> index 99b66eebc5..7850e81d2f 100644
>>> --- a/scripts/lib/wic/ksparser.py
>>> +++ b/scripts/lib/wic/ksparser.py
>>> @@ -144,6 +144,7 @@ class KickStart():
>>>          part.add_argument('--no-table', action=3D'store_true')
>>>          part.add_argument('--ondisk', '--ondrive', dest=3D'disk', defa=
ult=3D'sda')
>>>          part.add_argument("--overhead-factor", type=3Doverheadtype)
>>> +        part.add_argument('--part-name')
>>>          part.add_argument('--part-type')
>>>          part.add_argument('--rootfs-dir')
>>>
>>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.p=
y
>>> index b623bb9e6d..66e61ba70c 100644
>>> --- a/scripts/lib/wic/partition.py
>>> +++ b/scripts/lib/wic/partition.py
>>> @@ -51,6 +51,7 @@ class Partition():
>>>          self.no_table =3D args.no_table
>>>          self.num =3D None
>>>          self.overhead_factor =3D args.overhead_factor
>>> +        self.part_name =3D args.part_name
>>>          self.part_type =3D args.part_type
>>>          self.rootfs_dir =3D args.rootfs_dir
>>>          self.size =3D args.size
>>> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic=
/plugins/imager/direct.py
>>> index 60317eed22..bdb8385620 100644
>>> --- a/scripts/lib/wic/plugins/imager/direct.py
>>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>>> @@ -366,6 +366,10 @@ class PartitionedImage():
>>>          for num in range(len(self.partitions)):
>>>              part =3D self.partitions[num]
>>>
>>> +            if self.ptable_format =3D=3D 'msdos' and part.part_name:
>>> +                raise WicError("setting custom partition name is not "=
 \
>>> +                               "implemented for msdos partitions")
>>> +
>>>              if self.ptable_format =3D=3D 'msdos' and part.part_type:
>>>                  # The --part-type can also be implemented for MBR part=
itions,
>>>                  # in which case it would map to the 1-byte "partition =
type"
>>> @@ -519,6 +523,13 @@ class PartitionedImage():
>>>              self._create_partition(self.path, part.type,
>>>                                     parted_fs_type, part.start, part.si=
ze_sec)
>>>
>>> +            if part.part_name:
>>> +                logger.debug("partition %d: set name to %s",
>>> +                             part.num, part.part_name)
>>> +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
>>> +                                         (part.num, part.part_name,
>>> +                                          self.path), self.native_sysr=
oot)
>>> +
>>>              if part.part_type:
>>>                  logger.debug("partition %d: set type UID to %s",
>>>                               part.num, part.part_type)
>>

