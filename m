Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAC4C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 07:23:08 +0000 (UTC)
Subject: Re: [PATCH] binutils: Fix CVE-2025-1180
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (223.237.164.161)
X-Originating-Platform: Windows Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 May 2025 00:23:05 -0700
References: <c8872756-9150-410b-9dee-01a0248ceeb3@gmail.com>
In-Reply-To: <c8872756-9150-410b-9dee-01a0248ceeb3@gmail.com>
Message-ID: <26223.1747984985015269889@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="HKrrixrURXRH8ZNBj9eA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 07:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217178

--HKrrixrURXRH8ZNBj9eA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Test result summary for binutils with before and after applying the patch:

Component Metric Without Patch With Patch Change *binutils* Expected passes=
 310 310 =E2=80=94 Unexpected failures 1 1 =E2=80=94 Untested testcases 1 1=
 =E2=80=94 Unsupported tests 9 9 =E2=80=94 *gas* Expected passes 2017 2017 =
=E2=80=94 Unexpected failures 4 4 =E2=80=94 Unsupported tests 1 1 =E2=80=94=
 *ld* Expected passes 1787 1787 =E2=80=94 Expected failures 7 7 =E2=80=94 U=
nresolved testcases 1 1 =E2=80=94 Untested testcases 20 20 =E2=80=94 Unsupp=
orted tests 99 99 =E2=80=94

There is no regressions in test results.

Thanks,
Harish

--HKrrixrURXRH8ZNBj9eA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Test result summary for binutils with before and after applying the pa=
tch:<br /><br />
<table>
<thead>
<tr>
<th>Component</th>
<th>Metric</th>
<th>Without Patch</th>
<th>With Patch</th>
<th>Change</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>binutils</strong></td>
<td>Expected passes</td>
<td>310</td>
<td>310</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unexpected failures</td>
<td>1</td>
<td>1</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Untested testcases</td>
<td>1</td>
<td>1</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unsupported tests</td>
<td>9</td>
<td>9</td>
<td>&mdash;</td>
</tr>
<tr>
<td><strong>gas</strong></td>
<td>Expected passes</td>
<td>2017</td>
<td>2017</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unexpected failures</td>
<td>4</td>
<td>4</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unsupported tests</td>
<td>1</td>
<td>1</td>
<td>&mdash;</td>
</tr>
<tr>
<td><strong>ld</strong></td>
<td>Expected passes</td>
<td>1787</td>
<td>1787</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Expected failures</td>
<td>7</td>
<td>7</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unresolved testcases</td>
<td>1</td>
<td>1</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Untested testcases</td>
<td>20</td>
<td>20</td>
<td>&mdash;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>Unsupported tests</td>
<td>99</td>
<td>99</td>
<td>&mdash;</td>
</tr>
</tbody>
</table>
</div>
<div><br />There is no regressions in test results.<br /><br />Thanks,<br /=
>Harish</div>

--HKrrixrURXRH8ZNBj9eA--

