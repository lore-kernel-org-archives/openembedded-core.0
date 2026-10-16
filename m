Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4426ACCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:32 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 5/8] curl: fix CVE-2026-8927
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 06:10:23 -0700
References: <20261007112403.486499-1-devanshp@cisco.com> <20261007112403.486499-5-devanshp@cisco.com> <DM3ZEZORCSRZ.27QK3IA59S0GQ@smile.fr> <PH0PR11MB76163B9949BBA5FD283D5A76D39C2@PH0PR11MB7616.namprd11.prod.outlook.com> <DM5QFWN94ZTR.1JHKJRMRCI8YA@smile.fr>
In-Reply-To: <DM5QFWN94ZTR.1JHKJRMRCI8YA@smile.fr>
Message-ID: <2040945.1792156223788444481@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="218e4RBUyGY5cvUx1lms"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248022

--218e4RBUyGY5cvUx1lms
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have rebased the remaining four patches (5/8=E2=80=938/8) onto stable/sca=
rthgap-review
and Sent v2 [1][2][3][4]. The backport notes now explain the test.h macro r=
equirements,
and the commit messages include the validation results.

The fresh Scarthgap build succeeded along with ptests passing with no failu=
res.

[1] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2_5_8/121787397
[2] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2_6_8/121787401
[3] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2_7_8/121787398
[4] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2_8_8/121787400

Regards,
Devansh

On Fri, Oct 16, 2026 at 03:03 AM, Yoann Congal wrote:

>=20
> On Thu Oct 15, 2026 at 10:27 AM CEST, Devansh Patel -X (devanshp - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>=20
>> Hi Yoann,
>=20
> Hello,
>=20
>=20
>> I compared the submitted backport with upstream. curl 8.7.1 lacks
>> first.h and uses the older test.h harness. Its res_easy_setopt() and
>> res_global_init() macros assign to res, requiring the rename in
>> init1647() and test().
>=20
> Ok, now I see it. To give you an idea, this is the kind of info I want
> in the backport notes. Can you send a v2 of the series with that added?
> You will have to rebase on top of stable/scarthgap-review, I took some
> patches of the series.
>=20
>=20
>> run1647() retains upstream=E2=80=99s result. Following
>> your earlier feedback [1], init1647() also retains the CURLcode type.
>> With those adjustments, the test passes; reversing the library fix
>> reproduces the Digest header leak.
>=20
> This info can go into your commit message. Knowing what kind of test was
> done is always good.
>=20
>=20
>> [1] https://www.mail-archive.com/openembedded-core%40lists.openembedded.=
org/msg226412.html
>>=20
>> Regards,
>> Devansh
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--218e4RBUyGY5cvUx1lms
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />I have rebased the remaining four patches (5/8&nd=
ash;8/8) onto stable/scarthgap-review <br />and Sent v2 [1][2][3][4]. The b=
ackport notes now explain the test.h macro requirements,<br />and the commi=
t messages include the validation results.<br /><br />The fresh Scarthgap b=
uild succeeded along with ptests passing with no failures.<br /><br />[1] <=
a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/scarthga=
p_patch_v2_5_8/121787397" target=3D"_blank" rel=3D"noopener">https://lists.=
openembedded.org/g/openembedded-core/topic/scarthgap_patch_v2_5_8/121787397=
</a><br />[2] <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/topic/scarthgap_patch_v2_6_8/121787401" target=3D"_blank" rel=3D"noopener"=
>https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patch_v=
2_6_8/121787401</a></div>
<div>[3] <a href=3D"https://lists.openembedded.org/g/openembedded-core/topi=
c/scarthgap_patch_v2_7_8/121787398" target=3D"_blank" rel=3D"noopener">http=
s://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patch_v2_7_8=
/121787398</a><br />[4] <a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/topic/scarthgap_patch_v2_8_8/121787400" target=3D"_blank" rel=3D=
"noopener">https://lists.openembedded.org/g/openembedded-core/topic/scarthg=
ap_patch_v2_8_8/121787400</a><br /><br />Regards,<br />Devansh</div>
<div>&nbsp;</div>
<div>On Fri, Oct 16, 2026 at 03:03 AM, Yoann Congal wrote:</div>
<div>
<blockquote>On Thu Oct 15, 2026 at 10:27 AM CEST, Devansh Patel -X (devansh=
p - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br />
<blockquote>Hi Yoann,</blockquote>
Hello,<br /><br />
<blockquote>I compared the submitted backport with upstream. curl 8.7.1 lac=
ks<br />first.h and uses the older test.h harness. Its res_easy_setopt() an=
d<br />res_global_init() macros assign to res, requiring the rename in<br /=
>init1647() and test().</blockquote>
Ok, now I see it. To give you an idea, this is the kind of info I want<br /=
>in the backport notes. Can you send a v2 of the series with that added?<br=
 />You will have to rebase on top of stable/scarthgap-review, I took some<b=
r />patches of the series.<br /><br />
<blockquote>run1647() retains upstream&rsquo;s result. Following<br />your =
earlier feedback [1], init1647() also retains the CURLcode type.<br />With =
those adjustments, the test passes; reversing the library fix<br />reproduc=
es the Digest header leak.</blockquote>
This info can go into your commit message. Knowing what kind of test was<br=
 />done is always good.<br /><br />
<blockquote>[1] <a href=3D"https://www.mail-archive.com/openembedded-core%4=
0lists.openembedded.org/msg226412.html" target=3D"_blank" rel=3D"noopener">=
https://www.mail-archive.com/openembedded-core%40lists.openembedded.org/msg=
226412.html</a><br />Regards,<br />Devansh</blockquote>
Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--218e4RBUyGY5cvUx1lms--

