Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 05A0C7FA49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 01:32:47 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id ca19so2020506pjb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 17:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=12ROJhNaBQpbzrW+IRC8JZZgJ9a+G6xVyfRO9fqloPg=;
	b=leETkbzWJJmqSRk7H2fCob7BvdfJxiZC06DiPPc6J112L4/NyxyZprR1Uuam4oei4q
	Pqyy/DsezCl0EuUP9S9e46/e7f1+UMcFQOyOLUD+cf0HlULB2bbVpS39v+1+McEFsq1O
	zaCyE+xFJnEfhvEARHb1w6LaAUznMU0b8VBUaEthPeCj4VQ78lCcuerUpppfrcHVEAnC
	prEtgBV4wNhrKDc8ohLEWJU2iiW2QPGtsaXHPnmXDundqTNvo0wwDi1BMVKXtpnUv2Yd
	LqOGJBn6QidRvcBgfjLsU8MUpc3wYM7d5QpCScqRClleSZ4pdATM2TN1BM8bRGflhy/x
	FqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=12ROJhNaBQpbzrW+IRC8JZZgJ9a+G6xVyfRO9fqloPg=;
	b=dbWehB3N9MakwrI+Qudq5tXGRsNjLHAb1DouHHvKljSFHJr9itSyraC0jF+rBODe3F
	mM/z3G8kB5l4vu06qsTbTxeeaBfNEp/TSDCoeTN42yXi0qoWLRwc9GOulbUEO+7u3PTI
	r2dJ4akCbzvvOiMfDRYw500qyhgZckoQy4XQ5D7q72Wl1AK+8h0Zzj4WJPu8xakjomaM
	mK/bq9teN9zYS6K+w5NzEr7QREQEhZ7RxJhwTYfMg00yQU8SpCe78qmHOPclyknMD8uO
	MO1Emm0x372psAC0vtcA05ate8s6lGTg4dp6GkS8ud2MV9Cg3/xUA2SQotas/Srk3+J9
	L/Tw==
X-Gm-Message-State: APjAAAUodr0dIUSJnlvwmS9DGeu2qr7E5Dza5Y8Enbmp5QB30iT69rlh
	1dmMZIWAhnV+7cgVtZm4yfaVEYQQ5po=
X-Google-Smtp-Source: APXvYqx7VntxotEkcHHkzOEyDh8WSbcLKJfBx8EadEcXu3lzsXvHEZr59O2HS9v2CwWAouhCx2xufQ==
X-Received: by 2002:a17:902:409:: with SMTP id
	9mr12042767ple.306.1575595968457; 
	Thu, 05 Dec 2019 17:32:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id o8sm936360pjo.7.2019.12.05.17.32.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 17:32:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 17:32:37 -0800
Message-Id: <20191206013237.3105393-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191206013237.3105393-1-raj.khem@gmail.com>
References: <20191206013237.3105393-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] flac: Enable VSX when vsx is in tune features
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
X-List-Received-Date: Fri, 06 Dec 2019 01:32:48 -0000
Content-Transfer-Encoding: 8bit

This ensures that, support is not enabled for machines which do not
support VSX

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/flac/flac_1.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index fea2be1f6b..cb6692aedf 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -33,6 +33,7 @@ EXTRA_OECONF = "--disable-oggtest \
                 "
 
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
+EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "vsx", " --enable-vsx", " --disable-vsx", d)}"
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "core2", " --enable-sse", "", d)}"
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "corei7", " --enable-sse", "", d)}"
 
-- 
2.24.0


