Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C186795F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:43 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p52-v6so8456890eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qvjZwhKV2kfrHJPDkbGrckmhSbob6C6Ig1SrtlkZyQY=;
	b=savSsNxgglWQkehfPgOVY6LWmbAi4Ny/zhQLuW2luazGaSjMsXOFQ7Zdrc2SOEwTiN
	S6z0ZhKYGT0sAXRYCNzpNtpLBjMoDw7wPq6ga/4kJjHOllO0Yrps4bKT/7qbHH6OR2Ip
	L7EqgK61IFROqUnqOeGMrWDL3geI3CYXK0VE/TeBPIS4BWs8W2mWgpI6yPp1jghmF01J
	tMLc8wcH8Qh/qr49WPzHe15jpfhEaihlpcnVYoZQvrGX/1VkJC4fSxYdFL+AC6//dVdv
	sfM4vf9/n0Dz065q7+BNiPcYUK7Y2Rj03dP+SGeo1B0jElfKteOFku24vZwM8Ica+RpZ
	jjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qvjZwhKV2kfrHJPDkbGrckmhSbob6C6Ig1SrtlkZyQY=;
	b=WOO333oha8/6roOxx32/9SIDYVEW/SyAPObYuoiTOKEVGctKtT9DujdzSR14pJn/P+
	eT7WuoMluLw4a5Gpoi42LUHy/SZ+4FFO+p0qk/fBw2IHgtovTZOessN/BuRZdREypBki
	tzj0sA7XjfTuWq+QJA8VOGTxEpWz6JaKvzo+luTZp1Zpevgs4FuwFQCYLIxPm2BVqpdb
	ciLu3C8pkHUW+hfnLHuU+LU/v0hoS8iuoEDnFfL37TDEB40gBiGSra5opGniR/BIdqRK
	tn9fyiD4rKvLElkPuQzQfLqaIT2K8EWzh13WcwTvPextPwtZ5UjGbjJbCM6e34GnV88/
	HWJw==
X-Gm-Message-State: APzg51CKYL7IaQSK2It8pLFM3s2w0jqrSL30+CXsLlEh3VMDLUB8NAX/
	A3+bFOQ/JpMt+AtdIyUVMkPrfSCA4EI=
X-Google-Smtp-Source: ANB0Vdayp7Z1Pp0ntiLZ8ZxUPJ6d3CFTcGn4Vso4wzXOaqBET969PWrotPbeN4RSg+P+5PiWDWU5Uw==
X-Received: by 2002:a50:aa3b:: with SMTP id
	o56-v6mr2856809edc.23.1536230443911; 
	Thu, 06 Sep 2018 03:40:43 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:19 +0200
Message-Id: <1536230436-30342-4-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 04/21] dos2unix: fix upstream version check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/dos2unix/dos2unix_7.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
index 9964315..9a71270 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
@@ -9,6 +9,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 # Release 7.4.0
 SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
-- 
2.7.4


