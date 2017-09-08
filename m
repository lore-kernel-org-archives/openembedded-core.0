Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 17E4878258
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:11 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id v66so7027686pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wtcaaQh6G3QJwzArWfnX5APh4PlApJ6J83o5YonxDXQ=;
	b=l3lwLzyiN7s/z+IgAoOsrolq1eqYaTO1p9GLIC6GTY8uITFdiAxztN7Ht61eD+tPe8
	sLdurlr6dQow9tqAGBP3aHmo3i5O7M9xYYad8BjMgvQTzm4MEYui4rAuxmSP3s+Voyw3
	MeKU3zfDZLWkAq5tOlke0/O15twyF1Asc1wS3wKj1QBGKdkm1ATjLhVuBDoU5nOAcyEz
	2R7+OuI0gpID6lpyW3usY/tsMH0Qhs5W5OjnDAxWuFeG+9SCq1sGM9b1BPtN1RI++39f
	D1akvZRvczGsQtVDFfkkkHJ19l0YEEvhEg7P0B4igieBzP0M8YdXmMAAiMhuvwQ9JDTW
	nK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wtcaaQh6G3QJwzArWfnX5APh4PlApJ6J83o5YonxDXQ=;
	b=SkJgj2MqdzImFRQ4s5/kkM5tX4Cn41TemfbYKDlyLGPCHJCmFfQoFPEC0HopDZVAXL
	7Mq36OuS7ENU7cuyzEDZRc4z1Rz2iEjr2dvn4B7GpYQVdvJvfOsAX6RRmJ9vISrKWHzL
	WxFHW9A80yeA0P1+1ikT0Esm7BxY6ygNygHR2Fw/Pgue3/YiC9K5nSqrPobTByMqhz+E
	0AmSh1OYfVlwXEphbR3TQVfrbhVlus8Dl+1IfoOtQZWEuhUMpPkYkpArBRbFecggA7eA
	1XUoeqoI+LOn0tWQVjUzgMVCPsjkpHNsfQVtjac2mPu1uk0LVTAFZVNQGuxEb6VHVZMK
	sw6Q==
X-Gm-Message-State: AHPjjUhP1524MNTIdkj7Ibao7MZuxa5H42RLtUjc1IL2PuCXpwqEPwny
	VCZ2OHmQ/VWGV6ML
X-Google-Smtp-Source: ADKCNb6uQw4KLW1136FUM3YXzOAoh5xMaqy+PKfHyoE/oIWNpVfcazHaDn5RZIM4EN87q6S/1EX4qw==
X-Received: by 10.98.62.80 with SMTP id l77mr4727781pfa.267.1504912933080;
	Fri, 08 Sep 2017 16:22:13 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:39 -0700
Message-Id: <1504912911-23120-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 03/15] base-passwd: fix SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:12 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/b/base-passwd/base-passwd_3.5.29.tar.gz, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
(cherry picked from commit 9ac88e3a9ac36ed83f01ac21db57a3c01a24385e)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 59bd413..ace94a6 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.gz \
            file://add_shutdown.patch \
            file://nobash.patch \
            file://noshadow.patch \
-- 
1.9.1


