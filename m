Subject: Re: [wrynose][PATCH 1/3] expat: fix CVE-2026-113351
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 04:44:00 -0800
References: <20261105091719.1622520-1-dkelaiya@cisco.com> <DMUZ5O4N7A3R.1ICN3JE02JJZ5@smile.fr>
In-Reply-To: <DMUZ5O4N7A3R.1ICN3JE02JJZ5@smile.fr>
Message-ID: <897588.1794919440693698068@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="L6U8AbSP9KIPT5gNraIB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250445

--L6U8AbSP9KIPT5gNraIB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for reviewing this. I'll send backport patches for both Blacksail an=
d Scarthgap as soon as possible.

Regards,
Darsh

On Sat, Nov 14, 2026 at 07:10 PM, Yoann Congal wrote:

>=20
> On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> Backport the allocation-tracking reset fix [1] from upstream PR [2],
>> which is referenced by the NVD record [3].
>>=20
>> Snapshot retained allocations during XML_ParserReset() and exclude
>> those bytes from the next document's allocation-amplification checks.
>> Include the required counter extraction, accounting-settings
>> correction and both upstream regression tests from the same PR.
>>=20
>> Retain Expat 2.8.3's XmlBigCount counters and adapt the accounting
>> regression to its existing protection-setting APIs. Omit the PR's
>> comment-only encoding-check change because the later check that it
>> explains is absent from this source.
>>=20
>> [1] https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd=
95faa29132e67aa3
>>=20
>> [2] https://github.com/libexpat/libexpat/pull/1431
>> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-113351
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../expat/expat/CVE-2026-113351_p1.patch | 39 ++++++++
>> .../expat/expat/CVE-2026-113351_p2.patch | 65 +++++++++++++
>> .../expat/expat/CVE-2026-113351_p3.patch | 80 ++++++++++++++++
>> .../expat/expat/CVE-2026-113351_p4.patch | 95 +++++++++++++++++++
>> .../expat/expat/CVE-2026-113351_p5.patch | 70 ++++++++++++++
>> meta/recipes-core/expat/expat_2.8.3.bb | 7 +-
>> 6 files changed, 355 insertions(+), 1 deletion(-)
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.patc=
h
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p2.patc=
h
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p3.patc=
h
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p4.patc=
h
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p5.patc=
h
>=20
> Hello,
>=20
> I think master fixed the CVEs of this series by the 2.10.0 upgrade. But
> blacksail (at 2.8.5) is not fixed.
> Can you send a blacksail series to fix those?*
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--L6U8AbSP9KIPT5gNraIB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Thanks for reviewing this. I'll send backport pat=
ches for both Blacksail and Scarthgap as soon as possible.<br /><br />Regar=
ds,<br />Darsh<br /><br />On Sat, Nov 14, 2026 at 07:10 PM, Yoann Congal wr=
ote:</div>
<div>
<blockquote>On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort the allocation-tracking reset fix [1] from upstream PR [2],<br />which =
is referenced by the NVD record [3].<br /><br />Snapshot retained allocatio=
ns during XML_ParserReset() and exclude<br />those bytes from the next docu=
ment's allocation-amplification checks.<br />Include the required counter e=
xtraction, accounting-settings<br />correction and both upstream regression=
 tests from the same PR.<br /><br />Retain Expat 2.8.3's XmlBigCount counte=
rs and adapt the accounting<br />regression to its existing protection-sett=
ing APIs. Omit the PR's<br />comment-only encoding-check change because the=
 later check that it<br />explains is absent from this source.<br /><br />[=
1] <a href=3D"https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81=
e74c4cd95faa29132e67aa3" target=3D"_blank" rel=3D"noopener">https://github.=
com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3</a><b=
r />[2] <a href=3D"https://github.com/libexpat/libexpat/pull/1431" target=
=3D"_blank" rel=3D"noopener">https://github.com/libexpat/libexpat/pull/1431=
</a><br />[3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-113351" =
target=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/CVE-202=
6-113351</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com=
&gt;<br />---<br />.../expat/expat/CVE-2026-113351_p1.patch | 39 ++++++++<b=
r />.../expat/expat/CVE-2026-113351_p2.patch | 65 +++++++++++++<br />.../ex=
pat/expat/CVE-2026-113351_p3.patch | 80 ++++++++++++++++<br />.../expat/exp=
at/CVE-2026-113351_p4.patch | 95 +++++++++++++++++++<br />.../expat/expat/C=
VE-2026-113351_p5.patch | 70 ++++++++++++++<br />meta/recipes-core/expat/ex=
pat_2.8.3.bb | 7 +-<br />6 files changed, 355 insertions(+), 1 deletion(-)<=
br />create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.pa=
tch<br />create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p=
2.patch<br />create mode 100644 meta/recipes-core/expat/expat/CVE-2026-1133=
51_p3.patch<br />create mode 100644 meta/recipes-core/expat/expat/CVE-2026-=
113351_p4.patch<br />create mode 100644 meta/recipes-core/expat/expat/CVE-2=
026-113351_p5.patch</blockquote>
Hello,<br /><br />I think master fixed the CVEs of this series by the 2.10.=
0 upgrade. But blacksail (at 2.8.5) is not fixed.<br />Can you send a black=
sail series to fix those?*<br /><br />Thanks!<br />-- <br />Yoann Congal<br=
 />Smile ECS</blockquote>
</div>

--L6U8AbSP9KIPT5gNraIB--
