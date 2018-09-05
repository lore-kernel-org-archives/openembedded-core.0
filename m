Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC12F74703
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 20:25:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u24-v6so4033435pfn.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=7vhJav3YZB53ZLLzc3Ml+ySCOOlxqEFU1+kYauRCb1o=;
	b=gLwpN+5OuiJAtVjd+Ybp1lY8Nzc1Ezfl649alSYnyWp/cN1BYQGqUjJQK05F0FlkKk
	RP7oBc9GuJlVe/NIT1xqGHcL38Cf6nuyEtIHc60fEdbMMdXNzVCYo85YchxH3dFjsElh
	6tNavOrQctddQNJM8V5qy0RzzURyAEe4+k9bt85Vl/v+C/6kRgGj8iuu8M0b6vNql4Xu
	hkmfzlrNKrQwNn7vF4XbK3jZO3pUsZz3Sd0OUlm426OxsHncoyIJfLaxK2jfC16FYI4G
	WYMuVFbs8OQTI3DY0UU/FmIgJAgNKEWrykzhYDq4ouCKXmbWsSDfSIVSxDmrPonjkjBf
	zNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=7vhJav3YZB53ZLLzc3Ml+ySCOOlxqEFU1+kYauRCb1o=;
	b=BPdmSsY4oUXPiifR3ABxIVRPDLZkJ7a3/td42FjLgV5Ddg0qN88oNB7Edz3cP1Pse4
	vLsbR/4x4K0Wv6CskDhz0narbqyUnRZw+KTwFFQbmsjZtOl28TdxP6hDmFO5fJoyn9hR
	2svDMF96cdDluvWQl2PEh4g2BCMV+9y0wKd6eDj8t2DqeLPQ0scUjCFC67afPHIhNOBl
	I1eVdKKQXHXBhdwiTJq0G1+RePGgvrTVdo49uGxClDDVec/jCwk2GOrEC8qD1vJ3qZWg
	lQULwgxc3uITa+FgFOPmCTNmZgI3traxWq/UKwUHYZOZOKIeL97UPMwVIEa9kdaFBUdU
	dhMw==
X-Gm-Message-State: APzg51DNYcysDPMayS2wMqPCvcu0jbS4tZcHbmkMCORQBKka+fEpDhry
	e+8oC92PafGxFLQqQp4oBCsqTGA4
X-Google-Smtp-Source: ANB0VdYOk9WG59jOE4kJ5E0lYkNy6zSDttSO4qMNf57+mnMq0bJsjb+kswk2hCCLl0SlsVDZQvMXRw==
X-Received: by 2002:a65:464b:: with SMTP id
	k11-v6mr9109539pgr.448.1536179128352; 
	Wed, 05 Sep 2018 13:25:28 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:3dff:4b7f:4b07:1058])
	by smtp.gmail.com with ESMTPSA id
	v26-v6sm3913329pfe.57.2018.09.05.13.25.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 13:25:27 -0700 (PDT)
To: Andrej Valek <andrej.valek@siemens.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	"Denys Vlasenko <vda.linux@googlemail.com>; Chen Qi"
	<Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
	<4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <e24b16d0-eab7-da62-d4a6-aa517809158b@gmail.com>
Date: Wed, 5 Sep 2018 13:25:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>
Subject: Re: systemd/busybox fsck fail to run
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
X-List-Received-Date: Wed, 05 Sep 2018 20:25:27 -0000
X-Groupsio-MsgNum: 115885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="BLR4BeUnkwORBOZXklyCRkPDN6fj4kLd4"

--BLR4BeUnkwORBOZXklyCRkPDN6fj4kLd4
Content-Type: multipart/mixed; boundary="WY8dHeb8q9YQoZoyJ4vAYr265jnmQ4VMs";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 "Denys Vlasenko <vda.linux@googlemail.com>; Chen Qi"
 <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <e24b16d0-eab7-da62-d4a6-aa517809158b@gmail.com>
Subject: Re: [OE-core] systemd/busybox fsck fail to run
References: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
 <4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>
In-Reply-To: <4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>

--WY8dHeb8q9YQoZoyJ4vAYr265jnmQ4VMs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/5/18 5:46 AM, Andrej Valek wrote:
> Hi Alex,
>=20
> There could be multiple options, how to handle this.
>=20
> My 2cents about this problem:
>  1. Use update-alternatives to handle this
>  2. Rework busybox itself to handle this option
>  3. Just create a patch to ignore this option
>=20

I am not sure if systemd-fsck is supposed to work with anything other
than util-linux and e2progfs tools. So lets add a hard dependency in
systemd for this.

> Cheers,
> Andrej
>=20
> On 09/05/18 10:37, Alex Kiernan wrote:
>> I've just come across a box with a corrupt filesystem which wasn't
>> being cleaned (using systemd and busybox):
>>
>> Aug 29 16:03:22 localhost systemd-fsck[143]: read_bad_blocks_file: No
>> such file or directory while trying to open -M
>> Aug 29 16:03:22 localhost systemd-fsck[143]: Warning: fsck.ext4
>> /dev/mmcblk0p4 terminated by signal 8
>> Aug 29 16:03:22 localhost systemd-fsck[143]: fsck failed with exit sta=
tus 8.
>> Aug 29 16:03:22 localhost systemd-fsck[143]: Ignoring error.
>> Aug 29 16:03:22 localhost systemd[1]:
>> systemd-fsck@dev-mmcblk0p4.service: cgroup is empty
>> Aug 29 16:03:22 localhost systemd[1]:
>> systemd-fsck@dev-mmcblk0p4.service: Child 143 belongs to
>> systemd-fsck@dev-mmcblk0p4.service.
>> Aug 29 16:03:22 localhost systemd[1]:
>> systemd-fsck@dev-mmcblk0p4.service: Main process exited, code=3Dexited=
,
>> status=3D0/SUCCESS
>> Aug 29 16:03:22 localhost systemd[1]:
>> systemd-fsck@dev-mmcblk0p4.service: Changed start -> exited
>> Aug 29 16:03:22 localhost systemd[1]:
>> systemd-fsck@dev-mmcblk0p4.service: Job
>> systemd-fsck@dev-mmcblk0p4.service/start finished, result=3Ddone
>> Aug 29 16:03:22 localhost systemd[1]: Started File System Check on
>> /dev/mmcblk0p4.
>>
>> It turns out systemd-fsck unconditionally passes `-l` to lock the file=
system:
>>
>> https://github.com/systemd/systemd/blame/master/src/fsck/fsck.c#L408
>>
>> which busybox fsck doesn't interpret and so passes on to fsck.ext4,
>> which then interprets it as a badblocks file...
>>
>> What's the right answer here? Add a patch to busybox fsck so it just
>> ignores `-l`, or do we need something more sophisticated?
>>
>> Obviously swapping in util-linux-fsck works around the problem.
>>


--WY8dHeb8q9YQoZoyJ4vAYr265jnmQ4VMs--

--BLR4BeUnkwORBOZXklyCRkPDN6fj4kLd4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5A7sQAKCRC7BTNVkZ0z
FKvSAJ9vFDNfUEoo0WvNsqMLOsrrpukFZgCfXgbQxlR2n/tJi6f1Xy34Hl5sdrM=
=FHgw
-----END PGP SIGNATURE-----

--BLR4BeUnkwORBOZXklyCRkPDN6fj4kLd4--
