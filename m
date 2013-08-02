Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1E59B6B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 09:08:36 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so272472lbf.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 02:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=VWo3NXXwtd3cg5byTqa73JiCqZILNb8Dr8cxh5eCYbM=;
	b=TwuHvlghEQpeDMzWoYMVgnKtOoFnwV5Sjhj28vGqp5Ug3oWg6nGPIyZdNEAhtLP57S
	brW8MeZ/KuCnrDYub/17irejk9x5+Z3iyODL6nsNanEJ3UVaAg1xPl0J+tfZjZ10X0Ns
	NqvbnsH9tlPNzJldSNtOPx2hd6hLLgblnWmzAobMO/hv0B4CS0CHCRX021DToy9ezK5k
	UJgBVuu/U108HwoKKvtTvMQ5EbhW3D6HyBsekR+zKRAqRf8B7do1hIhsCrgoRdee1kJF
	PsW0a+zH1rOr2bmseXjzEWBNM4jeiUXRGT3/hSIqKzbS+YjzI4GneiVTJTb/UiMSro2k
	kzqQ==
X-Received: by 10.112.97.179 with SMTP id eb19mr3057237lbb.78.1375434517003;
	Fri, 02 Aug 2013 02:08:37 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id p17sm2835390lbv.11.2013.08.02.02.08.35
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 Aug 2013 02:08:36 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 12:08:20 +0300
Message-Id: <1375434500-869-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQmABiBSeA2bhITH3aje/cYWum3L+SljcIn/qJ/DgSZmPI7x/NFhYePkd/nqiW3zAAX3M4Rq
Cc: Victor Kamensky <victor.kamensky@linaro.org>
Subject: [PATCH] libc-package.bbclass: Add armeb architecture to locale_arch_options
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
X-List-Received-Date: Fri, 02 Aug 2013 09:08:38 -0000

Fix gconv build failure on ARM big-endian architecture:
ERROR: locale_arch_options not found for target_arch=armeb
ERROR: Function failed: unknown arch:armeb for locale_arch_options

Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 74e2078..fd06c4a 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -267,6 +267,7 @@ python package_do_split_gconvs () {
             target_arch = d.getVar('TARGET_ARCH', True)
             locale_arch_options = { \
                 "arm":     " --uint32-align=4 --little-endian ", \
+                "armeb":   " --uint32-align=4 --big-endian ",    \
                 "sh4":     " --uint32-align=4 --big-endian ",    \
                 "powerpc": " --uint32-align=4 --big-endian ",    \
                 "powerpc64": " --uint32-align=4 --big-endian ",  \
-- 
1.8.1.2


