Return-Path: <woojoong.kim@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDECE92FE4
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 05:14:55 +0000 (UTC)
Subject: Need suggestions: in case where linux-libc-headers and the kernel versions differ
To: openembedded-core@lists.openembedded.org
From: woojoong.kim@lge.com
X-Originating-Location: Changwon, Gyeongsangnam-do, KR (27.122.242.64)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 05 Oct 2023 22:14:48 -0700
Message-ID: <wbIO.1696569288812482209.BHV9@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kYwwx6gSa35dxn0ZtVbE"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 05:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188743

--kYwwx6gSa35dxn0ZtVbE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am using different versions of the kernel and linux-libc-headers in the p=
roject.
Some modules are built using linux-libc-headers.

I'm wondering which version to use as the basis when searching for vulnerab=
ility listings on nvd.nist.gov.

To my knowledge, linux-libc-headers only contain headers and do not include=
 the kernel itself or source code. Additionally, the project may have only =
one kernel version.

For example, the kernel is version 5.4, and linux-libc-headers is version 5=
.16.
In this case, should I primarily check for vulnerabilities based on the ker=
nel version, which is 5.4? or 5.16 also need to be checked?

--kYwwx6gSa35dxn0ZtVbE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,<br /><br />
<div>I am using different versions of the kernel and linux-libc-headers in =
the project.<br />Some modules are built using linux-libc-headers.<br /><br=
 />I'm wondering which version to use as the basis when searching for vulne=
rability listings on nvd.nist.gov.</div>
<div><br />
<div>To my knowledge, linux-libc-headers only contain headers and do not in=
clude the kernel itself or source code. Additionally, the project may have =
only one kernel version.</div>
<div>&nbsp;</div>
<div>For example, the kernel is version 5.4, and linux-libc-headers is vers=
ion 5.16.</div>
<div>In this case, should I primarily check for vulnerabilities based on th=
e kernel version, which is 5.4? or 5.16 also need to be checked?</div>
</div>

--kYwwx6gSa35dxn0ZtVbE--

