Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0CC750C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:46:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o76-v6so18006pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OKlrtfAzQWECVop8Cb9EYlQdCkDSrn1br0O5x+oNN/k=;
	b=Q1MeSLL5ZIvSwiP/PKUF3m3HUG+bTctpidlNgyIpqav/zLUQereWapEL2go2FZU1Bg
	cUc4ATXrwPaRGZ00ooDWAyhQbWeJVj9e7loSPDDKgePn3b/HHEosDwajmn6zgt05eJkN
	QFlRtnGKRfAerMYGzEfzSyS5UWpnhjbIZzazC0l8Rbssdo+graa81BjFthl3UlnESn74
	P/r3+TyyFxwy2HrS7bQNQ9FNvYC6spyfpkOdRdMGhR+vY3QPhO5uUuIjTVJNnTenrjxT
	NFOcjK2O7l8CSobSVvH2OQ541hyvTckIk6+lllz3AnSaKkGUMgy6tA/0fIP0tisrSRof
	Z4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OKlrtfAzQWECVop8Cb9EYlQdCkDSrn1br0O5x+oNN/k=;
	b=lhdG8yBD6cq8L7KJzqsHCy29KLVZv60ihyMeueIDBN2l9yN6mudVcmUIU9QcUThE5Z
	R4or+bWraPI1Mxhm4lue65sy+MN5JTuisyWnHe2B2hPpJa4le1wHdvRV0PnK4rOzjQ44
	a7tnxpjOImzjcmNuaEw3hJIfXLvJq3I6XhwNKkcVXRIYx8l+M2L5DH/Znbd4bWty3XmU
	vf36rq7cK4gHR+H3L0Sy1lqmtoM7OfVmQ936Nq8Q1RCpw2h4mQ4qvCBM2JPsLyh7M1Co
	9KVt41LupieK1Rdwo8nxQ0mZI0CY10Z1sAkBXdxi+u03Wuv4fZatm2Pi/8k+dP0so92B
	OW6w==
X-Gm-Message-State: ALQs6tCbXkMpgrHdsT6h42upfDezixfBHlknm7jHm/AaeLswh7FaGjju
	KDr2lz1gjtlVzWOckRjMlP3HCg==
X-Google-Smtp-Source: AB8JxZoVI5OD+E1MoKqjmzqtA0Y+6gAd10dRDgtQczmnfL0yo1yPFF8YmXgb7+gaqSWryuTpnavFFA==
X-Received: by 10.98.20.195 with SMTP id 186mr27682448pfu.92.1525902414784;
	Wed, 09 May 2018 14:46:54 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:46:54 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:41 -0700
Message-Id: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 1/8] tune-corei7.inc: minor comment tweak to align with tune-core2.inc
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
X-List-Received-Date: Wed, 09 May 2018 21:46:54 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 9ce731c..d06af47 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -8,7 +8,7 @@
 #
 DEFAULTTUNE ?= "corei7-64"
 
-# Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-core2.inc
 
 # Extra tune features
-- 
1.9.1


