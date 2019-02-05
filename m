Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59CD87C0F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:57:43 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u6so837830pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lhBJ7ig+WNPpEfpL+bcyWHDhX4YKARMAa2Ozmp2D2Cg=;
	b=A82DWIEp5ziGgmJsm2uX+/WJsx8v3aB/I2+mwJmk+nUI9gT5mHt0dJqiQbUfyNav7y
	INNYk8mi7JD+LsCqbwy7MKGv4NR5uKutw/fQ9TnHjCayMMppBuB0VRyc+pq6+7bktXEw
	pQL3iDx/u5WQd1dxW9hkqcA93iofEVY3ZNYAT+WXMtS9e45K1ZHZtZQAuaMWxgZgQTKc
	h8M16MKLb/xki00YkUQEoK9PV1Na0gkYNbh0OO9gQ9apd2IyTg0fyyH6pAnpVSPWcSrD
	XVMw5PR31vjcrg66EUyhNVDJQnpyLZKKiDAOGaCPyA+MjeYUJiiIVsxh5njwrDxNbJ+4
	QBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lhBJ7ig+WNPpEfpL+bcyWHDhX4YKARMAa2Ozmp2D2Cg=;
	b=JoHmTw3R7u6dL1BHlmCN3EiFg6o5UGqXqLykz5BUfRWrs8YFH8kpZq42SeG4X1fq0L
	v6TjksbnE2PObzPorQD9OIZZ4lkuzxVRLVNfFkWzw+1je8EvR4paXeMn8e4Z0RyBvPZ/
	EKSorHsIOpnwFByBGRxzBP724lt5ZWRR0khreLqBBQf/Gh4QtGfVhH6MF8K6CGxkMcy8
	hpUfNrhFmlUEACz9J63aPZHQMwWiJJzOs+lVNSW1Boz6dQfvGzAtkcInu5vLFIiKY1PW
	a8PKM3BzZjRmC3TiAyQxmlER4eWrkmvQWS1a0hew6gO/ExEostUBc9yh3PT6638X2vgS
	dWiQ==
X-Gm-Message-State: AHQUAuYtvJf7jyrdWXKmxS/YDQslpBBiW8Q8L0HQhORzEdjSH4qKMyu/
	ktFu4aRTenzHSjiKwN7ZK/oBlzJB
X-Google-Smtp-Source: AHgI3IbsNTplZTM9xkAPQly6SzDbWcW9sy5CiyavhZ6dSnfYrrOPSmFz19K4bIhGFo0oV8GazhsZhg==
X-Received: by 2002:a63:4c04:: with SMTP id z4mr2485030pga.312.1549335464027; 
	Mon, 04 Feb 2019 18:57:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id u87sm2453788pfi.2.2019.02.04.18.57.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:57:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 18:57:23 -0800
Message-Id: <20190205025727.1937-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] ThunderX: update the armv8a rules
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
X-List-Received-Date: Tue, 05 Feb 2019 02:57:43 -0000
Content-Transfer-Encoding: 8bit

From: ayaka <ayaka@soulik.info>

I am not familiar with the big endian, so I don't update it.
I don't have much information about the Cavium ThunderX,
it looks like it supports all the ARM instructions.

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-thunderx.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 3d43b0f7e5..92adf2df1f 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -1,11 +1,11 @@
-require conf/machine/include/arm/arch-armv8.inc
-
 DEFAULTTUNE ?= "thunderx"
 AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx ', '',d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
 
 ARMPKGARCH_tune-thunderx ?= "thunderx"
 ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
@@ -15,5 +15,5 @@ TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
 BASE_LIB_tune-thunderx = "lib64"
 BASE_LIB_tune-thunderx_be = "lib64"
 
-PACKAGE_EXTRA_ARCHS_tune-thunderx = "aarch64 thunderx"
+PACKAGE_EXTRA_ARCHS_tune-thunderx = "armv8a-crc-crypto thunderx"
 PACKAGE_EXTRA_ARCHS_tune-thunderx_be = "aarch64_be thunderx_be"
-- 
2.20.1


