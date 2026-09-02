Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A56AC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:16:10 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3-py: ignore CVE-2022-42969
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 23:16:05 -0700
References: <20260826053217.729875-1-dkelaiya@cisco.com> <DL3V33TEPWDN.ZM1L9P29KZF9@smile.fr>
In-Reply-To: <DL3V33TEPWDN.ZM1L9P29KZF9@smile.fr>
Message-ID: <2527846.1788329765934963865@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sptByxRZBGD4U4imcn0J"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244894

--sptByxRZBGD4U4imcn0J
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 02:40 PM, Yoann Congal wrote:

>=20
> On Wed Aug 26, 2026 at 7:32 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> Analysis:
>> - NVD marks CVE-2022-42969 as disputed because multiple parties could
>> not reproduce it and argue that it is not a valid vulnerability [1].
>> - GitHub withdrew the advisory because the available evidence does not
>> show a valid, reproducible vulnerability [2].
>> - Wrynose and master use the same python3-py version and carry the same
>> disputed CVE status, so that disposition applies to Scarthgap [3].
>> - Hence ignoring the CVE for now.
>>=20
>> Reference:
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-42969
>> [2] https://github.com/advisories/GHSA-w596-4wvx-j9j6
>> [3] https://git.openembedded.org/meta-openembedded/commit/?id=3D91f6b85b=
36316d5940ee194b1d195caf3ac040b1
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>=20
> Hello,
>=20
> This CVE is already not in our metrics. Because OE-Core/scarthgap lacks
> these commits from meta-openembedded:
> * 1fac509459 (python3-py: set CVE_PRODUCT, 2025-12-31)
> * 26fa8b053b (python3-py: correct CVE_PRODUCT mapping, 2026-08-21)
>=20
> Can you send a v2 series with these backports added?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

Hi Yoann,

I=E2=80=99ve added the two requested python3-py backports in the v2 series:

https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patch_v2=
_1_3/121047195

Thanks,
Darsh Kelaiya

--sptByxRZBGD4U4imcn0J
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Sep 1, 2026 at 02:40 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Aug 26, 2026 at 7:32 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Analy=
sis:<br />- NVD marks CVE-2022-42969 as disputed because multiple parties c=
ould<br />not reproduce it and argue that it is not a valid vulnerability [=
1].<br />- GitHub withdrew the advisory because the available evidence does=
 not<br />show a valid, reproducible vulnerability [2].<br />- Wrynose and =
master use the same python3-py version and carry the same<br />disputed CVE=
 status, so that disposition applies to Scarthgap [3].<br />- Hence ignorin=
g the CVE for now.<br /><br />Reference:<br />[1] <a href=3D"https://nvd.ni=
st.gov/vuln/detail/CVE-2022-42969" target=3D"_blank" rel=3D"noopener">https=
://nvd.nist.gov/vuln/detail/CVE-2022-42969</a><br />[2] <a href=3D"https://=
github.com/advisories/GHSA-w596-4wvx-j9j6" target=3D"_blank" rel=3D"noopene=
r">https://github.com/advisories/GHSA-w596-4wvx-j9j6</a><br />[3] <a href=
=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D91f6b85b363=
16d5940ee194b1d195caf3ac040b1" target=3D"_blank" rel=3D"noopener">https://g=
it.openembedded.org/meta-openembedded/commit/?id=3D91f6b85b36316d5940ee194b=
1d195caf3ac040b1</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@c=
isco.com&gt;<br />---<br />meta/recipes-devtools/python/python3-py_1.11.0.b=
b | 2 ++<br />1 file changed, 2 insertions(+)</blockquote>
Hello,<br /><br />This CVE is already not in our metrics. Because OE-Core/s=
carthgap lacks<br />these commits from meta-openembedded:<br />* 1fac509459=
 (python3-py: set CVE_PRODUCT, 2025-12-31)<br />* 26fa8b053b (python3-py: c=
orrect CVE_PRODUCT mapping, 2026-08-21)<br /><br />Can you send a v2 series=
 with these backports added?<br /><br />Thanks!<br />-- <br />Yoann Congal<=
br />Smile ECS</blockquote>
Hi Yoann,<br /><br />I&rsquo;ve added the two requested python3-py backport=
s in the v2 series:<br /><br />https://lists.openembedded.org/g/openembedde=
d-core/topic/scarthgap_patch_v2_1_3/121047195<br /><br />Thanks,<br />Darsh=
 Kelaiya</div>

--sptByxRZBGD4U4imcn0J--

