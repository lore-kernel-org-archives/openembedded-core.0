Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC6E6FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 13:51:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x9-v6so10546236pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gnjmJj4eAujQ/BMDTbO1jZWX1NQ9tM85ecjmY13k4fo=;
	b=ZZ/vZQyUm+6stbhEICcRArR/ft6sA/57D2PTeiI5Lp42teiAbp5oeg5gtAxV0RVK3E
	o2Qu4P1YzTcYMndXBMatgLFlrfgF+ysKtm+awvlfNdzj5Nu/9WW4Ie7xWb7gg7qqiLyH
	1yNJi0I4QxDRbYjelZgCvFRktVXBQewswuQNFmOrZYrM5W/Cn09R2frRoe65Jz2BEo3l
	Oq7juO+Vz8Z01rgSl4stOv8uQ0HtrxFo/Dt2B6ZRvZROjZuQiygaJ4U5WcX5nYUHA4te
	S7WlU5u5bDtc/vvwA2Uj6k0bDtwppuNyZlQbQ++qEiRWG+1VqJM5TO5FECAcJ+RQJF/X
	qsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gnjmJj4eAujQ/BMDTbO1jZWX1NQ9tM85ecjmY13k4fo=;
	b=gFxZuSfNbn7yLQIf+bKXjOBA+l6l93NFpE1JgvRZFYga37Mz/nf3lGxcNywnj2SKpf
	H/uZpSWcATisK5tIfrV4qHp+cOqeowppHkst4cU77KF2BQWVLi8j8Sbzjo5kPL9DiO9s
	f2j98wOuZM0b462a1xZkAMk+xmjysIHKa9qoPZEnHpTF0F1ZBGvLVY0wYKOaaqwk4wp1
	9k0lW2krHkugaNc3uY8wA87D9XO+g9BY3yGkWC2nG8qK7XRkKlU32XPJqJUp4VGzMDJo
	DtMGtiyywW19qxhpB9c5nrPzBjGXyk/koTrGnpR6OVpvUnIqUWl5Pc0NPHHOLwt5uq6d
	lkXA==
X-Gm-Message-State: ALKqPwfYRgx2sRDLG6skXZet6AKWawSEh2l4GWRfJE0FHJYL3DZoH5cu
	omVHkrD3pC5zh1F3WeRHAZmJbIWm
X-Google-Smtp-Source: AB8JxZqYUNiV6TLbjIOfIvnC5g0stUlMMIvq+Dxcy0ljn7EJUHM3+yErF48DTF+Z36bJ460f+9gt7A==
X-Received: by 2002:a62:bd18:: with SMTP id
	a24-v6mr2968934pff.30.1527083466795; 
	Wed, 23 May 2018 06:51:06 -0700 (PDT)
Received: from ip-172-31-26-116.ap-northeast-2.compute.internal
	(ec2-52-79-39-246.ap-northeast-2.compute.amazonaws.com.
	[52.79.39.246]) by smtp.gmail.com with ESMTPSA id
	k64-v6sm30056542pgk.17.2018.05.23.06.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 May 2018 06:51:06 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2018 13:50:58 +0000
Message-Id: <1527083458-6619-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: upgrade 4.15.0 -> 4.16.0
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
X-List-Received-Date: Wed, 23 May 2018 13:51:06 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_4.15.0.bb => iproute2_4.16.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.15.0.bb => iproute2_4.16.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
index 7942bbf..4b0e893 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "0681bf4664b2649ad4e12551a3a7a1f9"
-SRC_URI[sha256sum] = "48d4616a99d7b609b7b795c0ae8ec57099fb0271ed89253e8772c02327798355"
+SRC_URI[md5sum] = "1f12a70d767ef77ffa2d1a0c4ce48f1a"
+SRC_URI[sha256sum] = "0c5c24020fd7349fe25728c5edee9fb6a1bc8a38f08e23be5c57a6301e55ee0a"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


