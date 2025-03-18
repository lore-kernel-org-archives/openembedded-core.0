Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAFCC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:25:03 +0000 (UTC)
Subject: Notes for BlueZ 5.80 upgrade
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (213.181.99.234)
X-Originating-Platform: Windows Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 01:24:58 -0700
Message-ID: <RooI.1742286298693917560.s8EM@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XaiyCmj8hllblWBTBigM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 08:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213187

--XaiyCmj8hllblWBTBigM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all, in case this is useful, I want to share some notes for anyone who w=
ants to upgrade BlueZ to 5.80 as I've been following upstream commits. My V=
M's SSD crashed recently such that I lost everything :(, so I can't really =
do the upgrade myself unless I set everything up again (not sure when that =
will happen).

Notes:
1) We should be able to remove the modifications to /etc/bluetooth director=
y permissions bits (done in do_install:append function) *[1]*. This was add=
ed previously for the SDK build so that uninstalling the directory/files wo=
rks.
2) AMP code has been removed *[2]*. This means "tools/amptest" can be remov=
ed from NOINST_TOOLS_BT
3) One patch can be removed: 0001-gdbus-define-MAX_INPUT-for-musl.patch as =
it is included in the release now *[3]*
4) Upstream doesn't test musl builds... so anyone upgrading should test wit=
h musl also to pass all the checks :)

[1] - https://github.com/bluez/bluez/commit/b1fd409960001a77cda2a09ecc00147=
ebd9c3667
[2] - https://github.com/bluez/bluez/commit/1474c11618bc1092f7dd4b304d3768c=
e9da02b13
[3] - https://github.com/bluez/bluez/commit/9d69dba21f1e46b34cdd8ae27fec11d=
0803907ee

Best regards,
Gudni

--XaiyCmj8hllblWBTBigM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all, in case this is useful, I want to share some notes for anyone =
who wants to upgrade BlueZ to 5.80 as I've been following upstream commits.=
 My VM's SSD crashed recently such that I lost everything :(, so I can't re=
ally do the upgrade myself unless I set everything up again (not sure when =
that will happen).</div>
<div>&nbsp;</div>
<div>Notes:</div>
<div>1) We should be able to remove the modifications to /etc/bluetooth dir=
ectory permissions bits (done in do_install:append function) <strong>[1]</s=
trong>. This was added previously for the SDK build so that uninstalling th=
e directory/files works. </div>
<div>2) AMP code has been removed <strong>[2]</strong>. This means "tools/a=
mptest" can be removed from NOINST_TOOLS_BT</div>
<div>3) One patch can be removed: 0001-gdbus-define-MAX_INPUT-for-musl.patc=
h as it is included in the release now <strong>[3]</strong></div>
<div>4) Upstream doesn't test musl builds... so anyone upgrading should tes=
t with musl also to pass all the checks :)</div>
<div>&nbsp;</div>
<div>[1] - <a href=3D"https://github.com/bluez/bluez/commit/b1fd409960001a7=
7cda2a09ecc00147ebd9c3667" target=3D"_blank" rel=3D"noopener">https://githu=
b.com/bluez/bluez/commit/b1fd409960001a77cda2a09ecc00147ebd9c3667</a></div>
<div>[2] - <a href=3D"https://github.com/bluez/bluez/commit/1474c11618bc109=
2f7dd4b304d3768ce9da02b13" target=3D"_blank" rel=3D"noopener">https://githu=
b.com/bluez/bluez/commit/1474c11618bc1092f7dd4b304d3768ce9da02b13</a></div>
<div>[3] - <a href=3D"https://github.com/bluez/bluez/commit/9d69dba21f1e46b=
34cdd8ae27fec11d0803907ee" target=3D"_blank" rel=3D"noopener">https://githu=
b.com/bluez/bluez/commit/9d69dba21f1e46b34cdd8ae27fec11d0803907ee</a></div>
<div>&nbsp;</div>
<div>Best regards,</div>
<div>Gudni</div>

--XaiyCmj8hllblWBTBigM--

