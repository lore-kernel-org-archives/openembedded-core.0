Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9297F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 2so24899233pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=Lh9Rh1L0cyFCnBK9eiZxd6vVJ/Xz/mZkYZlZZYwQA5SsvkRJm23FtnLkkdoIZ5XSd3
	NfJd3HPNkfeoNc7K1rXnfNcuuStERirTwbOjY7hio7KXac1cx5G3sIdHWs9VSSrsRvlX
	SX4mR0aHLb3eBgRwf7dorhaTQygfOHKYtByNT9yN4hyTkpevWlMvcR+9FU4xIFUeIOZf
	qOl/0DoKREMcgmrfw7R6/cKIjz57WJLmLPhkTo/dWY9bjSIi46O507M/lJZsEzCW2PI1
	sfQ4l4UkZGEPbLsXNP8Mqn5O3XeqsifZONzqJgHpvJ24i8wwQez9wCLdosC5om47uXNi
	0eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=p3IXgHvYv1N7qDT7Di8/WrKnQ+bFQZD/cx7ne6TaLTYNAwemtCSMGBVVYygRmEceT0
	IdGNx7CUyY6bTB11QbT9zjZgp8JPd9eH4Z8iLQXSF1Rwcd4Y7biTYGBwcuMwMckaHA42
	xEhYqsqpqiDEWRotMO4Doh7xiglYqbhtF4K156z1yAnihq0gxDO8rFEoq+2cUiSDG5xB
	y3p6Ewq8wTIdB7NVz3ipo8AuyvhhkEeukIE+x+6bqAfiHOMisb7LgeG0ZX7U5Szplu52
	7HlmXS0TfGq2l+DGREUrAGF3jCUGbC27AYTJFrvyjMcM/SV2KJkVzdwPiMQH6DFHv1l7
	/7Cw==
X-Gm-Message-State: APjAAAWdZM6KEQs5/dETVNpFozbHj/xvM0uXjtiDMjTVas1sZ1f85ukC
	mP5cw+/RgP1tkzn24ADcMQ1o3s+CqXU=
X-Google-Smtp-Source: APXvYqyt0UghdPQf1KC4tcOMEUFGmiw30MasJ1AprJP3ntMRVugZcjBueTk+r5qkZX/gWv3tolYBVg==
X-Received: by 2002:a63:1d1d:: with SMTP id d29mr98155573pgd.387.1578155179090;
	Sat, 04 Jan 2020 08:26:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:47 -0800
Message-Id: <a15c05fa17bcce345ce254f02c0d6dcd97f60cb8.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 06/29] sstate.bbclass: Fix for consistent whitespace
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:18 -0000

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


