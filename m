Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155DFCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 20:45:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.179610.1697489131617244550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 13:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6E09820B74C0;
	Mon, 16 Oct 2023 13:45:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E09820B74C0
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] qemuarmv5: Drop QB_DTB conditional for older kernels
Date: Mon, 16 Oct 2023 14:45:23 -0600
Message-Id: <20231016204523.1185892-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 20:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189314

The conditional for the DTB nomenclature hasnt changed
and the 4.7 kernel is old enough at this point, hence
this check has become unnecessary'

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/conf/machine/qemuarmv5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarm=
v5.conf
index f0a86f1e4c..d648e01121 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -14,6 +14,6 @@ QB_SYSTEM_NAME =3D "qemu-system-arm"
 QB_MACHINE =3D "-machine versatilepb"
 QB_GRAPHICS =3D "-device virtio-gpu-pci"
 QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
-QB_DTB =3D "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-y=
octo', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
+QB_DTB ?=3D "zImage-versatile-pb.dtb"
=20
 KMACHINE:qemuarmv5 =3D "arm-versatile-926ejs"
--=20
2.34.1


