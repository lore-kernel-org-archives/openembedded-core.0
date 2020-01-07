Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id A47CA7D2E5
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id s7so8574227pjc.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=I+1qSYJMCDifgsiZQk0QKWoyp7rtvaS2I9wDe1/BLGTUZ/W1zMtuCKrcsA/xfSwxHu
	yG8uIY+mWsYlEFmIP+HlYyWb78gpYGpnHKq1ndH5O9FQbeiW+cFmKJ4b4yjAMYkmm4H1
	f7VESC5C4Hv/EKRBvd3nEcC13d9gykoyZ1ZiSfK5k1HNeTk/AEqRXOOv8cvbi1q4YYSn
	/yhYp928TupsEOaE2t58ZVvW6s6BclONvgI4sxaYiZB8ebVz2fwNzG6XzaViohnDtOWi
	1J5QvQ746o25Vo8LpWEjI5dkSfF45k4iDis4DCx8Xfh61A4Vjhdqp2nkoevnMerR6H0w
	VUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=YmxAMmMRVGDbBpuoJYn0rkLrF3kCEpyWT3bPGOBB3mOflku60jh25xdNRMTvNv2LCm
	WMguqKeOhD0xUZNk5vsUW43bRa81/W4Y8qigVewxvXIfqVghBX9qCG/lmW38py19MBC3
	H7+1GDtfT2wSwjZHZlz/VZMF3m5wg60N4xhH8sjw1IdidDlfaC5FUCwsFKMpqAIBevoY
	SexS/5XHM+Y4SmAnpHjyOiVyqM/H2HFhYQ8H0X4eGLsowlFgN0E0oN6IVHnZe8xvrwqt
	sTpv9DyaDgKLqxcmWjy4FPXv0sZoZ0NqRX1MM29W4I7FnfHXD/z/VGsS3IRi/8y0vQel
	/T6w==
X-Gm-Message-State: APjAAAWSoj0WOhuqgG/4gdQUEgsuh6sFWnu5JCckQHNSB0jh9jA189mx
	k0UuyH/VWIu2yZHXG+/BS/abvhsZ
X-Google-Smtp-Source: APXvYqz/y9tN+Jzn2vqRZVm4jIw2SuQM8JNG1cbRo5OIzMj0VfleudveN5KAb+/Cxi1P+Uiivi+owg==
X-Received: by 2002:a17:90a:f496:: with SMTP id
	bx22mr47073270pjb.101.1578364484572; 
	Mon, 06 Jan 2020 18:34:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.43
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:11 -0800
Message-Id: <a15c05fa17bcce345ce254f02c0d6dcd97f60cb8.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 06/28] sstate.bbclass: Fix for consistent whitespace
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:43 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e874d067ace03774132ba3030a898678057c1304)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b5267f00be..c0329cd5d1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -752,14 +752,14 @@ sstate_create_package () {
 		return
 	fi
 
-        mkdir -p `dirname ${SSTATE_PKG}`
+	mkdir -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
-        # Use pigz if available
-        OPT="-czS"
-        if [ -x "$(command -v pigz)" ]; then
-            OPT="-I pigz -cS"
-        fi
+	# Use pigz if available
+	OPT="-czS"
+	if [ -x "$(command -v pigz)" ]; then
+		OPT="-I pigz -cS"
+	fi
 
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-- 
2.17.1


