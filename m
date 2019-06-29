Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEE90605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 16:29:36 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b11so5993761lfa.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ND3YXP0XASPsMd7MXVdJGKRyY1T7sqdbnf1H9bwoRd4=;
	b=uLRptOUY/zYwHfHe1R0H+2qbv4ro4z9rE1VRtKG8OxEdbTMPcpzII+zC4tFDKQggTV
	zX8oXZh53MRBJq7KYzleDynMqtbz8Wov98j63E32T3wIuFfsXDQLeddmTjFGNQK7sDRI
	+F4wnJp5dO5QENRgtTWfsHiZ5rsO0gDzF0BAd/bMHuKVD0rkO7oFcoeg6GgMLgGOEVct
	3U26srI/do2SUJtjgYozD/qA5naSLesZPyd7tFl9UoyD+dQe2guf7x38DlI1IuJRRyNo
	iO0HzKnWsSA3HRB/u6BNk9IxSpeXv8BC1lRDx0Yce4TtWia3QXwAbP2aXLeU2e7C94JZ
	7IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ND3YXP0XASPsMd7MXVdJGKRyY1T7sqdbnf1H9bwoRd4=;
	b=RTtAlRsxebgi05FxAZb0aWsdNqzZ8pujhBbMlbe68WtVT8s6kOyH5CTTCn7X0G7uI3
	LHGRn4slA2goqYl5MvmPmQTpjA6ybDNowUzDlI9k8mOMs2ZuAzjQb7vyTEDp9ilhsjxD
	Z4KxfrGLb44hHyeVesbMdqDhSyF8aHvSCfvF3GA9llTMCGcNgcOJPvVbSXMSzx1HcBW0
	quTPRjyU8MzUyhhSltkQQup5wJRQ035DNVWSZbKEhgWUC0q06+sAES+4cFp5clpK0ACR
	dIXDXhreVY1i1xQLXzAn6+VecHTQq+GS6F3xB9+MHWfAgmc/xnubXjBo3+gaxEimiZ+4
	njsg==
X-Gm-Message-State: APjAAAVAaHIIA4XhOe0Xakse2+joP1W5f/MHWVWUcHPPtsA/6Rh6k3H3
	htsHTr3Pm9zDD+/wT2sv1Rk9RTTDvAE=
X-Google-Smtp-Source: APXvYqy97SzI8c9WagxXP9HQ3kt0i8UsRjgOZVfI9w9DaouoQDZx8z7MN8erS88YIyr6C1p1sDsSxw==
X-Received: by 2002:ac2:5212:: with SMTP id a18mr7700128lfl.50.1561825777040; 
	Sat, 29 Jun 2019 09:29:37 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	w28sm1801165ljd.12.2019.06.29.09.29.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 09:29:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 18:29:31 +0200
Message-Id: <20190629162931.31457-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] babeltrace: update to 1.5.7
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
X-List-Received-Date: Sat, 29 Jun 2019 16:29:37 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../lttng/{babeltrace_1.5.6.bb => babeltrace_1.5.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.6.bb => babeltrace_1.5.7.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
index f5c31c4463..05ef6d099c 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
-SRCREV = "4f10a4adabee5ca61c27ba399b3438505e0cd6de"
+SRCREV = "d4014aeef4b89a4aaab1af42d7b0d143d62da0ff"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


