Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3F45F7CB36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id o17so29887993wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=deIYgz2htHTTrm8dIeyLNTNy7ZFGeRkJosil8q9+ECw=;
	b=fHggtKtY7G11h0BnqhO6uboRM57RMmXa1+UEcNVm3vmzW90gFD8WkoFWVtivH6xqcO
	oRbKNkkWBEe6NyIQCPS7U0U/0GLxqjGqwQTDw01XlYjnsX3gczwlW2thMbOCI4TIKdSg
	kDLB99jawLY/3Tq2uUxo3vyebzQrsHWHe51bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=deIYgz2htHTTrm8dIeyLNTNy7ZFGeRkJosil8q9+ECw=;
	b=EncfYi6bhgRuQg6OyG50x/SoTqGSnyQjV0NDqnv4EBbuRC8M+i3PrIReEco+Bk8s9q
	IqKZFL1EB95gupi96T5HlOOnQVgo8TMaxPJnYwownsn+/qT+1CuCQItGnvIHH4rQ8KG7
	13HDAttplF3mfXVko4BBPYp02RNMjsukFRe0/t6GxwNVdFRNeRzzbjeKpwWS+ca3ZTJQ
	+CqDrPzic1w2WnHkatu6xc/il1GXNwvrrZNhX1MBUSrK+ThHuW5dkAlQwD8THVPazIaM
	lnP5cB4TVxRMuZE8Y3jY6apONsPs3gcaUDwww4jqiZAr4E4mEOgoyFmKE9gzNC3WPLAi
	mLLQ==
X-Gm-Message-State: AHQUAuZ/TiDR5kztF7G1gAexLjzs71Sop3cxzPMh9OnK3e0f3h0ZacT4
	cJ3jcUO+5EUB0C2VhZcgJskj74P9T08=
X-Google-Smtp-Source: AHgI3IYNflC3Zggc5paUQMCg1CfdI23/PQbx6I4ZHVSswzTRq+N4y+DOhYNBwvkENILWEfGoGctzHg==
X-Received: by 2002:a05:6000:1185:: with SMTP id
	g5mr27093979wrx.299.1550752901566; 
	Thu, 21 Feb 2019 04:41:41 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:25 +0000
Message-Id: <20190221124130.25733-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 09/14] pkgconf: upgrade 1.5.3 -> 1.6.0
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pkgconf/{pkgconf_1.5.3.bb => pkgconf_1.6.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.5.3.bb => pkgconf_1.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
index 415478d5cf9..1452875f5d8 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "c21743bca14c882c0f282746168a5edc"
-SRC_URI[sha256sum] = "d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715"
+SRC_URI[md5sum] = "0c93492d7f001e5175b0347b5472e86d"
+SRC_URI[sha256sum] = "6135a3abb576672ba54a899860442ba185063f0f90dae5892f64f7bae8e1ece5"
 
 inherit autotools
 
-- 
2.20.1


