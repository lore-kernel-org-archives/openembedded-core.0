Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E94FC433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 15:58:11 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] libpcre2: upgrade 10.39 -> 10.40
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Mira, Veneto, IT (82.60.178.153)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 30 May 2022 08:58:09 -0700
References: 
 <CAGDS+n=zq+79_JrEC_s-X_f9BEMYXWsyZZrogUk1Z+iLjPvgKQ@mail.gmail.com>
In-Reply-To: 
 <CAGDS+n=zq+79_JrEC_s-X_f9BEMYXWsyZZrogUk1Z+iLjPvgKQ@mail.gmail.com>
Message-ID: <10230.1653926289490240388@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UzVIOPKLhP7ZgaBAKlzk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 15:58:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166290

--UzVIOPKLhP7ZgaBAKlzk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 08:49 AM, Steve Sakoman wrote:

>=20
>=20
>> Delete CVE-2022-1586.patch, wrong CVE code (patch included in 10.40).
>>=20
>> CVE: CVE-2022-1587
>=20
> If this is the case then you should submit a patch for master to
> correct this. If people agree that the version bump is suitable for
> LTS I would then take the upgrade patch from master along with your
> patch to fix the CVE confusion.

Do you mean for kirkstone? Because master doesn't have that patch.

Also if this update is a problem I can just rename the patch so that cve-ch=
eck can work properly.

Davide

--UzVIOPKLhP7ZgaBAKlzk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 08:49 AM, Steve Sakoman wrote:<br />
<blockquote>
<blockquote>Delete CVE-2022-1586.patch, wrong CVE code (patch included in 1=
0.40).<br /><br />CVE: CVE-2022-1587</blockquote>
If this is the case then you should submit a patch for master to<br />corre=
ct this. If people agree that the version bump is suitable for<br />LTS I w=
ould then take the upgrade patch from master along with your<br />patch to =
fix the CVE confusion.</blockquote>
Do you mean for kirkstone? Because master doesn't have that patch.<br /><br=
 />Also if this update is a problem I can just rename the patch so that cve=
-check can work properly.<br /><br />Davide

--UzVIOPKLhP7ZgaBAKlzk--

