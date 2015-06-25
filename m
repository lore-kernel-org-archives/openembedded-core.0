Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2FBD6AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:24:11 +0000 (UTC)
Received: by wguu7 with SMTP id u7so59735901wgu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=nWD+9ru8MftBL41axNvf1Z8fP6iBqvWRz/Kjc8OsifQ=;
	b=DN+rB+Tzo3Y5gPivZLblGudqErM7zq2zpUkYoYgSiNid962o3SDUiEygTdwT7T+gJ3
	4pPMgYitVdUb+ZLrkzDanrbSG+j4F3JI7rRWIodVD6z0yPh44YkKBBClDyRWsF+J2965
	0MNHJveKHB7cBLyR34q+E41OnpOMfn2+Drx6Q4pDR/HOcoknBv97QvI9lfCJ7c5U/IHS
	AFYkYjZE/jd1kn6FgZGLEgHp486sZtU/g6N8Kdfn2P7Zhw8g8ANhGyd22L4GaReQ5fs4
	jg/yAtXG+eXYY2PMTlI3+lv7ID2TC1DwNtAjpMQAfz/REtc4o5gzV2nUtViCIn4ig2Ik
	xV7g==
X-Received: by 10.181.29.100 with SMTP id jv4mr4786760wid.4.1435231452385;
	Thu, 25 Jun 2015 04:24:12 -0700 (PDT)
Received: from X220.tupi.fr ([37.163.120.64])
	by mx.google.com with ESMTPSA id b5sm7113324wic.3.2015.06.25.04.24.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 04:24:11 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:24:03 +0200
Message-Id: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] Set S to fix QA warning on systemd-serialgetty.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 11:24:13 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 1c34d5c..399a88f 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -8,6 +8,8 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://serial-getty@.service"
 
+S = "${WORKDIR}/${PN}-${PV}"
+
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
-- 
1.7.10.4


