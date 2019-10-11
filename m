Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id C2CDC6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r3so11587148wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FkkP6h9q9oGqRVRmZ8lX/hVUGbqd+34nP5n/8DqBcx0=;
	b=AQZXEAQUfPKC0grZhz0MF3C984CDoXNXtjXw15veSHq3wbCo7Sug9rjaAY5BAqpoQ+
	VT+n9n3FRgZYryYoMQ0DlOuoJB8yKWID+cAUSyDLMbyRGmAUoBnvklgDYIkIg8OKcA8Z
	potn3bYBAjbReAYPkGfCUrJwAFp1zjS3MRr8bK0piSzrjQsK28x0wFE9655EvMY6DQMc
	0X8oRjcl2XaAfB8q5AZJ0t+1dGB+Ozo03hlVTAXo8Mbm9RoE6BMAhiARAe3b7ShhIqfs
	ed0itQaEmE+CugKY/2QK+BJotJnrenbK1LvBrS/nouwQU3iGArIv/FmF6cqEd/bMzNli
	UNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FkkP6h9q9oGqRVRmZ8lX/hVUGbqd+34nP5n/8DqBcx0=;
	b=CN97ALSzsY1nrgalJunFQdUaj1MEVXN5zoStj1s/W2o+fzHwvd8mGIGSBisC+Ub7Pi
	L6wkP99bTQ6F0C6DsectRx4ugn9/85ExmSGsvywE1FrVXahuhOPr8iVTyvd1iAwqMgBR
	eavHJEY8XMn1K8+DtnXaxtogj9OaXrtyXjPj9xRncZKO3grez5K18gAm6kI6XMlbbk9e
	277VCMGuNMAKXE56sVrBYVMl2o44i7zEdTFzwZtuU0VDRQyRYFIC8lJJm/DPtUT0stlW
	ARSALAL/U2kryeOISE4J2FVosH33lqD1kLHpNG9MxYAl4u5JOhS4gYdcvRDO6q7RJyBl
	NCGw==
X-Gm-Message-State: APjAAAUz7q0LDP+N2WBRlMJed+VyGujK5qeVvTICkPtO8UPnIrWe9hCV
	+tUiiP+4jhVZrSH93wGooewbe/ix
X-Google-Smtp-Source: APXvYqwy7gXYg0Z8Ve6Irw0e+dZwA9yaFNCroHlwP+wVvO57hChxlSh8F4N/SYf8HdP31HmMOBXpzQ==
X-Received: by 2002:adf:94c5:: with SMTP id 63mr13730588wrr.199.1570794486378; 
	Fri, 11 Oct 2019 04:48:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:41 +0200
Message-Id: <20191011114754.91740-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/19] glib-networking: update to 2.62.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:06 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.60.3.bb => glib-networking_2.62.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.60.3.bb => glib-networking_2.62.1.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.1.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.62.1.bb
index 0278ab2fb68..81d3fd43d9e 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "e8fd0462a82269fb4bbd6c07a1e7d0f4"
-SRC_URI[archive.sha256sum] = "d50183046a4ff955d8cc7e953067cdfc94f14dbfda3024bf377ff37a3121dcd5"
+SRC_URI[archive.md5sum] = "64ca1e1e43e623b916059585bf7e4758"
+SRC_URI[archive.sha256sum] = "3c55ae6771ad7a79fa606a834f4686ed555c2774ed6e9ece6f3c0f6a3dab7110"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1


