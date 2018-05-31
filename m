Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6D47601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 07:01:50 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id d24-v6so8110378lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=0WmBzn2s8wpiOftM5FipepQXYh/RJ0LClKlRvCNymzM=;
	b=YJOxNRgM6ta8eT0Qt07y+t3G+lQ/sAoLY2V8RQjXiMnXmURbHqjz2FuoS5MBXmS+Up
	7cBC4KgEy9eQNT3m2Tf9tWHEax8ZGPS3xHCtv3nMwAO5u71ZNv5OAQR9yYHuq5sCo74C
	HmcUJP7lhzj6sv+2CHvTZoRRoqxwhsW+7/9AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0WmBzn2s8wpiOftM5FipepQXYh/RJ0LClKlRvCNymzM=;
	b=T0ySRDaUVGdlKNNI8dL2cMRQF93a/AM/iRlEa9sVrh+JKc9bI/WpPg5DQOOqXaccwn
	53zieRyxaFU8y8CsSjXZ2uM3OW0SB2aenjl1HycO3+jZmWQOJMlBUl09wQic2mHeoX5n
	k2Q7Ega5R7pNeTe1E6b/rvcqPYvDG2SHqK3qUIoUeZMkh526Ro7hg0eyB5G7Y6CtHD5E
	bYdWH+jiXlQ7hBgsQz/PW2tXdetdVDsrKgUZeg4Ioe7ZwMuOfQ3VFQnO63Ix3zEKg3F3
	4Wfuax0NcjldDjGAQkOtNp5Ujs637TSXb0JfaW6b59wuD6rAj4Iaai+2HW70vfO92qgN
	ue4A==
X-Gm-Message-State: ALKqPwcEvnvPmE78ksdXQRp9cFzOGvU0gvifTuTkwp8pQzE6lULJqIXz
	ZulL2Nmv1CktToBPjcPyyLwnE4PsuJA=
X-Google-Smtp-Source: ADUXVKLIV3QvgVFFWEPxY5W/WkQJsqM16Vdd2Jjyz5s16wwdSCcjscKgU9AOUCfLZdhg4K0sExYeDA==
X-Received: by 2002:a19:e497:: with SMTP id
	x23-v6mr3434023lfi.40.1527750110766; 
	Thu, 31 May 2018 00:01:50 -0700 (PDT)
Received: from localhost.localdomain (91-156-68-100.elisa-laajakaista.fi.
	[91.156.68.100]) by smtp.gmail.com with ESMTPSA id
	g24-v6sm7490505ljk.7.2018.05.31.00.01.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 00:01:50 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 10:01:40 +0300
Message-Id: <20180531070140.3847-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ltp: build open posix test suite
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
X-List-Received-Date: Thu, 31 May 2018 07:01:50 -0000

We ship the open posix test suite already but it isn't compiled.
Let's build it and make it ready to use on the device.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20180118.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 8992f1b0f2..b3e2f533cb 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -59,7 +59,7 @@ export exec_prefix = "/opt/ltp"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
+EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite --with-open-posix-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
-- 
2.17.1


