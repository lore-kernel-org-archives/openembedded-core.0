Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 267697827B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:33 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id q68so7059067pgq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oHXFSzb+YJvY1DreJ7bbgKrqRAuBj9iDh+0pBLoV+Ng=;
	b=ARB4Kquud+7ebBr+xpgw4WW7lYponmf17obBBxSZcAB/M/XCCp4YE1tNV8dFkcsHdZ
	Zi5Xb7+FZnxJtLDNNGicna6e1tqCbJ41doBXAvkyJPGFspkvoCig6ZG46jrQpx/tmBSm
	aUV89purpgAGD8LdJPQniz7j6J+vM6wOwpBdGmD9RMLfbucEIlZ9a+gFdilO1+/3KDOE
	hOZISaySTRF6fKnVPgbLTl7ZypJfrCvFbQXCupj4YoV+mUJgxKyqlR+5su0lySg7kAhs
	DczG8LT6yEpFK4QwKTTRf58EWA47BUt3jy9P0lszQnZ10augV1cKXVNjrHWyazoyGc7Q
	FJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oHXFSzb+YJvY1DreJ7bbgKrqRAuBj9iDh+0pBLoV+Ng=;
	b=a5dH3+nQ7clIWMbxsGzXuaZwnIx7CcotGzdom2HN9U0G8QiG7IqvVwiP2lHGZRx5Qn
	zLldU13V1/J3ooWU8CdfaNAbgDTu0iqq/Bi4arM+7YEa+1gQW+pVy4JwPSmOjN5bV2Jx
	tvcIFJJogX1QWZZ0Kf+Oga8CpsXC/3BHALqwiVxq9d5KRo/7g+Nk51DVbmQZReB0N3eD
	EQYO3yju51icaoayAFfwkJy94qvr7L7c0rjKlySm66Hra2K9PmLaXxn5yBlCmojfjjMu
	Y95hOZGy+teN3+Jub39N8U/RS5+brDqEcBwhYv6rlXrK4LzWq0eUV6gMgG720lG1KpeW
	y+Pw==
X-Gm-Message-State: AHPjjUjfyLLMr49GaeOZh+VhpPySnVjIr6mPRIAbJCARYEGpkDCRJenU
	aImmvWlg0MkLVgWO
X-Google-Smtp-Source: ADKCNb4q3uCKsBmq+NhOe22NwuGdVlOrr3JpK9MyBvH+djaMr0GTTHvX1rG7SbWZVMyO9ik+xjVcPA==
X-Received: by 10.99.186.3 with SMTP id k3mr4621673pgf.149.1504912954914;
	Fri, 08 Sep 2017 16:22:34 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:49 -0700
Message-Id: <1504912911-23120-14-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 13/15] lsof: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:34 -0000

The official lsof ftp site rejects download attempts from hosts for
which it can not perform a DNS reverse-lookup. See:

  https://people.freebsd.org/~abe/

Fix for long download timeout and warnings from the bitbake fetcher.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.87.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index 5676cd9..f17a700 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -4,7 +4,7 @@ Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/lsof_${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
 SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
-- 
1.9.1


