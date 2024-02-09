Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFCDC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:23:26 +0000 (UTC)
Subject: Re: [kirkstone][PATCH v2] shadow: backport patch to fix CVE-2023-29383
To: openembedded-core@lists.openembedded.org
From: "Pawan Badganchi" <badganchipv@gmail.com>
X-Originating-Location: US (136.226.233.98)
X-Originating-Platform: Linux Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 03:23:18 -0800
References: <CA+chaQddzpzuTUv39y+WHrmun4K4ZSRpdmf9POJJYjqU331xeQ@mail.gmail.com>
In-Reply-To: <CA+chaQddzpzuTUv39y+WHrmun4K4ZSRpdmf9POJJYjqU331xeQ@mail.gmail.com>
Message-ID: <3891.1707477798704237933@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tA8tSLa47njHAFi5sFQF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195198

--tA8tSLa47njHAFi5sFQF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Already set=C2=A0 oe-core/meta/recipes-extended/shadow/files/login.defs_sha=
dow-sysroot:SYSLOG_SU_ENAB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes
Still issue is coming.

# Enable "syslog" logging of su activity - in addition to sulog file loggin=
g.
# SYSLOG_SG_ENAB does the same for newgrp and sg.
#
SYSLOG_SU_ENAB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes
SYSLOG_SG_ENAB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes

--tA8tSLa47njHAFi5sFQF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Already set&nbsp; oe-core/meta/recipes-extended/shadow/files/login.def=
s_shadow-sysroot:SYSLOG_SU_ENAB &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; y=
es
<div>Still issue is coming.</div>
<br /># Enable "syslog" logging of su activity - in addition to sulog file =
logging.</div>
<div># SYSLOG_SG_ENAB does the same for newgrp and sg.</div>
<div>#</div>
<div>SYSLOG_SU_ENAB&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes</div>
<div>SYSLOG_SG_ENAB&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes</div>
<div>&nbsp;</div>

--tA8tSLa47njHAFi5sFQF--

