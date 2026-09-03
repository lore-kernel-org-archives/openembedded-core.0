Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B47C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:43:18 +0000 (UTC)
Subject: Re: [wrynose][PATCH] python3-pip: Fix CVE-2026-8643
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 23:43:10 -0700
References: <20260817044231.127184-1-hthakar@cisco.com> <DL4OY27DNNP2.1QDHTOBTRVJY0@smile.fr>
In-Reply-To: <DL4OY27DNNP2.1QDHTOBTRVJY0@smile.fr>
Message-ID: <3112418.1788417790407544509@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lvuzMrbH057zVD35ucow"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245005

--lvuzMrbH057zVD35ucow
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 02:04 PM, Yoann Congal wrote:

>=20
> On Mon Aug 17, 2026 at 6:42 AM CEST, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Hetvi Thakar <hthakar@cisco.com>
>>=20
>> This patch backports the upstream fix for CVE-2026-8643. The
>> commit is included in pip 26.1.2 and referenced in [1]. The public
>> CVE advisory is referenced in [2].
>>=20
>> The selected commit is self-contained. Later upstream commits refactor
>> the validation to use a shared containment helper and update release
>> notes; they are not prerequisites for this fix.
>>=20
>> [1] https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b26=
5158dfb
>>=20
>> [2] https://github.com/advisories/GHSA-wf93-45jw-7689
>>=20
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> ---
>> .../python/python3-pip/CVE-2026-8643.patch | 80 +++++++++++++++++++
>> .../python/python3-pip_26.0.1.bb | 4 +-
>> 2 files changed, 83 insertions(+), 1 deletion(-)
>> create mode 100644
>> meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
>=20
> Hello,
>=20
> Thanks for the patch.
>=20
> The scarthgap fix for this CVE[0] has 2 regression patches in addition to
> the CVE fix itself. Don't we need those for wrynose as well?
>=20
> I'll hold CVE-2026-8643 patches (scarthgap/wrynose) in the meantime.
>=20
> [0]: https://patchwork.yoctoproject.org/project/oe-core/patch/20260817044=
429.62418-1-hthakar@cisco.com/
>=20
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

Hi Yoann,

Thanks for pointing this out. You=E2=80=99re right the Wrynose backport sho=
uld include the two upstream regression fixes as well.
I=E2=80=99ll update Wrynose patch and sent v2 patch accordingly.

Regards,
Hetvi

--lvuzMrbH057zVD35ucow
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 2, 2026 at 02:04 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Mon Aug 17, 2026 at 6:42 AM CEST, Hetvi Thakar -X (hthakar -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br=
 />
<blockquote>From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br /><br />This pa=
tch backports the upstream fix for CVE-2026-8643. The<br />commit is includ=
ed in pip 26.1.2 and referenced in [1]. The public<br />CVE advisory is ref=
erenced in [2].<br /><br />The selected commit is self-contained. Later ups=
tream commits refactor<br />the validation to use a shared containment help=
er and update release<br />notes; they are not prerequisites for this fix.<=
br /><br />[1] <a href=3D"https://github.com/pypa/pip/commit/8eb178480bd1a2=
b223f509fc430796b265158dfb" target=3D"_blank" rel=3D"noopener">https://gith=
ub.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265158dfb</a><br />[2=
] <a href=3D"https://github.com/advisories/GHSA-wf93-45jw-7689" target=3D"_=
blank" rel=3D"noopener">https://github.com/advisories/GHSA-wf93-45jw-7689</=
a><br /><br />Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br />--=
-<br />.../python/python3-pip/CVE-2026-8643.patch | 80 +++++++++++++++++++<=
br />.../python/python3-pip_26.0.1.bb | 4 +-<br />2 files changed, 83 inser=
tions(+), 1 deletion(-)<br />create mode 100644 meta/recipes-devtools/pytho=
n/python3-pip/CVE-2026-8643.patch</blockquote>
Hello,<br /><br />Thanks for the patch.<br /><br />The scarthgap fix for th=
is CVE[0] has 2 regression patches in addition to<br />the CVE fix itself. =
Don't we need those for wrynose as well?<br /><br />I'll hold CVE-2026-8643=
 patches (scarthgap/wrynose) in the meantime.<br /><br />[0]: <a href=3D"ht=
tps://patchwork.yoctoproject.org/project/oe-core/patch/20260817044429.62418=
-1-hthakar@cisco.com/" target=3D"_blank" rel=3D"noopener">https://patchwork=
.yoctoproject.org/project/oe-core/patch/20260817044429.62418-1-hthakar@cisc=
o.com/</a><br /><br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS</b=
lockquote>
<br />Hi Yoann,<br /><br />Thanks for pointing this out. You&rsquo;re right=
 the Wrynose backport should include the two upstream regression fixes as w=
ell.</div>
<div>I&rsquo;ll update Wrynose patch and sent v2 patch accordingly.<br /><b=
r />&nbsp;Regards,<br />&nbsp;Hetvi</div>

--lvuzMrbH057zVD35ucow--

