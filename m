Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD6C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:42:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.63767.1643809368436564470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=Op0yNiSb;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E373838BD;
	Wed,  2 Feb 2022 14:42:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809365;
	bh=r/JRHSCO2vmYINPtECkl8IfCzwIUpQwM98kTFoIJung=;
	h=From:To:Cc:Subject:Date:From;
	b=Op0yNiSbdqQY770rmJ3vEpWEvEVXZbaRoFtBJR1S+zaCTEpskoVFJPqjlpwz5Xcq/
	 K/iYFG7WA3w1DkOxlS99t7Q07dBn3MmXBqhpQaHRWh8xPzotsNq5iBr4Ln9deoVNFh
	 OuQfi7IDKTbNuET02xxQo3HiYjFqXLiyucTkqHh4Th4D+GzBV0ze0NFA+awO9wMIsx
	 lCgNyO562seu3z6Y0qqkznRAQuKVgOu1pTWBtt6kXZXxnuyeDSL8dtndNE2d4VnOpr
	 5/+DLVcLJbOR3up3KF/CNovQN6wdfTgnltEB5Pz8ndTrfQGU40ZAAP88B1cTBvKVM+
	 cG1qVTE6b6vKA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 00/12] Update gstreamer recipes to 1.19.90
Date: Wed,  2 Feb 2022 14:42:21 +0100
Message-Id: <20220202134233.2091916-1-ch@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:42:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161196

Hi,

this patchset update gstreamer to 1.19.90, the rc1 of the 1.20.0 release.

Changes from the RFC patchset:
- Use split up tarballs, instead of combined one
- Use 1.19.90 release instead of commit id
- Added patch to remove the gstbin:test_watch_for_state_change testcase, =
since it seems to be flaky:
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778

regards,
Claudius

Claudius Heine (12):
  gstreamer1.0: 1.18.5 -> 1.19.90
  gstreamer1.0-plugins-base: 1.18.5 -> 1.19.90
  gstreamer1.0-plugins-good: 1.18.5 -> 1.19.90
  gstreamer1.0-plugins-bad: 1.18.5 -> 1.19.90
  gstreamer1.0-plugins-ugly: 1.18.5 -> 1.19.90
  gstreamer1.0-libav: 1.18.5 -> 1.19.90
  gstreamer1.0-python: 1.18.5 -> 1.19.90
  gstreamer1.0-omx: 1.18.5 -> 1.19.90
  gstreamer1.0-vaapi: 1.18.5 -> 1.19.90
  gstreamer1.0-rtsp-server: 1.18.5 -> 1.19.90
  gst-examples: 1.18.5 -> 1.19.90
  gst-devtools: 1.18.5 -> 1.19.90

 ...ools_1.18.5.bb =3D> gst-devtools_1.19.90.bb} |   2 +-
 ...001-Make-player-examples-installable.patch |   2 +-
 ...ples_1.18.5.bb =3D> gst-examples_1.19.90.bb} |   0
 ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ------------------
 ....18.5.bb =3D> gstreamer1.0-libav_1.19.90.bb} |   5 +-
 ..._1.18.5.bb =3D> gstreamer1.0-omx_1.19.90.bb} |   2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  17 +-
 .../0005-msdk-fix-includedir-path.patch       |  18 +-
 ...bb =3D> gstreamer1.0-plugins-bad_1.19.90.bb} |   4 +-
 ...004-glimagesink-Downrank-to-marginal.patch |  32 --
 ...b =3D> gstreamer1.0-plugins-base_1.19.90.bb} |   5 +-
 ...b =3D> gstreamer1.0-plugins-good_1.19.90.bb} |   2 +-
 ...b =3D> gstreamer1.0-plugins-ugly_1.19.90.bb} |   5 +-
 ...18.5.bb =3D> gstreamer1.0-python_1.19.90.bb} |   2 +-
 ...bb =3D> gstreamer1.0-rtsp-server_1.19.90.bb} |   4 +-
 ....18.5.bb =3D> gstreamer1.0-vaapi_1.19.90.bb} |   2 +-
 ...der.c-when-env-var-is-set-do-not-fal.patch |  69 ----
 ...pect-the-idententaion-used-in-meson.patch} |   7 +-
 ...002-Remove-unused-valgrind-detection.patch | 112 ------
 ...s-add-support-for-install-the-tests.patch} |  48 ++-
 ...-use-too-strict-timeout-for-validati.patch |  32 --
 ...-use-a-dictionaries-for-environment.patch} |  24 +-
 ...er-script-to-run-the-installed_tests.patch |  72 ++++
 ...bin-test_watch_for_state_change-test.patch | 107 ++++++
 ...-the-environment-for-installed_tests.patch |  58 ---
 ...r1.0_1.18.5.bb =3D> gstreamer1.0_1.19.90.bb} |  18 +-
 26 files changed, 258 insertions(+), 737 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb =3D> gs=
t-devtools_1.19.90.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb =3D> gs=
t-examples_1.19.90.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/=
0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb =3D=
> gstreamer1.0-libav_1.19.90.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb =3D=
> gstreamer1.0-omx_1.19.90.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.=
5.bb =3D> gstreamer1.0-plugins-bad_1.19.90.bb} (97%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0004-glimagesink-Downrank-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18=
.5.bb =3D> gstreamer1.0-plugins-base_1.19.90.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18=
.5.bb =3D> gstreamer1.0-plugins-good_1.19.90.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18=
.5.bb =3D> gstreamer1.0-plugins-ugly_1.19.90.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb =
=3D> gstreamer1.0-python_1.19.90.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.=
5.bb =3D> gstreamer1.0-rtsp-server_1.19.90.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb =3D=
> gstreamer1.0-vaapi_1.19.90.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-g=
st-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respec=
t-the-idententaion-used-in-meson.patch =3D> 0001-tests-respect-the-idente=
ntaion-used-in-meson.patch} (87%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-R=
emove-unused-valgrind-detection.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-su=
pport-for-install-the-tests.patch =3D> 0002-tests-add-support-for-install=
-the-tests.patch} (79%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-t=
ests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-=
dictionaries-for-environment.patch =3D> 0003-tests-use-a-dictionaries-for=
-environment.patch} (70%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-t=
ests-add-helper-script-to-run-the-installed_tests.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-t=
ests-remove-gstbin-test_watch_for_state_change-test.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-t=
ests-install-the-environment-for-installed_tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D> gs=
treamer1.0_1.19.90.bb} (77%)


base-commit: d1e1c8698a5143a1e5d80d172105b76c57b85dd6
--=20
2.34.1


