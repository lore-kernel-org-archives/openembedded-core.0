Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 052D56C110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:41:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id f12-v6so14712322plo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OFoTMuSC+paElEfGNA2nrENjrEoxIQl81hxZirDkkPY=;
	b=o7iijzxrG7jA+qJP1dOXjwICrXqoqFMNkLBp3fYlCroBxNXMMhYyb6YYmVun2PRLDq
	EqVawdd9OipLzybRJKcasgVXD82eme5v9uRdMjtL+w3ixWvQY1G4cxjza0O+43N/iHl9
	GKlYEaLnNzWQe9ybMr1nFcJqbAknyEb3cjZN8aQvSvh95sFuZTtbFPW0uA30pwsyCYwW
	NV5zWkhA5KqpMHZqK1255ErrYkX2TCtoOrskS4kj/Cw66HYzvUFkKUKPfuyWvK8op1do
	OLWg1cfFPo8T0p9rKXpAmhXzhTnCvm7W/FH69/rui7/qg6qMgt3xSHd/DK4eKSFghPuw
	LBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OFoTMuSC+paElEfGNA2nrENjrEoxIQl81hxZirDkkPY=;
	b=Ds7vKPY+sOChg7NMR+i26LGutwOm8RHayNVt+SKm4eKgUc58ESgMkSrcHrEnBsEVmr
	h0avoVqMkhGMvZ2QY7sRAb2GA8vob9IppqLYxgxqIw3IR2zSl9btOgEif+5iIhQs2Bdv
	n5Fqn/iigFhhtOooLGOUn5stoyu5uoh1Qbj7odWNbN2SzIwRMQPaqRu7OVqYg7Rx6jib
	1czj3pi8UlFRbJoEEorheH3cDBBuSACs0/krUNbtTdKvuw7KQsBsXckiIl+wmDi8CTpA
	Te40Vna38JRzV7h2QkQ5loHcnsrtnFWAeGAbOOrXaEoNhiYLSUNWeYduceuN0/+2rvFJ
	nPbg==
X-Gm-Message-State: AA+aEWarzVCGKtSKXkFHsA4Yoci4xU8t6GEYlsXJZjNFmElWKJJOGpoO
	x7jtM7BEW2qFFhuy+kKE7Lk=
X-Google-Smtp-Source: AFSGD/XdH02ekJ4cB9p6UYt4DUf34fziUOFXOLQQxwOCf5gA9ptWVNb0J/shTacUwjG0rU8feq+5pw==
X-Received: by 2002:a17:902:9f93:: with SMTP id
	g19mr9123953plq.195.1542638520264; 
	Mon, 19 Nov 2018 06:42:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:cd6c:2c60:eff2:335a])
	by smtp.gmail.com with ESMTPSA id
	w136sm26777300pfd.169.2018.11.19.06.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 06:41:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 06:41:54 -0800
Message-Id: <1542638517-19735-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
References: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/5] nss: update to 3.40
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
X-List-Received-Date: Mon, 19 Nov 2018 14:42:00 -0000

see: https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.40_release_notes

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nss/{nss_3.39.bb => nss_3.40.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.39.bb => nss_3.40.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.39.bb b/meta/recipes-support/nss/nss_3.40.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.39.bb
rename to meta/recipes-support/nss/nss_3.40.bb
index cdc95c6..23c95dd 100644
--- a/meta/recipes-support/nss/nss_3.39.bb
+++ b/meta/recipes-support/nss/nss_3.40.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "10720fc70fd483de1b085402fb10ed59"
-SRC_URI[sha256sum] = "6be64dd76f212415cc8bc34343ac1e7389048db4db9a023a84873c411dc5864b"
+SRC_URI[md5sum] = "f7aec858d192ae03d0e9a35a730c70fa"
+SRC_URI[sha256sum] = "0562087b8bda072bf5964f8acf851f9c0997a59c384f4887cb517b3b628b32dd"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


