Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EF9C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 12:39:41 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.18132.1724157572062841451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 05:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fancydomain.eu header.s=mail header.b=QseOqQi+;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
Date: Tue, 20 Aug 2024 14:39:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1724157568;
	bh=yg/Fc+EoXuzPz8gSTeuUQsLDnYnUyANpVv39ze8qQ/o=;
	h=From:To:CC:Subject:In-Reply-To:References;
	b=QseOqQi+my2Yi4Eh0TWjcvMDg9g10JgUZcodYQTXqk8ya02sq2Ac04+EQsyQXN3dP
	 Ec/1F953QbDEZ7z0HmVjXpR/gACdvIifZx2l60HXWbiMwQiMn2X09mzi0In39DkatP
	 Mtm/VJuWlxs3An50kPsPbrANCFQoojqPbgRtJFpyKDzl3hVoNYaoJsZQ2JIsv6V84t
	 GTbgYNcdukeeskAC1pxQqKiUf+9KtCMgbO3Q6UvqmxfL7yHz4QECXfmovUAoWlCwd4
	 2M/oXsvC+9OUu+JDD642YFgWg+g33Yhfa+nWASw/Lhai6XrhRPpy1R2K4ak1iNvTwp
	 3d6jQRgUWZaTg==
From: Jasper Orschulko <jasper@fancydomain.eu>
To: aoifepowerIris@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Util-linux: Adding missing ptest dependencies
In-Reply-To: <CANNYZj_fHpg3Xi=qKYTBEHX0ueFahihcik-4XuB8prsAnvxp7A@mail.gmail.com>
References: <20240819145140.582935-1-aoifepowerIris@gmail.com> <CAFpNyFw0xR-MqoVmQSjPYGbEwNZkPdPWSx2JP2rnOi=5K1g0cQ@mail.gmail.com> <CANNYZj_fHpg3Xi=qKYTBEHX0ueFahihcik-4XuB8prsAnvxp7A@mail.gmail.com>
Message-ID: <8AF9EB90-F702-46E9-AFF6-DC6E493ED721@fancydomain.eu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----J4EJQGMANTLOUTTDL3ZSGTXZ9VA8UK
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 12:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203555

------J4EJQGMANTLOUTTDL3ZSGTXZ9VA8UK
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

please ignore the previous patch=2E There is still stuff that we need to f=
igure out internally, due to miscommunication=2E We will submit a v2 of the=
 patch if required=2E Thanks and sorry for the inconvenience=2E :)

Cheers,
Jasper

On 19 August 2024 17:34:00 CEST, Alexander Kanavin <alex=2Ekanavin@gmail=
=2Ecom> wrote:
>What the failures you are seeing actually are? We do run util-linux
>ptest on the autobuilder, and it isn't failing=2E Is it different for
>you?
>
>Alex
>
>On Mon, 19 Aug 2024 at 16:55, Aoife Power via lists=2Eopenembedded=2Eorg
><aoifepowerIris=3Dgmail=2Ecom@lists=2Eopenembedded=2Eorg> wrote:
>>
>> Note: with ptests the adduser package is only avaliable in the meta-ope=
nembedded/meta-perl layer=2E
>> Does this need to be included elsewhere for the ptest use case?  Should=
 it be added to the core layer to allow the ptests to work correctly?
>> Thanks,
>> Aoife
>>
>> On Mon, Aug 19, 2024 at 4:52=E2=80=AFPM Aoife Power <aoifepoweriris@gma=
il=2Ecom> wrote:
>>>
>>> Missing adduser and eudev to RDEPENDS dependencies for ptest
>>>
>>> Signed-off-by: Aoife Power <aoifepowerIris@gmail=2Ecom>
>>> ---
>>>  meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb b=
/meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb
>>> index a1aab94055=2E=2Ef1c200c28b 100644
>>> --- a/meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb
>>> +++ b/meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb
>>> @@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
>>>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
>>>
>>>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"
>>> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs fi=
ndutils grep iproute2 kmod procps sed socat which xz diffutils"
>>> +RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs fi=
ndutils grep iproute2 kmod procps sed socat which xz diffutils adduser eude=
v"
>>>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-=
sd-mod kernel-module-loop kernel-module-algif-hash"
>>>  RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>>>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"
>>> --
>>> 2=2E46=2E0
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group=2E
>> View/Reply Online (#203509): https://lists=2Eopenembedded=2Eorg/g/opene=
mbedded-core/message/203509
>> Mute This Topic: https://lists=2Eopenembedded=2Eorg/mt/107982088/168648=
9
>> Group Owner: openembedded-core+owner@lists=2Eopenembedded=2Eorg
>> Unsubscribe: https://lists=2Eopenembedded=2Eorg/g/openembedded-core/uns=
ub [alex=2Ekanavin@gmail=2Ecom]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

------J4EJQGMANTLOUTTDL3ZSGTXZ9VA8UK
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi Alex,<br><br>please ignore th=
e previous patch=2E There is still stuff that we need to figure out interna=
lly, due to miscommunication=2E We will submit a v2 of the patch if require=
d=2E Thanks and sorry for the inconvenience=2E :)<br><br>Cheers,<br>Jasper<=
/div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">On 19 August 2024=
 17:34:00 CEST, Alexander Kanavin &lt;alex=2Ekanavin@gmail=2Ecom&gt; wrote:=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">What the failures you are seeing a=
