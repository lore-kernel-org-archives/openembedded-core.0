Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A077B7836D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p87so2942398pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wdYL2al1xjgUuH1zXcf+MPM8wJq2sY8Bi/bC3f77kTw=;
	b=YCbN4BaS+fxxfcJ4bBuZHZ3qtvCx/qx+hfhuR8cyfuf9J60Mwlvfaqu1UA2XzTjaY/
	k+By/rPTSpG2jTUvdpRH1XpsWJFOiMAQQjewGgkQ9tIalAOz/M5y/93w1wV8qn6eAkha
	y2K9UqSAp/3uwaKgG2NRC1da+UbKVjk3sqkx6sYA6+D2Q951EuuG9jC96Fdbdc0nrLBs
	8TncUU/vx8MAL2Eu049Y1Fx5mzCZFk6oouOt25Y774eDasLd+6IV/F8vJVW8wiLw7AhG
	XDLiNIP8JTnWg04xZTNTpYVhsmMQod/Rp6OZx5lmW1OseRpz9nSrJ/2ei10Ojfq+4yhq
	PdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wdYL2al1xjgUuH1zXcf+MPM8wJq2sY8Bi/bC3f77kTw=;
	b=JbZV7RA1EPVfb8Fi8J/g2IBWwrjeFNw9c8bfHfTT1Z65S2+Lr2O6hEQO5dMkimwuUs
	sEX/0AAHOqWrHy2Us5mnwkT08MY914//9WSjZvKF+HlP/yuGqDOLRr0RFGHUjJXw2EVW
	d9CXocNsYlpLsGRL5cHbNuk/ql1B8uoozwmRDpxcyu43PWhXsJOvFCj0d8CBxaL24GDq
	b9xJdAC2kOGbPeQbPbtHfZAh8AW8HYxvuFdWVTz+M1V/CS++in3PmUI+WAVgChBAM9Xr
	EL1VuJgfFIdt7i0yfRfyY3+4lFeOOLLM052XlmVLLiVudVP3A/TL60BzNusblsOJM1Ci
	zoWA==
X-Gm-Message-State: AMCzsaUBRdaIi7DR/pXRF5XqoLuZhX0X23uAqoWHl8+B8DAGsFpTUrD3
	tmCim9rrxT1SC8RkykWOkLA=
X-Google-Smtp-Source: ABhQp+R1frNBHtdjIW2pTJNYZWpz91s9FJxmnAHOoImN2lAUb3Ovzjv9rH8KlkWVlEEjkJO71TktFg==
X-Received: by 10.99.178.77 with SMTP id t13mr8272242pgo.219.1509738898923;
	Fri, 03 Nov 2017 12:54:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:40 -0700
Message-Id: <91f5ef34c0b11e9a76eaedfdd72696cec8bb0fc2.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 06/15] nspr: update to 4.17
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:57 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nspr/{nspr_4.16.bb => nspr_4.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.16.bb => nspr_4.17.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.16.bb b/meta/recipes-support/nspr/nspr_4.17.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.16.bb
rename to meta/recipes-support/nspr/nspr_4.17.bb
index 78ef994..21768c7 100644
--- a/meta/recipes-support/nspr/nspr_4.16.bb
+++ b/meta/recipes-support/nspr/nspr_4.17.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "42fd8963a4b394f62d43ba604f03fab7"
-SRC_URI[sha256sum] = "9b3102d97665504aeee73363c11a21c062ad67a2522242368b7f019f96a53cd1"
+SRC_URI[md5sum] = "0534d9ac45dca251655b9b240670eab4"
+SRC_URI[sha256sum] = "590a0aea29412ae22d7728038c21ef2ab42646e48172a47d2e4bb782846d1095"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4


