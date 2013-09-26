Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id EAAC96B8AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:47:34 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so764938lab.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=7jgxaDfWZZI91JzuMOBJF7z5F6igOGtyC2M/FkwjZ3w=;
	b=frgPXivluRWuxr6qCVDh87TCwyQuRGaiwgXAlXSI5AwU+QozgY+JavAOjgZ80yWVrg
	VWHrjR+gdfkVcc/yUt52ibSWqj7x+A6ynA++yAteExa3m/z+3XGsfFisVofZJmBYAOlu
	elKXzl1FJweZPuIlKmUtlx5s39oo+StjQtI3rYgifs5TUSzmqZRyaGXbUcqDKwM3RnF9
	6iwlZZS0pS3N4MMXw6j+Gbq5jzZ4iomglZjsFQpZLR4RTEASL/vj0ZVgi6jzCC8tBdsr
	UhYesaXgGmBBF8iEkz4+eaRjfgqYo7hJcyhnhcYbuVj7rhYFZZ49+FiHZ9N6Rm/rc07a
	WFMA==
X-Received: by 10.112.172.137 with SMTP id bc9mr3443944lbc.21.1380192455883;
	Thu, 26 Sep 2013 03:47:35 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id oc1sm1986312lbb.3.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 03:47:34 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 0C8A140055A; Thu, 26 Sep 2013 12:47:28 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 12:47:22 +0200
Message-Id: <1380192442-12205-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] makedevs: Add device_table-minimal.txt to the nativesdk sysroot
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
X-List-Received-Date: Thu, 26 Sep 2013 10:47:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an example device_table in the SDK under /usr/share/

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
index e6860f0..4c7a5ae 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
 SRC_URI = "file://makedevs.c \
            file://COPYING.patch"
-PR = "r7"
+PR = "r8"
+
+FILES_${PN}_append_class-nativesdk = " ${datadir}"
 
 do_configure() {
 	install -m 0644 ${WORKDIR}/makedevs.c ${S}/
@@ -19,4 +21,9 @@ do_install() {
 	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
 }
 
+do_install_append_class-nativesdk() {
+        install -d ${D}${datadir}
+        install -m 644 ${COREBASE}/meta/files/device_table-minimal.txt ${D}${datadir}/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


