Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17E047E2FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:48:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l17so2130579wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VE6noGz74tkQoVDCchgwHUhoOY4q22kpKkNeZy22rD0=;
	b=Afeiladjfg2ZHOaZAqcOk27Gj5fbBastbqrUAdJzc2g8qxCCPZ5cngSi6mJC4sjwOd
	S1PWlrKkKpy/A9ape0ODsgu8IWR11Y5Xtkv6eNEvGi6+Ep795QDJlCrrr/QdEJzWkPfG
	oTNszhtvg8r8m9NV9QStPqOduLN9twmAlwrVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VE6noGz74tkQoVDCchgwHUhoOY4q22kpKkNeZy22rD0=;
	b=aO5f/sb9aPakGTDKxsH193jQGLi5qzCk5rXkzsWDq0aZtK+qieb0O4aJstQOqxkcO6
	403CvIoDeZus3SBOEIjzpqPeUyc5KRPuGTYmRY902Ve4NcCTT620/lnvHhh+9jwMhPf4
	xvHCJHCPBsM4i3XcrJL4yMWY4lUvtcHlhAyORPdHKldiZqXKqdZ2XfSOLnwG0/TxiK/g
	jjCo1dDxEo0EJ+F5XnF07Z24Q60LdCw4htG7GIcIeKRXyBKTT3k/5RaZ1eDgrpwY7qrp
	bbEXLz64+PNs/F6cavPGrMDpMbYI0ZmctHgCWlt7wilNL8aatjWOvqFGlM1wTobRItYK
	vzJQ==
X-Gm-Message-State: APjAAAWqlsAzZtEbSNnsuHQQj6hxUaIHJgd+EZYUaf81V2Q52ST1+EFB
	tN58Jf3Bx0htjTW1TlBCsGSNllZzqks=
X-Google-Smtp-Source: APXvYqx9ZpLPcD76c8zgmg+DF5x5sd8kLdU0VT7dnA3tOl7xyVv4SxcJTz4HWxQZV0NIhDs6bqy79w==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr40911344wru.87.1559144899546; 
	Wed, 29 May 2019 08:48:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm5593322wmf.43.2019.05.29.08.48.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:48:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 16:48:14 +0100
Message-Id: <20190529154814.2996-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
References: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/4] mdadm: Add missing ptest dependency
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
X-List-Received-Date: Wed, 29 May 2019 15:48:19 -0000
Content-Transfer-Encoding: 8bit

Without this the ptest fails, unable to find mkfs.ext3.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 40fe376a796..494b81b5e79 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -81,7 +81,7 @@ do_install_ptest() {
 	done
 }
 
-RDEPENDS_${PN}-ptest += "bash"
+RDEPENDS_${PN}-ptest += "bash e2fsprogs-mke2fs"
 RRECOMMENDS_${PN}-ptest += " \
     coreutils \
     util-linux \
-- 
2.20.1


