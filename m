Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C27C61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 04:42:41 +0000 (UTC)
Subject: Re: [wrynose][PATCH 2/4] wget: Fix CVE-2026-58470
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 21:42:39 -0700
References: <20260722100754.1568842-1-hthakar@cisco.com> <20260722100754.1568842-2-hthakar@cisco.com> <DL5ZT3T1IIG3.2FR7K7OK18ID@smile.fr>
In-Reply-To: <DL5ZT3T1IIG3.2FR7K7OK18ID@smile.fr>
Message-ID: <969.1788496959299737035@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Pbp0cBPVcX9H6hDHdorx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 04:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245053

--Pbp0cBPVcX9H6hDHdorx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 02:48 AM, Yoann Congal wrote:

>=20
> On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Hetvi Thakar <hthakar@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>=20
>> [1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c=
6ffd30c34ffcf
>>=20
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
>>=20
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> ---
>> .../wget/wget/CVE-2026-58470.patch | 79 +++++++++++++++++++
>> meta/recipes-extended/wget/wget_1.25.0.bb | 1 +
>> 2 files changed, 80 insertions(+)
>> create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch
>=20
> Hello,
>=20
> The master patch you sent contained a regression fix that is not in this
> wrynose version (also not in your scarthgap version).
>=20
> Can you send a v2 with the regression fix?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

Hi,

Thanks for pointing this out.

I will include the regression fix in both the wrynose and scarthgap
patches and send the updated v2 versions.

Regards,
Hetvi

--Pbp0cBPVcX9H6hDHdorx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 4, 2026 at 02:48 AM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<b=
r />
<blockquote>From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br /><br />This pa=
tch applies the upstream fix as referenced in [2],<br />using the commit sh=
own in [1].<br /><br />[1] <a href=3D"https://gitlab.com/gnuwget/wget/-/com=
mit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf" target=3D"_blank" rel=3D"noop=
ener">https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6=
ffd30c34ffcf</a><br />[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2=
026-58470" target=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/det=
ail/CVE-2026-58470</a><br /><br />Signed-off-by: Hetvi Thakar &lt;hthakar@c=
isco.com&gt;<br />---<br />.../wget/wget/CVE-2026-58470.patch | 79 ++++++++=
+++++++++++<br />meta/recipes-extended/wget/wget_1.25.0.bb | 1 +<br />2 fil=
es changed, 80 insertions(+)<br />create mode 100644 meta/recipes-extended/=
wget/wget/CVE-2026-58470.patch</blockquote>
Hello,<br /><br />The master patch you sent contained a regression fix that=
 is not in this<br />wrynose version (also not in your scarthgap version).<=
br /><br />Can you send a v2 with the regression fix?<br /><br />Thanks!<br=
 />-- <br />Yoann Congal<br />Smile ECS</blockquote>
<p class=3D"isSelectedEnd"><span>Hi,</span></p>
<p class=3D"isSelectedEnd"><span>Thanks for pointing this out.</span></p>
<p class=3D"isSelectedEnd"><span>I will include the regression fix in both =
the wrynose and scarthgap</span><br /><span>patches and send the updated v2=
 versions.</span></p>
<p><span>Regards,</span><br /><span>Hetvi</span></p>
</div>

--Pbp0cBPVcX9H6hDHdorx--

