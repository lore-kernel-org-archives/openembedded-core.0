Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD2FC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 06:48:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5174.1651042095668802060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 23:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=esTA59V/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:616e:1401:bb69:bc17:3cad:66e8] (unknown
 [IPv6:2001:a61:616e:1401:bb69:bc17:3cad:66e8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 023CF80137;
	Wed, 27 Apr 2022 08:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1651042087;
	bh=93Gli3gIwqEnOLXWxP/CSH2RQvQWfp+1donDcJThnzQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=esTA59V/u8/EC3Z5l8gvaftnH2RE4sWEYv4mvPkZPqfXS7UJrzARZCbnCVGeCn4/s
	 Jo8YdDGvfjdtw+4w2886Bb3DgiR9XjMKc0R61fZfFY2HfiBR1J7HDsXjWk/LKDtVeD
	 onQRNutPNPROuAl4eG4pPiaYN7QJ0n525oJj4xXrXyF7oCz8Uf3wOyW6zpodCg9LwB
	 j4R5/1Bg484/FFkaGzJpbjRfpsdPCQWrz9ANOBJWskpNaNMBVpSOqPlcqQASgOdZaR
	 CWSXJOoN5ZdtZMSdwvLnDRwfpkFDLadPDIgF9fGfZOPwImiMiSIuV9LDey+tN5jRGx
	 ygjIU31pVPY8g==
Message-ID: <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
Date: Wed, 27 Apr 2022 08:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] Git and pseudo
Content-Language: en-US
To: Mike Looijmans <mike.looijmans@topic.nl>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 06:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164889

Hi Mike, Richard,

On 26.04.22 11:08, Mike Looijmans wrote:
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
> On 25-04-2022 14:51, Richard Purdie wrote:
>> On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
>>> Recently GIT got updated with a security fix:
>>>
>>> https://github.blog/2022-04-12-git-security-vulnerability-announced/
>>>
>>>
>>> The problem is that this causes all "git" tasks that run within pseud=
o
>>> (most noticably, image recipes) to fail. In many repositories, we use=
:
>>> git rev-parse --verify HEAD > /etc/revision
>>>
>>> Or something similar to that. After the GIT update, this now fails wi=
th
>>> an error like:
>>>
>>> '''
>>> fatal: unsafe repository ('/home/mike/repository/path' is owned by
>>> someone else)
>>> To add an exception for this directory, call:
>>>
>>> =C2=A0 =C2=A0=C2=A0 =C2=A0git config --global --add safe.directory=20
>>> /home/mike/repository/path
>>> '''
>>>
>>> Apart from doing as it says, or even "git config --global --add
>>> safe.directory '*'" anyone have a better idea, especially one that
>>> prevents the system thinking I'm someone else (root in the case of=20
>>> pseudo).
>> https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2=
d874eaa4a92fff0e5=20
>>
>>
>> However this isn't quite enough as some things encode the path to git=20
>> into build
>> files so the PATH change at do_install isn't enough. igt-gpu-tools via=
=20
>> meson in
>> OE-Core is an example.
>>
>> Cheers,
>>
>> Richard
>>
> Nice, also for general usefulness.
>=20
>=20
> For our particular case, I came up with this (works in old OE versions=20
> as well), just inserting a task since both do_image and do_rootfs run=20
> under fakeroot:
>=20
>  =C2=A0# We require access to the git repository here, so we must run o=
utside=20
> fakeroot
> do_swumetadata() {
>  =C2=A0=C2=A0 # Hardware revision for SWUpdate
>  =C2=A0=C2=A0 echo "${SWU_BOARD_HWREVISION}" >=20
> ${IMAGE_ROOTFS}${sysconfdir}/hwrevision
>  =C2=A0=C2=A0 v=3D`git rev-parse --verify HEAD`
>  =C2=A0=C2=A0 echo $v > ${IMAGE_ROOTFS}${sysconfdir}/swrevision
>  =C2=A0=C2=A0 echo $v > ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}.swrevisio=
n
> }
> addtask do_swumetadata before do_image after do_rootfs
>=20

It looks like we have several breakages. I found yesterday that=20
buildinfo (image-buildinfo) does not work anymore.

meta-filesystems  =3D <unknown>:<unknown>

meta-networking   =3D <unknown>:<unknown>

meta-oe           =3D <unknown>:<unknown>

meta-perl         =3D <unknown>:<unknown>

meta-python       =3D <unknown>:<unknown>

meta-swupdate     =3D <unknown>:<unknown>

meta              =3D <unknown>:<unknown>

meta-poky         =3D <unknown>:<unknown>

meta-yocto-bsp    =3D <unknown>:<unknown>



And the reason is exactly this security update to git, and=20
base_get_metadata_git_revision / base_get_metadata_git_branch do not=20
work anymore (in this context, of course). So should we create=20
/etc/build in a task before do_rootfs ?

Bad is also that this affects older versions (dunfell for example),=20
because it depends on an external package (git) to OE.

Best regards,
Stefano

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

