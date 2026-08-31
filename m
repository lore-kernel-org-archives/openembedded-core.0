Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A831DC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:22:58 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3-mako: Fix CVE-2026-41205
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 02:22:52 -0700
References: <20260819111509.53180-1-hthakar@cisco.com> <DL30HXPDJQL3.3LPAQ8V1DUDRD@smile.fr>
In-Reply-To: <DL30HXPDJQL3.3LPAQ8V1DUDRD@smile.fr>
Message-ID: <2446669.1788168172489430367@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9aGU1P1c5fBwuad4yiVx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244757

--9aGU1P1c5fBwuad4yiVx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 02:42 PM, Yoann Congal wrote:

>=20
> On Wed Aug 19, 2026 at 1:15 PM CEST, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Hetvi Thakar <hthakar@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2], using
>> the commit shown in [1].
>>=20
>> The backport makes Template URI normalization strip all leading
>> slashes, preventing a double-slash URI from bypassing the path
>> traversal check while keeping Mako at version 1.3.2.
>>=20
>> [1] https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd=
72dc48328719a3
>>=20
>> [2] https://github.com/advisories/GHSA-v92g-xgxw-vvmm
>>=20
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> ---
>> .../python/python3-mako/CVE-2026-41205.patch | 110 ++++++++++++++++++
>> .../python/python3-mako_1.3.2.bb | 2 +
>> 2 files changed, 112 insertions(+)
>> create mode 100644
>> meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
>=20
> Hello,
>=20
> As fas as I can tell, a fix for this CVE is also needed on wrynose.
>=20
> I can't merge here until this is fixed there.
>=20
> Can you send a patch to fix this and then, ping back here?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

Hi,

I have submitted a package upgrade for wrynose that addresses this
CVE:

https://lists.openembedded.org/g/openembedded-core/message/244285 ( https:/=
/lists.openembedded.org/g/openembedded-core/message/244285 )

Could you please take a look and review it?

Regards,
Hetvi

--9aGU1P1c5fBwuad4yiVx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Aug 31, 2026 at 02:42 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Aug 19, 2026 at 1:15 PM CEST, Hetvi Thakar -X (hthakar -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br=
 />
<blockquote>From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br /><br />This pa=
tch applies the upstream fix as referenced in [2], using<br />the commit sh=
own in [1].<br /><br />The backport makes Template URI normalization strip =
all leading<br />slashes, preventing a double-slash URI from bypassing the =
path<br />traversal check while keeping Mako at version 1.3.2.<br /><br />[=
1] <a href=3D"https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7d=
cde6cfd72dc48328719a3" target=3D"_blank" rel=3D"noopener">https://github.co=
m/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd72dc48328719a3</a><br />=
[2] <a href=3D"https://github.com/advisories/GHSA-v92g-xgxw-vvmm" target=3D=
"_blank" rel=3D"noopener">https://github.com/advisories/GHSA-v92g-xgxw-vvmm=
</a><br /><br />Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br />=
---<br />.../python/python3-mako/CVE-2026-41205.patch | 110 +++++++++++++++=
+++<br />.../python/python3-mako_1.3.2.bb | 2 +<br />2 files changed, 112 i=
nsertions(+)<br />create mode 100644 meta/recipes-devtools/python/python3-m=
ako/CVE-2026-41205.patch</blockquote>
Hello,<br /><br />As fas as I can tell, a fix for this CVE is also needed o=
n wrynose.<br /><br />I can't merge here until this is fixed there.<br /><b=
r />Can you send a patch to fix this and then, ping back here?<br /><br />T=
hanks!<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
<p class=3D"isSelectedEnd"><span>Hi,</span></p>
<p class=3D"isSelectedEnd"><span>I have submitted a package upgrade for wry=
nose that addresses this</span><br /><span>CVE:</span></p>
<p class=3D"isSelectedEnd"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/244285" data-rich-text-autolink=3D""><span>https://li=
sts.openembedded.org/g/openembedded-core/message/244285</span></a></p>
<p class=3D"isSelectedEnd"><span>Could you please take a look and review it=
?</span></p>
<p><span>Regards,</span><br /><span>Hetvi</span></p>
</div>

--9aGU1P1c5fBwuad4yiVx--

