Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxM5I-0004Jj-0R
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:27:09 +0100
Received: from mail-wg0-f71.google.com ([74.125.82.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 10:11:26 -0800
Received: by mail-wg0-f71.google.com with SMTP id dr13so6808205wgb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=x67YqMeR/Ah73JjvK/j0IqsAdZyF5y9uneRzAwJN6OY=;
	b=XN0IzA0eT+WYf1JfeGUL9FWokv1NpWKzMz3xQ0BVwY4kfLbsoRgWKlZAX08hjLRHMo
	3WE3LdV0bHnglBkszsmdItJto4MRZravoOUZTtVr4v04SrOFR4pIVwV8ewJH22fFOx8L
	35TZYi80CWrDWdeElsYFOpL1AyTv5T3EQcSytcvwkei3VaIiAT8Vq3cQknFgkWQw06cb
	e5/kL7VMOk0P/xSUorXFIcT6OYRY2kqTsy1LiwVJDb+Brrc18jY6jKk8Q0fhOquTx0RT
	Qkp9dCDktoHG57UY7eAvFt0t35KEjVD/YTyqVRNfw+iwVLqsDHrMkyCUXSpZHAT0m0Y+
	5ibQ==
X-Received: by 10.180.19.136 with SMTP id f8mr17109698wie.0.1358791884919;
	Mon, 21 Jan 2013 10:11:24 -0800 (PST)
X-Received: by 10.180.19.136 with SMTP id f8mr17109687wie.0.1358791884737;
	Mon, 21 Jan 2013 10:11:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm19814796wiv.6.2013.01.21.10.11.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:11:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 18:09:19 +0000
Message-Id: <dbe069ce91f8e13998ba51f7048cf61072964ef1.1358791697.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
References: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
In-Reply-To: <cover.1358791697.git.ross.burton@intel.com>
References: <cover.1358791697.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkmodEKvaz2dqAfrvqXXZSA+4AOtw09aXgaj0w5uetbDSBbxJ5s2EKa4XibLJb/zI2G/vROB/atQo5/IFQmfNwkknMWK540vWk9IhNa9VVnDBks8CtubjNrQ4gqlmL/QP+A5d7hzJVRqwVY6/9PgVv/8u0Wd/80S4YhZuARfJZmPoBWmJ9B/iY4+zVzrDHS8/2vMreS
Subject: [PATCH 2/4] systemd-serialgetty: remove redundant statements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 18:27:14 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 7e7368b..3e2a0e3 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -35,9 +35,6 @@ do_install() {
 	fi
 }
 
-PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-doc"
-
-RRECOMMENDS_${PN} = ""
 RDEPENDS_${PN} = "systemd"
 
 # This is a machine specific file
-- 
1.7.10.4