ctually are? We do run util-linux<br>ptest on the autobuilder, and it isn't=
 failing=2E Is it different for<br>you?<br><br>Alex<br><br>On Mon, 19 Aug 2=
024 at 16:55, Aoife Power via lists=2Eopenembedded=2Eorg<br>&lt;aoifepowerI=
ris=3Dgmail=2Ecom@lists=2Eopenembedded=2Eorg&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: =
1px solid #729fcf; padding-left: 1ex;"><div dir=3D"auto"><br> Note: with pt=
ests the adduser package is only avaliable in the meta-openembedded/meta-pe=
rl layer=2E<br> Does this need to be included elsewhere for the ptest use c=
ase?  Should it be added to the core layer to allow the ptests to work corr=
ectly?<br> Thanks,<br> Aoife<br><br> On Mon, Aug 19, 2024 at 4:52=E2=80=AFP=
M Aoife Power &lt;aoifepoweriris@gmail=2Ecom&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: =
1px solid #ad7fa8; padding-left: 1ex;"><div dir=3D"auto"><br> Missing addus=
er and eudev to RDEPENDS dependencies for ptest<br><br> Signed-off-by: Aoif=
e Power &lt;aoifepowerIris@gmail=2Ecom&gt;<hr>  meta/recipes-core/util-linu=
x/util-linux_2=2E40=2E1=2Ebb | 2 +-<br>  1 file changed, 1 insertion(+), 1 =
deletion(-)<br><br> diff --git a/meta/recipes-core/util-linux/util-linux_2=
=2E40=2E1=2Ebb b/meta/recipes-core/util-linux/util-linux_2=2E40=2E1=2Ebb<br=
> index a1aab94055=2E=2Ef1c200c28b 100644<br> --- a/meta/recipes-core/util-=
linux/util-linux_2=2E40=2E1=2Ebb<br> +++ b/meta/recipes-core/util-linux/uti=
l-linux_2=2E40=2E1=2Ebb<br> @@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev +=3D " u=
til-linux-libuuid-dev"<br>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${P=
N}-libmount-dev"<br><br>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"=
<br> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs fi=
ndutils grep iproute2 kmod procps sed socat which xz diffutils"<br> +RDEPEN=
DS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findutils grep=
 iproute2 kmod procps sed socat which xz diffutils adduser eudev"<br>  RREC=
OMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-mod ker=
nel-module-loop kernel-module-algif-hash"<br>  RDEPENDS:${PN}-swaponoff =3D=
 "${PN}-swapon ${PN}-swapoff"<br>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"<br> =
--<br> 2=2E46=2E0<br><br></div></blockquote><div dir=3D"auto"><hr> Links: Y=
ou receive all messages sent to this group=2E<br> View/Reply Online (#20350=
9): <a href=3D"https://lists=2Eopenembedded=2Eorg/g/openembedded-core/messa=
ge/203509">https://lists=2Eopenembedded=2Eorg/g/openembedded-core/message/2=
03509</a><br> Mute This Topic: <a href=3D"https://lists=2Eopenembedded=2Eor=
g/mt/107982088/1686489">https://lists=2Eopenembedded=2Eorg/mt/107982088/168=
6489</a><br> Group Owner: openembedded-core+owner@lists=2Eopenembedded=2Eor=
g<br> Unsubscribe: <a href=3D"https://lists=2Eopenembedded=2Eorg/g/openembe=
dded-core/unsub">https://lists=2Eopenembedded=2Eorg/g/openembedded-core/uns=
ub</a> [alex=2Ekanavin@gmail=2Ecom]<hr></div></blockquote></pre></blockquot=
e></div></body></html>
------J4EJQGMANTLOUTTDL3ZSGTXZ9VA8UK--

