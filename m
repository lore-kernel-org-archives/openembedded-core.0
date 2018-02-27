Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id E0790786F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 22:47:59 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e7so1085480ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eLcMY3zk5ohfaH3k74Z1vqBQwnmDUStpOSuhBhGpAfg=;
	b=is/kvn6WI7Raf+y+a0w1qYb9O8jbUdjCtLXuz60j9SqTZgjcDRD3M6kUF0mMOoMA0/
	rOpZs5kPXJo407Td0UlOfiZLKBG32YS4rGvFua6WW8oltRB33w1FGXwOLk1rA+SorzE/
	gVLRXvU8ShXq1srGFYs3VY5DbdNr24ZsTa+63MuaHOzJKtyJfB7vTo4JJYws2pHXOanX
	Fk3xp8X6zjz6MRwxzaaPApdJCZWvk5iea78ka8d8eq6PUyXeHmvxm1Yz/Gsfb3kRPS3T
	TXde7vcYCerQiH/vTNmd39UuD6QMK3+OIMBqXQj0CNrgtWBmtJ4RQ+IWtiOcIwrNGIms
	tu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eLcMY3zk5ohfaH3k74Z1vqBQwnmDUStpOSuhBhGpAfg=;
	b=oZ+SbnmXdkriNG/ypRYigridouSv7nrs+JbNsybX+AZ85uhC6jn4bH4YXzI9ggA909
	LXkI4y8R2rwOdXY2nMlBVgh4AZAQ/IWqWnFwxFExhRVEpSdwvWUBmDWkkUFItaddIaDV
	Sv1j0nNursHSl5NpkKVnHlzDp0p2I6jvRMbAVB1Za6vvTonmRUNPGSQupf6eVnK0wJAS
	TD8ZbEsDreRvcqCgvyZUM4Vpfuzc5KxnsNPi1WGh4iSCpUXoWbO+bnE/zuJt4kf+zdwx
	JNDLzvNk35VMlWV90/anQqsGZ/kkF1ZL6/a8kZquShS4LanP2tg1jU2OHMZxWlpkNbvO
	NFoQ==
X-Gm-Message-State: APf1xPBDr6wnB5LWWOsiFDQ4N45apQMOr+mrradveLMMescZk9EVvp48
	DT4WLfxPaWX/haoIEuQc9q/OtlEg
X-Google-Smtp-Source: AG47ELumVp1hEVHwOgMxZZEG0z2CHMKv2NMp+IV73r3fqi6TFApIqV/JlcF8IjXa2Rn+5/bMoraihw==
X-Received: by 10.107.88.10 with SMTP id m10mr16198805iob.144.1519771681324;
	Tue, 27 Feb 2018 14:48:01 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r137sm373612ita.23.2018.02.27.14.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 14:48:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 16:47:52 -0600
Message-Id: <20180227224753.30881-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227224753.30881-1-JPEWhacker@gmail.com>
References: <20180227224753.30881-1-JPEWhacker@gmail.com>
Subject: [RFC 2/3] ref-manual: Update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Tue, 27 Feb 2018 22:48:00 -0000

Describes the new wildcard syntax in the documentation

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 137a556d929..c5db057174b 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -12635,6 +12635,24 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                     <filename>mplayer2</filename>.
                 </para>
 
+                <para>
+                    The special token <filename>"*"</filename> may be used on
+                    the left hand side of the dependency, which has the special
+                    meaning "all other recipes, except the one on the right hand
+                    side.
+                    For example:
+                    <literallayout class='monospaced'>
+    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
+                    </literallayout>
+                </para>
+
+                <para>
+                    In this example, all recipes except
+                    <filename>quilt-native</filename> will ignore task
+                    signatures from the <filename>quilt-native</filename> recipe
+                    when determining their task signatures.
+                </para>
+
                 <para>
                     Use of this variable is one mechanism to remove dependencies
                     that affect task signatures and thus force rebuilds when a
-- 
2.14.3


