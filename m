Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86BC06B06C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:07:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b19so3321920wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 01:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IXaZeYp12jC3FrH4FWBzedadz+IDKeq5lKJmiTEBo+U=;
	b=B8d6I31LRfgWGxck8EwmihDLj/pL3KknzO64f33AYsB4bTbZU6BBHMtD6yYZhnbq1W
	BaNiBKLn7vg6ixlAclJIbYke2a7Tfzs9x33RLUJj5wnBknLV1ctE44mKtlBSuADXCDZz
	y5zMrOjTv/ekXnAvHn0djjhG0JfVWzw/Rsfjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IXaZeYp12jC3FrH4FWBzedadz+IDKeq5lKJmiTEBo+U=;
	b=H2M6SGX6jVLiWFpEOUoXkjlRN1H5YLP3fI/d+voB9M0iqyFSgR3C19Ak45oPhY7pwK
	fKludyElJI9OKrN/zG7TK6fSWi1a2Y9zgLoosj0aX3BDIpKokqKuleZKtDUEKGg4QCVS
	Ac53GBeedaZWILlHaw2UPCreT58SKw8LeDPZjck7JFfne24J7z1vUwwpBxVKiXmHYaX6
	ikTYzNPOXhvhjE7jZ2cerQQPi36VodmMLxtmQdtCGX8SVanwe09hBsqIQnbPdZ/86qZR
	dPhLzKGonP57nisUtEC+fXUnS4VDdr7DmPAP2+RNh2a9gUPgOe906MW1kaYH7mCgRwf5
	xGNQ==
X-Gm-Message-State: APjAAAVvlWPf8G4hEPT0LntbRGuFpIkognoUnF6Ipt8ypIKoT7TybPF9
	4fCkztRkZ/y0uXG/byVZ6ClGcaqrL5A=
X-Google-Smtp-Source: APXvYqwcBFcGEwwx1gmGj+xileMwPAOQKg/VFKjNDwhDXThOZ7a2TQmBktLk2LsrgUpfkFcM8qnNxQ==
X-Received: by 2002:a05:600c:507:: with SMTP id
	i7mr25276567wmc.135.1576400834029; 
	Sun, 15 Dec 2019 01:07:14 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u8sm16684434wmm.15.2019.12.15.01.07.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 01:07:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 09:07:11 +0000
Message-Id: <20191215090711.25182-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191215090711.25182-1-richard.purdie@linuxfoundation.org>
References: <20191215090711.25182-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] scripts/oe-build-perf-test: Use python3 from the environment
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
X-List-Received-Date: Sun, 15 Dec 2019 09:07:13 -0000
Content-Transfer-Encoding: 8bit

On test machines we have python3 available at alternative locations. Use
these rather from the evnrionment rather than a hardcoded path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-test | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 0b13f24888a..00e00b4ce93 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Build performance test script
 #
-- 
2.20.1


