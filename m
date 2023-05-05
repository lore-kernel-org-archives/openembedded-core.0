Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29C6C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 01:05:40 +0000 (UTC)
Subject: Re: [PATCH V1] e2fsprogs: fix ptest bug for second running
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 May 2023 18:05:38 -0700
References: <CAMKF1soZiL82M5y14agXb=OBU4Y3EeqUp=nzpD-kWO95q_z+3Q@mail.gmail.com>
In-Reply-To: <CAMKF1soZiL82M5y14agXb=OBU4Y3EeqUp=nzpD-kWO95q_z+3Q@mail.gmail.com>
Message-ID: <5798.1683248738795533620@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="moS1avuU9MFoXMyNRF37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 01:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180890

--moS1avuU9MFoXMyNRF37
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C Khem Raj

>=20
> | WARNING:
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/e2fsprogs/1.47.0=
-r0/temp/run.do_install_ptest_base.2332727:192
>=20
> exit 127 from ' install -Dm 0644
>=20

There is no warning in my env, so could you share the file " run.do_install=
_ptest_base.2332727" ?
And the parameter "D" looks a bit strange.
command in warning: install -Dm 644
command in patch: install -m 0644

Thanks,
Qiu Tingting

--moS1avuU9MFoXMyNRF37
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"white-space: pre-wrap;">Hi=EF=BC=8C<span style=3D"white-spac=
e: normal;">Khem Raj</span><br /></span>
<blockquote><span style=3D"white-space: pre-wrap;">| WARNING: /mnt/b/yoe/ma=
ster/build/tmp/work/core2-64-yoe-linux-musl/e2fsprogs/1.47.0-r0/temp/run.do=
_install_ptest_base.2332727:192</span><br style=3D"white-space: pre-wrap;" =
/><span style=3D"white-space: pre-wrap;">exit 127 from ' install -Dm 0644</=
span><span style=3D"white-space: pre-wrap;"><br /></span></blockquote>
There is no warning in my env, so could you share the file "<span style=3D"=
white-space: pre-wrap;">run.do_install_ptest_base.2332727" ?</span><br /><s=
pan style=3D"color: #000000;"><span style=3D"font-size: 14.6667px;">And the=
 parameter "D" looks a bit strange.</span></span><span style=3D"white-space=
: pre-wrap;"><br />command in warning: install -Dm 644<br />command in patc=
h: </span><span style=3D"color: #000000; font-family: Segoe UI Web (West Eu=
ropean), Segoe UI, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neu=
e, sans-serif;"><span style=3D"font-size: 14.6667px;">install -m 0644<br />=
<br /></span></span>Thanks,<br />Qiu Tingting

--moS1avuU9MFoXMyNRF37--

