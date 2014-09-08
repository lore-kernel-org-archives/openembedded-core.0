Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0491B712AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:56 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so2184384wes.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Aph2+7gyxwiBX0/6qhY/8Luj3+BMp2NlZh4baXzgPok=;
	b=BpZZOFeW9KgfWYDA4wR7Vnn2qrBzP3PLYtGCGDhE5ApetnXSNys4U077pmk4y6gPaC
	U8AfGchy8XwkHcw8lYvOBmHGj52bmPKrpMg+/7L/VXQgX/IKtZYt9ZEsU8JXaFPF1DKx
	PQgrMJoZvG1//d+/lbPU5qpT/NvWBmk/rkr0yMhtO0s4iHIg1m13IJej+p+zsN0rlXFE
	up/SVuPaj0Z1AsthXYmxdat5Hrthz/tz3dro0nVPfS+k3ChE4CkBB9mhIxCVlZzWPKcP
	+HUYSMtZQnvC+9Lj+JnVQE/qpJT9LkwnDW+P04YNbG0lMSSi178PceCGNpQq1UaUANRN
	bNxA==
X-Gm-Message-State: ALoCoQm8VgHgArbO2S509RkHS9s8e9aMpgz7wMcYM50U0DnTbopi+RgMTKVEfPu1A9gpL+tKJzny
X-Received: by 10.194.193.10 with SMTP id hk10mr12405259wjc.70.1410177537843; 
	Mon, 08 Sep 2014 04:58:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:22 +0100
Message-Id: <d8e866b42de54a48da5e79a7650b024a11411c33.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 04/27] sudo: make sudoers a config file
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:58 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 6de984a..1d7e541 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -18,6 +18,8 @@ inherit autotools
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
+CONFFILES_${PN} = "${sysconfdir}/sudoers"
+
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
 do_configure_prepend () {
-- 
1.7.10.4


