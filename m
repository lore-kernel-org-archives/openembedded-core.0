Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2A2C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 15:11:47 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.324.1637075506443267943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 07:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1AGFAgYM005933;
	Tue, 16 Nov 2021 09:10:42 -0600
Message-ID: <eae4129a-1a6d-312a-d2c3-caaa39869463@kernel.crashing.org>
Date: Tue, 16 Nov 2021 09:10:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [OE-core] Yocto : Need help in building latest openembedded
 branch code
Content-Language: en-US
To: mohammed aqdam <mohammedaqdam@gmail.com>,
        openembedded-core@lists.openembedded.org,
        openembedded-core+help@lists.openembedded.org
References: 
 <CAGsrAHfvNdtkN9G1CQk_=+vtmEja=K48_UDJZwTtPfmqfNwG0w@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <CAGsrAHfvNdtkN9G1CQk_=+vtmEja=K48_UDJZwTtPfmqfNwG0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id
 1AGFAgYM005933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 15:11:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158345

The variable syntax has changed between older and newer versions of bitba=
ke.

See:=20
https://docs.yoctoproject.org/migration-guides/migration-3.4.html#overrid=
e-syntax-changes

On 11/15/21 11:59 PM, mohammed aqdam wrote:
> Hi There,
>=20
> I am working on a yocto image for the imx8 board, for this I have creat=
ed a=20
> project with zeus layers for all layers(including meta-imx) using the b=
elow=20
> manifest file.
>=20
>     |repo init -u https:||//source||.codeaurora.org
>     <http://codeaurora.org/>||/external/imx/imx-manifest||-b imx-linux-=
zeus -m
>     imx-5.4.47-2.2.0.xml|
>=20
>=20
> I am trying to fetch master/honister=C2=A0code of openEmbedded on my=20
> existing=C2=A0project(Earlier i was using Zeus branch) to use latest mo=
dules of=20
> perl(5.34.0), chrony(4.1)=C2=A0& gpsd(gpsd 3.23.1=20
> <http://layers.openembedded.org/layerindex/recipe/1120/>), by modifying=
=20
> .repo/manifests/imx-5.4.47-2.2.0.xml=C2=A0with master/honister code for=
=20
> openEmbedded(revision=3D"refs/heads/honister"), later=C2=A0i ran into b=
elow error,
>=20
>     $ bitbake -k imx-image-full
>     ERROR: Unable to start bitbake server (None)
>     ERROR: Server log for this session
>     (/data/home/maqdam/imx_yocto_master/build/bitbake-cookerdaemon.log)=
:
>     --- Starting bitbake server pid 6315 at 2021-11-16 10:36:44.095759 =
---
>     ERROR: ParseError at
>     /data/home/maqdam/imx_yocto_master/sources/meta-openembedded/meta-o=
e/conf/layer.conf:106:
>     unparsed line: 'DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image =3D "
>     ${PTESTTESTSUITE}"'
>=20
>=20
> Tried updating the bitbake layer(poky) to master/honister in similar=C2=
=A0fashion,=20
> Later seeing the below error in meta-imx/meta-bsp/conf/layer.conf file.
>=20
>     $ bitbake -k imx-image-full
>     ERROR: Variable FSL_EULA_FILE_MD5SUMS_append contains an operation =
using the
>     old override syntax. Please convert this layer/metadata before atte=
mpting to
>     use with a newer bitbake.
>=20
>=20
> I could not find how to use FSL_EULA_FILE_MD5SUMS_append with the lates=
t bitbake.
> Request you to suggest how can i use this master/honister=C2=A0code of =
openEmbedded &=20
> with which version of bitbake.
>=20
> Thanks,
> Aqdam
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158340): https://lists.openembedded.org/g/openembed=
ded-core/message/158340
> Mute This Topic: https://lists.openembedded.org/mt/87089467/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

