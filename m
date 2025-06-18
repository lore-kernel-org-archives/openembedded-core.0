Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33714C7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 16:55:37 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by mx.groups.io with SMTP id smtpd.web10.8538.1750256181216049703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michaelestner@web.de header.s=s29768273 header.b=kbwWClG+;
 spf=pass (domain: web.de, ip: 212.227.15.3, mailfrom: michaelestner@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750256179; x=1750860979; i=michaelestner@web.de;
	bh=mQbcyNOrcfQCIyLE8Wy3D+3G9sjz0UkiNkPpXUIRgS8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kbwWClG+yGbTD26UZl25W3ib1jt9G/pB5kRs4iIWir6+7/2MXgHdstf1vERLeFes
	 EBEZVb4z5tbrXK+2YNO2Y1KNLFFvrnoMrOKz7XJvB/FX7I/2VTg/F/Q3OQNKj4bzh
	 gfmveQ43eytgONc13x8jDvv4SLmA8VyfZ5xhfyQFZX/700B0MR9Rwg1x0VzdMUi8z
	 d5cOXg2LZsOTvr+U2rZnBrWjXWf6yRgIOuDrJGyVvlEL2Qhgsu/bx3PcNfNC/b3KR
	 VpNQLQml8AQhQrn7Dxousx0OgSPoF9F86K04VEJbRpemZr7jfkopXqPHP3MguPW7g
	 KYJ4QvsD5FLr0egzKA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([130.41.201.208]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MzTLI-1ueuG30tOa-013r6B; Wed, 18 Jun 2025 16:16:19 +0200
From: "Michael Estner" <michaelestner@web.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Estner <michaelestner@web.de>
Subject: [PATCH 1/1] [Openembedded-devel][meta]: add nilfs-utils_v2.2.11
Date: Wed, 18 Jun 2025 16:16:11 +0200
Message-Id: <20250618141611.257918-2-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618141611.257918-1-michaelestner@web.de>
References: <20250618141611.257918-1-michaelestner@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:juTYX8mLKJUNA+zJdR0yasr/ALSBfU6H9t0fJMHbVBF55/Xmogf
 a0dMZC3NZQaA7e+y1A5AbQ1kLPpCBla/0k/EKfnqaW2/fr0WS94UNv/6YSiXDUV8OkYYbg6
 1m48ROgnmJ1shxy2E8/Lm3BsIoeiAKOXebSmFI/f7UWm4pb9JW+RUbAeKmvQ4bGa27JuQ7y
 Bv5SI6WU9CfmZdQIbOcSA==
UI-OutboundReport: notjunk:1;M01:P0:QM+DZjIvscw=;7VyJYAEml1uw8vpVJ92y1Uj3UaN
 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
 0uzN21a6Y86lrf96
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 16:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219026

* Add nilfs-utils to provide tools to work with the NILFS2 filesystem

* Tested with branch master and kirkstone

Signed-off-by: Michael Estner <michaelestner@web.de>
=2D--
 .../nilfs-utils/nilfs-utils_v2.2.11.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.=
bb

diff --git a/meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb b/me=
ta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb
new file mode 100644
index 0000000000..6893edab29
=2D-- /dev/null
+++ b/meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "nilfs-utils is a set of utilities for managing the NILFS fil=
esystem."
+HOMEPAGE =3D "https://nilfs.sourceforge.io/"
+
+LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D385034ac639a62b8415db9814582ee=
98"
+SRC_URI =3D "git://github.com/nilfs-dev/nilfs-utils.git;protocol=3Dhttps;=
branch=3Dv2.2.y;tag=3D${PV}"
+
+SRCREV =3D "507064bb3604d0fd88f5e3f6422d9ade73a26120"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "util-linux util-linux-libuuid"
+
+inherit autotools
=2D-=20
2.34.1


