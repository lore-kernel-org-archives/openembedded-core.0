Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 58DDA7F511
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 12:37:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l3so2969122wru.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=o/JymHSja4o5mwbXay9zSL3mTnwM7c0NW69jGXXdwjE=;
	b=n4O72guDlHSOCvtalaNdZMuT76lQr8XGo2piOykgJUUTcOMhFLYGzKig346jrJt1XA
	WRLTSDoeSWdWlbXp9wWLaXt+M/3bPKbNOAN7m6x7pR3aYHsaRy132ta/Tkhozwqr0UZi
	iRF1sCWcybOkiuwYiyMyY59p4II4Jho85zvsySuATs/VNeMREViDBa6ZSAKBCoBPnIwD
	3uOdhoROVxB3FF2m3LBasqAPDQ84cYNCT5iDFNpeds9VPTUOyG5/PYwlxMCDYIW1M8zW
	fk9BKpWl6lvmoejx/qUOO2gGkykxFYay0VvtJamavw+hOcp5EUfBDy5ffXe6XJwktbXg
	mlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o/JymHSja4o5mwbXay9zSL3mTnwM7c0NW69jGXXdwjE=;
	b=NpezZA2w1D7sluo3WcopyG4VdesS36sY0zXTtrakzIhEogRV37cJn/pzdf772JmxqO
	ZmZv6boL4zJIvbdyn9etIly/OVhctbxcB/NxL+ZLlheLdnIIU4xMgLEUcKktIuja/4tV
	z+yFjTWvT06SzYWoshPEWYpAHDTLLJ1k0WTdh2VcQZSxf6fty2VCbmpe1T0NMBh04KmQ
	nvG0+A2g2cPLgZOe3XADPmCVZIqB3cITkM+HMN+/JKFVvzG8HT7ehEEtbLryDWe4Y41L
	wBooc2JiKh50CK4O4OeRMdZPkDnS882Uwk3a2kuWewKDmvQG6/NuZpSi7Xnt0yEQbfgV
	CDfw==
X-Gm-Message-State: APjAAAXHBOxCwBm7mzH9JKX+jAD5yH+VwIJvsv/oiKxv7qOW11RwMJmq
	BgNRJ0DyUixcOdXwO62Jz5ek2jwyrjc=
X-Google-Smtp-Source: APXvYqx9XvRaoPHw3RjwvdiEP6KfcH6rTbSYK0X53/NeC1iVbOKhpIMoPkFBVAjDH6UQGvY7FpQdQA==
X-Received: by 2002:adf:f081:: with SMTP id n1mr2801814wro.273.1568723823792; 
	Tue, 17 Sep 2019 05:37:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l13sm2412994wmj.25.2019.09.17.05.37.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 05:37:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 13:36:54 +0100
Message-Id: <20190917123655.30315-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917123655.30315-1-ross.burton@intel.com>
References: <20190917123655.30315-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] distcc: use --enable-tcp-insecure instead of --make-me-a-botnet
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
X-List-Received-Date: Tue, 17 Sep 2019 12:37:03 -0000
Content-Transfer-Encoding: 8bit

--make-me-a-botnet is worrying, --enable-tcp-insecure is clearer and doesn't
  scare people glancing at 'ps'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/files/default | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/files/default b/meta/recipes-devtools/distcc/files/default
index e5ca68b8561..a5bc13ecf33 100644
--- a/meta/recipes-devtools/distcc/files/default
+++ b/meta/recipes-devtools/distcc/files/default
@@ -21,4 +21,4 @@ ALLOWEDNETS="127.0.0.1"
 #
 # OPTIONS is used for the systemd service file
 #
-OPTIONS="--allow 127.0.0.1 --make-me-a-botnet"
+OPTIONS="--allow 127.0.0.1 --enable-tcp-insecure"
-- 
2.20.1


