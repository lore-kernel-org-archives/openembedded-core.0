Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 505A27316D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so11586431wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=aESg213Zxy/+0OK8AlKqpIbxwljtmYZGLKPuOtFJt8U=;
	b=UaoGSlIWF/cBo9vrghJiEOOk1MuAg/d4uEH3bk0R0urS4EB6sY85RgY08X2SvHYCCf
	N7meCiArvFLFH/s5kyNTn12PbZDcOuEWF/TloxuxxeepfNW1Mwm7PoYLKox6iDMu982y
	dYLvSykPgYfd8ukx9Lsxn5it/1ZmCDBxDvdRr+UY6GVnPpATl9WrFGAqG057HhjBk40R
	n5mEbXzgTLJSnc4PkK1QemkeXC94ohdUqRv7qbRhr7WUzP4MtDOhZhAeSCM4nPTnMWD3
	IhhAKIZw1Gmr+54YXIVlmMnBYLr/9b7gCQXmof/lB4IlMN5PAsP/yJHFvBSC0PwISzYO
	Idqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=aESg213Zxy/+0OK8AlKqpIbxwljtmYZGLKPuOtFJt8U=;
	b=c56KgMqvk9B+C5CAw9DRMiOnD2niHeDL0a/QXXrrtI6yJ1UyZPq1q6dpoZrdlxqfEY
	P7G0dShZY4qjXEqGEnaUlYtGid55RojqoijNAQxriNATUCvmYjdhlSqCHkaSYdfpxY5z
	CwNVK+Evy/QjT6Ao19VXVj/TnDKgD2rvaNfqsNAvFDKKA5DPq0YjdXGIYXAhE0it1FaU
	8hrG8ReSymipncCgS6Tn3IXOHYY2lK3N1lHsZ6qvj14fcpJl5sqUUbXuRmiDDHtMGI/B
	0CmjPnG6AoJNPuS/w8vEutKnY6uc3nRkr1HWruvMHI1ANl95cNGn0GhYwFCfeSgUPsR8
	NhNA==
X-Gm-Message-State: AD7BkJKgIIS0tuzuefEzQDwzMqvUdnfM7ynJ+uhAeeZ6F9LWvAoEQ2fHlWQOPsEJ/i4oGA==
X-Received: by 10.28.21.75 with SMTP id 72mr13391094wmv.64.1457896509928;
	Sun, 13 Mar 2016 12:15:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:09 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:25 +0100
Message-Id: <8d4028279df58da017ca2dfd41f392194f7956b9.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 27/42] lighttpd: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:09 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
index a407d03..ca88b75 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
@@ -54,12 +54,12 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@BASE_BINDIR@,${base_bindir},g' \
-		${D}${systemd_unitdir}/system/lighttpd.service
+		${D}${systemd_system_unitdir}/lighttpd.service
 	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
 	ln -sf ${localstatedir}/log ${D}/www/logs
 	ln -sf ${localstatedir}/tmp ${D}/www/var
-- 
2.7.1


