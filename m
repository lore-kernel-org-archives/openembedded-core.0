Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF4D7CBE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 10:56:43 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p9so6222016wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m1Af/YSi6ZvSgv4cORXDvpNhBqD0M4FLSRiYMfmVnbE=;
	b=LGC4B32+Rv++b79FnIw4E6ZjMuMh/pRnXzG39C6hjFqMKxQcTdvjr0NA5J3NsR1YE3
	JJjV8ZU3W0g76fR2/+bUeoBzU2PqrLI1FdNlJjfscxC2+ED1Wi3C2/M2j3QnWxpJCe/f
	0VVVl0umDx9joEy8tFYym40rDx/8CM7dMHpaoNg+1gH8G8qPnGvCwzARP3cMQrXFy1o8
	6/vyihIuaf5yPmH7DUdmLm9TUU5chSvehESReBsLSCecgP/9vfD49BEOrHZncY8TzUPW
	7XzghTEXR6sF/ahUEcRgGG/Rb3VJrdiNk9XSMQiXE5ebGZLytOmb+MoTto3SmcRgKnku
	GAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m1Af/YSi6ZvSgv4cORXDvpNhBqD0M4FLSRiYMfmVnbE=;
	b=Kf9PKBS198tDEOxFx+OUf/Tbz+vQvaR/Rc2DUlIPNz4F9lhTRYEFnT6+NlCeKP+2us
	pcuCVAb+/sglg7DPS+KVSoi6GwH9wtzwZsFLtRkOpauRUTzFJauz41lumBh1KZuBPCt2
	G3JdoC/egt5ptCw+weWopbly7zG5C4WLXKJpfZovaWMVwn2vVGNp6BIP45VHc60MnWlv
	m5usVFCcdWE03qwdudM8VQG/JX3AS7cjY9VJiH+EkyAk8CC0s7xN9FopUXStAn/mA3mP
	TbgjUOTvE17atXRt2eaus1TkxYVgwWcQfju113lfvwQa06IMLENpZ2vYASjIeYmm9JSL
	ldbA==
X-Gm-Message-State: APjAAAVSuoDnXx32RZyEaPJ4rn2mvZT8RyOJFo0WzI2VL5VdEwOwelL4
	3FRsbEbozUYnSKg+lyx0lk3kBSD/
X-Google-Smtp-Source: APXvYqwCyUcs+kKWo6S2O/v4XPHaxz070MY/yBCzMXAyMhSGiaCNNLq3IOYFLG2O3e5TM08nL6hk6g==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr30169648wmo.13.1576493803812; 
	Mon, 16 Dec 2019 02:56:43 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	p17sm21139222wmk.30.2019.12.16.02.56.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 02:56:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 11:56:41 +0100
Message-Id: <20191216105641.5861-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216095620.3747-1-Martin.Jansa@gmail.com>
References: <20191216095620.3747-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2] sstate.bbclass: use tabs for indentation
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
X-List-Received-Date: Mon, 16 Dec 2019 10:56:43 -0000
Content-Transfer-Encoding: 8bit

* it's terrible, but this is what oe-core wants and it's better than mixing tabs and spaces in the same function

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 14de791c81..6603c6e926 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -753,14 +753,14 @@ sstate_create_package () {
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
2.20.1


