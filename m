Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD80C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 14:38:33 +0000 (UTC)
Subject: [scarthgap] TUNE_ARCH error
To: openembedded-core@lists.openembedded.org
From: "Ganesh Mahajan" <ganesh.manoj.mahajan@signify.com>
X-Originating-Location: IN (165.225.124.181)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Jan 2025 03:45:49 -0800
Message-ID: <mG2c.1737459949281337191.EK5d@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="B7Gn0UilGmwtHDP8fqS5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 14:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210095

--B7Gn0UilGmwtHDP8fqS5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

When tried to generate image got below error.
Command used to generate image: =C2=A0bitbake -k wac-core-image

In dunfell we had no such configuration for TUNE_ARCH in /conf/machine but =
in scarthgap below error was thrown.
Is it good practice to disable the checker?

E *RROR: =C2=A0OE-core's config sanity checker detected a potential misconf=
iguration.*
*Either fix the cause of this error or at your own risk disable the checker=
 (see sanity.conf).*
*Following is the list of potential problems / advisories:*
*TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a va=
lid tune configuration file which will set this correctly.*
*Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS:tu=
ne-${DEFAULTTUNE}} wacin) for DEFAULTTUNE (None) does not contain TUNE_PKGA=
RCH ().Toolchain tunings invalid:*
*No tuning found for default multilib.

* Ganesh

--B7Gn0UilGmwtHDP8fqS5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>When tried to generate image got below error.<br />Command used to gen=
erate image: &nbsp;bitbake -k wac-core-image</div>
<div><br />In dunfell we had no such configuration for TUNE_ARCH in /conf/m=
achine but in scarthgap below error was thrown.<br />Is it good practice to=
 disable the checker?<br /><br />E<strong>RROR: &nbsp;OE-core's config sani=
ty checker detected a potential misconfiguration.</strong><br /><strong>&nb=
sp; &nbsp; Either fix the cause of this error or at your own risk disable t=
he checker (see sanity.conf).</strong><br /><strong>&nbsp; &nbsp; Following=
 is the list of potential problems / advisories:</strong></div>
<div><strong>&nbsp; &nbsp; TUNE_ARCH is unset. Please ensure your MACHINE c=
onfiguration includes a valid tune configuration file which will set this c=
orrectly.</strong><br /><strong>Error, the PACKAGE_ARCHS variable (all any =
noarch ${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}} wacin) for DEFAULTTUNE (N=
one) does not contain TUNE_PKGARCH ().Toolchain tunings invalid:</strong><b=
r /><strong>No tuning found for default multilib.<br /><br /></strong>Ganes=
h</div>
</div>

--B7Gn0UilGmwtHDP8fqS5--

