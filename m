Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BB4C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:48:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.6713.1651056512930113044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 03:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=eevV7A0S;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:616e:1401:a966:7317:45b8:c18d] (unknown
 [IPv6:2001:a61:616e:1401:a966:7317:45b8:c18d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AF4D68021F;
	Wed, 27 Apr 2022 12:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1651056510;
	bh=wusIoxO2GT6zSCMARwxiPEziOiqe116bxbAu0g2Vw2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eevV7A0SQT86Ky4QUpSQRcOSsQ0e/yQrSF3MXx6eZAcJLqKSeoQnydaaNUNA7r40l
	 Nbgwug+lkuXOUXHkU0mk9Xx6SsjFDiYDkiByN2uinPqhwGDPZFmkpGQa0OVmTCZWUX
	 oDzoXvmoqVHbG920MFVWQr2XUUSO5f7kXQlLvuVbHIKxwMW3V7UMuzqrFqt3KPloww
	 Rmzkrn0LsXonbBSpbEowg3JCtqi+0nbae4R957EnhLgbmOkr5BPlHX2+w+9jUwA2Hf
	 sTE5L81dq8ODl/3D3cbcP1ekqilvOI0BAaG4XGSpNoCyDMAONyPNlLL1oN64XA7OP1
	 1+nQITWAMhQpw==
Message-ID: <9fd491f6-b410-805a-1375-a7a137c8fe68@denx.de>
Date: Wed, 27 Apr 2022 12:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] Git and pseudo
Content-Language: de-DE
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefano Babic <sbabic@denx.de>, Mike Looijmans <mike.looijmans@topic.nl>,
 openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
 <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: 
 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 10:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164917

On 27.04.22 12:22, Richard Purdie wrote:
> On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:
>> Hi Mike, Richard,
>>
>> On 26.04.22 11:08, Mike Looijmans wrote:
>>>
>>> Met vriendelijke groet / kind regards,
>>>
>>> Mike Looijmans
>>> System Expert
>>>
>>>
>>> TOPIC Embedded Products B.V.
>>> Materiaalweg 4, 5681 RJ Best
>>> The Netherlands
>>>
>>> T: +31 (0) 499 33 69 69
>>> E: mike.looijmans@topicproducts.com
>>> W: www.topic.nl
>>>
>>> Please consider the environment before printing this e-mail
>>> On 25-04-2022 14:51, Richard Purdie wrote:
>>>> On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
>>>>> Recently GIT got updated with a security fix:
>>>>>
>>>>> https://github.blog/2022-04-12-git-security-vulnerability-announced=
/
>>>>>
>>>>>
>>>>> The problem is that this causes all "git" tasks that run within pse=
udo
>>>>> (most noticably, image recipes) to fail. In many repositories, we u=
se:
>>>>> git rev-parse --verify HEAD > /etc/revision
>>>>>
>>>>> Or something similar to that. After the GIT update, this now fails =
with
>>>>> an error like:
>>>>>
>>>>> '''
>>>>> fatal: unsafe repository ('/home/mike/repository/path' is owned by
>>>>> someone else)
>>>>> To add an exception for this directory, call:
>>>>>
>>>>>  =C2=A0 =C2=A0=C2=A0 =C2=A0git config --global --add safe.directory
>>>>> /home/mike/repository/path
>>>>> '''
>>>>>
>>>>> Apart from doing as it says, or even "git config --global --add
>>>>> safe.directory '*'" anyone have a better idea, especially one that
>>>>> prevents the system thinking I'm someone else (root in the case of
>>>>> pseudo).
>>>> https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5=
f2d874eaa4a92fff0e5
>>>>
>>>>
>>>> However this isn't quite enough as some things encode the path to gi=
t
>>>> into build
>>>> files so the PATH change at do_install isn't enough. igt-gpu-tools v=
ia
>>>> meson in
>>>> OE-Core is an example.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>> Nice, also for general usefulness.
>>>
>>>
>>> For our particular case, I came up with this (works in old OE version=
s
>>> as well), just inserting a task since both do_image and do_rootfs run
>>> under fakeroot:
>>>
>>>   =C2=A0# We require access to the git repository here, so we must ru=
n outside
>>> fakeroot
>>> do_swumetadata() {
>>>   =C2=A0=C2=A0 # Hardware revision for SWUpdate
>>>   =C2=A0=C2=A0 echo "${SWU_BOARD_HWREVISION}" >
>>> ${IMAGE_ROOTFS}${sysconfdir}/hwrevision
>>>   =C2=A0=C2=A0 v=3D`git rev-parse --verify HEAD`
>>>   =C2=A0=C2=A0 echo $v > ${IMAGE_ROOTFS}${sysconfdir}/swrevision
>>>   =C2=A0=C2=A0 echo $v > ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}.swrevi=
sion
>>> }
>>> addtask do_swumetadata before do_image after do_rootfs
>>>
>>
>> It looks like we have several breakages. I found yesterday that
>> buildinfo (image-buildinfo) does not work anymore.
>>
>> meta-filesystems  =3D <unknown>:<unknown>
>>
>> meta-networking   =3D <unknown>:<unknown>
>>
>> meta-oe           =3D <unknown>:<unknown>
>>
>> meta-perl         =3D <unknown>:<unknown>
>>
>> meta-python       =3D <unknown>:<unknown>
>>
>> meta-swupdate     =3D <unknown>:<unknown>
>>
>> meta              =3D <unknown>:<unknown>
>>
>> meta-poky         =3D <unknown>:<unknown>
>>
>> meta-yocto-bsp    =3D <unknown>:<unknown>
>>
>>
>>
>> And the reason is exactly this security update to git, and
>> base_get_metadata_git_revision / base_get_metadata_git_branch do not
>> work anymore (in this context, of course). So should we create
>> /etc/build in a task before do_rootfs ?
>>
>> Bad is also that this affects older versions (dunfell for example),
>> because it depends on an external package (git) to OE.
>=20
>=20
> https://git.yoctoproject.org/poky/commit/?id=3D5bca57859b280f73b23247aa=
c7dec6b05f48fde8
>=20

Ok, understood, thanks !

> is now the preferred fix and we will likely be backporting this to kirk=
stone,
> honister and dunfell.

Thanks !

Stefano

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164911): https://lists.openembedded.org/g/openembed=
ded-core/message/164911
> Mute This Topic: https://lists.openembedded.org/mt/90680045/3618551
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sbabic@denx.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

