Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2708EC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:36:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.47541.1748338573852976058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dk8sac8E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B9104396A;
	Tue, 27 May 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748338571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/fuf+J1MOEntWxeZRhavRav3oe8Cg4khRQ2iyVxe+5E=;
	b=Dk8sac8EeJigVbfXdZDfd9wEv6oCDddfjnpesssaE7K97xlpz+5YiPGgkCsDb4NG46KlXG
	0BaEzEgoZm57emdnxwlR9D8+M4JYg5XMGaNhvUSwAgerhyR5v3OsZEaRBkYc/5rNaJRZRk
	qEwkPJutdf8AVzVUyLHG5uN9xsYuxjLvinP4LRXCO+a25NR30+3B0uUAaPb0DBNJiz3XT7
	ESMLvNPwRIsMFr4KL/xiq3Ss+s8Qn5e4+YRv5qVBv27hnNrq5BqCJAyvOCqCvMcgxJM38G
	eFwtEI7r0JsGDoTvMjcLfF9VK3QMbw0K0YT3lOCvUHgUidrhng9LAV2x/Rk+zA==
Content-Type: multipart/mixed;
 boundary=2d48c5e1fab6448b87074c2e3dbfbb53af41aee4b5776a49fe705a69d1b5
Mime-Version: 1.0
Date: Tue, 27 May 2025 11:36:10 +0200
Message-Id: <DA6UARJCKY1F.22D63SXC39NBQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org> <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com> <aDVnDQPSPFFeYgYG@nuoska>
 <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
In-Reply-To: <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurheptgggfffkhffvufevofhfjgesmhdtreerredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeujeehkefgieehleeutedtudevtedugeffieevudffteelieetkeegueevleeiueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdutgeimeefieegsgemleekrgehmegtugdugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegtudgtieemfeeigegsmeelkegrheemtgguudegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhko
 hdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217294

--2d48c5e1fab6448b87074c2e3dbfbb53af41aee4b5776a49fe705a69d1b5
Content-Type: multipart/alternative;
 boundary=7434aefe13989c049e35e40e10c1c7c0994e866ee66691e2baf8e670b530

--7434aefe13989c049e35e40e10c1c7c0994e866ee66691e2baf8e670b530
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Tue May 27, 2025 at 9:43 AM CEST, Mathieu Dubois-Briand wrote:
> On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
>> Hi,
>>
>> On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
>>> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
>>> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.open=
embedded.org wrote:
>>> >
>>> > I reviewed the runqemu and qemu-system-aarch64 arguments but could no=
t see major differences.
>>> > One difference is that autobuilder runs with tap and I with slirp net=
working, but that
>>> > should not affect rootfs/ESP partition detection in u-boot. I've sent=
 out v4 now.
