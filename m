Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 33F9378695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:31 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p9so8697154pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wVOTL4SFPYcrXH1AU1jX5TTtwVmxhr/IB95LwO2Vwsg=;
	b=XXsiQC/flz1RDTn6uSC4QKiWuDDdxTYdEN3EYG+eXql47GLx9X9Z2b+p4M8UVX1UFJ
	bjB0LRU68/CKop56kUvnudSRXRWZQSlDyhtElFqfrkeUbN0ae/5qOQMyGak4Jnk1b9NC
	VTAKScOYUWNu3wx1notTM8xqwMNEAo/qzFogSGq9akaEM61SwlKamW8HORwTL8NPtxmx
	i6meM35EhnIuwD5g6D5GaLAFIngnUnHHrlRJcwkVugGUNwrOzoicWaRpgZhE3gNFTyeU
	jaSq9ukL1nZp1rkcI85tlybsS/lvJnhz+FSpCeeyjKBs5wB0uv+28dH0z4xFuQ/ivOYz
	H+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wVOTL4SFPYcrXH1AU1jX5TTtwVmxhr/IB95LwO2Vwsg=;
	b=fA5PXogUorY+S44/v+IppxKBfwfUz84zR59PgqgTdiGg0pcrE0jQJjw4JeXM7LbJHE
	61/3YdWqxkS3jCms2nW77bs3C3SlF0pf7q+PefvLH4LYWvFiYehYqYhG0WfXA6csyHSt
	6dUOhBwntXpu6RFWUJUOvGbhfSZZJ8cnxD4+Fsyk1a+a+tpxrRVJgvqo7HySNkDP2byx
	XwETU9DD6Fb6+ur5jELps4LAD5Ie1bGwedrd+GWyWSmoeAkyHP7NeADb9rBr/yKbwSPO
	Oc9SRV/jXjGgNySParCPloo1AgXr9w7lw3ZYlK5AXFyUFx4ajjNJ3nEvgax+Ub8td/Ph
	W23w==
X-Gm-Message-State: AJaThX45yDcKcpXDDiQl75v7W6ZS98BwPGCQcvWx/2fT1+bjBKQAoGbw
	MxoUJQzm8JA+GBONgUu/ro8KYA==
X-Google-Smtp-Source: AGs4zMal0LbxVVhJwQQ6v6wJlztRQfhxAI2la+YYWaEF7SEkfM2Rbl3ellC+wMpmho+l5A+esJ5C7A==
X-Received: by 10.101.74.8 with SMTP id s8mr14867050pgq.259.1511222853291;
	Mon, 20 Nov 2017 16:07:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:13 -0800
Message-Id: <212806acfa910bae3837313f9ee230ecb3db22ec.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
Subject: [PATCH 3/5] nss: update to 3.34
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:32 -0000

From: Armin Kuster <akuster@mvista.com>

for more info see:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.34_release_notes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/{nss_3.33.bb => nss_3.34.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.33.bb => nss_3.34.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.33.bb b/meta/recipes-support/nss/nss_3.34.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.33.bb
rename to meta/recipes-support/nss/nss_3.34.bb
index e3d4f96..f1fbbb0 100644
--- a/meta/recipes-support/nss/nss_3.33.bb
+++ b/meta/recipes-support/nss/nss_3.34.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://Fix-compilation-for-X32.patch \
            "
 
-SRC_URI[md5sum] = "43663c850e2b2ed48ecb8910b055f5a9"
-SRC_URI[sha256sum] = "98f0dabd36408e83dd3a11727336cc3cdfee4cbdd9aede2b2831eb2389c284e4"
+SRC_URI[md5sum] = "1e30b8e5b13b5b08bbc489c265948d82"
+SRC_URI[sha256sum] = "0d45954181373023c7cfc33e77c8c636d394ec7e55b93e059149ed7888652af5"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


