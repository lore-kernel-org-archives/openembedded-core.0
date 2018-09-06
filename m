Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id CBC6A795E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h4-v6so8467814edi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qMZfwUKNUPxtYJrJz2rZ66Ds3GfdmC24u1YttvaTQQs=;
	b=q/2lEf7q4hWneM2xvgw1MjwwhWpEbGCE6d0IWG2N3FR5QCqHSEn5sG7HuWDGJWdqRe
	ItbvKHVdfB4fVvVkCbR9WzRj+J5HgKUR0xjymPEWR+SxO3parwpf2XhBdeTGHPRQeyds
	dotri0M6O913liZIlAtf30ZCzacKOCIr/6hFhCxwzfU64HUxMI16UbHDU0pvpS0XR5Cl
	H+ep6FypnkSiSt1GgGejYYJzaChuFZU5zG0akUH6yGVyRQxfVnZ9uaTueb0hIGyXUVXa
	faaZiLxJBWt5QA/Hf4LxtVQ7+2BWNAp/hS9CWPU3UNbJeWq+l/8efpOoYETNkN/MuUBx
	4OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qMZfwUKNUPxtYJrJz2rZ66Ds3GfdmC24u1YttvaTQQs=;
	b=U/vxjWlcg1LNH8bSD7P7QouScNoud07/wdKtw2lkgxWltwDlkn2lfBrtPRG/MEiX2a
	b4XXCBHvC5HE5s3e0vyOSOBcC2TYBqrFarnzCgihgS46KwQo29KFlR+QpTVd4p+tq1Q9
	kdSW+1+UpxZ4TejCIi7dMrotxJCUiYbDzboV/B8wL+Z3iN50Wre7D46NUOV6PQeP8gzp
	IAjt2pNEgbXXxAm9n8GvGlPzEwPTadfsxde5w9ROBI67+7GQbNbJvmS6VtzZYK0Or0p3
	nbjIc9AsMNZPrjelGBu95EPcHFRaFrWvqt9yWONjRvjF99CMs+Ws8/How4MdCvWXo0Jq
	FeUw==
X-Gm-Message-State: APzg51DpCTa3IG74xTHX/d5VEEs24f8XprYgm12PoxPhJAUm5/QrAy3u
	8bffTsCHf6dAwJ6tbS1rGpOC2rkG0Hc=
X-Google-Smtp-Source: ANB0VdZbZeb4iALoh4ZdnJ84Y8ik/EEgTD5X/7iDnhZ/DaNWc4bBMnCDKY6j/pIuXp8FjGkGRBNsqw==
X-Received: by 2002:aa7:d6da:: with SMTP id
	x26-v6mr2892496edr.209.1536229783405; 
	Thu, 06 Sep 2018 03:29:43 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:12 +0200
Message-Id: <1536229770-29600-3-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 03/21] bzip2: do not perform upstream verison check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:43 -0000

Otherwise, latest version is reported as 1.0.2 which is less than 1.0.6.
Hopefully some kind of official homepage will exist at some point.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index acbf80a..6cafe26 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -20,6 +20,7 @@ SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/bzip2/"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 PACKAGES =+ "libbz2"
 
-- 
2.7.4


