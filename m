Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 07DD27C035
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 17:24:38 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l15-v6so7158203lja.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 09:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OEDzMHI4f8Yp8OhBiPg5AsUrdzoVFX3exNLGjWxMOqo=;
	b=QkfYw5YzThNiIw8oKArRpCiDxBzz9HhllGlRVFWBfar0DULrMu2MSIzEAO+JZzNFUz
	ltgq41rJ4dO0YyYvMAFp6p18BDhAHk0xgvqljrFJzui2NIeJfs0naVPEFwDz/rLdOW76
	LpFgLATRs52sHC/F1W4ffIr4ldpLnifulmQpgCiz8q2M0MJW+yOLRH3W0KBh/FhGRMQ2
	o45+OnmkPso+NBh55CbYWrRsqFd94+CSqJk+Rxsvt9kmXC398nxVliQ47CK3c1mK9ecf
	nv+a3xtsoHJ9vZiAdYkZTdXPKgsIeemawNBezS39GuBHghakgApajfovx+kleZ0ryqwV
	MOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OEDzMHI4f8Yp8OhBiPg5AsUrdzoVFX3exNLGjWxMOqo=;
	b=dFxKQ4bqbbDNeNOCSWUJ/GZssVgYGykUBnGQxWYLuBk5+sSzSoQF03agwu2iCEY+88
	Pl93qa6ly5tRtQVTL2g4b4tl4TpI/HdH0jruvra7xFSJ5cF2qRmbXpeeH0pvskxxsyVm
	OVOkJaTgApnt6Hs3Hw58lCKIYfRvip7bD7qIiDjNe13WCxX08ZRdGd+9CbkZoBWQHGYK
	XmDP/UqQwKgngeKH5qDL81l/vS6U/0e/o5ylzC9YxmX611IlRFjnqiKWP7U1BXnXmaxb
	rW3eXlrlYm5fzKLn6Vtl8EUvK9Mso/Bv7e9ntJ0StkY8sICp/eapPYJvi4F/c07E7NEH
	jy9w==
X-Gm-Message-State: AJcUukfhCUJdNmCbQa/Hi1t0uPGESt2sQPNcU/c8pLHMFYxOc6qoPN/3
	+KrRTMHxIJiq7N6cnv6LFrPOLNGDBWs=
X-Google-Smtp-Source: ALg8bN7aO+6rRqQmY6C41fKNDfdeAppPeAGqsi0owJWpBeIUM7CV/IcA6BvhNrD0ZM8i0S7uBPaOEA==
X-Received: by 2002:a2e:2d11:: with SMTP id
	t17-v6mr3890752ljt.159.1547054679401; 
	Wed, 09 Jan 2019 09:24:39 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	y9sm14008448lfe.75.2019.01.09.09.24.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Jan 2019 09:24:38 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 18:24:35 +0100
Message-Id: <1547054675-32745-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] npm.bbclass: introduce NPM_PXORY
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
X-List-Received-Date: Wed, 09 Jan 2019 17:24:39 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is needed to support building npm packages under environment with
proxy setting.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/npm.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 6dbae6b..0f37f30 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -24,6 +24,9 @@ def npm_oe_arch_map(target_arch, d):
 NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
 NPM_INSTALL_DEV ?= "0"
 
+# Format: http://proxyhost:proxyport
+NPM_PROXY ?= ""
+
 npm_do_compile() {
 	# Copy in any additionally fetched modules
 	if [ -d ${WORKDIR}/node_modules ] ; then
@@ -32,6 +35,13 @@ npm_do_compile() {
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
 	export HOME=${WORKDIR}
+	if [ -n "${NPM_PROXY}" ]; then
+		npm config set proxy ${NPM_PROXY}
+		npm config set https-proxy ${NPM_PROXY}
+	else
+		npm config set proxy null
+		npm config set https-proxy null
+	fi
 	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
 		npm config set dev true
 	else
-- 
2.7.4


