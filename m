Subject: Re: [wrynose][PATCH 2/3] expat: fix CVE-2026-117610
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 09:20:18 -0800
References: <20261105091719.1622520-1-dkelaiya@cisco.com> <20261105091719.1622520-2-dkelaiya@cisco.com> <DN2MPL18V9TU.1A57UGBE3IOUM@smile.fr>
In-Reply-To: <DN2MPL18V9TU.1A57UGBE3IOUM@smile.fr>
Message-ID: <1247346.1795540818998642938@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DyFl0jBys6cfvBzQoknW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251064

--DyFl0jBys6cfvBzQoknW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

Thanks for the review. I'll retain the regression test in Wrynose and
submit a test-only follow-up for Blacksail as soon as possible.

Regards,
Darsh

On Mon, Nov 23, 2026 at 07:06 PM, Yoann Congal wrote:

>=20
> On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> Backport the merged upstream fix [1] identified by the release
>> announcement [2], together with its regression test [3]. An initial
>> empty, non-final external-entity parse must remain in the correct
>> initialization state instead of reaching a handler with invalid state.
>>=20
>> Use the final merged PR 1444 commits; the earlier advisory reference
>> 7b0d50e4b1d16fafd55876260701e04279a7489d was superseded during review.
>> The regression test uses Expat 2.8.3's existing XCS literals and
>> xcstrcmp helper, so no string-helper refactoring is required.
>>=20
>> The focused external-entity case crashes the unpatched native library
>> and passes with this fix. The full native unit suite also passes.
>> BitBake was not run.
>>=20
>> [1] https://github.com/libexpat/libexpat/commit/bfc28346fa3efeb8ca56c174=
37d24a7344e5feab
>>=20
>> [2] https://www.openwall.com/lists/oss-security/2026/11/02/6
>> [3] https://github.com/libexpat/libexpat/commit/cedb704d2cad9d6ef77f8f17=
2104d3e751eccfd2
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../expat/expat/CVE-2026-117610_p1.patch | 30 ++++++
>> .../expat/expat/CVE-2026-117610_p2.patch | 92 +++++++++++++++++++
>> meta/recipes-core/expat/expat_2.8.3.bb | 2 +
>> 3 files changed, 124 insertions(+)
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p1.patc=
h
>> create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p2.patc=
h
>>=20
>> diff --git a/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
>> b/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
>> new file mode 100644
>> index 0000000000..2ebe6446c4
>> --- /dev/null
>> +++ b/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
>> @@ -0,0 +1,92 @@
>> +From cedb704d2cad9d6ef77f8f172104d3e751eccfd2 Mon Sep 17 00:00:00 2001
>> +From: Sebastian Pipping <sebastian@pipping.org>
>> +Date: Mon, 26 Oct 2026 17:17:57 +0100
>> +Subject: [PATCH] tests: Add a test for a initial non-final empty
>> subparser
>> + parse
>> +
>> +.. with a handler call
>> +
>> +CVE: CVE-2026-117610
>> +Upstream-Status: Backport [ https://github.com/libexpat/libexpat/commit=
/cedb704d2cad9d6ef77f8f172104d3e751eccfd2
>> ]
>> +
>> +Backport Changes:
>> +- Compare handler data with the existing XCS macro and xcstrcmp test
>> + helper in Expat 2.8.3. This replaces xcsdup_str allocations,
>> + allocation assertions and frees, avoiding the newer xcs helpers.
>> +
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>=20
> Hello,
>=20
> Blacksail backport does not have this _p2 adding the test. Can you
> either:
> * resent this without the test, or
> * send the patch adding the test to blacksail? (Since the recipe has
> ptest, adding a test for the non regression of a CVE fix is
> acceptable)
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--DyFl0jBys6cfvBzQoknW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Yoann,<br /><br />Thanks for the review. I'll retain the regress=
ion test in Wrynose and<br />submit a test-only follow-up for Blacksail as =
soon as possible.</div>
<div>&nbsp;</div>
<div>Regards,<br />Darsh</div>
<div>&nbsp;</div>
<div>On Mon, Nov 23, 2026 at 07:06 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort the merged upstream fix [1] identified by the release<br />announcement=
 [2], together with its regression test [3]. An initial<br />empty, non-fin=
