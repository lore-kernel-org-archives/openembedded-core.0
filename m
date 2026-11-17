Subject: Re: [wrynose][PATCH 3/3] python3: fix CVE-2026-87910
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 04:51:36 -0800
References: <20261016053944.3835603-1-dkelaiya@cisco.com> <20261016053944.3835603-4-dkelaiya@cisco.com> <DMUU3P3KWKLT.308M5CKOHWEOP@smile.fr>
In-Reply-To: <DMUU3P3KWKLT.308M5CKOHWEOP@smile.fr>
Message-ID: <882014.1794919896160101502@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jgnZI3ZnuglGcORsvYLL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250446

--jgnZI3ZnuglGcORsvYLL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Since python3 has been upgraded to 3.14.10 on Wrynose,
this series is no longer required.

Thanks,
Darsh
On Sat, Nov 14, 2026 at 03:12 PM, Yoann Congal wrote:

>=20
> On Fri Oct 16, 2026 at 7:39 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix shown in [1]. The Windows test
>> correction is applied from [2]. The advisory identifying the fix is
>> referenced in [3].
>>=20
>> [1] https://github.com/python/cpython/commit/fb2f0bbc3b35264f09cc2cb2934=
b7987527a6bc2
>>=20
>> [2] https://github.com/python/cpython/commit/d9565e54b1fc6d63c5be9afd581=
14499128fa57b
>>=20
>> [3] https://nvd.nist.gov/vuln/detail/cve-2026-87910
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../python/python3/CVE-2026-87910_p1.patch | 98 +++++++++++++++++++
>=20
> Hello,
>=20
> CVE-2026-87910_p1.patch now fails to apply on top of the recent python3
> upgrade:
> | ERROR: python3-3.14.10-r0 do_patch: Applying patch
> 'wrynose/_review/worktrees/openembedded-core/meta/recipes-devtools/python=
/python3/CVE-2026-87910_p1.patch'
> on target directory
> 'bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-linux/python3/3.14.10/sourc=
es/Python-3.14.10'
>=20
> | CmdError('quilt --quiltrc
> bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-linux/python3/3.14.10/recipe=
-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2026-87910_p1.patch
> | patching file Lib/tarfile.py
> | Hunk #1 FAILED at 2818.
> | 1 out of 1 hunk FAILED -- rejects in file Lib/tarfile.py
> | patching file Lib/test/test_tarfile.py
> | Hunk #1 FAILED at 4395.
> | Hunk #2 succeeded at 4710 with fuzz 2 (offset 134 lines).
> | 1 out of 2 hunks FAILED -- rejects in file Lib/test/test_tarfile.py
> | patching file
> Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-157265.-vYuMp.rst
> | Patch CVE-2026-87910_p1.patch does not apply (enforce with -f)
>=20
> Can you rebase&resend?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--jgnZI3ZnuglGcORsvYLL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: #000000;"><span sty=
le=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetic=
a Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Em=
oji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 1=
6px;">Hi Yoann,<br /><br />Since python3 has been upgraded to 3.14.10 on Wr=
ynose,<br />this series is no longer required.<br /><br />Thanks,<br />Dars=
h<br />On Sat, Nov 14, 2026 at 03:12 PM, Yoann Congal wrote:</span></div>
</div>
<div>
<blockquote>On Fri Oct 16, 2026 at 7:39 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix shown in [1]. The Windows test<br />correcti=
on is applied from [2]. The advisory identifying the fix is<br />referenced=
 in [3].<br /><br />[1] <a href=3D"https://github.com/python/cpython/commit=
/fb2f0bbc3b35264f09cc2cb2934b7987527a6bc2" target=3D"_blank" rel=3D"noopene=
r">https://github.com/python/cpython/commit/fb2f0bbc3b35264f09cc2cb2934b798=
7527a6bc2</a><br />[2] <a href=3D"https://github.com/python/cpython/commit/=
d9565e54b1fc6d63c5be9afd58114499128fa57b" target=3D"_blank" rel=3D"noopener=
">https://github.com/python/cpython/commit/d9565e54b1fc6d63c5be9afd58114499=
128fa57b</a><br />[3] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-=
87910" target=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/=
cve-2026-87910</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cis=
co.com&gt;<br />---<br />.../python/python3/CVE-2026-87910_p1.patch | 98 ++=
+++++++++++++++++</blockquote>
Hello,<br /><br />CVE-2026-87910_p1.patch now fails to apply on top of the =
recent python3<br />upgrade:<br />| ERROR: python3-3.14.10-r0 do_patch: App=
lying patch 'wrynose/_review/worktrees/openembedded-core/meta/recipes-devto=
ols/python/python3/CVE-2026-87910_p1.patch' on target directory 'bitbake-bu=
ilds/wrynose/tmp/work/x86-64-v3-oe-linux/python3/3.14.10/sources/Python-3.1=
4.10'<br />| CmdError('quilt --quiltrc bitbake-builds/wrynose/tmp/work/x86-=
64-v3-oe-linux/python3/3.14.10/recipe-sysroot-native/etc/quiltrc push', 0, =
'stdout: Applying patch CVE-2026-87910_p1.patch<br />| patching file Lib/ta=
rfile.py<br />| Hunk #1 FAILED at 2818.<br />| 1 out of 1 hunk FAILED -- re=
jects in file Lib/tarfile.py<br />| patching file Lib/test/test_tarfile.py<=
br />| Hunk #1 FAILED at 4395.<br />| Hunk #2 succeeded at 4710 with fuzz 2=
 (offset 134 lines).<br />| 1 out of 2 hunks FAILED -- rejects in file Lib/=
test/test_tarfile.py<br />| patching file Misc/NEWS.d/next/Security/2026-09=
-10-13-38-11.gh-issue-157265.-vYuMp.rst<br />| Patch CVE-2026-87910_p1.patc=
h does not apply (enforce with -f)<br /><br />Can you rebase&amp;resend?<br=
 /><br />Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--jgnZI3ZnuglGcORsvYLL--
