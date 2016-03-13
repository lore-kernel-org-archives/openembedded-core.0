Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07F2B73192
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n205so11550825wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=inHQkPjg+egzrwenJbkdHPf4vtyKW3NFyftZ1D16bf8=;
	b=kwFxsUV3I8FHfsx74Mjgs3taVtMsxpgwDjAitmR+6N7mgfmcekp8oJBu05nTf+B32o
	pdoY+4xweDvRTQPgvmSV7E8Ouu+idz2EMhu3EnXVdgVO8xyfsAZzj7AIBhWI7WePszji
	+NH3ySx9KQkBOCZJz0EIf7Fox25Ymk01UtptrunwY2+dQJyXwHiuZfy8PMDT1kWMZUti
	txQ2RvkzY+N/5DdeBwF2b8k2QvDQwlWo2WuBSMl3YzBoQvoSRnEUOsxJATdlH+KaImwh
	/URpfPU/eu6YMvu9+cPkoLyM7UA/V+CPRnd6rxEBPYads5FjFVLU0NywEdit6i7hBpN4
	EAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=inHQkPjg+egzrwenJbkdHPf4vtyKW3NFyftZ1D16bf8=;
	b=cwwfTg2u+rcLa8jGhmS7UoZXFlXMRf5JWwxGpvHGC/crjVYCgc0wM6SAmFyrRYFCMb
	1aogD9hOLV0hFVX+lJDcX7dp6jR42yuhzU3zX9HOFvqO8tFCDKhkpMd0cM3fKCT/ManY
	ZvHE0DqqaHIhFnhksw+yRReBkCdR5K/SZKT3s9ikQF4g0e211IDeHS74P0qgHkcbL/rN
	vWIZUi3QP436jmru73oGOlQ30RjIz09kZ8/5OIvJuvj4VltA/ECdALuAPK1Td7xDTHdf
	ehPhe0aEfyT04aTS3526g0Kz4nrjcd2EDKzdKzoCfDSOebNjP6MBjM5+eywU8dDlaagC
	cQ1w==
X-Gm-Message-State: AD7BkJI/kc941M3+xkdzoOT85qK10QiQ8C15sJv3KMAuePOwh3r3IkMkGBp1qOB8cSwk6Q==
X-Received: by 10.194.86.202 with SMTP id r10mr9521134wjz.113.1457896511630;
	Sun, 13 Mar 2016 12:15:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:10 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:26 +0100
Message-Id: <aaa1e57537642218cc38fead598283cd7e6a3d5c.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 28/42] rpcbind: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:11 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
index c19a197..0afec6d 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
@@ -47,7 +47,7 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir / \
                        --shell /bin/false --user-group rpc"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/, \
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/, \
                           --without-systemdsystemunitdir, \
                           systemd \
 "
@@ -64,10 +64,10 @@ do_install_append () {
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 
 	install -m 0755 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/rpcbind.socket ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/rpcbind.socket ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		${D}${systemd_unitdir}/system/rpcbind.service
+		${D}${systemd_system_unitdir}/rpcbind.service
 }
-- 
2.7.1


