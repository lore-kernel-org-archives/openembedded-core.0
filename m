Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0096474D97
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id v63so18599367pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4G0FxhK4ny4S4DNqksOQvurfb9LCXySfOv2S4y1e6Sk=;
	b=sy0c/APVkDzNBpRAntBflO+vvRhFvr+PXufSOc57GQjSRXPnBd5e8zHRMU7pFiS1m5
	1xgPsyBJFC3JFA6oaKBkdivD1Axwzqs8yJa2OmK1MmbwFuQZhHFVJahOAUgWMCoFD7qU
	XJ+IwMF6wTTDlpLamS8G57ny9r+euurS6oxFae3N36jjCdDsCD01lcwSQLtwfbvSGBfo
	10gkj8iafRmdran+2kTpnLHnzaMJsdPB8UR/HfRQ+4W86SgPIJ5pDvIIU89BsWKyK2ej
	CvBzowoZEs9xDnxW+rCj0vFWBpzg/d7VcCnHdx2WcHp1jGaIPmiS009NOE0Zndt9iO0q
	dLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4G0FxhK4ny4S4DNqksOQvurfb9LCXySfOv2S4y1e6Sk=;
	b=twv1cv2Zt5OJklpWUgB4dm3T4dpGalbvnBUdZ219JYGlu2zxnYDyaldiRf0Ws7MF4h
	ygutRXjzhQ2bmxHs6KGCx24RSE4bBcV/MKBXXPCU2x5dfz1bcsQOrzN+01vSkXaG8MrU
	yzso/3kAuoml3ILW4MijQjfGB0w/tRW7SniuzRPhPbPLTOUU1AUXHNWj9o0ksdELCTL1
	EVMaQ/rNIVCRN4uTI3gdQdc07/rU9V3cbN/ilIip19hHsLvG3nD+LLB5hNjQDMZUgc51
	oXBTuV9D1mRHb4Y/+gqq7idL92XJBwaqI+4qI1LimAjDKlUrcdMOWJ8Z9ZbHzXG6cKro
	dIWw==
X-Gm-Message-State: ALQs6tCKROt46tTiLS8Riq7irknJ5Xnza6A8AzgePNYtXl+OZV5QJ+WC
	kW7sncNp4o3vAE08DTOgq4gAcg==
X-Google-Smtp-Source: AB8JxZrx71O0DX0d5omSYelDbJJZEZjvh3jLFPdqpZaPg6LA+79YQEMaoIObzJ5PEIev7Ihe7tanAA==
X-Received: by 2002:a17:902:b7cb:: with SMTP id
	v11-v6mr4755107plz.266.1525479287034; 
	Fri, 04 May 2018 17:14:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:15 -0700
Message-Id: <6a2c8bb93c50b02100549c23c1b7c0aec2304e95.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 21/27] ppp: Install net/ppp_defs.h on musl
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
X-List-Received-Date: Sat, 05 May 2018 00:14:46 -0000

This header is used by other apps e.g. ippool
glibc provides an internal version which it should not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index a5f764f6ec..a1bb7d71c1 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -80,6 +80,10 @@ do_install_append () {
 	chmod u+s ${D}${sbindir}/pppd
 }
 
+do_install_append_libc-musl () {
+	install -Dm 0644 ${S}/include/net/ppp_defs.h ${D}${includedir}/net/ppp_defs.h
+}
+
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
-- 
2.17.0


