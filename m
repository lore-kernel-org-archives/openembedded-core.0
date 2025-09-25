Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9A6CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 11:23:28 +0000 (UTC)
Subject: Re: [PATCH] apt: fix reproducibility issue occasionally
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 04:23:05 -0700
References: <F4ED507B-EA45-4492-BD5C-6552514752E8@arm.com>
In-Reply-To: <F4ED507B-EA45-4492-BD5C-6552514752E8@arm.com>
Message-ID: <20743.1758799385418621275@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="535aRLDYNF5xCnbFmfFh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 11:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224016

--535aRLDYNF5xCnbFmfFh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

The host is Ubuntu 22.04, I manually run `id -gn root' and always get `root=
'
It is weird to get ` wheel' in AB test, and the issue occurs occasionally

$ cat /etc/os-release
PRETTY_NAME=3D"Ubuntu 22.04.4 LTS"
NAME=3D"Ubuntu"
VERSION_ID=3D"22.04"
VERSION=3D"22.04.4 LTS (Jammy Jellyfish)"
VERSION_CODENAME=3Djammy
ID=3Dubuntu
ID_LIKE=3Ddebian
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/priva=
cy-policy"
UBUNTU_CODENAME=3Djammy

$ id -gn root
root

//Hongxu

--535aRLDYNF5xCnbFmfFh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>The host is Ubuntu 22.04, I manually run `id -gn root' and always get =
`root'</div>
<div>It is weird to get `<span style=3D"color: #333333; font-family: system=
-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', =
Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'=
, 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial; display=
: inline !important; float: none;">wheel' in AB test, and the issue occurs =
occasionally</span></div>
<div>&nbsp;</div>
<div>$ cat /etc/os-release&nbsp;<br />PRETTY_NAME=3D"Ubuntu 22.04.4 LTS"<br=
 />NAME=3D"Ubuntu"<br />VERSION_ID=3D"22.04"<br />VERSION=3D"22.04.4 LTS (J=
ammy Jellyfish)"<br />VERSION_CODENAME=3Djammy<br />ID=3Dubuntu<br />ID_LIK=
E=3Ddebian<br />HOME_URL=3D"https://www.ubuntu.com/"<br />SUPPORT_URL=3D"ht=
tps://help.ubuntu.com/"<br />BUG_REPORT_URL=3D"https://bugs.launchpad.net/u=
buntu/"<br />PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-p=
olicies/privacy-policy"<br />UBUNTU_CODENAME=3Djammy</div>
<div>&nbsp;</div>
<div>$ id -gn root<br />root</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--535aRLDYNF5xCnbFmfFh--

