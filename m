Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2BCC982DA
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 10:46:02 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3: fix CVE-2026-0864
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 03:45:59 -0700
References: <20260826052322.716321-1-dkelaiya@cisco.com> <DLIC3R56WHV2.221JF28TY0KH7@smile.fr>
In-Reply-To: <DLIC3R56WHV2.221JF28TY0KH7@smile.fr>
Message-ID: <632265.1789901159917551066@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Gxr8JgdhbxpqkfNIDRSx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 10:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246262

--Gxr8JgdhbxpqkfNIDRSx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

This CVE is applicable to Python 3.12.13 but is not applicable to Python 3.=
12.14, as per NVD.

Since the Python upgrade commit has already been merged into Scarthgap, thi=
s patch is no longer required.

Thanks,
Darsh

On Fri, Sep 18, 2026 at 02:58 PM, Yoann Congal wrote:

>=20
> On Wed Aug 26, 2026 at 7:23 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>=20
>> [1] https://github.com/python/cpython/commit/db4a157c790479710a1a840d793=
7c5c815a6f8b6
>>=20
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-0864
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../python/python3/CVE-2026-0864.patch | 72 +++++++++++++++++++
>> .../python/python3_3.12.13.bb | 1 +
>> 2 files changed, 73 insertions(+)
>> create mode 100644
>> meta/recipes-devtools/python/python3/CVE-2026-0864.patch
>>=20
>> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
>> b/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
>> new file mode 100644
>> index 0000000000..e39177bdcb
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
>> @@ -0,0 +1,72 @@
>> +From 1426c0d9d57a1ed19f95de0d461903e7cd6f6f64 Mon Sep 17 00:00:00 2001
>> +From: "Miss Islington (bot)"
>> + <31488909+miss-islington@users.noreply.github.com>
>> +Date: Tue, 4 Aug 2026 11:27:20 +0200
>> +Subject: [PATCH] [3.12] gh-143927: Normalize all line endings (CR, CRLF=
,
>> and
>> + LF) in configparser (GH-143929) (#152005)
>> +
>> +gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparse=
r
>> (GH-143929)
>> +
>> +CVE: CVE-2026-0864
>> +Upstream-Status: Backport [ https://github.com/python/cpython/commit/db=
4a157c790479710a1a840d7937c5c815a6f8b6
>> ]
>> +
>> +(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
>> +
>> +Co-authored-by: Seth Larson <seth@python.org>
>> +(cherry picked from commit db4a157c790479710a1a840d7937c5c815a6f8b6)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> +---
>> + Lib/configparser.py | 4 +++-
>> + Lib/test/test_configparser.py | 11 +++++++++++
>> + .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst | 2 ++
>> + 3 files changed, 16 insertions(+), 1 deletion(-)
>> + create mode 100644
>> Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
>=20
> Hello,
>=20
> That patch does not apply:
>=20
> ERROR: python3-3.12.14-r0 do_patch: Applying patch 'CVE-2026-0864.patch'
> on target directory
> 'bitbake-builds/scarthgap/tmp-glibc/work/core2-64-oe-linux/python3/3.12.1=
4/Python-3.12.14'
>=20
> CmdError('quilt --quiltrc
> bitbake-builds/scarthgap/tmp-glibc/work/core2-64-oe-linux/python3/3.12.14=
/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2026-0864.patch
> patching file Lib/configparser.py
> Hunk #1 FAILED at 907.
> 1 out of 1 hunk FAILED -- rejects in file Lib/configparser.py
> patching file Lib/test/test_configparser.py
> Hunk #1 succeeded at 538 with fuzz 2 (offset 11 lines).
> patching file
> Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
> Patch CVE-2026-0864.patch does not apply (enforce with -f)
>=20
> Can you check please?
>=20
> Thanks,
> --
> Yoann Congal
> Smile ECS

--Gxr8JgdhbxpqkfNIDRSx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Yoann,<br /><br />
<p class=3D"isSelectedEnd"><span>This CVE is applicable to Python 3.12.13 b=
ut is not applicable to Python 3.12.14, as per NVD.</span></p>
<p class=3D"isSelectedEnd"><span>Since the Python upgrade commit has alread=
y been merged into Scarthgap, this patch is no longer required.</span></p>
<p><span>Thanks,</span><br /><span>Darsh</span></p>
<br />On Fri, Sep 18, 2026 at 02:58 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Aug 26, 2026 at 7:23 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [2],<br />using the commit =
shown in [1].<br /><br />[1] <a href=3D"https://github.com/python/cpython/c=
ommit/db4a157c790479710a1a840d7937c5c815a6f8b6" target=3D"_blank" rel=3D"no=
opener">https://github.com/python/cpython/commit/db4a157c790479710a1a840d79=
37c5c815a6f8b6</a><br />[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE=
-2026-0864" target=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/de=
tail/CVE-2026-0864</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya=
@cisco.com&gt;<br />---<br />.../python/python3/CVE-2026-0864.patch | 72 ++=
+++++++++++++++++<br />.../python/python3_3.12.13.bb | 1 +<br />2 files cha=
nged, 73 insertions(+)<br />create mode 100644 meta/recipes-devtools/python=
/python3/CVE-2026-0864.patch<br /><br />diff --git a/meta/recipes-devtools/=
python/python3/CVE-2026-0864.patch b/meta/recipes-devtools/python/python3/C=
VE-2026-0864.patch<br />new file mode 100644<br />index 0000000000..e39177b=
dcb<br />--- /dev/null<br />+++ b/meta/recipes-devtools/python/python3/CVE-=
2026-0864.patch<br />@@ -0,0 +1,72 @@<br />+From 1426c0d9d57a1ed19f95de0d46=
1903e7cd6f6f64 Mon Sep 17 00:00:00 2001<br />+From: "Miss Islington (bot)"<=
br />+ &lt;31488909+miss-islington@users.noreply.github.com&gt;<br />+Date:=
 Tue, 4 Aug 2026 11:27:20 +0200<br />+Subject: [PATCH] [3.12] gh-143927: No=
rmalize all line endings (CR, CRLF, and<br />+ LF) in configparser (GH-1439=
29) (#152005)<br />+<br />+gh-143927: Normalize all line endings (CR, CRLF,=
 and LF) in configparser (GH-143929)<br />+<br />+CVE: CVE-2026-0864<br />+=
Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/com=
mit/db4a157c790479710a1a840d7937c5c815a6f8b6" target=3D"_blank" rel=3D"noop=
ener">https://github.com/python/cpython/commit/db4a157c790479710a1a840d7937=
c5c815a6f8b6</a>]<br />+<br />+(cherry picked from commit 5858e42c539dac839=
4636a6e9b30472b8994851f)<br />+<br />+Co-authored-by: Seth Larson &lt;seth@=
python.org&gt;<br />+(cherry picked from commit db4a157c790479710a1a840d793=
7c5c815a6f8b6)<br />+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt=
;<br />+---<br />+ Lib/configparser.py | 4 +++-<br />+ Lib/test/test_config=
parser.py | 11 +++++++++++<br />+ .../2026-01-16-11-58-19.gh-issue-143927.a=
viFeG.rst | 2 ++<br />+ 3 files changed, 16 insertions(+), 1 deletion(-)<br=
 />+ create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-is=
sue-143927.aviFeG.rst</blockquote>
Hello,<br /><br />That patch does not apply:<br /><br />ERROR: python3-3.12=
.14-r0 do_patch: Applying patch 'CVE-2026-0864.patch' on target directory '=
bitbake-builds/scarthgap/tmp-glibc/work/core2-64-oe-linux/python3/3.12.14/P=
ython-3.12.14'<br />CmdError('quilt --quiltrc bitbake-builds/scarthgap/tmp-=
glibc/work/core2-64-oe-linux/python3/3.12.14/recipe-sysroot-native/etc/quil=
trc push', 0, 'stdout: Applying patch CVE-2026-0864.patch<br />patching fil=
e Lib/configparser.py<br />Hunk #1 FAILED at 907.<br />1 out of 1 hunk FAIL=
ED -- rejects in file Lib/configparser.py<br />patching file Lib/test/test_=
configparser.py<br />Hunk #1 succeeded at 538 with fuzz 2 (offset 11 lines)=
.<br />patching file Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue=
-143927.aviFeG.rst<br />Patch CVE-2026-0864.patch does not apply (enforce w=
ith -f)<br /><br />Can you check please?<br /><br />Thanks,<br />-- <br />Y=
oann Congal<br />Smile ECS</blockquote>
</div>

--Gxr8JgdhbxpqkfNIDRSx--

