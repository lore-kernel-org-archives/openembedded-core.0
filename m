Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D78878431
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 15:49:08 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id z50so3866057qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EnCyXh6zjbNWHBzGR84xmzpmNCOYGQpDVQgDYvY3/CQ=;
	b=XB9EW5fffKmhK73mUSOSoKgmXzyBXqGZBPsyHLCoGY8qcYf4Lxi3c9ALqaSZNYwpS0
	fgoU+/gqZ7hVe+usKR9UhxOtSGiykkCtDQ0feEgnX0bTuMB4vpRagjT+Pt1sGQaSB4dA
	zhwhmeeLi1i1hOr8kiPxLazM4pHUJ89QX/3mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EnCyXh6zjbNWHBzGR84xmzpmNCOYGQpDVQgDYvY3/CQ=;
	b=EK6/wYu5Sd/dcaebrlF0ZOZlHC498i89bM2k567UHLjCU0A4dJJ674LDRF5cRyfyHe
	OAC74BlSNOZVzR4fXrsp1vNdQW4c7QVNN+bBY4n4XYRQcGboSP495TI3h3DbES0Ezxok
	LSrf7FgC6WQi78hjN0ZngKOVgS7oXIcLns50wmzQkZbiaZ3VrDSxbkUvs/+Z9Qq4ZQ62
	ui4K84tsh6kUFOCOCLxzvsI51AGdZBOKx0otd25jjkq6lWnFND3IBPhCukAuaz26hx2x
	+veI8ZJlLa6Y38H9OutTemkWvmASu1qGnRFSYhsEDl+cPvvVsbm1o7YRmLe7D47EfY8+
	RlxQ==
X-Gm-Message-State: AJaThX4hJXyvyVzEZvjwyw/piClZ30uajHKNaHhnbeFUJD89Hx6MHRP+
	HTH2fZ7eghB6Uy20/gZ7yQAO8D+lbfp2XfczgK8siQ==
X-Google-Smtp-Source: ABhQp+QHcwME4VNUh364RKSkQIAr50YG1ODWueukeul0klFbYFX1PZynJKcTTfKkQRbhfRGkIF7x5qd057rN6Bj5+98=
X-Received: by 10.200.36.86 with SMTP id d22mr1526506qtd.140.1510156149939;
	Wed, 08 Nov 2017 07:49:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.81.81 with HTTP; Wed, 8 Nov 2017 07:48:49 -0800 (PST)
In-Reply-To: <03bbafa0-af61-6f17-44d5-0e3b91219e0b@gmail.com>
References: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
	<03bbafa0-af61-6f17-44d5-0e3b91219e0b@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Nov 2017 16:48:49 +0100
Message-ID: <CAP71WjyFa=7NAAOZC5mJPvWMB5eiJoq=UBn0p3ODP603hWE74A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, ed.bartosh@linux.intel.com
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 08 Nov 2017 15:49:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2017 at 4:46 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/08/2017 03:04 AM, Nicolas Dechesne wrote:
>> From: Artur M=C4=85drzak <artur@madrzak.eu>
>>
>> The WIC's 'part' can now give a name for GPT partition in WKS file.
>> It's similar to '--label', but is naming partintions instead file system=
s.
>> It's required by some bootloaders to partitions have specified names.
>>
>> Backport from master, without it WIC cannot be used on Qualcomm based ma=
chines.
> This is adding new functionality to a stable release.  What other
> machines need this to work?

that's one way to look at it. I am looking at it as "this patch fixes
WIC for my board" ;)

More seriously.. +Ed , who indicated the patch was a good target for
backport on the list already.

>
> - armin
>>
>> Signed-off-by: Artur M=C4=85drzak <artur@madrzak.eu>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 9b60e3466ed7cff0cea10815851eb1304002eb52)
>> ---
>>  scripts/lib/wic/help.py                  |  2 ++
>>  scripts/lib/wic/ksparser.py              |  1 +
>>  scripts/lib/wic/partition.py             |  1 +
>>  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>>  4 files changed, 15 insertions(+)
>>
>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>> index bd9c62e2e8..2ac45e052e 100644
>> --- a/scripts/lib/wic/help.py
>> +++ b/scripts/lib/wic/help.py
>> @@ -970,6 +970,8 @@ DESCRIPTION
>>                              This option cannot be used with --fixed-siz=
e
>>                              option.
>>
>> +         --part-name: This option is specific to wic. It specifies name=
 for GPT partitions.
>> +
>>           --part-type: This option is specific to wic. It specifies part=
ition
>>                        type GUID for GPT partitions.
>>                        List of partition type GUIDS can be found here:
>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>> index 99b66eebc5..7850e81d2f 100644
>> --- a/scripts/lib/wic/ksparser.py
>> +++ b/scripts/lib/wic/ksparser.py
>> @@ -144,6 +144,7 @@ class KickStart():
>>          part.add_argument('--no-table', action=3D'store_true')
>>          part.add_argument('--ondisk', '--ondrive', dest=3D'disk', defau=
lt=3D'sda')
>>          part.add_argument("--overhead-factor", type=3Doverheadtype)
>> +        part.add_argument('--part-name')
>>          part.add_argument('--part-type')
>>          part.add_argument('--rootfs-dir')
>>
>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>> index b623bb9e6d..66e61ba70c 100644
>> --- a/scripts/lib/wic/partition.py
>> +++ b/scripts/lib/wic/partition.py
>> @@ -51,6 +51,7 @@ class Partition():
>>          self.no_table =3D args.no_table
>>          self.num =3D None
>>          self.overhead_factor =3D args.overhead_factor
>> +        self.part_name =3D args.part_name
>>          self.part_type =3D args.part_type
>>          self.rootfs_dir =3D args.rootfs_dir
>>          self.size =3D args.size
>> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/=
plugins/imager/direct.py
>> index 60317eed22..bdb8385620 100644
>> --- a/scripts/lib/wic/plugins/imager/direct.py
>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>> @@ -366,6 +366,10 @@ class PartitionedImage():
>>          for num in range(len(self.partitions)):
>>              part =3D self.partitions[num]
>>
>> +            if self.ptable_format =3D=3D 'msdos' and part.part_name:
>> +                raise WicError("setting custom partition name is not " =
\
>> +                               "implemented for msdos partitions")
>> +
>>              if self.ptable_format =3D=3D 'msdos' and part.part_type:
>>                  # The --part-type can also be implemented for MBR parti=
tions,
>>                  # in which case it would map to the 1-byte "partition t=
ype"
>> @@ -519,6 +523,13 @@ class PartitionedImage():
>>              self._create_partition(self.path, part.type,
>>                                     parted_fs_type, part.start, part.siz=
e_sec)
>>
>> +            if part.part_name:
>> +                logger.debug("partition %d: set name to %s",
>> +                             part.num, part.part_name)
>> +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
>> +                                         (part.num, part.part_name,
>> +                                          self.path), self.native_sysro=
ot)
>> +
>>              if part.part_type:
>>                  logger.debug("partition %d: set type UID to %s",
>>                               part.num, part.part_type)
>

