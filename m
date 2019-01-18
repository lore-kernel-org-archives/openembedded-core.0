Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF8877C229
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:02:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t200so4117661wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kgPw/k5NYEACm2xbzVipl0Wm+qU2Ek4xCviADGF395E=;
	b=XqHMlFav+01Yu2Who6gQz9OQJ6H48XdI+G8k/JkeN1JCYU5TktZD23BV6bTDSGqm/y
	la+uxfAXbLJ8peN4xfpBZP/Yg/+WccNKd667jhy9magv2pt3sMxxJjoN9jgq4IK7GLYx
	pm8y8M0e759b7a+SBsTGU66Ym9h2HnOEtqdA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kgPw/k5NYEACm2xbzVipl0Wm+qU2Ek4xCviADGF395E=;
	b=LlwEuoSuLpUrDSbeGvW/LQ+7m6OO6knCJID37qrC8ddtUPa/vcI7tsIb9O5FOeIQ4+
	Sn3PLmiCAigL09UasVs82be5ZfDQoh4O5attlKAc4y/uC+MizIXXjQ+yqFIg8EB38Pe6
	XvaLy3uw0Mq8SUeXY+f5+/LhvKlscxezhXNt8j/MHUemmAT8V7N1qv7QTxVRfo8hMe7m
	S7PPfh3DLPYGA8WfecfrXJ8k/Fi1qLFQP6Zo4vjIs2UuJ/ee1BsgUbHsW1bkLGEGRwNR
	0aXmiRAGs3adesD2vd3UNZJXmzt1ifCNM4AO0luGRVQWcZuxn65GkOs4IQJ2zicvvccN
	CB+A==
X-Gm-Message-State: AJcUukeMguB1C1mGBEWrYBPXWEyL7fOHb/iJOFRrHE949eER16CVZKz+
	iZB2ge5wmSwvXrl4vPNUV/KiI8cBagA=
X-Google-Smtp-Source: ALg8bN4edIkRGM/FI2pgLYYyQb/VpUCIu7lg8r26MdW6szxNHpGIhviiP+0rwceLEGbiyuQwVxOAEw==
X-Received: by 2002:a1c:aa0f:: with SMTP id t15mr14945902wme.108.1547809376459;
	Fri, 18 Jan 2019 03:02:56 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s66sm35171621wmf.34.2019.01.18.03.02.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 03:02:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 11:02:53 +0000
Message-Id: <20190118110253.8273-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190118110253.8273-1-richard.purdie@linuxfoundation.org>
References: <20190118110253.8273-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] nasm: Upgrade 2.14 -> 2.14.02
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
X-List-Received-Date: Fri, 18 Jan 2019 11:02:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/{nasm_2.14.bb => nasm_2.14.02.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.14.bb => nasm_2.14.02.bb} (74%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.14.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
similarity index 74%
rename from meta/recipes-devtools/nasm/nasm_2.14.bb
rename to meta/recipes-devtools/nasm/nasm_2.14.02.bb
index 687a05a5cde..96536cc577d 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "238a240d3f869a52f8ac38ee3f8faafa"
-SRC_URI[sha256sum] = "d43cfd27cad53d0c22a9bf9702e9dffcc7018a0df21d15b92c56d250d747c744"
+SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
+SRC_URI[sha256sum] = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc"
 
 # brokensep since this uses autoconf but not automake
 inherit autotools-brokensep
-- 
2.19.1


