Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCBE578817
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 22:30:26 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id e7so12884349ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 14:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WEqOHKUQEG5QtkzdcL7v9VEVu+KjwF5bodPmcmUOGvE=;
	b=QLvMzsmazf+WdgzU/GrqRgc34giCL6+muKsCtmV8wYW7+bEmfB4mNzTEvkFavlRKyO
	n60RH1nWVw8ZFtQSTsEYI92JBJG5v3in/f2C5rWL2sJvs+Gd5UWDKKwcRoB/Ub75nBOU
	JDH0lgrjWA6cZH7R5Wl1T0y3WZfttc97R2ncdWmHrSWCBBp6VSXiFDD3+JsACPcYuXcL
	KKouLUa8RkVKNf/hC1sKnajtwtOkusTFrbDIybrDB1SbWMNoQMsFBbzBDLboZYR8Qj/G
	+F8yeO6cnoeFW/9+vT1OuwR5DDv5cGL+g1vwoYNsCVbH2L8i8TOSGMS9dq5wEUe13knY
	toUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WEqOHKUQEG5QtkzdcL7v9VEVu+KjwF5bodPmcmUOGvE=;
	b=Iq0mLltx3m/SGmRJtF5Lvsw8IsTDFQhkWxIAt2GBysJaWH0MdGz8aLywzQustxk1Vy
	UxduWyD+BeLPT8G6/8KaTn9NNKafaTawF8st7ElnJwY5ArS55HAg1JRtA3zBVP3v8jWc
	3ESNHpVdZIkaa9OM06HNOT8MbxNLDot+9Nu67c99RvSdbVX1XlObfC14tQcaRU425D+n
	UUMrYVrfTZ7YYP42Ngxl6yXq9Ln7z3210Fv/ZZFLWGjuOM0JGiMKHzPt/eNG0DdIHlMG
	TbbWHJoT+0GeTGMeGVDFw0Z69yszq9yQob/qwPg0pB0f2Qktni0H0km+/AEfsrQx4tkp
	I5LQ==
X-Gm-Message-State: APf1xPBD5KxgIwAmc4EqytMR6toiQZlraotsgrYBBZJwFzG5EwwbSBNk
	XkZ6vC1zLPDfClY46YICjf/JoNal
X-Google-Smtp-Source: AH8x225PYQVoz5DpMcxhxjV3h18bXlgaVQ8nH1QVmk4/xOhDGmXaX9oWWNN1S9uMWtFDNdTv4Ia71A==
X-Received: by 10.107.88.19 with SMTP id m19mr22352416iob.113.1519079428079;
	Mon, 19 Feb 2018 14:30:28 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	87sm4464230ioq.36.2018.02.19.14.30.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Feb 2018 14:30:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 16:30:22 -0600
Message-Id: <20180219223022.17833-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180219223022.17833-1-JPEWhacker@gmail.com>
References: <20180219223022.17833-1-JPEWhacker@gmail.com>
Subject: [PATCH 3/3] icecc.bbclass: Remove icecream from uninative
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
X-List-Received-Date: Mon, 19 Feb 2018 22:30:27 -0000

The icecream native tools should not be included in uninative tarballs
even though it is nativesdk

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index bfab61dfa36..48a51310c21 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -403,5 +403,8 @@ do_install_prepend() {
 ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
 ICECC_SDK_HOST_TASK_task-populate-sdk-ext = ""
 
+# Don't include IceCream in uninative tarball
+ICECC_SDK_HOST_TASK_pn-uninative-tarball = ""
+
 # Add the toolchain scripts to the SDK
 TOOLCHAIN_HOST_TASK_append = " ${ICECC_SDK_HOST_TASK}"
-- 
2.14.3


