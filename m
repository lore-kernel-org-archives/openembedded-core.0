Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF66CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:43:42 +0000 (UTC)
Subject: Re: [scarthgap 03/21] nfs-utils: fix CVE-2025-12801
To: openembedded-core@lists.openembedded.org
From: "Sudhir Dumbhare" <sudumbha@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 00:43:33 -0700
References: <cover.1781270474.git.jeremy.rosen@smile.fr> <33321e687cf18e03bb1d824d58214d758b02078f.1781270474.git.jeremy.rosen@smile.fr> <8dd3e431cafdd364285eeaa79bf89507a4f4c6a1.camel@pbarker.dev>
In-Reply-To: <8dd3e431cafdd364285eeaa79bf89507a4f4c6a1.camel@pbarker.dev>
Message-ID: <82309.1781595813770605230@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8s6oAl85BSNVkj74qX2B"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238875

--8s6oAl85BSNVkj74qX2B
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thank you for pointing this out and for referencing both the original upstr=
eam commit and the RHEL backport.

When applying the upstream change, including prerequisites [1][2][3] and th=
e fix [4], as noted in [6],
we observed the following compilation failure on scarthgap with nfs-utils v=
2.6.4:
nfsd_path.c:322:17: error: implicit declaration of function 'nfsd_run_task'

Because of this, we backported only the required changes from [5], specific=
ally nfsd_run_task() and
struct nfsd_task_t, to support the fix. Non-essential parts were trimmed to=
 keep the patch minimal
and build-safe for scarthgap.

Please let us know if you would prefer us to align with the full backport, =
similar to the RHEL approach.

References:
[1] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D7e8b=
36522f58657359c6842119fc516c6dd1baa4
[2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D42f0=
1e6a78fed98f12437ac8b28cfb12b6bad056
[3] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D5173=
8ae56d922d4961e60dad73ad1c2d97d8d99b
[4] Fixed by: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommi=
t;h=3Df36bd900a899088ca1925de079bd58d6205a1f3c
[5] Dependent patch: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=
=3Dcommit;h=3Dcd90f29257904f36509ea5a04a86f42398fbe94a
[6] https://security-tracker.debian.org/tracker/CVE-2025-12801

Thanks and regards,
Sudhir

--8s6oAl85BSNVkj74qX2B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,<br />Thank you for pointing this out and for referencing both=
 the original upstream commit and the RHEL backport.<br /><br />When applyi=
ng the upstream change, including prerequisites [1][2][3] and the fix [4], =
as noted in [6],<br />we observed the following compilation failure on scar=
thgap with nfs-utils v2.6.4:<br />nfsd_path.c:322:17: error: implicit decla=
ration of function 'nfsd_run_task'<br /><br />Because of this, we backporte=
d only the required changes from [5], specifically nfsd_run_task() and<br /=
>struct nfsd_task_t, to support the fix. Non-essential parts were trimmed t=
o keep the patch minimal<br />and build-safe for scarthgap.<br /><br />Plea=
se let us know if you would prefer us to align with the full backport, simi=
lar to the RHEL approach.<br /><br />References:<br />[1] https://git.linux=
-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D7e8b36522f58657359c684211=
9fc516c6dd1baa4<br />[2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.gi=
t;a=3Dcommit;h=3D42f01e6a78fed98f12437ac8b28cfb12b6bad056<br />[3] https://=
git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D51738ae56d922d49=
61e60dad73ad1c2d97d8d99b<br />[4] Fixed by: https://git.linux-nfs.org/?p=3D=
steved/nfs-utils.git;a=3Dcommit;h=3Df36bd900a899088ca1925de079bd58d6205a1f3=
c<br />[5] Dependent patch: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils=
.git;a=3Dcommit;h=3Dcd90f29257904f36509ea5a04a86f42398fbe94a<br />[6] https=
://security-tracker.debian.org/tracker/CVE-2025-12801<br /><br />Thanks and=
 regards,<br />Sudhir</div>

--8s6oAl85BSNVkj74qX2B--

