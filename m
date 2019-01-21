Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C081579F1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 23:01:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q1so10768991pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w95xp7tZPxtmvmr8WZLp5ROcQ265LgCCh3ExViIjApc=;
	b=FKj+9faS0+9HyABHHbAjFQZg2jmaaey0d0wVbktxWYLsWXcEkvnsNcKIgWyteSUcV0
	7TRF93+iKXXNR4+JUUSbU+Qk9J+QFWKg1jV2dLiXbZXLxGSG+g3efTE+d+y9ygKRF+4A
	ggryZcaiM5pNOpncYKZU+09bzrE68A7EGHdbguP1Uj9W6pQIpJNxi//YAWC+v9XIjAyx
	Y1rP4+2n85HQwMlBywRy5xP88wMwX4E4yfJvaAhPGEq1x0T2/Z7C++HT6EkgA2beSKOj
	Qw0DbDsHt4X/is6RvHvGtq8hbaIZmSrh8GDKuoMr68qMTMpaapfhwKUkwSV9XGtzx2So
	nkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w95xp7tZPxtmvmr8WZLp5ROcQ265LgCCh3ExViIjApc=;
	b=qPt+Y7LhgEfyPSoMf8+KPaoqlxBcX5vRZ6M+7gRUesEcSHwCq3XAVh0xTwb8ykFNPs
	OZRTPo1k06uiiNy9F8amU0VHSwfz0xAmv6TXhnIw3RGbRFYO46k5EWzkzwZ6kAendh61
	/b3j75Q+0RdqAbjCGroDSmXG4wJH7vWtDOOHY62gX4x1iLdodsPS+V1824wR9Y+tCR1j
	fZeSstVZj7u61Ceo2I3LeN0ZhuM3qZnKJFEZC0qAWqbV5oaB1LyskUEZglYmPksvXiFg
	EDJ33gIjQnOskFhAn6mZgn7KA26CMT2kikwB9rwCCE7EWEFYsh5ELHPbg7Qpimhvh5On
	BDWg==
X-Gm-Message-State: AJcUukcGTQR68iCbtinTWYv7WAYSeOYvbri9Yl2W+z57q2EmZsiDkI0N
	lH5KeYnifVB7nP9PPp6Za2UkP/3QhME=
X-Google-Smtp-Source: ALg8bN4DwQVnjUjFJqCUYXIkCGmmRbFlOwb26m9Xb9oZrXWp4O4NQs04looeaj+1WRXqlJun2bo98w==
X-Received: by 2002:a65:63d3:: with SMTP id n19mr30061811pgv.179.1548111701412;
	Mon, 21 Jan 2019 15:01:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	v13sm16981728pff.20.2019.01.21.15.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 15:01:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 15:01:30 -0800
Message-Id: <20190121230130.15848-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] musl: Upgrade to 1.1.21 release
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
X-List-Received-Date: Mon, 21 Jan 2019 23:01:40 -0000
Content-Transfer-Encoding: 8bit

Delta of changes from previous Revision

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=de7dc1318f493184b20f7661bc12b1829b957b67..1691b23955590d1eb66a11158fdd91c86337e886

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index cba4d06766..73906d0f3c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "de7dc1318f493184b20f7661bc12b1829b957b67"
+SRCREV = "1691b23955590d1eb66a11158fdd91c86337e886"
 
-BASEVER = "1.1.20"
+BASEVER = "1.1.21"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.20.1


