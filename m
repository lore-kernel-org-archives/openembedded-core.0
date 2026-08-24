Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB236C5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:24:26 +0000 (UTC)
Subject: Re: [PATCH] u-boot-tools: add CVE_PRODUCT mapping
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 06:24:19 -0700
References: <20260824110158.26007-1-devanshp@cisco.com> <683e7f3c-9107-40cd-aadd-975cdd2a64f7@cherry.de>
In-Reply-To: <683e7f3c-9107-40cd-aadd-975cdd2a64f7@cherry.de>
Message-ID: <2227188.1787577859288953598@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="p2rZNSwJ0uUWUwS2d8kw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244121

--p2rZNSwJ0uUWUwS2d8kw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 04:38 PM, Quentin Schulz wrote:

>=20
> Hi Devansh,
>=20
> On 8/24/26 1:01 PM, Devansh Patel via lists.openembedded.org wrote:
>=20
>> From: Devansh Patel <devanshp@cisco.com>
>>=20
>> The current inherited "u-boot-tools" identity has no vulnerability recor=
ds
>> even
>> though this recipe builds host utilities from the U-Boot source tree, so
>> source-aligned CVEs are missed.
>>=20
>> Use "u-boot:u-boot" for the CNA affected-data identity and
>> "denx:u-boot" for the NVD dictionary CPE and configuration identity.
>=20
> How about using a file that is included by both u-boot-tools and u-boot
> so that we don't have to not forget to update both?
>=20
> u-boot-common.inc is included by both u-boot-tools.bb and u-boot.bb so
> that seems like an ideal candidate (if so, then we probably could remove
> CVE_PRODUCT from u-boot.inc?)

Hi Quentin,
Thanks, I agree that u-boot-common.inc is the correct location. I will move=
 the mapping there and remove it from u-boot.inc, so both recipes inherit i=
t.

>=20
> We only have denx:u-boot today in u-boot.inc, how did you come to the
> conclusion we also needed u-boot:u-boot?

u-boot:u-boot is not an NVD CPE. It comes from the authoritative CNA affect=
ed data for CVE-2026-29007, CVE-2026-29008, and CVE-2026-29009, where VulnC=
heck uses affected.vendor=3Du-boot and affected.product=3Du-boot.

OE-Core master=E2=80=99s sbom-cve-check consumes CVE List V5 affected data =
directly as well as NVD data. NVD currently also maps those three records t=
o denx:u-boot, so the CNA token adds no exclusive CVEs today. Keeping it ne=
vertheless allows CNA records to be matched while NVD enrichment is pending=
 or absent. I will clarify that distinction in v2.

>=20
> Cheers,
> Quentin

Regards,
Devansh Patel

--p2rZNSwJ0uUWUwS2d8kw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Aug 24, 2026 at 04:38 PM, Quentin Schulz wrote:</div>
<div>
<blockquote>Hi Devansh,<br /><br />On 8/24/26 1:01 PM, Devansh Patel via li=
sts.openembedded.org wrote:<br />
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />The c=
urrent inherited "u-boot-tools" identity has no vulnerability records even<=
br />though this recipe builds host utilities from the U-Boot source tree, =
so<br />source-aligned CVEs are missed.<br /><br />Use "u-boot:u-boot" for =
the CNA affected-data identity and<br />"denx:u-boot" for the NVD dictionar=
y CPE and configuration identity.</blockquote>
How about using a file that is included by both u-boot-tools and u-boot <br=
 />so that we don't have to not forget to update both?<br /><br />u-boot-co=
mmon.inc is included by both u-boot-tools.bb and u-boot.bb so <br />that se=
ems like an ideal candidate (if so, then we probably could remove <br />CVE=
_PRODUCT from u-boot.inc?)</blockquote>
</div>
<div>Hi Quentin,<br />Thanks, I agree that u-boot-common.inc is the correct=
 location. I will move the mapping there and remove it from u-boot.inc, so =
both recipes inherit it.<br />
<blockquote>We only have denx:u-boot today in u-boot.inc, how did you come =
to the <br />conclusion we also needed u-boot:u-boot?</blockquote>
u-boot:u-boot is not an NVD CPE. It comes from the authoritative CNA affect=
ed data for CVE-2026-29007, CVE-2026-29008, and CVE-2026-29009, where VulnC=
heck uses affected.vendor=3Du-boot and affected.product=3Du-boot.</div>
<div><br />OE-Core master&rsquo;s sbom-cve-check consumes CVE List V5 affec=
ted data directly as well as NVD data. NVD currently also maps those three =
records to denx:u-boot, so the CNA token adds no exclusive CVEs today. Keep=
ing it nevertheless allows CNA records to be matched while NVD enrichment i=
s pending or absent. I will clarify that distinction in v2.<br />
<blockquote>Cheers,<br />Quentin</blockquote>
</div>
<div>Regards,<br />Devansh Patel</div>

--p2rZNSwJ0uUWUwS2d8kw--

