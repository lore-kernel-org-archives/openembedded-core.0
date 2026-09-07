Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A3CC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 05:43:47 +0000 (UTC)
Subject: Re: [PATCH] binutils: correct CVE_PRODUCT mapping
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 22:43:45 -0700
References: <20260824110156.25702-1-devanshp@cisco.com> <82653ab103f8116bfb0a9a675cf9d7f38a92a588.camel@pbarker.dev> <2789044.1787834827643066647@lists.openembedded.org> <6aad1ce63d1f75e5d5cde45b2691ac68151762ce.camel@pbarker.dev>
In-Reply-To: <6aad1ce63d1f75e5d5cde45b2691ac68151762ce.camel@pbarker.dev>
Message-ID: <199240.1788759825143617206@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AUbWe1av35Yhg7i40qK4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 05:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245227

--AUbWe1av35Yhg7i40qK4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 07:54 PM, Paul Barker wrote:

>=20
> Hi Devansh,
>=20
> The commit messages for these changes make no mention of the SBOM
> output. Commit messages need to explain *why* a change is proposed. So
> from the patches you sent I could only infer that this was solely about
> CVE matching accuracy.
>=20
> CVE_PRODUCT assignments have so far been used when the default leads to
> either CVEs being missed, or unrelated CVEs being matched. We haven't
> carried CVE_PRODUCT assignments purely for SBOM accuracy. I don't really
> have the context to understand if this is required or not - I think we
> need some discussion and input from others here. Could you send an email
> to the openembedded-architecture list to discuss the need for additional
> CVE_PRODUCT assignments before sending further patches like this?
>=20
> Best regards,
>=20
> --
> Paul Barker

Hi Paul,

Thank you for the clarification.

We are reviewing the proposed CVE_PRODUCT changes internally at Cisco, part=
icularly
the relationship between CVE matching, CPE identities in SPDX output, and t=
he
sbom-cve-check workflow.

The main question is whether a vendor-qualified mapping is appropriate when=
 it improves
the component identity in the SBOM but does not change the reported CVEs, a=
nd how existing
product aliases should be retained where they are necessary for complete CV=
E coverage.

We will ask our Cisco representative to raise this broader topic to the ope=
nembedded community
with more details. In the meantime, we will pause further CVE_PRODUCT submi=
ssions
that are intended to improve SBOM identity.

We will continue proposing mappings where the default value demonstrably mi=
sses relevant CVEs
or produces unrelated matches, with the specific CVE-reporting impact docum=
ented in the commit message.

Best regards,
Devansh

--AUbWe1av35Yhg7i40qK4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Aug 27, 2026 at 07:54 PM, Paul Barker wrote:</div>
<div>
<blockquote>Hi Devansh,<br /><br />The commit messages for these changes ma=
ke no mention of the SBOM<br />output. Commit messages need to explain *why=
* a change is proposed. So<br />from the patches you sent I could only infe=
r that this was solely about<br />CVE matching accuracy.<br /><br />CVE_PRO=
DUCT assignments have so far been used when the default leads to<br />eithe=
r CVEs being missed, or unrelated CVEs being matched. We haven't<br />carri=
ed CVE_PRODUCT assignments purely for SBOM accuracy. I don't really<br />ha=
ve the context to understand if this is required or not - I think we<br />n=
eed some discussion and input from others here. Could you send an email<br =
/>to the openembedded-architecture list to discuss the need for additional<=
br />CVE_PRODUCT assignments before sending further patches like this?<br /=
><br />Best regards,<br /><br />-- <br />Paul Barker</blockquote>
</div>
<div>Hi Paul,<br /><br />Thank you for the clarification.<br /><br />We are=
 reviewing the proposed CVE_PRODUCT changes internally at Cisco, particular=
ly</div>
<div>the relationship between CVE matching, CPE identities in SPDX output, =
and the</div>
<div>sbom-cve-check workflow.<br /><br />The main question is whether a ven=
dor-qualified mapping is appropriate when it improves</div>
<div>the component identity in the SBOM but does not change the reported CV=
Es, and how existing</div>
<div>product aliases should be retained where they are necessary for comple=
te CVE coverage.<br /><br />We will ask our Cisco representative to raise t=
his broader topic to the openembedded community&nbsp;</div>
<div>with more details. In the meantime, we will pause further CVE_PRODUCT =
submissions</div>
<div>that are intended to improve SBOM identity.<br /><br />We will continu=
e proposing mappings where the default value demonstrably misses relevant C=
VEs</div>
<div>or produces unrelated matches, with the specific CVE-reporting impact =
documented in the commit message.<br /><br />Best regards,<br />Devansh</di=
v>

--AUbWe1av35Yhg7i40qK4--