>>> > If this still fails on autobuilder, then I'd need know what config fr=
agments
>>> > are applied. I've configured qemuarm64 and genericarm64 with
>>> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS +=3D "slirp"
>>> > and SANITY_TESTED_DISTROS =3D "" to conf/local.conf. Maybe autobuilde=
r
>>> > scripts add something more.
>>> >
>>> > Cheers,
>>> >
>>> > -Mikko
>>>=20
>>> Hi Mikko,
>>>=20
>>> Thanks for the new version, but I confirm it still fails.
>>>=20
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772
>>
>> Is it possible to grab the full boot log
>> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659/t=
mp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log=
.20250526163143 ?
>>
>> It was referred in
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_in=
line
>>
>
> The file is gone :(
>
> I will launch a new build so I can capture the file.

New build. There is also a failure on bitbake selftest here, but it
seems to be an unrelated intermittent issue.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1778

I believe the file you are looking for is
/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-932426/tmp/w=
ork/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.202=
50527082811.2,
I'm attaching it to my mail. But I'm not sure there is more data than
what you already had.

I will try to backup the whole build directory once the build is done,
in the case you need some other file.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--7434aefe13989c049e35e40e10c1c7c0994e866ee66691e2baf8e670b530--

--2d48c5e1fab6448b87074c2e3dbfbb53af41aee4b5776a49fe705a69d1b5
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=qemu_boot_log.20250527082811.2
Content-Type: application/octet-stream; name=qemu_boot_log.20250527082811.2

DQoNClUtQm9vdCAyMDI1LjA0IChBcHIgMDcgMjAyNSAtIDIxOjU3OjU1ICswMDAwKQ0KDQpEUkFN
OiAgMjU2IE1pQg0KQ29yZTogIDUyIGRldmljZXMsIDE0IHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBi
b2FyZA0KRmxhc2g6IDY0IE1pQg0KTG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIEZsYXNoLi4uICoq
KiBXYXJuaW5nIC0gYmFkIENSQywgdXNpbmcgZGVmYXVsdCBlbnZpcm9ubWVudA0KDQpJbjogICAg
c2VyaWFsLHVzYmtiZA0KT3V0OiAgIHNlcmlhbCx2aWRjb25zb2xlDQpFcnI6ICAgc2VyaWFsLHZp
ZGNvbnNvbGUNCk5vIFVTQiBjb250cm9sbGVycyBmb3VuZA0KTmV0OiAgIGV0aDA6IHZpcnRpby1u
ZXQjMzINChtbPzI1aA0Kc3RhcnRpbmcgVVNCLi4uDQpObyBVU0IgY29udHJvbGxlcnMgZm91bmQN
CkhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6ICAyIAgICCAxIAgICCAwIA0KU2Nhbm5pbmcg
Zm9yIGJvb3RmbG93cyBpbiBhbGwgYm9vdGRldnMNClNlcSAgTWV0aG9kICAgICAgIFN0YXRlICAg
VWNsYXNzICAgIFBhcnQgIE5hbWUgICAgICAgICAgICAgICAgICAgICAgRmlsZW5hbWUNCi0tLSAg
LS0tLS0tLS0tLS0gIC0tLS0tLSAgLS0tLS0tLS0gIC0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSAgLS0tLS0tLS0tLS0tLS0tLQ0KU2Nhbm5pbmcgZ2xvYmFsIGJvb3RtZXRoICdlZmlfbWdy
JzoNChs3G1tyG1s5OTk7OTk5SBtbNm4bOENhbm5vdCBwZXJzaXN0IEVGSSB2YXJpYWJsZXMgd2l0
aG91dCBzeXN0ZW0gcGFydGl0aW9uDQpNaXNzaW5nIFRQTXYyIGRldmljZSBmb3IgRUZJX1RDR19Q
Uk9UT0NPTA0KICAwICBlZmlfbWdyICAgICAgcmVhZHkgICAobm9uZSkgICAgICAgMCAgPE5VTEw+
ICAgICAgICAgICAgICAgICAgICANCioqIEJvb3RpbmcgYm9vdGZsb3cgJzxOVUxMPicgd2l0aCBl
ZmlfbWdyDQpMb2FkaW5nIEJvb3QwMDAwICd2aXJ0aW8gMCcgZmFpbGVkDQpFRkkgYm9vdCBtYW5h
Z2VyOiBDYW5ub3QgbG9hZCBhbnkgaW1hZ2UNCkJvb3QgZmFpbGVkIChlcnI9LTE0KQ0KU2Nhbm5p
bmcgYm9vdGRldiAnZnctY2ZnQDkwMjAwMDAuYm9vdGRldic6DQpmYXRhbDogbm8ga2VybmVsIGF2
YWlsYWJsZQ0KTm8gVVNCIGNvbnRyb2xsZXJzIGZvdW5kDQpzY2FubmluZyBidXMgZm9yIGRldmlj
ZXMuLi4NClNjYW5uaW5nIGJvb3RkZXYgJ3ZpcnRpby1ibGsjMzYuYm9vdGRldic6DQpTY2Fubmlu
ZyBib290ZGV2ICd2aXJ0aW8tbmV0IzMyLmJvb3RkZXYnOg0KQk9PVFAgYnJvYWRjYXN0IDENCkJP
T1RQIGJyb2FkY2FzdCAyDQpCT09UUCBicm9hZGNhc3QgMw0KQk9PVFAgYnJvYWRjYXN0IDQNCkJP
T1RQIGJyb2FkY2FzdCA1DQpCT09UUCBicm9hZGNhc3QgNg0KQk9PVFAgYnJvYWRjYXN0IDcNCkJP
T1RQIGJyb2FkY2FzdCA4DQpCT09UUCBicm9hZGNhc3QgOQ0KQk9PVFAgYnJvYWRjYXN0IDEwDQpC
T09UUCBicm9hZGNhc3QgMTENCkJPT1RQIGJyb2FkY2FzdCAxMg0KQk9PVFAgYnJvYWRjYXN0IDEz
DQpCT09UUCBicm9hZGNhc3QgMTQNCkJPT1RQIGJyb2FkY2FzdCAxNQ0KQk9PVFAgYnJvYWRjYXN0
IDE2DQpCT09UUCBicm9hZGNhc3QgMTcNCg0KUmV0cnkgdGltZSBleGNlZWRlZDsgc3RhcnRpbmcg
YWdhaW4NCk5vIG1vcmUgYm9vdGRldnMNCi0tLSAgLS0tLS0tLS0tLS0gIC0tLS0tLSAgLS0tLS0t
LS0gIC0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgLS0tLS0tLS0tLS0tLS0tLQ0KKDEg
Ym9vdGZsb3csIDEgdmFsaWQpDQo9PiA=
--2d48c5e1fab6448b87074c2e3dbfbb53af41aee4b5776a49fe705a69d1b5--

