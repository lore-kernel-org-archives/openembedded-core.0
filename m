Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23F0C3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 19:22:41 +0000 (UTC)
Subject: Re: [PATCH] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: Bagshot, England, GB (64.103.40.23)
X-Originating-Platform: Windows Firefox 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Jul 2024 12:22:32 -0700
References: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
In-Reply-To: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
Message-ID: <28508.1720812152706147809@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FjO1CSVVplLw3Vl2A5ep"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 19:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201850

--FjO1CSVVplLw3Vl2A5ep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

gcc recipe structure is quite complex. Where should I put these common func=
tions? gcc-configure-common.inc ?
I see that all 3 files (gcc-target.inc, gcc-cross.inc, gcc-cross-canadian.i=
nc) which use this code `require gcc-configure-common.inc`.

Thanks,
Oleksandr

--FjO1CSVVplLw3Vl2A5ep
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br /><br />gcc recipe structure is quite complex. Where should I p=
ut these common functions? gcc-configure-common.inc ?<br />I see that all 3=
 files (gcc-target.inc, gcc-cross.inc, gcc-cross-canadian.inc) which use th=
is code `require gcc-configure-common.inc`.<br /><br />Thanks,<br />Oleksan=
dr

--FjO1CSVVplLw3Vl2A5ep--

