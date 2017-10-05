Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB425719A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:23:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so9987270wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j9ZyERVtzq+6Oxc5zZmgDHzuLUWsA7IB1qij+RwMcbk=;
	b=SUGswi0fsUHbRZLuwaPIIUX7gf3PloD99k2jvTbE4kBA2pkYFfJ2A+wAmy8vsyzNiD
	254MQNKykHmXylIgAJCEhPmq9YlCUfgRmilKJKhFwlBhZSxa4KBVcOFl60+MJhyIGjxW
	qwOEMQh24gyO1VN2godLZv6Gwq8jVNQqwiaRoUID3ALf5UHgG4KririARTjzNKXvcrVD
	ueCuzgDoR3sDKlAKAAcJIgpO6NXY09JBO2Q/tSsVjiCfjbZNtsuZZ1bsJ+FcOj1an68D
	Gd1X8hjNPOuhp6fYQekGwOXydGTR73TltBkIPO/cBp+U6ZjQARUrqn1CNFLFrSs96usd
	RCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j9ZyERVtzq+6Oxc5zZmgDHzuLUWsA7IB1qij+RwMcbk=;
	b=XkoGRj73SojBu4fMPw/ORtMDJfnM6DUUqv66vTCBoYSzJoqR1TMSa6BkbAN5/mQ5ZM
	mLi0aYU1a69w+WROiwEvgyHMZIdcjkszTQ5mNnbSQ39QdOfnLhREKJsm9asKf/BwD2Gf
	P8MQIwkyK6nLF1OuAeJaP0XDKrVTvhncsZaqbVeHWHsQiRq35NUKPvHN3u1AFqc2518I
	zE9uIQUXIti65L6cD5SZVkqUWbzA/49+ai3lSBBTXEQwpHPP1QUpcCFv/4ThcVJ2dqUI
	YASq8sOiZfnKo4Reg6F3MM5TSphbNByzGrC2rpaT0EczrymG/DL2OwKtHzNSKkxatvmU
	pN7A==
X-Gm-Message-State: AMCzsaUb4/3BkHxLYALbeK1IhUxoUzKWtuMJiBO3avn8LKWCjiZcqeke
	iwJfTkwg2+QJ/Au8C+7RpXwCNw==
X-Google-Smtp-Source: AOwi7QBiYCz1bhcl0yF4k4L4QE9naUdbKbCdg34quqXl0cK16kpaREaX3daEu9Y/4I2E2ayxlIihJg==
X-Received: by 10.80.166.133 with SMTP id e5mr5598584edc.51.1507213404578;
	Thu, 05 Oct 2017 07:23:24 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.10]) by smtp.gmail.com with ESMTPSA id
	w20sm14265503edl.2.2017.10.05.07.23.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 07:23:23 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 16:23:02 +0200
Message-Id: <1507213382-23230-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] argp-standalone: drop RDEPENDS dev/staticdev packages on main package
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
X-List-Received-Date: Thu, 05 Oct 2017 14:23:24 -0000

From: Ming Liu <liu.ming50@gmail.com>

This ensures argp-standalone-staticdev package could be installed
correctly(without depending on the empty argp-standalone package) if
it's being required during SDK population.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index bd0cfdf..21bbcab 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -19,6 +19,9 @@ inherit autotools
 
 CFLAGS += "-fPIC -U__OPTIMIZE__"
 
+RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-staticdev = ""
+
 do_install() {
 	install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
 	install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
-- 
2.7.4


