Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744F7C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:57:18 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.web09.51250.1654012636053346777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 08:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.196,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.toradex.int ([31.10.206.125]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0LtHdl-1npM2I1fkh-012la2;
 Tue, 31 May 2022 17:57:09 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v2] libavtp: add recipe to be able to use aaf config
 for alsa-plugins
Date: Tue, 31 May 2022 17:57:04 +0200
Message-Id: <20220531155704.682685-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BCPEA/MOFB+lR14kFmL9iwsxUJpG0URIYBi1JbxpY0Aq7vwephb
 PKUmtsDlbIvNQSHnx1nSkF2eMs5Yo97lOuVKLrmZS4y8s1i9Uk7ihZjKB2mqB0QjWJfFZRy
 Egt/QbJGHdwJU/CiVm/VisT/L25L1TqnvmS7rVIS0lhv2XcvJ48uE1pjbYOiBHe8KyxgKem
 miVzhFrzhIoA4437gn+9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1EhD7VTSVIU=:3OxIy2/U1yalZXpGg/yBvz
 J661OxW7fXdyuyRiYkDnGK5jZqvCSadoXtXZfTlDpElGgLE7fd8EekfuvrEMA6HrzJGbB3rUJ
 akwUwvWHlnu5nfrWD4Aj9/7CaX0dsZKZBoZkWDUGCY1EQfslGq96Ln0KfjZT0bc9cQ43Qlddg
 ICg+M5eQ2JgrYwrRA04YWf6MnsIHceobRUMbDFIYseuNuk+OvrCPJEvdE1g9wKgvwbM9058gI
 8Lmme8BKU/Umj3Wz2kBP3cmFhClC3nnBTXhUXMcoGYQK//TDyumT4F6qhSwIO8EICfbu4DM6s
 nyH7x2FT8TcBMKJfYvfaXj79LtWwIqdBIaOwFRGLTgvwBT4gLjfQvshaOPTBdUMWiGhkH40NW
 t+mBUsyq88CCgHQY38dRMI8DXEkyIsDhEgBU7S5F13f4xb3AFOiln6BjirBPuYfjP3UvZbItt
 HT/EdO+BwxHiWZm1uRZy1ig66BFWFmL9IX4t0Wx42iCBuqvSjCENdDpCC0zKiAJj9AxeK94WQ
 UYIPX79s+cF72VcQu4xq1jQmiavkR/Zz9tKVgioLLv5vVitp7pKzBCn+qOG0SZrMbcEMIoyKG
 ttDNC79uQ0ryuNSourI2h8bVKWlCaqbAMDXzJURaFk897udt4TWGvVJLOQ7LeelMWgKByB1VP
 0SShn0my3fi2VKyavBbm4QpcBQYdNU+Y+MMedXTDXAYo6s540au5wNz3xakH2+pg7J7jAxvl6
 efNxoJonlLBK8bgasQm+a57JzhybZNfsYGzAMA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 15:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166321

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
Will talk about it at the Embedded World in the TSN & Linux track next
month [2].

[1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
[2] https://events.weka-fachmedien.de/embedded-world-conference/program/

Changes in v2:
- Updated SRC_URI specifying mandatory protocol as https.
- Updated SRCREV to latest.

 meta/recipes-multimedia/libavtp/libavtp_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-multimedia/libavtp/libavtp_git.bb

diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb b/meta/recipes-multimedia/libavtp/libavtp_git.bb
new file mode 100644
index 0000000000..aefbee56ea
--- /dev/null
+++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
+               specified in IEEE 1722-2016 spec."
+HOMEPAGE = "https://github.com/Avnu/libavtp"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
+
+PROVIDES = "avtp"
+
+SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
+SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dtests=disabled"
-- 
2.36.1


