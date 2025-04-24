Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAAFC369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:50:54 +0000 (UTC)
Subject: Re: [PATCH] glibc-y2038-tests:add tests-special in run-built-tests yes
To: openembedded-core@lists.openembedded.org
From: "rajmohan r" <semc.2042@gmail.com>
X-Originating-Location: IN (136.226.253.31)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 24 Apr 2025 07:50:50 -0700
References: <CANNYZj8ineDyXv8pNgb3GkTJ2RFFm=md5-JiPRo2TxbouP9PPg@mail.gmail.com>
In-Reply-To: <CANNYZj8ineDyXv8pNgb3GkTJ2RFFm=md5-JiPRo2TxbouP9PPg@mail.gmail.com>
Message-ID: <28087.1745506250655631551@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Tqggh4tUKH48kkqXbzDR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215382

--Tqggh4tUKH48kkqXbzDR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 03:52 PM, Alexander Kanavin wrote:

>=20
> On Tue, 22 Apr 2025 at 13:03, rajmohan r via lists.openembedded.org
> <semc.2042=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> On Thu, Apr 10, 2025 at 07:34 PM, Alexander Kanavin wrote:
>>=20
>> Thanks. This patch is invasive and adds to glibc maintenance burden.
>> Which begs the question: do we need the recipe at all? Is there a
>> particular reason you started looking into this issue?
>>=20
>> When we moved from yocto kirkstone branch to scarthgap branch, we found
>> that
>> compilation for this module taking longer time. hence started looking
>> which stage
>> in this module takes time. Found that it is in do_check() stage.
>>=20
>>=20
>> It is by now well established that glibc itself works as it should,
>> that all affected 32 bit targets are configured to use 64 bit time_t,
>> and that any lingering y2038 issues are in components other than the c
>> library, and usually come from C programming mistakes (e.g. storing
>> timestamps in long). Maybe we can simply remove the recipe?
>>=20
>> This recipe gives only two test cases in the packages to test. below are
>> the
>> test cases seen for this package
>> io/ftwtest
>> io/ftwtest-time64
>=20
> Right. I propose that this recipe be altogether removed (with the
> rationale I provided above which you can add to the commit message).
> Can you send a patch for that?

Patch is send here https://lists.openembedded.org/g/openembedded-core/messa=
ge/215381 please review. Thanks for reviewing.

>=20
> Alex

--Tqggh4tUKH48kkqXbzDR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Apr 22, 2025 at 03:52 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>On Tue, 22 Apr 2025 at 13:03, rajmohan r via lists.openembedded=
.org<br />&lt;semc.2042=3Dgmail.com@lists.openembedded.org&gt; wrote:<br />
<blockquote>On Thu, Apr 10, 2025 at 07:34 PM, Alexander Kanavin wrote:<br /=
><br />Thanks. This patch is invasive and adds to glibc maintenance burden.=
<br />Which begs the question: do we need the recipe at all? Is there a<br =
/>particular reason you started looking into this issue?<br /><br />When we=
 moved from yocto kirkstone branch to scarthgap branch, we found that<br />=
compilation for this module taking longer time. hence started looking which=
 stage<br />in this module takes time. Found that it is in do_check() stage=
.<br /><br /><br />It is by now well established that glibc itself works as=
 it should,<br />that all affected 32 bit targets are configured to use 64 =
bit time_t,<br />and that any lingering y2038 issues are in components othe=
r than the c<br />library, and usually come from C programming mistakes (e.=
g. storing<br />timestamps in long). Maybe we can simply remove the recipe?=
<br /><br />This recipe gives only two test cases in the packages to test. =
below are the<br />test cases seen for this package<br />io/ftwtest<br />io=
/ftwtest-time64</blockquote>
Right. I propose that this recipe be altogether removed (with the<br />rati=
onale I provided above which you can add to the commit message).<br />Can y=
ou send a patch for that?</blockquote>
Patch is send here <a href=3D"https://lists.openembedded.org/g/openembedded=
-core/message/215381" target=3D"_blank" rel=3D"noopener">https://lists.open=
embedded.org/g/openembedded-core/message/215381</a> please review. Thanks f=
or reviewing.<br />
<blockquote>Alex</blockquote>
</div>

--Tqggh4tUKH48kkqXbzDR--

