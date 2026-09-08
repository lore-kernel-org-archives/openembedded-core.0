Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C00BC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:47:42 +0000 (UTC)
Subject: Re: [wrynose][PATCH] vim: Fix CVE-2026-28417 hostname regression
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 02:47:31 -0700
References: <20260826053017.51184-1-devanshp@cisco.com>
In-Reply-To: <20260826053017.51184-1-devanshp@cisco.com>
Message-ID: <256345.1788860851919782948@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="e6nbVD2c1PN1rbGA94Gc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245339

--e6nbVD2c1PN1rbGA94Gc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:00 AM, Devansh Patel wrote:

>=20
> From: Devansh Patel <devanshp@cisco.com>
>=20
> The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
> hostname validation. That CVE fix requires follow-up regression patches
> because it rejects valid hostnames containing optional ports or
> underscores.
>=20
> Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
> corrects optional-port handling. It still needs patch 9.2.0553 to accept
> underscores, so backport that commit and retain its _gateway regression
> test.
>=20
> The netrw history hunk is adapted to preserve Wrynose's existing
> multi-line history and append the upstream 2026 May 28 entry. The
> src/version.c hunk is omitted because this backport does not change the
> recipe version or Vim's upstream patch-number table.
>=20
> [1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d6851=
4fcc1
>=20
> [2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d=
3cdda
>=20
> [3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e2=
64b11
>=20
> [4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
> .../files/CVE-2026-28417-regression_p1.patch | 64 +++++++++++++++++++
> meta/recipes-support/vim/vim.inc | 1 +
> 2 files changed, 65 insertions(+)
> create mode 100644
> meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch

Hi Yoann,

Gentle reminder to review the above Vim regression patch when convenient.

Please share your feedback.

Thanks,
Devansh

--e6nbVD2c1PN1rbGA94Gc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Aug 26, 2026 at 11:00 AM, Devansh Patel wrote:</div>
<div>
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />The o=
lder Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw<br />hostn=
ame validation. That CVE fix requires follow-up regression patches<br />bec=
ause it rejects valid hostnames containing optional ports or<br />underscor=
es.<br /><br />Vim 9.2.0340 already contains that CVE fix and patch 9.2.008=
9, which<br />corrects optional-port handling. It still needs patch 9.2.055=
3 to accept<br />underscores, so backport that commit and retain its _gatew=
ay regression<br />test.<br /><br />The netrw history hunk is adapted to pr=
eserve Wrynose's existing<br />multi-line history and append the upstream 2=
026 May 28 entry. The<br />src/version.c hunk is omitted because this backp=
ort does not change the<br />recipe version or Vim's upstream patch-number =
table.<br /><br />[1] <a href=3D"https://github.com/vim/vim/commit/79348dbb=
c09332130f4c86045e1541d68514fcc1" target=3D"_blank" rel=3D"noopener">https:=
//github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1</a><br=
 />[2] <a href=3D"https://github.com/vim/vim/commit/a6198523fb28a50d9694545=
8792cdb4787d3cdda" target=3D"_blank" rel=3D"noopener">https://github.com/vi=
m/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda</a><br />[3] <a href=
=3D"https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264=
b11" target=3D"_blank" rel=3D"noopener">https://github.com/vim/vim/commit/9=
3d177cd2b69bac58fc51a5a514d7bc71e264b11</a><br />[4] <a href=3D"https://git=
hub.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336" target=3D"_blank" =
rel=3D"noopener">https://github.com/vim/vim/security/advisories/GHSA-m3xh-9=
434-g336</a><br /><br />Signed-off-by: Devansh Patel &lt;devanshp@cisco.com=
&gt;<br />---<br />.../files/CVE-2026-28417-regression_p1.patch | 64 ++++++=
+++++++++++++<br />meta/recipes-support/vim/vim.inc | 1 +<br />2 files chan=
ged, 65 insertions(+)<br />create mode 100644 meta/recipes-support/vim/file=
s/CVE-2026-28417-regression_p1.patch</blockquote>
<br />Hi Yoann,<br />
<p data-start=3D"9" data-end=3D"75">Gentle reminder to review the above Vim=
 regression patch when convenient.</p>
<p data-start=3D"178" data-end=3D"205">Please share your feedback.</p>
<p data-start=3D"207" data-end=3D"224" data-is-last-node=3D"" data-is-only-=
node=3D"">Thanks,<br data-start=3D"214" data-end=3D"217" />Devansh</p>
</div>

--e6nbVD2c1PN1rbGA94Gc--

