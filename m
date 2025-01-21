Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DEAC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 14:38:33 +0000 (UTC)
Subject: [scarthgap] TUNE_ARCH error #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Ganesh Mahajan" <ganesh.manoj.mahajan@signify.com>
X-Originating-Location: IN (165.225.124.177)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Jan 2025 04:06:27 -0800
Message-ID: <iFfK.1737461187659479212.JCdb@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8FpBDIRgIfvUdIAgQqjY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 14:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210096

--8FpBDIRgIfvUdIAgQqjY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

when tried to build image using command bitbake -k wac-core-image below err=
or poped up.
ERROR: =C2=A0OE-core's config sanity checker detected a potential misconfig=
uration.
Either fix the cause of this error or at your own risk disable the checker =
(see sanity.conf).
Following is the list of potential problems / advisories:
TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a val=
id tune configuration file which will set this correctly.
Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS:tun=
e-${DEFAULTTUNE}} wacin) for DEFAULTTUNE (None) does not contain TUNE_PKGAR=
CH ().Toolchain tunings invalid:
No tuning found for default multilib.
I am upgrading from dunfell to scarthgap-5.0.5 (LTS), were dunfell had no T=
UNE_ARCH (tune-coretexA72.inc) but scarthgap has it.
or is it a good practice to disable the checker? Location for tune-coretexA=
72.inc should be /conf/machine/ ?

--8FpBDIRgIfvUdIAgQqjY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>when tried to build image using command bitbake -k wac-core-image belo=
w error poped up.</div>
<div>ERROR: &nbsp;OE-core's config sanity checker detected a potential misc=
onfiguration.<br />&nbsp; &nbsp; Either fix the cause of this error or at y=
our own risk disable the checker (see sanity.conf).<br />&nbsp; &nbsp; Foll=
owing is the list of potential problems / advisories:</div>
<div>&nbsp; &nbsp; TUNE_ARCH is unset. Please ensure your MACHINE configura=
tion includes a valid tune configuration file which will set this correctly=
.<br />Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_AR=
CHS:tune-${DEFAULTTUNE}} wacin) for DEFAULTTUNE (None) does not contain TUN=
E_PKGARCH ().Toolchain tunings invalid:<br />No tuning found for default mu=
ltilib.</div>
<div>I am upgrading from dunfell to scarthgap-5.0.5 (LTS), were dunfell had=
 no TUNE_ARCH (tune-coretexA72.inc) but scarthgap has it.&nbsp;<br />or is =
it a good practice to disable the checker? Location for tune-coretexA72.inc=
 should be /conf/machine/ ?</div>
</div>

--8FpBDIRgIfvUdIAgQqjY--

