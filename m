Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B34F07D695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 22:07:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r4so23945642wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hWQm1iidic6UfQuW4YpIwsOkHYcw5z07bvwFDLBqETY=;
	b=EHfcfiHDQnHByxQWaF2E7+qtCRf9EERGdXasBlvgUL/zYf+LDETChpLLIkxv1Nzjpt
	jrr4fFvjYdsBD/iYKI42muh9VOPWIlWpHPo6Kj1Z3TSQR6kgefjlSaL2HoKKUzrML+7M
	FmllymtkhC2HYVgGy0IExB3UaVv/y1fmUskuox/K1JD2phb10Fjjox6CbWkQqRty7tr7
	XUNxWa/6ghOKkazIcf28pJUMwx+h2bt/P91mQ4HncwXWIV9ngW5KgqI+oWqeP3wiszy6
	bNrvEfbOFcauVGv7Y1LJR6ezs94gsEWE6rWQojklNX9/UtJvNBpoccW3WIc9dL0Wg9Pn
	c5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hWQm1iidic6UfQuW4YpIwsOkHYcw5z07bvwFDLBqETY=;
	b=f1RwvWLKpqOaebRIHiJPGT3r0/oaMw2wieGqLD6RCyp9QeJRrm5VyO6r03NiaH3wfW
	ADSv9Uih424DTNIIEP2iaEO7K2KJ0fqUiG9S5Fv5pVUpL3tjxecIkU3Z6ENWOhIsVdeM
	AVgyog4oNR5NSIibVyLAd8Z3zeOXjuR0empsugJW6k7Uvh2wtZIGvftji0bSbjFnVkm1
	BOUOJYYPtFJfmoDylh/WUakpDnfZnwLBZ8Iau4gGmCke0JeKQz0LFFR5LjVl4zpd+K2O
	yWdycJd8tpf1nGj5KIUp9rfmhVazr2/DHbc2rapYwc5wyRUUFIJmK8G5mCPzSrNeqUTj
	ZQ8w==
X-Gm-Message-State: APjAAAVjGQSo4DHG016NgqV5n+Ab07Gculfzj1keOLZWAjgtz5PHK0Hp
	bBPSCPAGZ1xBbWBl9EnqAJnNFiyx
X-Google-Smtp-Source: APXvYqxgsx4qEbqjlx7XlxSmYoUZu88g2o6RqYQj/i9YSGDFtCDzobalnimlN8oc4K/RHEHqm4IpTA==
X-Received: by 2002:adf:df08:: with SMTP id y8mr12782990wrl.91.1555366071066; 
	Mon, 15 Apr 2019 15:07:51 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h9sm14344602wmb.5.2019.04.15.15.07.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 15:07:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 22:07:51 +0000
Message-Id: <20190415220751.22127-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] connman: add PACKAGECONFIG for nfc, fix MACHINE_ARCH signature when l2tp is enabled
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
X-List-Received-Date: Mon, 15 Apr 2019 22:07:51 -0000

* import 2 fixes from LuneOS
* with l2tp PACKAGECONFIG enabled connman depends on MACHINE_ARCH xl2tpd:
   === Comparing signatures for task do_package_write_ipk.sigdata between hammerhead and mako ===
  ERROR: connman different signature for task do_package_write_ipk.sigdata between hammerhead and mako
  NOTE: Starting bitbake server...
  Hash for dependent task xl2tpd/xl2tpd_git.bb.do_packagedata changed from 6312d5711b5c2c1a85ee235d09bf37a8ec00f7ad9e7248c087bb83ef1d5bd078 to c0d3ef52b37bda945d8b2a015980ddb8fe7b4b3dca3d82d71a84176cc5125142
  Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb.do_packagedata with hashes 6312d5711b5c2c1a85ee235d09bf37a8ec00f7ad9e7248c087bb83ef1d5bd078 or c0d3ef52b37bda945d8b2a015980ddb8fe7b4b3dca3d82d71a84176cc5125142

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf                          | 1 +
 meta/recipes-connectivity/connman/connman.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9d63b5b24d..6590e80700 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -76,6 +76,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston->weston-conf \
   weston-init->weston \
   weston-init->kbd \
+  connman->xl2tpd \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 0a117e44a4..ae67079c71 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
+PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
-- 
2.17.1


