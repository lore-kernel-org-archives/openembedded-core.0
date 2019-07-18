Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F30E7EED0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 20:04:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so22759646wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EpcFY+nWMv9R2Q8oZaFjWtRsV6TVZsvuJUHZu2VcCAQ=;
	b=s5/CMRVzyH7OmbTVrOPy3g9Jq4zlMJOg532vwA6jWPUSzJO06VwU/n0YHKLrTY6BK/
	BS538+++8MzIe492ugFLGfrcte5/uT0HLht03ted2ekhTWZSgFLyRY/NpGQViRoTbnDz
	BdZoRV/dlBRNRhQUTNgfuh9foVLXQRUzB0qYZrsPKGqu7ve96O8PvYqxtsNyvWiaCeFR
	8cpoU4VZ8VkmsvpHbjHuc2wXHIMgFU4/FXrrKjTDjW2HdU6ka5SgyT63zBaxJEu+0fPk
	VGXAC12XnDoO5jcUKyP/dh9D7KR2AhXW4YzHhgvyT7U+mnDOimIW26gEiZuwFC4te+RU
	Z7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EpcFY+nWMv9R2Q8oZaFjWtRsV6TVZsvuJUHZu2VcCAQ=;
	b=i51bfUVpk8QfHm1V4YlUZlIMUwV/4fq1LU6dEj/vSiuwlW1qPT1tNwmOXHgeOGtEVO
	3/7ZiT5GZ5yiPzORjEHDXs2mgcCVF/XvGqzZpeqEsIYNKSG5uDm8zxhZODJpj8EkGXMK
	nJgaAGRkrmYfHJgIyUf9iX9VZempm/HmK/d7+5QFXzo44hMt4FClM+hd15bbs4V5Hq9k
	mUhjeRTDxRguJrMP4AAXU/TxlTBqYgPmFzDixzNkPSAq4cctXdO4aL+RNuq6vC2EGvpI
	iHzcgWcQo4sK9zojSgVFMokhdtR2O9IcxddbNhKQzHiLLlYfJ8iRC/EtnEnReKn314wN
	dA+A==
X-Gm-Message-State: APjAAAWP+ZYimY0XjyfYS5e8iUnL26XQJ6QFzHo5vD6ih1gfaLt20xu9
	NsKvjMwM8GQ4kpfEmXhyugmA8YCfFos=
X-Google-Smtp-Source: APXvYqwrGEV/Yq2LWFPNfoPSfnunY5wWY8IsfJGzgxqnAyZHT+b21MUbB6FB/4w7iB0DDy/05bvfyw==
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr40414010wmd.87.1563480244475;
	Thu, 18 Jul 2019 13:04:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r12sm35331858wrt.95.2019.07.18.13.04.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 13:04:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 21:03:59 +0100
Message-Id: <20190718200400.19750-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718200400.19750-1-ross.burton@intel.com>
References: <20190718200400.19750-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] cve-update-db: actually inherit native
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
X-List-Received-Date: Thu, 18 Jul 2019 20:04:04 -0000
Content-Transfer-Encoding: 8bit

The recipe was called -native but didn't inherit native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9047513dbdf..cabbde5066c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -2,9 +2,8 @@ SUMMARY = "Updates the NVD CVE database"
 LICENSE = "MIT"
 
 INHIBIT_DEFAULT_DEPS = "1"
-PACKAGES = ""
 
-inherit nopackages
+inherit native
 
 deltask do_unpack
 deltask do_patch
-- 
2.20.1


