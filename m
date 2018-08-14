Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14FDC6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 22:45:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c13-v6so18556048wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 15:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nf9uexDwaWIToMJreobpNO/C9S/b4ltj1yK9hTVtE44=;
	b=INpfmeI0H6FiPR1Ke7Zg9EojoN1A1+T6WB/Lcad+KO1uS4PJMMUV3nWKcE31lwkHlo
	4hZU8SRVJOI8G6VSbrrOWXC1E9cWoG5PU2HZg70DbFsJXwABBgx0CDUKzL8ycTIlTFcG
	WStmO0qGpYQkG9Ln3APqluULF5NdDCnKfDFuzxYVv9YbXdIgPck/oeWlO2GwNy4k2khq
	19IMG7gjUDZRK5FVDL6wwQH7oqiOdd6Ia8eo/KEY2bbonchHnHks+TbDy4YB6r9m7exg
	1i9ZMwZLL77AK9kLOSVmk0WGNHvMpUo5I3ybee3FN15VrlyXvZc4OEwCKc+v5PneHkPY
	0Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nf9uexDwaWIToMJreobpNO/C9S/b4ltj1yK9hTVtE44=;
	b=ZQGzhTtcJiEv6NXz/RQiZgBCVprZWDhTKQNuKQykgmPpxb30n0cwCvi1z1hFUY7y6p
	dcsvdqISh08aG0kB2FsMgRrq30aiPu8rQLDoOgYe3ELlLpldkzUZBuNYBiwcXjFdtYYh
	OyeiSEYks+CTmPkN8XvGvOxn/npD4CvfWIBPfYGZwpoxwzIS9cjgGBTbE2Ztrw85hPZe
	JSLPCJedsIjctiNNCfPOsz1bK8rA2HiSgJwbShG3oY46MTY3nJ8GTtNhP4UX6lP6pk4t
	YIShSrHV/Y9wwTilZnti8ExOmVsFfBHjKiCxmWp9Q37womZjF+CbAcmyOY/x4eXEfQ8j
	MuHQ==
X-Gm-Message-State: AOUpUlFZc8UElKKvZQguyxm1gOHO9SMJkcNOilYZvaHk2CjBYw5HdthW
	Hu4jZR0kyKkblFLONRHUyekCq28d
X-Google-Smtp-Source: AA+uWPyLH065BTaI0ZL+okNMtPTIm/C5PUMklK3+sv98ZKsdydM+QRGGGdWwG0z9d5s7HK0jT5Dr1Q==
X-Received: by 2002:adf:b188:: with SMTP id
	q8-v6mr14803823wra.95.1534286727569; 
	Tue, 14 Aug 2018 15:45:27 -0700 (PDT)
Received: from localhost.localdomain
	(host146-228-dynamic.182-80-r.retail.telecomitalia.it.
	[80.182.228.146]) by smtp.gmail.com with ESMTPSA id
	t186-v6sm516890wmf.14.2018.08.14.15.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 15:45:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 00:45:23 +0200
Message-Id: <1534286723-15194-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tune-strongarm1100.inc: restore specific tuning
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
X-List-Received-Date: Tue, 14 Aug 2018 22:45:27 -0000

Since commit

 a11bdc36a1be
 tune-*: define more generic DEFAULTTUNE to share feed between machines

we are using armv4 to share binary feeds.

As of today, there are no public feeds for the legacy devices so let's prefer
the optimal tuning.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 80cfb8a..c8b62c4 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv4"
+DEFAULTTUNE ?= "strongarm"
 
 require conf/machine/include/arm/arch-armv4.inc
 
-- 
2.7.4


