Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67986C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 11:17:14 +0000 (UTC)
Subject: Re: [scarthgap] [PATCH] apt: CVE-2011-3374
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 04:17:08 -0700
References: <20260601134048.45729-1-adongare@cisco.com> <DJ4HENS1HI6E.CJ0J0A7TESHU@smile.fr>
In-Reply-To: <DJ4HENS1HI6E.CJ0J0A7TESHU@smile.fr>
Message-ID: <2283556.1787656628832856546@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="s92IF2E3OxMGMMUOAVf4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244230

--s92IF2E3OxMGMMUOAVf4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 04:58 PM, J=C3=A9r=C3=A9my Rosen wrote:

>=20
> Hello Anil
>=20
> It seems this CVE is not fixed upstream, so the not-applicable tag must
> also be applied to master and wrynose
>=20
> please submit patches for those two branches and then ping here
>=20
> thanks a lot
> Jeremy
>=20
> On Mon Jun 1, 2026 at 3:40 PM CEST, Anil Dongare -X (adongare - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Anil Dongare <adongare@cisco.com>
>>=20
>> Details: https://security-tracker.debian.org/tracker/CVE-2011-3374
>>=20
>> The vulnerability is a design-level flaw in the legacy apt-key utility
>> regarding
>> the global trust model of GPG keys.
>>=20
>> This is marked as not-applicable-config because apt-key net-update is
>> disabled by default, and Debian vendor configuration does not define the
>> archive keyring URI required to use that path. Ignore this CVE in this
>> recipe due to this configuration.
>>=20
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>> ---
>> meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb
>> b/meta/recipes-devtools/apt/apt_2.6.1.bb
>> index 12915660b0..8b48de3498 100644
>> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
>> +++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
>> @@ -38,6 +38,9 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>> # to express 'divisible by 4 plus 2' in regex (that I know of), let's
>> hardcode a few.
>> UPSTREAM_CHECK_REGEX =3D
>> "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.t=
ar"
>>=20
>>=20
>> +# Not applicable: Debian vendor configuration does not enable apt-key
>> net-update.
>> +CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: apt-key net-updat=
e is
>> disabled by default and Debian vendor configuration has no archive keyri=
ng
>> URI"
>> +
>> inherit cmake perlnative bash-completion useradd
>>=20
>> # User is added to allow apt to drop privs, will runtime warn without
>=20
>=20

Hi Jeremy,

As requested, patches for the same CVE were submitted for both
master and wrynose.

The patch for master has now been merged, and the corresponding
wrynose patch has also been submitted upstream.

Master:
https://git.openembedded.org/openembedded-core/commit/?id=3D5126e4792ddd8e6=
c721c47733d287633c234f2a9 ( https://git.openembedded.org/openembedded-core/=
commit/?id=3D5126e4792ddd8e6c721c47733d287633c234f2a9 )

Wrynose:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260825110148.216=
3688-1-hthakar@cisco.com/ ( https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260825110148.2163688-1-hthakar@cisco.com/ )

Could you please review the Scarthgap patch now?

Regards,
Hetvi

--s92IF2E3OxMGMMUOAVf4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jun 9, 2026 at 04:58 PM, J&eacute;r&eacute;my Rosen wrote:</di=
v>
<div>
<blockquote>Hello Anil<br /><br />It seems this CVE is not fixed upstream, =
so the not-applicable tag must<br />also be applied to master and wrynose<b=
r /><br />please submit patches for those two branches and then ping here<b=
r /><br />thanks a lot<br />Jeremy<br /><br />On Mon Jun 1, 2026 at 3:40 PM=
 CEST, Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) vi=
a lists.openembedded.org wrote:<br />
<blockquote>From: Anil Dongare &lt;adongare@cisco.com&gt;<br /><br />Detail=
s: <a href=3D"https://security-tracker.debian.org/tracker/CVE-2011-3374" ta=
rget=3D"_blank" rel=3D"noopener">https://security-tracker.debian.org/tracke=
r/CVE-2011-3374</a><br /><br />The vulnerability is a design-level flaw in =
the legacy apt-key utility regarding<br />the global trust model of GPG key=
s.<br /><br />This is marked as not-applicable-config because apt-key net-u=
pdate is<br />disabled by default, and Debian vendor configuration does not=
 define the<br />archive keyring URI required to use that path. Ignore this=
 CVE in this<br />recipe due to this configuration.<br /><br />Signed-off-b=
y: Anil Dongare &lt;adongare@cisco.com&gt;<br />---<br />meta/recipes-devto=
ols/apt/apt_2.6.1.bb | 3 +++<br />1 file changed, 3 insertions(+)<br /><br =
/>diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtoo=
ls/apt/apt_2.6.1.bb<br />index 12915660b0..8b48de3498 100644<br />--- a/met=
a/recipes-devtools/apt/apt_2.6.1.bb<br />+++ b/meta/recipes-devtools/apt/ap=
t_2.6.1.bb<br />@@ -38,6 +38,9 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/=
main/a/apt/"<br /># to express 'divisible by 4 plus 2' in regex (that I kno=
w of), let's hardcode a few.<br />UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P&lt;p=
ver&gt;((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"<br /><br =
/>+# Not applicable: Debian vendor configuration does not enable apt-key ne=
t-update.<br />+CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: apt-k=
ey net-update is disabled by default and Debian vendor configuration has no=
 archive keyring URI"<br />+<br />inherit cmake perlnative bash-completion =
useradd<br /><br /># User is added to allow apt to drop privs, will runtime=
 warn without</blockquote>
</blockquote>
Hi Jeremy,
<p class=3D"isSelectedEnd"><span>As requested, patches for the same CVE wer=
e submitted for both</span><br /><span>master and wrynose.</span></p>
<p class=3D"isSelectedEnd"><span>The patch for master has now been merged, =
and the corresponding</span><br /><span>wrynose patch has also been submitt=
ed upstream.</span></p>
<p class=3D"isSelectedEnd"><span>Master:</span><br /><a href=3D"https://git=
.openembedded.org/openembedded-core/commit/?id=3D5126e4792ddd8e6c721c47733d=
287633c234f2a9" data-rich-text-autolink=3D""><span>https://git.openembedded=
.org/openembedded-core/commit/?id=3D5126e4792ddd8e6c721c47733d287633c234f2a=
9</span></a></p>
<p class=3D"isSelectedEnd"><span>Wrynose:</span><br /><a href=3D"https://pa=
tchwork.yoctoproject.org/project/oe-core/patch/20260825110148.2163688-1-hth=
akar@cisco.com/" data-rich-text-autolink=3D""><span>https://patchwork.yocto=
project.org/project/oe-core/patch/20260825110148.2163688-1-hthakar@cisco.co=
m/</span></a></p>
<p class=3D"isSelectedEnd"><span>Could you please review the Scarthgap patc=
h now?</span></p>
<p><span>Regards,</span><br /><span>Hetvi&nbsp;</span></p>
</div>

--s92IF2E3OxMGMMUOAVf4--

