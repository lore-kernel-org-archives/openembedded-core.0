Subject: Re: [wrynose][PATCH 06/12] curl: fix CVE-2026-92386
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 09:29:14 -0800
References: <20261104073627.302002-1-dkelaiya@cisco.com> <20261104073627.302002-7-dkelaiya@cisco.com> <DN2R468NTAL9.2NXZ7MZO87AV3@smile.fr>
In-Reply-To: <DN2R468NTAL9.2NXZ7MZO87AV3@smile.fr>
Message-ID: <1257714.1795541354740666673@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3YsSQSVzuazphQlltWHH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251067

--3YsSQSVzuazphQlltWHH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review. I will send a regression follow-up on top
of Joao's patch as soon as possible for Blacksail.

Regards,
Darsh

On Mon, Nov 23, 2026 at 10:33 PM, Yoann Congal wrote:

>=20
> On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>=20
>> Include the upstream correction [3] to accept every cookie-jar record
>> that curl can serialize. The original MAX_COOKIE_LINE + 48 allowance
>> is too small for long paths and domains. Keep both commits in separate
>> patches and include the test1902/lib1902.c regression coverage.
>>=20
>> [1] https://github.com/curl/curl/commit/445aa87e13f91c94bc742f54343a2eac=
924e1765
>>=20
>> [2] https://curl.se/docs/CVE-2026-92386.html
>> [3] https://github.com/curl/curl/commit/7d64440abba37e3d8039fe663d3edc84=
f582ce92
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../curl/curl/CVE-2026-92386_p1.patch | 33 ++++
>> .../curl/curl/CVE-2026-92386_p2.patch | 146 ++++++++++++++++++
>> meta/recipes-support/curl/curl_8.19.0.bb | 2 +
>> 3 files changed, 181 insertions(+)
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patc=
h
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patc=
h
>>=20
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
>> b/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
>> new file mode 100644
>> index 00000000000..4228387ae63
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
>> @@ -0,0 +1,146 @@
>> +From 7d64440abba37e3d8039fe663d3edc84f582ce92 Mon Sep 17 00:00:00 2001
>> +From: Zheng Yu <dataisland@outlook.com>
>> +Date: Wed, 14 Oct 2026 18:13:59 -0700
>> +Subject: [PATCH] cookie: reload complete self-generated cookie jar rows
>> +
>> +Closes #23407
>> +
>> +CVE: CVE-2026-92386
>> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/7d64440=
abba37e3d8039fe663d3edc84f582ce92
>> ]
>> +
>> +Backport Changes:
>> +- Match the two spaces before URL in the deleted CURLOPT_COOKIEJAR
>> + line in lib1902.c; upstream's deleted line uses one space.
>> +
>> +(cherry picked from commit 7d64440abba37e3d8039fe663d3edc84f582ce92)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> +---
>> + lib/cookie.c | 9 ++++++---
>> + tests/data/test1902 | 5 ++++-
>> + tests/libtest/lib1902.c | 39 ++++++++++++++++++++++++++++++++++-----
>> + 3 files changed, 44 insertions(+), 9 deletions(-)
>=20
> Hello,
>=20
> That _p2 looks indeed like a regression fix, it needs to be submitted to
> blacksail.
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--3YsSQSVzuazphQlltWHH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Thanks for the review. I will send a regression f=
ollow-up on top</div>
<div>of Joao's patch as soon as possible for Blacksail.<br /><br />Regards,=
<br />Darsh</div>
<div>&nbsp;</div>
<div>On Mon, Nov 23, 2026 at 10:33 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [2],<br />using the commit =
shown in [1].<br /><br />Include the upstream correction [3] to accept ever=
y cookie-jar record<br />that curl can serialize. The original MAX_COOKIE_L=
INE + 48 allowance<br />is too small for long paths and domains. Keep both =
commits in separate<br />patches and include the test1902/lib1902.c regress=
ion coverage.<br /><br />[1] <a href=3D"https://github.com/curl/curl/commit=
/445aa87e13f91c94bc742f54343a2eac924e1765" target=3D"_blank" rel=3D"noopene=
r">https://github.com/curl/curl/commit/445aa87e13f91c94bc742f54343a2eac924e=
1765</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-92386.html" targ=
et=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-92386.html</a>=
<br />[3] <a href=3D"https://github.com/curl/curl/commit/7d64440abba37e3d80=
39fe663d3edc84f582ce92" target=3D"_blank" rel=3D"noopener">https://github.c=
om/curl/curl/commit/7d64440abba37e3d8039fe663d3edc84f582ce92</a><br /><br /=
>Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />---<br />.../=
curl/curl/CVE-2026-92386_p1.patch | 33 ++++<br />.../curl/curl/CVE-2026-923=
86_p2.patch | 146 ++++++++++++++++++<br />meta/recipes-support/curl/curl_8.=
19.0.bb | 2 +<br />3 files changed, 181 insertions(+)<br />create mode 1006=
44 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch<br />create mode =
100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch<br /><br />di=
ff --git a/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-92386_p2.patch<br />new file mode 100644<b=
r />index 00000000000..4228387ae63<br />--- /dev/null<br />+++ b/meta/recip=
es-support/curl/curl/CVE-2026-92386_p2.patch<br />@@ -0,0 +1,146 @@<br />+F=
rom 7d64440abba37e3d8039fe663d3edc84f582ce92 Mon Sep 17 00:00:00 2001<br />=
+From: Zheng Yu &lt;dataisland@outlook.com&gt;<br />+Date: Wed, 14 Oct 2026=
 18:13:59 -0700<br />+Subject: [PATCH] cookie: reload complete self-generat=
ed cookie jar rows<br />+<br />+Closes #23407<br />+<br />+CVE: CVE-2026-92=
386<br />+Upstream-Status: Backport [<a href=3D"https://github.com/curl/cur=
l/commit/7d64440abba37e3d8039fe663d3edc84f582ce92" target=3D"_blank" rel=3D=
"noopener">https://github.com/curl/curl/commit/7d64440abba37e3d8039fe663d3e=
dc84f582ce92</a>]<br />+<br />+Backport Changes:<br />+- Match the two spac=
es before URL in the deleted CURLOPT_COOKIEJAR<br />+ line in lib1902.c; up=
stream's deleted line uses one space.<br />+<br />+(cherry picked from comm=
it 7d64440abba37e3d8039fe663d3edc84f582ce92)<br />+Signed-off-by: Darsh Kel=
aiya &lt;dkelaiya@cisco.com&gt;<br />+---<br />+ lib/cookie.c | 9 ++++++---=
<br />+ tests/data/test1902 | 5 ++++-<br />+ tests/libtest/lib1902.c | 39 +=
+++++++++++++++++++++++++++++++++-----<br />+ 3 files changed, 44 insertion=
s(+), 9 deletions(-)</blockquote>
Hello,<br /><br />That _p2 looks indeed like a regression fix, it needs to =
be submitted to<br />blacksail.<br /><br />Regards,<br />-- <br />Yoann Con=
gal<br />Smile ECS</blockquote>
</div>

--3YsSQSVzuazphQlltWHH--
