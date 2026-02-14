Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8636EEF5842
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 15:34:34 +0000 (UTC)
Subject: Re: [PATCH] bluez5: upgrade 5.85 -> 5.86
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 07:34:30 -0800
References: <20260214153039.2022198-1-gudni.m.g@gmail.com>
In-Reply-To: <20260214153039.2022198-1-gudni.m.g@gmail.com>
Message-ID: <1493339.1771083270694896639@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ihBxzB9bphBftQqBMABa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231148

--ihBxzB9bphBftQqBMABa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Note I am not the maintainer of this recipe and I just want to see BlueZ be=
ing up to date, especially before new LTS :)

I ran the ptests locally and all of them passed. I did not verify if BlueZ =
5.86 builds with musl.

Below are the steps I used to test:
1) run: bitbake core-image-ptest-bluez5
2) run: runqemu qemux86-64 core-image-ptest-bluez5 slirp nographic snapshot
3) run: /usr/lib/bluez5/ptest/ptest-runner bluez5

--ihBxzB9bphBftQqBMABa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Note I am not the maintainer of this recipe and I just want to see Blu=
eZ being up to date, especially before new LTS :)</div>
<div>&nbsp;</div>
<div>I ran the ptests locally and all of them passed. I did not verify if B=
lueZ 5.86 builds with musl.</div>
<div>&nbsp;</div>
<div>Below are the steps I used to test:</div>
<div>1) run: bitbake core-image-ptest-bluez5</div>
<div>2) run: runqemu qemux86-64 core-image-ptest-bluez5 slirp nographic sna=
pshot</div>
<div>3) run: /usr/lib/bluez5/ptest/ptest-runner bluez5</div>

--ihBxzB9bphBftQqBMABa--

