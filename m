Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0097F304
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 23:16:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id v4so3477135pff.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 16:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RAHPIQPBaAjOPMfFxcvTnF7oSQMawo+M3Bfn9vKaN60=;
	b=HYZ7zam/yc5y3N7uwrV/TU3ZtcnvYKbicT2Vtr0bsnZkXzITCcfxBZkwYWsaHyrw/9
	X1qrK4vojYCM26TDrUsn9Xf761G07RSUTzAPIOeCKOfcnuWSgPdBEYqdYrm6gqYEDiGQ
	xw7yyohs8DsaGYcy+YNDsYk8f4ntKwhZjCdc/E2NKc0TboQ+h8o6lKt+P0Us2nwGY6l8
	dPWd7wX+8KwhA+LxnqYtDHPwTCMxiLZ/3AkZjVbJqQV9wqpV4NA2oI4xN6dJ4Plv+jft
	8GzqmN8SZs5SZJvcBsA27Kp5yVKMh7fpxCmFqiDExzBt+B+IhvhwNTuxXyBazH2IyECe
	DpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RAHPIQPBaAjOPMfFxcvTnF7oSQMawo+M3Bfn9vKaN60=;
	b=m84IcR7V9Zn/o7xpTcm1vCIFiDYWMBDcp54t5P1qExZg0fvrRPSXi5LCwYI8BSbnKf
	RPMY+d35/aBgf32UPwWugO2CP7nfAOCWg2jCPpU7iRxcrzh7EUNThZHWHmXvqmLu0PtI
	W3Tk9DkutRoJWOzziZVtMTPjdre/spMUNETAjG9Yeyz+esxb9481hpKSE+CIcXmX6rno
	eyz/KH8cvTGOYMBIWed+dsVpJBcFPhQq1XBBfWl6GTzmDXXG/PzbPRg+dq1PrZKtduw5
	zLzpmVxBRtoHEzWqJrnl8pjCBDo4+iDWFD6P5gbKxq0lPwAH8ANA3o+4VAEbuRK7TLxU
	dH3Q==
X-Gm-Message-State: APjAAAUHxgFhDxlpfPuvQ3SGksqLoobUVpEmOSsRcEyxpLUNoViirDFR
	zNiKCbzf4WchsxEwiCm0Z4KjCj43Db0=
X-Google-Smtp-Source: APXvYqwla8WcUTNaLQ9xBfbmXZ5XCfEAhgF7V92sRCTaPmivmMq4D9zz00+d0RFb8D3vMccAltOOJw==
X-Received: by 2002:a62:168e:: with SMTP id 136mr13128785pfw.144.1569712595732;
	Sat, 28 Sep 2019 16:16:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id 31sm9690507pgr.55.2019.09.28.16.16.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 16:16:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Sep 2019 16:16:16 -0700
Message-Id: <20190928231617.3553801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] core-image-sato-sdk-ptest: Remove valgrind ptests for riscv
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
X-List-Received-Date: Sat, 28 Sep 2019 23:16:35 -0000
Content-Transfer-Encoding: 8bit

valgrind is not yet ported to riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index ff297fe324..13c813a4d6 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -10,6 +10,8 @@ PROVIDES += "core-image-sato-ptest"
 # Also include ptests which may not otherwise be included in a sato image
 IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
 
+PTESTS_SLOW_remove_riscv64 = "valgrind-ptest"
+
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
 # box) and explicitly add just 1100MB.
-- 
2.23.0


