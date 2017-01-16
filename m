Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE61C71B27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:52 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t6so1386019pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=kkLeiJZrVg0urIL6UxFPW9T+AUynIdIZuTVU7QJGvPk=;
	b=k0LYE4/hCTxXuOfKfeBcbxdojfpqwKMk07UWZUx3HtUH4fqeIOT12jZztIOFUXy46f
	mbfvyPRMOCcmB6vGdRUix2TS6HceFnJqhHBsrGON/62qbIYNWC4BpyJvJMSMvs+6XYha
	t/h1tvjoijE/kB3Yht8Dyoo29U2fRWxt/U2kASKc0RNDan0X+lfUlWpZSPKzlJDrpc2C
	TsN5JiemDqrvEJq+hd2RHddZFu8Dcld+zKfpsyi5fqMjRqD26HOwQn4QBzOlVyauPoRq
	OqsPccCwSCh1iMWd7ddtEmFNHzz/9ynXe0gfjxpKJTPa6NZx3bqX+WTdzoPWr1MXZcsk
	LGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=kkLeiJZrVg0urIL6UxFPW9T+AUynIdIZuTVU7QJGvPk=;
	b=eWHTd9Fql9kRvUUjFhWrDWXWMILb8QKDxD2uYhKGZ5hD+HmYVcirWm1cVp1lURgj0i
	wsK/89SDOcizhjOkBjVmOTVvflFcr8+N+g3d1i0peAJQqGX+pJ1RfBm0HwatNmK3HgOT
	xYyof71O+S1/6HZRCGoBbuxgSipwDScmSlmCp+qEd3lgoE7KjnV4rrzWZ80GYUZcl0Uu
	4m9ybetKNefhzlgA6odHe0RETLalD2iw8Fm7jwUEVE0ScSIzYAIVEmT0DDNePsndt4Vm
	vydPI8WaGjjItioW+QhR3EGsq8O1tYMDYW2eSQC+3I22co5jOihFgmCzQPRhWUBkfs9K
	teNw==
X-Gm-Message-State: AIkVDXKGs4whbpyQAlk5e0GoNbJMy86q2/6yqB91yb7wjw6UvzftRI7gxewoeyNWanduWw==
X-Received: by 10.84.129.111 with SMTP id 102mr51545623plb.103.1484576273693; 
	Mon, 16 Jan 2017 06:17:53 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	b83sm48288497pfe.12.2017.01.16.06.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:53 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-26-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 26/30] libgcrypt.inc: Handle packaging of .exe files
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Use a wildcard to handle packaging of .exe for the hmac/dumpexp
packages. Also add the packaging of mpicalc* to the -dev package.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 1677a908d1..963338770a 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -46,8 +46,8 @@ do_install_append() {
 
 PACKAGES =+ "dumpsexp-dev"
 
-FILES_${PN}-dev += "${bindir}/hmac256"
-FILES_dumpsexp-dev += "${bindir}/dumpsexp"
+FILES_${PN}-dev += "${bindir}/hmac256* ${bindir}/mpicalc*"
+FILES_dumpsexp-dev += "${bindir}/dumpsexp*"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
2.11.0


