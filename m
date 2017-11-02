Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5464560685
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:16:09 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 8so5737145qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7EIQVqnBoJHt5PWh99E82ILP9LBXxEnZ34OlrGXz3Xs=;
	b=DrEZIOQhOPX3+SSCZ8cIUAml20GR5IcZx1HsPFku0i/IwmFXyXjGVrfAagqqeLgL9B
	MV6DFr7o1lplmZ3BXdqq4uNB0BoKr5i3e+iv+oaujNJ6s9MKuloaG1FNFp1eiAgEuAFj
	xyQDYsj6xP8cWRqkz0u4H/EWzMNe2d4kF9ka4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7EIQVqnBoJHt5PWh99E82ILP9LBXxEnZ34OlrGXz3Xs=;
	b=Stb+tl8Sx9BkEYAj23eYM3it5h25EbMhTYOXHbTXQwDqPM2KwakHowfFfsV+F7fldn
	EQogLpmLfIJN+u6lRVr7YAnsQo2x03rkzwGl4KMJPPMwJM+SAZkzZRi5m56bj3MeGd8A
	HSwQfjxllypYJvxzYm1k1/wWMQFR/JUDrxhL9vs61EfVDK0smOi/b9TbDOqtrDZF5LrM
	tL4qjbU2JeE78SG7QmBHMCdSpAmoHwiHF+8tWrnuUwudNayxQ541X2nIUUa7ElJKvQ2b
	HfAApfGEUVhDZXEHGzYSqvoydghQ396NX6SVH9rJEbD1gDE9/8z/P4KLICvms9/n6hsE
	yfPw==
X-Gm-Message-State: AMCzsaVvh7DkOGdMxhcRNYzXGJqHjGFHU47l/qDFw21dAT/wcmuCmS+x
	AtwJtVfrUxop8f+yQ8fwIn30p8seH7FzgBrTcaP/8Bfx
X-Google-Smtp-Source: ABhQp+TNiC0pn74qJb9TzOjO0oO4BoaINlKU1K2XZByOGdlRelJfbiDGQIgZn25d0us0QEu1pYEh389LuNsaeY1PMLc=
X-Received: by 10.200.46.22 with SMTP id r22mr3953447qta.63.1509617770855;
	Thu, 02 Nov 2017 03:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.81 with HTTP; Thu, 2 Nov 2017 03:15:50 -0700 (PDT)
In-Reply-To: <aeb0b30f-3399-6a67-51fa-7cdc21db84bb@madrzak.eu>
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
	<20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
	<CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
	<20171101124808.2gc5nswcombvrcuf@linux.intel.com>
	<aeb0b30f-3399-6a67-51fa-7cdc21db84bb@madrzak.eu>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 2 Nov 2017 11:15:50 +0100
Message-ID: <CAP71WjzpDNmLwyVu8vcVzyeQzv1dZuZkSPmC=e1nuuC2hS_4SQ@mail.gmail.com>
To: =?UTF-8?Q?Artur_M=C4=85drzak?= <artur@madrzak.eu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Thu, 02 Nov 2017 10:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2017 at 11:01 AM, Artur M=C4=85drzak <artur@madrzak.eu> wrot=
e:
>
> Hi again,
>
> May I ask you to merge attached patch? I'm sorry I'm not sending it accor=
ding to the guide, but I don't know why list doesn't accept my emails sent =
via git send-email(can receive emails if send to my different e-mail addres=
s). If I place patch manually, then patchwork complain. The patch is on top=
 of openembedded-core 3b413a8057 (head of master).

I will test it our locally, and resend for you.

