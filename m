Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 907937FB3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:41:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so4372759wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C+ny4AiYQNbFY29S3uO3jI5ibE4t6VOF23PEZ6CMbbY=;
	b=X8dXnpH+INicEAd0kmE7r9Nyz7JkOCMD5XVsIVXvBVLZvWqtXpluEz4A+rzM2JRz6e
	CgAtmuJfQhgYN8H1xse44x/fZ7rR/UWivNweGPD9mkkIsW2CsHXHIRnlGKRG0FbX5TZK
	5ejzUMSjlIdlRMTKU5RwBx/ryxjWxuMKEYoQTZv4wKLzJM30fXEief4OfihYHUmESjHf
	sEpv851Auc9L+djAszKTlbHLycWNpvhdP0uBnFJKFNkmt/qFuZ4INoAwhemHE6ueZmsT
	nUbB8AyE+sLiILY/DGb3TRgzhuH8iw5MuBmfWR8ZGTMbEgFCl9iyYBWlnioPBWE2p+ft
	l9ug==
X-Gm-Message-State: APjAAAWV6jcVPV/3VWx4HkYnRgcBlFo7URgqQlje3rrDM/DYJTrl1U29
	5OgBtv2RytWsxo5PYFuwqtKEMTA5
X-Google-Smtp-Source: APXvYqzUObyEy+lDR0ApFOaDiChsX48Jik4QjXfHc6reo8ECUNLxDwl6UzqfFy4/m1AZlhgT+1db4A==
X-Received: by 2002:a5d:4807:: with SMTP id l7mr8856434wrq.64.1576186919169;
	Thu, 12 Dec 2019 13:41:59 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	p15sm2842362wma.40.2019.12.12.13.41.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:41:58 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:41:58 +0000
Message-Id: <20191212214158.25526-1-git@andred.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] connman: update kernel module RRECOMMENDS for kernel >= v4.19
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
X-List-Received-Date: Thu, 12 Dec 2019 21:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nf_tables_inet.ko and nf_tables_ipv4.ko and nf_tables_ipv6.o
(and nf_tables_arp.ko and nf_tables_netdev.ko) were merged into
the core nf_tables.ko before v4.17 in kernel commit
    02c7b25e5f54 netfilter: nf_tables: build-in filter chain type

nf_meta.ko was merged to be a builtin of nf_tables.ko before
v4.18 in kernel commit
    8a22543c8e70 netfilter: nf_tables: make meta expression builtin

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index fb38ab4fc1..ff3aff5f1f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -51,7 +51,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
 
-- 
2.24.0


