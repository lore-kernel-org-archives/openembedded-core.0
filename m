Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 62FA07ED59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:16:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y23so27804619ljn.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NVkSC7WB1h4KnMhCWNK37ucZMgnT9vdpqHKbt79wi3Y=;
	b=qNejquPS7L8NYPRm511O5wERW+Bsuyc7EqY3StPBhqf1Rru3q+ZOC/tf9sYTaMtXFo
	eEsR3MrA/iBrBzPx+PQjE+qmBgRsHdzJreRHJorK+6XpYgHyNYmSKn/cJiD/KJj+lpPk
	J41BSMj/bnxLsOhpmdstRh1evogCoSyXht89sdrCm24LcilFuULgsKLP+cgl15IH4+A4
	/Vj2bxHJnyMWqurZ7dD1sPwluR3AxUDWYD8b+4sxCLEcIfezNrlbFbSXlORUyA5muhxZ
	+7lPn4p4zR6yYZg84HCkZuLsTZsFSmd/8n0ID+RSHH3BctqMphTZCbcIJ5F27v+hHcov
	+Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NVkSC7WB1h4KnMhCWNK37ucZMgnT9vdpqHKbt79wi3Y=;
	b=Z/yvGo3AmZXBZg+2/RefiQbxm8SF3aUjjFo4SbOdJfzwfVQRRN3jgs+R1FPQNYWlcj
	hQbHpT4YrauRq3viKzLl+A/t9ryd5bipK0z+pTumEJXevyGVgYuKMHM6Kq+qvcD/8hU0
	edRlMJT/6y79n84yXa7uQVClxmEgSOzvQlmPqKTjmkuEIFt8cbt7W22Ydm8qiP6mvNPd
	S3uIvBxq7IhErZv85mF2laDGKT1pzsfkgPECETK3uUyRn+TcpidZ5V8crIDdfEMl2mNI
	kgmxDzSVCMZqGQg0jWdQXoSjcktd+bHL73PSX3PCfyhorx7QMiNgaSo4pJxU+WLkzCSF
	neOw==
X-Gm-Message-State: APjAAAUi6fLDr11dc5pbKhWnwBGq6OhJOywxwd6AZSgNo5Tvgw9RMpsb
	h11bqUMgKN9hGFuxN1cKjcKzw5t1BSI=
X-Google-Smtp-Source: APXvYqxNT7SR6+F6vebXwnvE7nGNWDVWap6iY9jSaVRaWK5zCYZtzZ7gVb/zpTcGEfcu+86HGitTrg==
X-Received: by 2002:a2e:874a:: with SMTP id q10mr29847475ljj.187.1568402162521;
	Fri, 13 Sep 2019 12:16:02 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	c197sm7112319lfg.46.2019.09.13.12.16.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 12:16:01 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 21:15:58 +0200
Message-Id: <20190913191558.31450-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH]] curl: update to 7.66.0
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
X-List-Received-Date: Fri, 13 Sep 2019 19:16:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.65.3.bb b/meta/recipes-support/curl/curl_7.66.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.65.3.bb
rename to meta/recipes-support/curl/curl_7.66.0.bb
index 96f90fb8ba..d1975f2460 100644
--- a/meta/recipes-support/curl/curl_7.65.3.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
-SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
+SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
+SRC_URI[sha256sum] = "6618234e0235c420a21f4cb4c2dd0badde76e6139668739085a70c4e2fe7a141"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.17.1