>
>
> Thanks and sorry for inconvenience.
> Artur M=C4=85drzak
>
> W dniu 01.11.2017 o 13:48, Ed Bartosh pisze:
>
>> On Tue, Oct 31, 2017 at 04:08:58PM +0100, Nicolas Dechesne wrote:
>>>
>>> On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh <ed.bartosh@linux.intel.com=
> wrote:
>>>>
>>>>
>>>> On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur M=C4=85drzak wrote:
>>>>>
>>>>> The WIC's 'part' can now give a name for GPT partition in WKS file.
>>>>> It's similar to '--label', but is naming partitions instead file syst=
ems.
>>>>> It's required by some bootloaders to partitions have specified names.
>>>>>
>>>>
>>>> Thank you for the patch!
>>>>
>>>> +1
>>>
>>>
>>> Yes, +1 from me as well. The context of this patch is for the Qualcomm
>>> SoC based board that have *interesting* bootloaders requirements, one
>>> of them being to look for partition by their names.
>>>
>>> Patchwork complained about the patch, so Artur, please address these
>>> comments and resend the patch.
>>>
>>> Ed: do you think this can be backported to previous release branches?
>>> The lack of --part-name on previous releases make WIC unusable for us.
>>> The backport is not trivial since many changes have happened, but
>>> Artur has a equivalent patch for morty at least.
>>>
>>
>> Yes, I think it can be backported. It shouldn't be hard to do especially
>> if there is a patch for morty. Just go ahead and send it for review. It
>> would be a good first step in this direction.
>>
>>>
>>>>
>>>>
>>>>> Signed-off-by: Artur M=C4=85drzak <artur@madrzak.eu>
>>>>> ---
>>>>>   scripts/lib/wic/help.py                  |  2 ++
>>>>>   scripts/lib/wic/ksparser.py              |  1 +
>>>>>   scripts/lib/wic/partition.py             |  1 +
>>>>>   scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>>>>>   4 files changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>>>>> index bd9c62e2e8..2ac45e052e 100644
>>>>> --- a/scripts/lib/wic/help.py
>>>>> +++ b/scripts/lib/wic/help.py
>>>>> @@ -970,6 +970,8 @@ DESCRIPTION
>>>>>                               This option cannot be used with --fixed=
-size
>>>>>                               option.
>>>>>
>>>>> +         --part-name: This option is specific to wic. It specifies n=
ame for
>>>>> GPT partitions.
>>>>> +
>>>>>            --part-type: This option is specific to wic. It specifies
>>>>> partition
>>>>>                         type GUID for GPT partitions.
>>>>>                         List of partition type GUIDS can be found her=
e:
>>>>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.p=
y
>>>>> index 99b66eebc5..7850e81d2f 100644
>>>>> --- a/scripts/lib/wic/ksparser.py
>>>>> +++ b/scripts/lib/wic/ksparser.py
>>>>> @@ -144,6 +144,7 @@ class KickStart():
>>>>>           part.add_argument('--no-table', action=3D'store_true')
>>>>>           part.add_argument('--ondisk', '--ondrive', dest=3D'disk',
>>>>> default=3D'sda')
>>>>>           part.add_argument("--overhead-factor", type=3Doverheadtype)
>>>>> +        part.add_argument('--part-name')
>>>>>           part.add_argument('--part-type')
>>>>>           part.add_argument('--rootfs-dir')
>>>>>
>>>>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition=
.py
>>>>> index b623bb9e6d..66e61ba70c 100644
>>>>> --- a/scripts/lib/wic/partition.py
>>>>> +++ b/scripts/lib/wic/partition.py
>>>>> @@ -51,6 +51,7 @@ class Partition():
>>>>>           self.no_table =3D args.no_table
>>>>>           self.num =3D None
>>>>>           self.overhead_factor =3D args.overhead_factor
>>>>> +        self.part_name =3D args.part_name
>>>>>           self.part_type =3D args.part_type
>>>>>           self.rootfs_dir =3D args.rootfs_dir
>>>>>           self.size =3D args.size
>>>>> diff --git a/scripts/lib/wic/plugins/imager/direct.py
>>>>> b/scripts/lib/wic/plugins/imager/direct.py
>>>>> index 60317eed22..bdb8385620 100644
>>>>> --- a/scripts/lib/wic/plugins/imager/direct.py
>>>>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>>>>> @@ -366,6 +366,10 @@ class PartitionedImage():
>>>>>           for num in range(len(self.partitions)):
>>>>>               part =3D self.partitions[num]
>>>>>
>>>>> +            if self.ptable_format =3D=3D 'msdos' and part.part_name:
>>>>> +                raise WicError("setting custom partition name is not=
 " \
>>>>> +                               "implemented for msdos partitions")
>>>>> +
>>>>>               if self.ptable_format =3D=3D 'msdos' and part.part_type=
:
>>>>>                   # The --part-type can also be implemented for MBR
>>>>> partitions,
>>>>>                   # in which case it would map to the 1-byte "partiti=
on type"
>>>>> @@ -519,6 +523,13 @@ class PartitionedImage():
>>>>>               self._create_partition(self.path, part.type,
>>>>>                                      parted_fs_type, part.start,
>>>>> part.size_sec)
>>>>>
>>>>> +            if part.part_name:
>>>>> +                logger.debug("partition %d: set name to %s",
>>>>> +                             part.num, part.part_name)
>>>>> +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % =
\
>>>>> +                                         (part.num, part.part_name,
>>>>> +                                          self.path), self.native_sy=
sroot)
>>>>> +
>>>>>               if part.part_type:
>>>>>                   logger.debug("partition %d: set type UID to %s",
>>>>>                                part.num, part.part_type)
>>>>> --
>>>>> 2.13.6
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>> --
>>>> --
>>>> Regards,
>>>> Ed
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> Regards,
>> Ed
>>

