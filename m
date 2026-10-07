Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDA4CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:48:55 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v3 5/5] curl: fix CVE-2026-7168
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 04:48:50 -0700
References: <20260804103305.1180770-5-deeratho@cisco.com> <20260824094720.2194782-1-deeratho@cisco.com> <DLIBX22WN2SX.1MVF74KFYR0Q1@smile.fr> <DLIBYRX0TCX1.DDHXW0VLSJG3@smile.fr>
In-Reply-To: <DLIBYRX0TCX1.DDHXW0VLSJG3@smile.fr>
Message-ID: <1690975.1791373730074697715@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AqEUqMruOqcL3wz7j4cl"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247397

--AqEUqMruOqcL3wz7j4cl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I have submitted updated fixes for CVE-2026-6429 and CVE-2026-7168 as patch=
es 7/8 and 8/8 in a complete Scarthgap curl series:

https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D51870

For CVE-2026-7168, the test prerequisite is separate, the curl 8.7.1 backpo=
rt changes are explained, and the CURLcode-returning helpers use CURLcode.

Please consider Deepak's v3 4/5 and 5/5 patches superseded and review the n=
ew series.

Regards,
Devansh

On Fri, Sep 18, 2026 at 02:51 PM, Yoann Congal wrote:

>=20
> On Fri Sep 18, 2026 at 11:19 AM CEST, Yoann Congal wrote:
>=20
>> Hello,
>>=20
>> This patch conflict with other patches in my branch. Because this one
>> has issues, I will hold it for another cycle, you will have to
>> refresh/rebase on top of the next merge (or send me a new version that
>> applies on top of the -nut branch I will push/test later today)
>>=20
>> Details of the issues below:
>=20
> I forgot to add that sending partial series (only 4,5/5 and not 1,2/2)
> make my tooling throw warnings... Can you send the patches as 1,2/2 in
> the next iteration?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--AqEUqMruOqcL3wz7j4cl
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br />I have submitted updated fixes for CVE-2026-6429 and CV=
E-2026-7168 as patches 7/8 and 8/8 in a complete Scarthgap curl series:<br =
/><br />https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D5=
1870<br /><br />For CVE-2026-7168, the test prerequisite is separate, the c=
url 8.7.1 backport changes are explained, and the CURLcode-returning helper=
s use CURLcode.<br /><br />Please consider Deepak's v3 4/5 and 5/5 patches =
superseded and review the new series.<br /><br />Regards,<br />Devansh</div=
>
<div>&nbsp;</div>
<div>On Fri, Sep 18, 2026 at 02:51 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Fri Sep 18, 2026 at 11:19 AM CEST, Yoann Congal wrote:<br />
<blockquote>Hello,<br /><br />This patch conflict with other patches in my =
branch. Because this one<br />has issues, I will hold it for another cycle,=
 you will have to<br />refresh/rebase on top of the next merge (or send me =
a new version that<br />applies on top of the -nut branch I will push/test =
later today)<br /><br />Details of the issues below:</blockquote>
I forgot to add that sending partial series (only 4,5/5 and not 1,2/2)<br /=
>make my tooling throw warnings... Can you send the patches as 1,2/2 in<br =
/>the next iteration?<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Sm=
ile ECS</blockquote>
</div>

--AqEUqMruOqcL3wz7j4cl--