al external-entity parse must remain in the correct<br />initialization sta=
te instead of reaching a handler with invalid state.<br /><br />Use the fin=
al merged PR 1444 commits; the earlier advisory reference<br />7b0d50e4b1d1=
6fafd55876260701e04279a7489d was superseded during review.<br />The regress=
ion test uses Expat 2.8.3's existing XCS literals and<br />xcstrcmp helper,=
 so no string-helper refactoring is required.<br /><br />The focused extern=
al-entity case crashes the unpatched native library<br />and passes with th=
is fix. The full native unit suite also passes.<br />BitBake was not run.<b=
r /><br />[1] <a href=3D"https://github.com/libexpat/libexpat/commit/bfc283=
46fa3efeb8ca56c17437d24a7344e5feab" target=3D"_blank" rel=3D"noopener">http=
s://github.com/libexpat/libexpat/commit/bfc28346fa3efeb8ca56c17437d24a7344e=
5feab</a><br />[2] <a href=3D"https://www.openwall.com/lists/oss-security/2=
026/11/02/6" target=3D"_blank" rel=3D"noopener">https://www.openwall.com/li=
sts/oss-security/2026/11/02/6</a><br />[3] <a href=3D"https://github.com/li=
bexpat/libexpat/commit/cedb704d2cad9d6ef77f8f172104d3e751eccfd2" target=3D"=
_blank" rel=3D"noopener">https://github.com/libexpat/libexpat/commit/cedb70=
4d2cad9d6ef77f8f172104d3e751eccfd2</a><br /><br />Signed-off-by: Darsh Kela=
iya &lt;dkelaiya@cisco.com&gt;<br />---<br />.../expat/expat/CVE-2026-11761=
0_p1.patch | 30 ++++++<br />.../expat/expat/CVE-2026-117610_p2.patch | 92 +=
++++++++++++++++++<br />meta/recipes-core/expat/expat_2.8.3.bb | 2 +<br />3=
 files changed, 124 insertions(+)<br />create mode 100644 meta/recipes-core=
/expat/expat/CVE-2026-117610_p1.patch<br />create mode 100644 meta/recipes-=
core/expat/expat/CVE-2026-117610_p2.patch<br /><br />diff --git a/meta/reci=
pes-core/expat/expat/CVE-2026-117610_p2.patch b/meta/recipes-core/expat/exp=
at/CVE-2026-117610_p2.patch<br />new file mode 100644<br />index 0000000000=
..2ebe6446c4<br />--- /dev/null<br />+++ b/meta/recipes-core/expat/expat/CV=
E-2026-117610_p2.patch<br />@@ -0,0 +1,92 @@<br />+From cedb704d2cad9d6ef77=
f8f172104d3e751eccfd2 Mon Sep 17 00:00:00 2001<br />+From: Sebastian Pippin=
g &lt;sebastian@pipping.org&gt;<br />+Date: Mon, 26 Oct 2026 17:17:57 +0100=
<br />+Subject: [PATCH] tests: Add a test for a initial non-final empty sub=
parser<br />+ parse<br />+<br />+.. with a handler call<br />+<br />+CVE: C=
VE-2026-117610<br />+Upstream-Status: Backport [<a href=3D"https://github.c=
om/libexpat/libexpat/commit/cedb704d2cad9d6ef77f8f172104d3e751eccfd2" targe=
t=3D"_blank" rel=3D"noopener">https://github.com/libexpat/libexpat/commit/c=
edb704d2cad9d6ef77f8f172104d3e751eccfd2</a>]<br />+<br />+Backport Changes:=
<br />+- Compare handler data with the existing XCS macro and xcstrcmp test=
<br />+ helper in Expat 2.8.3. This replaces xcsdup_str allocations,<br />+=
 allocation assertions and frees, avoiding the newer xcs helpers.<br />+<br=
 />+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;</blockquote>
Hello,<br /><br />Blacksail backport does not have this _p2 adding the test=
. Can you<br />either:<br />* resent this without the test, or<br />* send =
the patch adding the test to blacksail? (Since the recipe has<br />ptest, a=
dding a test for the non regression of a CVE fix is<br />acceptable)<br /><=
br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--DyFl0jBys6cfvBzQoknW--
