Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id BBFEB7842E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:25 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f4so4135934ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8oml2Yquw8TLbnArn/gtfx7gPWywWabSa5e6ubl1hVw=;
	b=joZA4UkegoUqVLrGHVrkuYTnStq/63+I/19KgL38IVdYBct9uWLqyIYJ8sW+DMxr+b
	Ifu55Aw8psySso6+jshBB/XvxeeIoORHJ4+HGkGepxuG3XdERPVrXAeG5KYrwiymahC7
	x+UyTs4qDOTixFMYFELfg15tjZcpGWaOnJrzSmwfXIY2tc5GjCeci/fR8q1dJLF7fUMr
	gWIWdYUQqaClMmvQjzPGYIKInQYkekINJRt8A0JFv7L1G0BMD4SGxE/G5R2Bcn3QDa5Y
	mdwrns8CW2DdDz4I6nuoyI5LG8xu9lU+FRX7bmWYGgM1pPHxJILepZElj/I0uXz8vK6r
	7/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8oml2Yquw8TLbnArn/gtfx7gPWywWabSa5e6ubl1hVw=;
	b=qTU3gHJETAG+S8ohtWDG2u94AB0A8pw06ldizLOCcbkpVTo4G9SNKuLz8SWWyHvhZ6
	tAfKgFDWO0W3W0Z2bFswjzpP/qXX5WMon0zCJS8HQE2iYHzOmOYOwQA9L+FsH45S81Xo
	7H/kD1d2OUJlrpJm7EuA8tNG+md5Lf5zmV3aWWAg+O3UZNyCSEmBfEG9KPW1NiPY/jJF
	zygNdEnql/6w3tn9yVPeEfYyyFx+rs25oBUPflMWdGknEiO45h3x9Pc6UHmPXaAbAVhI
	QR1UDduucEn2UKOJPX3gVgVMcRmFqqooPqK7wI+BqmNehFQdO/H6XcSljYF83prgJ7r9
	3dhw==
X-Gm-Message-State: APf1xPDbRcLSvr2JUnBVyDMNzHDjpIhQO7lb9sN/HzxpDOzEkGEJ6L80
	yekMALpUhtc4PoB34X+TqDFlegw3
X-Google-Smtp-Source: AH8x227WgcOnmr54xxqDqz9QDP9w5Fy6qyUdrM35z8HSwFGnPyokaY3oBtSJULM2vUStSFW2tbRhyw==
X-Received: by 10.107.40.143 with SMTP id o137mr4866489ioo.72.1517954606940;
	Tue, 06 Feb 2018 14:03:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:33 -0600
Message-Id: <12612cd620e11dc64b77f1e400e9404934cbf3d7.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 14/14] icecc.bbclass: Add IceCream support to SDK
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:25 -0000

If icecc is inherited, generated SDKs will automatically have optional
support for compiling using the IceCream distributed compiler

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 9d5eaed57ce..8492ece60c3 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -346,3 +346,10 @@ do_compile_kernelmodules_prepend() {
 do_install_prepend() {
     set_icecc_env
 }
+
+# IceCream is not (currently) supported in the extensible SDK
+ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
+ICECC_SDK_HOST_TASK_task-populate-sdk-ext = ""
+
+# Add the toolchain scripts to the SDK
+TOOLCHAIN_HOST_TASK_append = " ${ICECC_SDK_HOST_TASK}"
-- 
2.14.3


