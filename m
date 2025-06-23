Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B33C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 11:53:19 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.17786.1750679592557556228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 04:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MK0PGcMO;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65B0B43892;
	Mon, 23 Jun 2025 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750679590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CL+gaAeRYr/iIcQPjN8S8BPxJUlsNbi5KeP7+t2cHM=;
	b=MK0PGcMOP84ztM+Lz68TAEZPE7v/dvPFIhZP58TkmpkW6FHL5Sp9T3ru4KHZD2LQ4F2SLP
	vZza+E5UHpxm8skfK563ChquRgqcJfGzKaxB18i/4N4XvON24ajNXyIf8mY4PHuoopP/jh
	HEfXEPCeXRAJS4kAFk0jw+uenP2f1mA6Sd7nKN/YAXV8hf5EYIGOplUxO7Xs2RULv4bXeD
	/LaY2WftQpdixM0fQYYFsdvOY9JXJz+0Qc75WPEl+KZWGnzDPNDQVO70XgZnWq7yNQ2A7G
	3JlTkm/a4v0wkJLI7OjXSh5kxrbqElgaYsSI8c1CKaFMQo+f8YM5rshg3aPmEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 13:53:09 +0200
Message-Id: <DATW4CPGVUD2.2QTF3P8CFLJC2@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] libubootenv: add rrecommends from
 libubootenv to u-boot-env
Cc: <stefano.babic@swupdate.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
References: <20250623073553.844037-1-adrian.freihofer@siemens.com>
 <20250623073553.844037-2-adrian.freihofer@siemens.com>
 <DATRJETQ7O1H.Q950SLDU2AGI@bootlin.com>
In-Reply-To: <DATRJETQ7O1H.Q950SLDU2AGI@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeftdeivdevfffhfeevjefhffetgedvvedvtdeigeeijeejheeutdekiedvuedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgesl
 hhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepshhtvghfrghnohdrsggrsghitgesshifuhhpuggrthgvrdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 11:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219211

On Mon Jun 23, 2025 at 10:17 AM CEST, Antonin Godard wrote:
> On Mon Jun 23, 2025 at 9:35 AM CEST, Adrian Freihofer via lists.openembed=
ded.org wrote:
>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>
>> Without /etc/fw_env.config, the fw_printenv and fw_setenv utilities fail
>> with an error, as they cannot locate the U-Boot environment.
>> This limitation also affects any application linking against
>> libubootenv. To address this, add an RRECOMMENDS from libubootenv to the
>> u-boot-env package, which provides the necessary configuration files.
>>
>> While this could be an RDEPENDS, using RRECOMMENDS allows users with
>> custom implementations to more easily override the dependency if needed.
>>
>> Some examples suggest bbappending fw_env.config directly to the
>> libubootenv recipe. However, /etc/fw_env.config is machine-specific,
>> whereas libubootenv is not. Additionally, the default U-Boot
>> environment, which can be used by libubootenv, is also provided by the
>> machine-specific u-boot-env package. Therefore, it is preferable to
>> provide fw_env.config via the machine-specific u-boot recipe.
>>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes=
-bsp/u-boot/libubootenv_0.3.6.bb
>> index 35678e2361f..a193872b83b 100644
>> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
>> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
>> @@ -21,4 +21,8 @@ DEPENDS =3D "zlib libyaml"
>>  PROVIDES +=3D "u-boot-fw-utils"
>>  RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"
>> =20
>> +# libubootenv needs /etc/fw_env.config and /etc/u-boot-initial-env conf=
iguration
>> +# files which are usually provided by the MACHINE specific u-boot-env p=
ackage
>> +RRECOMMENDS:${PN} +=3D "u-boot-env"
>> +
>>  BBCLASSEXTEND =3D "native"
>
> Hi,
>
> I think this patch produces the following warnings:
>
> stdio: WARNING: Nothing RPROVIDES 'u-boot-env-native' (but virtual:native=
:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libuboote=
nv_0.3.6.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'libubootenv-native' (but virtual:nativ=
e:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libuboot=
env_0.3.6.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'libubootenv-dev-native' (but virtual:n=
ative:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-bsp/u-boot/libu=
bootenv_0.3.6.bb RDEPENDS on or otherwise requires it)
>
> Happens on `bitbake universe -c fetch -k`.
>
> Can you have a look?
>
> Full log:
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2765656/raw_inl=
ine

Also triggers the following errors I believe:

ERROR: Nothing RPROVIDES 'lib32-u-boot-env' (but virtual:multilib:lib32:/sr=
v/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-bsp/u-boot/li=
bubootenv_0.3.6.bb RDEPENDS on or otherwise requires it)
u-boot RPROVIDES lib32-u-boot-env but was skipped: PREFERRED_PROVIDER_virtu=
al/lib32-bootloader set to lib32-u-boot, not u-boot
NOTE: Runtime target 'lib32-u-boot-env' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lib32-u-boot-env']
ERROR: Nothing RPROVIDES 'lib32-libubootenv-dev' (but virtual:multilib:lib3=
2:/srv/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-bsp/u-bo=
ot/libubootenv_0.3.6.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'lib32-libubootenv-dev'
NOTE: Runtime target 'lib32-libubootenv-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lib32-libubootenv-dev']
ERROR: Nothing RPROVIDES 'lib32-libubootenv' (but virtual:multilib:lib32:/s=
rv/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-bsp/u-boot/l=
ibubootenv_0.3.6.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'lib32-libubootenv'
NOTE: Runtime target 'lib32-libubootenv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lib32-libubootenv']
ERROR: Nothing RPROVIDES 'u-boot-env' (but /srv/pokybuild/yocto-worker/qemu=
x86-world-alt/build/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb RDEPENDS o=
n or otherwise requires it)
u-boot RPROVIDES u-boot-env but was skipped: We shouldn't have multilib var=
iants for u-boot
u-boot RPROVIDES u-boot-env but was skipped: PREFERRED_PROVIDER_virtual/lib=
32-bootloader set to lib32-u-boot, not u-boot
NOTE: Runtime target 'u-boot-env' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['u-boot-env']
ERROR: Nothing RPROVIDES 'libubootenv' (but /srv/pokybuild/yocto-worker/qem=
ux86-world-alt/build/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb RDEPENDS =
on or otherwise requires it)
No eligible RPROVIDERs exist for 'libubootenv'
NOTE: Runtime target 'libubootenv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libubootenv']
ERROR: Nothing RPROVIDES 'libubootenv-dev' (but /srv/pokybuild/yocto-worker=
/qemux86-world-alt/build/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb RDEPE=
NDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'libubootenv-dev'
NOTE: Runtime target 'libubootenv-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libubootenv-dev']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1742

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


