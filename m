Subject: Re: [wrynose][PATCH] sudo: fix CVE-2026-82474
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 04:37:31 -0800
References: <20261016065612.3926487-1-dkelaiya@cisco.com> <DM8WHNPDNECC.29BQ7CT8Z4HTX@smile.fr> <DMUTN7GH0G17.1CLRYSDWZVSUP@smile.fr>
In-Reply-To: <DMUTN7GH0G17.1CLRYSDWZVSUP@smile.fr>
Message-ID: <897588.1794919051663404605@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QNl5HUQ4rTkSZgxSi2oo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250444

--QNl5HUQ4rTkSZgxSi2oo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I'm preparing a backport patch for Blacksail also. Will send as soon as pos=
sible.

Thanks,
Darsh

On Sat, Nov 14, 2026 at 02:51 PM, Yoann Congal wrote:

>=20
> On Mon Oct 19, 2026 at 4:56 PM CEST, Yoann Congal wrote:
>=20
>> On Fri Oct 16, 2026 at 8:56 AM CEST, Darsh Kelaiya -X (dkelaiya - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>=20
>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>=20
>>> This patch applies the upstream fix as referenced in [2],
>>> using the commit shown in [1].
>>>=20
>>> The recipe enables Linux intercept support. Check execveat commands
>>> and log subcommands instead of allowing this syscall unconditionally.
>>> Resolve directory file descriptors and AT_EMPTY_PATH to paths for
>>> sudoers policy checks.
>>>=20
>>> Apply prerequisites [3] and [4] for proc_read_link() and fexecve paths.
>>> Include follow-ups [5] and [6] to reject failed pathname rewrites and
>>> correct relative-path moves. Keep the upstream source changes intact.
>>>=20
>>> [1] https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f7995405=
83a2dfb2ae6221edf
>>>=20
>>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-82474
>>> [3] https://github.com/sudo-project/sudo/commit/1a312af6348594df371e608=
8aeed99685977f575
>>>=20
>>> [4] https://github.com/sudo-project/sudo/commit/e822b729da31baf91549463=
29a9d6ef569f0d182
>>>=20
>>> [5] https://github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2=
af42399fcc5f1e3cd
>>>=20
>>> [6] https://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537=
b7f11bd5e7e10512e
>>>=20
>>>=20
>>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>>> ---
>>> .../files/CVE-2026-82474-dependent_p1.patch | 94 +++
>>> .../files/CVE-2026-82474-dependent_p2.patch | 34 +
>>> .../files/CVE-2026-82474-regression_p1.patch | 39 ++
>>> .../files/CVE-2026-82474-regression_p2.patch | 33 +
>>> .../sudo/files/CVE-2026-82474.patch | 617 ++++++++++++++++++
>>> meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 5 +
>>> 6 files changed, 822 insertions(+)
>>> create mode 100644
>>> meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p1.patch
>>> create mode 100644
>>> meta/recipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch
>>> create mode 100644
>>> meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patch
>>> create mode 100644
>>> meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p2.patch
>>> create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474.patc=
h
>>=20
>> Hello,
>>=20
>> I think this fix is also needed for blacksail and master. Can you send
>> the relevant upgrade/backports so I can merge this on wrynose?
>=20
> Hello,
>=20
> This CVE is now fixed on master but the cherry-pick does not apply
> cleanly for blacksail. Can you send this fix for blacksail as well?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--QNl5HUQ4rTkSZgxSi2oo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />I'm preparing a backport patch for Blacksail also=
. Will send as soon as possible.<br /><br />Thanks,<br />Darsh<br /><br />O=
n Sat, Nov 14, 2026 at 02:51 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Mon Oct 19, 2026 at 4:56 PM CEST, Yoann Congal wrote:<br />
<blockquote>On Fri Oct 16, 2026 at 8:56 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [2],<br />using the commit =
shown in [1].<br /><br />The recipe enables Linux intercept support. Check =
execveat commands<br />and log subcommands instead of allowing this syscall=
 unconditionally.<br />Resolve directory file descriptors and AT_EMPTY_PATH=
 to paths for<br />sudoers policy checks.<br /><br />Apply prerequisites [3=
] and [4] for proc_read_link() and fexecve paths.<br />Include follow-ups [=
5] and [6] to reject failed pathname rewrites and<br />correct relative-pat=
h moves. Keep the upstream source changes intact.<br /><br />[1] <a href=3D=
"https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f799540583a2dfb=
2ae6221edf" target=3D"_blank" rel=3D"noopener">https://github.com/sudo-proj=
ect/sudo/commit/71fbe42dcd5a1c8f799540583a2dfb2ae6221edf</a><br />[2] <a hr=
ef=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-82474" target=3D"_blank" re=
l=3D"noopener">https://nvd.nist.gov/vuln/detail/CVE-2026-82474</a><br />[3]=
 <a href=3D"https://github.com/sudo-project/sudo/commit/1a312af6348594df371=
e6088aeed99685977f575" target=3D"_blank" rel=3D"noopener">https://github.co=
m/sudo-project/sudo/commit/1a312af6348594df371e6088aeed99685977f575</a><br =
/>[4] <a href=3D"https://github.com/sudo-project/sudo/commit/e822b729da31ba=
f9154946329a9d6ef569f0d182" target=3D"_blank" rel=3D"noopener">https://gith=
ub.com/sudo-project/sudo/commit/e822b729da31baf9154946329a9d6ef569f0d182</a=
><br />[5] <a href=3D"https://github.com/sudo-project/sudo/commit/d1121181a=
87b2b47b4dfbb2af42399fcc5f1e3cd" target=3D"_blank" rel=3D"noopener">https:/=
/github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2af42399fcc5f1e3=
cd</a><br />[6] <a href=3D"https://github.com/sudo-project/sudo/commit/02b1=
4c043825b52be6cd537b7f11bd5e7e10512e" target=3D"_blank" rel=3D"noopener">ht=
tps://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537b7f11bd5e7=
e10512e</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&=
gt;<br />---<br />.../files/CVE-2026-82474-dependent_p1.patch | 94 +++<br /=
>.../files/CVE-2026-82474-dependent_p2.patch | 34 +<br />.../files/CVE-2026=
-82474-regression_p1.patch | 39 ++<br />.../files/CVE-2026-82474-regression=
_p2.patch | 33 +<br />.../sudo/files/CVE-2026-82474.patch | 617 +++++++++++=
+++++++<br />meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 5 +<br />6 files=
 changed, 822 insertions(+)<br />create mode 100644 meta/recipes-extended/s=
udo/files/CVE-2026-82474-dependent_p1.patch<br />create mode 100644 meta/re=
cipes-extended/sudo/files/CVE-2026-82474-dependent_p2.patch<br />create mod=
e 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regression_p1.patc=
h<br />create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-r=
egression_p2.patch<br />create mode 100644 meta/recipes-extended/sudo/files=
/CVE-2026-82474.patch</blockquote>
Hello,<br /><br />I think this fix is also needed for blacksail and master.=
 Can you send<br />the relevant upgrade/backports so I can merge this on wr=
ynose?</blockquote>
Hello,<br /><br />This CVE is now fixed on master but the cherry-pick does =
not apply<br />cleanly for blacksail. Can you send this fix for blacksail a=
s well?<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</block=
quote>
</div>

--QNl5HUQ4rTkSZgxSi2oo--
