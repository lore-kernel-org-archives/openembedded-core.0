Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1263C433FE
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:32:25 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.web08.502.1654032737789065809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.196,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.int.toradex.com ([81.221.243.92]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MJVcC-1oG0hf3Gfo-00JraT;
 Tue, 31 May 2022 23:32:12 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
Date: Tue, 31 May 2022 23:32:06 +0200
Message-Id: <20220531213206.7119-2-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531213206.7119-1-marcel@ziswiler.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LsWRt4M9M5Ca2vllVk8rzWBOwluSQKKz8+drjsHTIgkpVkLbMWQ
 3aAMakJnYBNUoCv3LsbLKG/1846wsB8p8SkR4Byb1eFxNomG8k2/nHUELIOGMfrJe0a4O3H
 bBZ2UB9p3i4nzhSz9p/Nw45hsCKZdog9NzGotL76FG8zYNdyD6Ed/RN9Px7jcz+ZsSck1As
 J3kC1YnAAUNGGt3xs0rUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:96jkWVGs+Cw=:EEYK7d8hUfRm/wJqWcBtb/
 i3f/H70E8ozfFzk2OLokLnEvjGSNQWehnaPx5YTjxLbvmfeVl5wu1Afla5lAruzf5Bn/hUCfN
 vhxmI7mIFdt6oK/7Xec+nhRxOTPl1TAX89AHYclMRpMf7B5PbHQegybERVFCRf+au/NvWt5Zn
 5/+PK8VvJRT/cj2wsHRo3RHkyEdLDvSvD5ObjLyf9vZ6sNLaLbFN/Vhg2x6KOi5E4o1lApAzW
 QnxtmaC/9MA4G5BwrYCEoT0FObiQlUcSMUCARckoYg3KxKnv06azvGEK2re2B/J43G48zTDhv
 lD3lJcoeBxZZENQ4ed856/jHk04AzqhYKx8gXLFF8cTVV5ogriw5onJDxx/DXW7qfy2SW9X6K
 DS3PCagJRsXYQucREnqIcVq+xh7C9sl2lEoycKK8altwT77VzBDXLAZkrggcoVXW3+1Kp5yJN
 XYQKYK7P5l/ODs+kYgOWcCFZ9H2DDSNByObZJtlQFnZMt9mT9G2Y8X975Qmg2yTTR45z/80Gi
 d4gFzALb9M+MH0rPQHIrwffnk3fk+UYqGQNFUHsH4qYaqfeqYCdI0zDbcIwuZj6vvpMmB0E+c
 Y7BaxJi4tbboQnYIgvCW6fTLhRGDHQNc6R+E8ikVmt5mpPoJJ8jH+Vck5gt34dW2G5Z3z3cwV
 nUQ8l9DWaqQf3g7TeCGTptdQRRyKpSBstScIjY/Kq6ry3Us43q5da3ntEo2xp0df/RolxWYDz
 BRFX7xpxld1PwDtsoVVA3aRBdN7bkdY5q8DsTA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:32:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166338

From: Peter Bergin <peter@berginkonsult.se>

In order to enable configuration option aaf (AVTP Audio Format)
used for AVB the library libavtp is a dependency but no recipe for
this library was present. aaf support for alsa-plugins was
introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---
Resurrect from mailing list [1] as this is still not upstream.
End-to-end tested on Verdin iMX8M Plus.
Will talk about it at the Embedded World Conference in the TSN & Linux
track next month [2].

[1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
[2] https://events.weka-fachmedien.de/embedded-world-conference/program/

Changes in v3:
- Rename recipe to officially released PV of 0.2.0.
- Drop PROVIDES of avtp which just works around alsa-plugins refering to
  it as such instead of libavtp. Will update PACKAGECONFIG in
  alsa-plugins instead.

Changes in v2:
- Updated SRC_URI specifying mandatory protocol as https.
- Updated SRCREV to latest.

 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb

diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
new file mode 100644
index 0000000000..563debde3c
--- /dev/null
+++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
+               specified in IEEE 1722-2016 spec."
+HOMEPAGE = "https://github.com/Avnu/libavtp"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
+
+SRC_URI = "git://github.com/Avnu/libavtp.git;branch=v${PV};protocol=https;nobranch=1"
+SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dtests=disabled"
-- 
2.36.1


