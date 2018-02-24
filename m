Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id EEC9F78698
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 23:18:16 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id o145so14032323lff.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7nI2g3pERPNM69AFr907uQJ3En3M6WrOxWfurnEB+Nc=;
	b=NlycK8fhoRDc8WWtPe56SDtUs7qaPGXLm0o0Iz2CFG0M+8Cuc+Q8Z4SjIRVhppc7yG
	hkuVniqaY1lxncTU7AkU5mEY3cl410gqz8xlLHkiE/CzA8tji2Ul3vO2X+oJmokkWayA
	S53PfB+NARAMCI9hDUGdCXFfL7EaHIwZ5hMFUOs42aVZPmaZcMPNRdagOABUlQ7xNXYE
	4oBZ2AD98MqyjnU525/a7BQ4j1qmndckpTJL3Ssyzyo3zDbc7TAJSDxEJ037PG77iIDg
	9dPOPbyrEipB4ALqbDRuZBm0IlajYIm7lYeWKeanudwqkZFIpR4inTax1HgounpPBXmd
	rgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7nI2g3pERPNM69AFr907uQJ3En3M6WrOxWfurnEB+Nc=;
	b=n1roMaoHfx+mEPxRQybe3YxCYLySipHMzn1M/mnp1j2Gj3OChYC+DJsPWD8Hps9LTR
	L3ZmqBbnGysZsrHutFmwa1+ztoapHHiKcIOTsQnxSQmUa4MuITOXI9AxDo8kMltYMJ7D
	iP4xBmUsYzDCYDV97Etk7kK2JKnNClObaGWkio+MVSd2SJDcWauguWa8HrzY1MfhIBDP
	K7qi6XosnKMI7tBE+odYdxbQxXICyFxAESWhPJiccAbymrQUjNXtsKQUlbZ9nol45lW4
	jtowjsOgKVxo+JeLOpa+k7oGKBEzKdTMxm7VzKeLDd1xUPMfSXNnJhoXWn+7X4SFMx9S
	1U9Q==
X-Gm-Message-State: APf1xPBHssxhZgDrtSdg8T2fa0E71qJqKu0Ms08KhR7YUtY+WAAVs2fJ
	lr3h5XwFVaOkWjfTrzJV/a3Lv63L
X-Google-Smtp-Source: AG47ELuN99Bctn2I3SQSLZjsJw8LjSJMtA8K3AuOplXbZNQVZ65Kd1RrcleQ3Mv9PnqUWL/3YzuA0A==
X-Received: by 10.46.125.10 with SMTP id y10mr4559755ljc.23.1519514296672;
	Sat, 24 Feb 2018 15:18:16 -0800 (PST)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:f495:dd31:4406:dfb4])
	by smtp.gmail.com with ESMTPSA id
	r73sm1167766lja.87.2018.02.24.15.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Feb 2018 15:18:15 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2018 00:17:50 +0100
Message-Id: <20180224231750.5795-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.14.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libmpc: upgrade to 1.1.0
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
X-List-Received-Date: Sat, 24 Feb 2018 23:18:17 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.0.3.bb => libmpc_1.1.0.bb} (69%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
similarity index 69%
rename from meta/recipes-support/libmpc/libmpc_1.0.3.bb
rename to meta/recipes-support/libmpc/libmpc_1.1.0.bb
index d37de3831a..2d25d388f1 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.1.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "https://ftp.gnu.org/gnu/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
-SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
+SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
+SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
 
 UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
 
-- 
2.14.1


