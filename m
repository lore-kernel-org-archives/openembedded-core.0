Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 74A2F6072C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so11584841wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=O5C/WIN2HEz8+NTd5O0mTP4RaM8UXT8NCZPjTOZK/kM=;
	b=0sJqj9/WBQ565k3FSrN1gO/ryDPfsBiBwaR9Trnhh/aWdvwSEPYplFccxH7Kxr2Cdz
	DdZwNbvQKwccTeC2ryh7L9XJQL/oa0WyKBndwkl/ML/ippWCmgZcVVLUG+p+jQ9HaMEa
	RWK/r55JB34p3ssMshAkvgdfFzySaVRAOTXaucV9QXoF0Nbo2vwLSY1S3rZWHhh3NVPC
	jM0kp4ucBSlNqa9uv7jZ3flXY/ePwDLiM0dp+CUXk4sOEo/GTh5es9HVgu9rCcCtBVJG
	jmkiMlSYdRXhWq7xFcY5WTRDKUpI5P8oBpBlRzqspbTSaxdonLM/j5o20etaU8LAz4zr
	rQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=O5C/WIN2HEz8+NTd5O0mTP4RaM8UXT8NCZPjTOZK/kM=;
	b=XBFtR9M9QHX5sdhK7Y1VAJ6BgJRtEfJOXacroiayNNjku+dDDtx7FCKgeKqKynfxwW
	ui/YbTj1QrUEvaJr5x/7iyDPM6YaCTQqkRTpLInZjTUaIlDXL5rmFtnZtHpU9BESDhFY
	UN577sUTsenZnO19juB4JIrcMb9hBLpeo2gsdt2rNl97Y+FIk2F2zZEelnuS2BEwYVn8
	QCYR4BwS6nxTbY+iflBwgoOttuSHAcaGpTPkfVx6IMihnIMf+Mwxe3RYyqjzZTfQLBEd
	BwB3aY3s7PzFpTHzb2Umwjly2iMGJCrLDG9XblJaFFbRp+9FjXfFo2jeouxO/QxTPRIZ
	1t1w==
X-Gm-Message-State: AD7BkJKDM+GQT9PdcPfRchtL4LMGiiiGnBQXJMYXIJtc2LCTnMielyRPNCHNgdfbGyfHnw==
X-Received: by 10.28.130.6 with SMTP id e6mr14008075wmd.71.1457896486056;
	Sun, 13 Mar 2016 12:14:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:44 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:07 +0100
Message-Id: <7a5b5a1a254b4ab1c896ec858353d191d32c0f7a.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 09/42] nfs-utils: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:45 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 .../nfs-utils/nfs-utils_1.3.3.bb                     | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index a6268f3..c89fe3d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -86,11 +86,11 @@ FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sysconfdir}/nfs-utils.conf \
 		      ${sysconfdir}/nfsmount.conf \
 		      ${sysconfdir}/init.d/nfscommon \
-		      ${systemd_unitdir}/system/nfs-statd.service"
+		      ${systemd_system_unitdir}/nfs-statd.service"
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
 RDEPENDS_${PN}-stats = "python"
 
-FILES_${PN} += "${systemd_unitdir}"
+FILES_${PN} += "${systemd_system_unitdir}"
 
 do_configure_prepend() {
         sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
@@ -114,19 +114,19 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
 	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 	    install -d ${D}${sysconfdir}/modules-load.d
 	    echo "nfsd" > ${D}${sysconfdir}/modules-load.d/nfsd.conf
-	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
-	    install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
-	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
+	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
+	    install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
+	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
 	fi
 
 	# kernel code as of 3.8 hard-codes this path as a default
-- 
2.7.1


