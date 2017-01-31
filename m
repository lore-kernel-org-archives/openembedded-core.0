Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 101D06011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:43 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id d9so28246471itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eFX5dh4RolfIKViN3sgAe7U59HyCv8xqPeqOazvJdaM=;
	b=ccPsviXAl28sNe5AXAKFg19LZoFycquvLt6Rx5/+VrcVH4vm2PiooIZUsxle7rxBce
	ekE67+J3vJungNky2PCHyn6LOgnYhRUG/L4lVPpTzcpo5rYjyVdslfz7+ermJjBLEuIy
	yIDtzvxOjslgYXRQoo1FKZCew5uqdNZ5vXySBKfXuEfovb4rS+4x5tMvnX8TB3On9NxY
	BRfXa2kzGIbSeXgklpUGQcDGdfehQC0w5/tG3U9pSc9te6ruU67CMTYl3+yviFmW4TzK
	/z2o6ZeCXMXtNoaMlOpxD3X6CW16OWlIgt4ZULo8kFySpEFNh5ggmV5JxQhw/3Or8Gnc
	RBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eFX5dh4RolfIKViN3sgAe7U59HyCv8xqPeqOazvJdaM=;
	b=fcynCcWDaWWpZJu38FAyi4B0M2x/ioC8sJNWJMNy3NyY73I3TlRtuREm05VheUAetA
	3o4jMAM+1lfqUw49iDVNveKMF1FJxeBXY4WjFMDnJuDxLO/ievHDiaRxO6Ej/wAHmDdi
	TflMzqdVmRKlhro6GcUrzBwRsQkFaPcNNUeqbWkrJ6yDbOIIq4CSRteTEITbaZ56aVex
	E9vwAs/3CXOtcISgEXOSY/lwy5BPL/v2fixOFO3UoVNEyOLcWJ1auXdgm3/Tr9GvEccq
	qjtfzgOJIU2gXYDfzl8lG4zdY3cq10EV9hqX/7W/WtWYeCUwBfQgqd6tmNrCIp7Q7d4t
	gL/g==
X-Gm-Message-State: AIkVDXKYWKMyIpgkQHWxhWpijsIrJ3CHgQvM2FjMQuYdSFkkm3Yx/y6Jl7uDo/WQTAlbEAIG
X-Received: by 10.36.111.82 with SMTP id x79mr19390325itb.1.1485867044064;
	Tue, 31 Jan 2017 04:50:44 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:43 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:26 +0100
Message-Id: <2a54003858df4d868e6fb50819fac25c9065bea9.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/8] verify-bashisms: fix typo
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:44 -0000

Variable was renamed, it's now called "output".

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index a8f761d..1bda60c 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -41,7 +41,7 @@ def process(recipe, function, script):
 
         # Replace the temporary filename with the function and split it
         output = e.output.replace(fn.name, function).splitlines()
-        if len(results) % 2 != 0:
+        if len(output) % 2 != 0:
             print("Unexpected output from checkbashism: %s" % str(output))
             return
 
-- 
git-series 0.9.1

