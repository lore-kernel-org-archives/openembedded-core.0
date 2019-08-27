Return-Path: <tim.blechmann@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4D36B8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 10:29:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id f22so30675368edt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UoXEQL94AvNzS/rnwsR7byfBqUaINmrd6zWCKmaubRw=;
	b=V2vMcpNI8z6PMgexXIpNVXJzf35u4JmYPH5E+1Q3f6rzG5Fy3AYP5aq+QwaaAT9Hkv
	7xwFaUpfAHpo155tUsNELjtrYSksOccxeZqXxqOqWnBZwAt7loFh5bYSkAbw8vCbz4Fx
	jSzlxqEqFEnjfGeZCFaEIe05dmgjYqJ+6HhBhDCYZqSCXUj0a3mlxuGk0zXfDzchYYap
	JMVTkYI1/3kpOTDP1xsbIO8ppKG31Z20aaGik/ompaNoi+VvvMQWoZux1Z/YzYiiLLEw
	zIyLPaKaoymVxkEdnG9opPFss7KyZTSARCLsGueotOMpnNlqeXeW/PaOrtdUIgdlfZIy
	ikfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UoXEQL94AvNzS/rnwsR7byfBqUaINmrd6zWCKmaubRw=;
	b=s6omW3LFqAGLVABbl6YYNOzc/s6YIo+GWRXLM6tD+jPl/5kdogSMtX2w2MOpYZBKgp
	6OegJrgtGJ5D+RxtXNZhRfVCPLsNDUIsWAGupyA+muQW4K7JTmRsjwAeiYbXtNQToeIp
	Xo7GdDFBNwZNc1elaUAQgxcR8FT+ExTHrJDAZHfHQHPwun3sKdIE14Hicn9ROtfG0F1N
	HHAAeoEl/ZRVIjMDhpumVDlLHqPBnYkKvvjMa76o+pHx7AeQ0zhcNkoOxWf5AdUKtfTW
	MYPzvC1HzrgAHzD4pxYKZKXFbspp7NHYi1RJ5EaanZV3iji6thdYNpkZ68KvCWAb3r/B
	0WEw==
X-Gm-Message-State: APjAAAU74P+9AH7NU84Yjw8POOIX/2lYmwl2ITlPAwosczA7VSE3FauV
	50eSqLP34gDEH9M/ql7IGkCCcy+H
X-Google-Smtp-Source: APXvYqwsNCTn1L3Jg7m/uul6U97a5sSuOJ8iCaFYQ2MOSoMWqrpuGpdBibLTiO700+1RdVkyGF49mg==
X-Received: by 2002:a17:906:4f1a:: with SMTP id
	t26mr20696135eju.174.1566901754290; 
	Tue, 27 Aug 2019 03:29:14 -0700 (PDT)
Received: from localhost.localdomain ([115.132.198.120])
	by smtp.gmail.com with ESMTPSA id 59sm1894678edg.44.2019.08.27.03.29.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Aug 2019 03:29:13 -0700 (PDT)
From: Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 18:28:52 +0800
Message-Id: <20190827102852.97997-1-tim@klingt.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Tim Blechmann <tim@klingt.org>
Subject: [PATCH] icecc: blacklist systemtap
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
X-List-Received-Date: Tue, 27 Aug 2019 10:29:14 -0000
Content-Transfer-Encoding: 8bit

compiling systemtap with icecc causes the following build failure

> build/tmp/work/silvermont-64-poky-linux/systemtap/4.0-r0/recipe-sysroot/usr/include/python3.7m/modsupport.h:120:66: note: in definition of macro 'PyModule_AddIntMacro'
> HelperSDT/_HelperSDT.c:145:34: error: 'PyTrace_RETURN' undeclared (first use in this function); did you mean 'PyTrace_C_RETURN'?
---
 meta/classes/icecc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10434..1a4b4ab526 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -73,10 +73,13 @@ ICECC_ENV_DEBUG ??= ""
 #
 # libgcc-initial - fails with CPP sanity check error if host sysroot contains
 #                  cross gcc built for another target tune/variant
+# systemtap - _HelperSDT.c undefs macros and uses the identifiers in macros emitting
+#             inline assembly
 # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
 #                             prefix" error.
 ICECC_SYSTEM_PACKAGE_BL += "\
     libgcc-initial \
+    systemtap \
     target-sdk-provides-dummy \
     "
 
-- 
2.23.0


