Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 61F936C5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:57 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q26so9496386wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vJaUHbijSTavIeo/ivKsiZD4BAFN/aO9rPdSPE5Cj8I=;
	b=NMJtQIBSz/nURLg3gJe94o5WmRRIFapWGHRmCE1eTKex4dem21oFAUOqwa6hS5l2no
	JF7SO2KS5XMKLCMrtj+ScJJQJ6BvbP66HFLzg8tjjMDT/Aao1s+jY59/1Mfzo6XzA6xr
	Thvin95wxraUaRjrpkVz5peqf9WxQGcN4mTVEmlnc0zXRfMYUcOYKZqShjPOZhLaF/6X
	I0i1A31mIM5X7JuFf8ewwSLGEuUj7vnk3JokSKgIAGonoNEiBugjhAtETNfSnSs1VMLD
	SA55N7bJvhPLijvZPj/5iziyhwjDPl0hQDGHHirnLxUbges3lwPYvG2VK5yzV66e+HCI
	4ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vJaUHbijSTavIeo/ivKsiZD4BAFN/aO9rPdSPE5Cj8I=;
	b=aG94pCa6jjC0f0dTnTxyKVBbeteB5SBfEbK4kfZ3PBbCefEowBWKLfdcz/ltvZeFv2
	yCbDLiyd54PBa4kolNyzVplJ3eKkY7YLXw/r879nRmpSA9ANkT6yxy5U0P99RpuIxdqk
	1s3qKFiZ7Sy6Oi37yT9t8Mx0elpKJRyopby9qJGIPrJ2tUKNF5J8B9IHyXx/IKnk4TXZ
	O9XZV5hsikIdH/5VR2yJI89ctVK45dPoMwbTxUfDfrdYAJLnyx6yqte0oAjLynDGb0sc
	UExG8aKotsVuxL1xitjA2mAe1XEctrYzmtVVlg6Vv45mS+n2lXdO8W2U4aARuWfuA/rg
	u4bg==
X-Gm-Message-State: AGRZ1gL/xYB6NisRQAR1zAHT6zu/YwlFFZI5/gsIw6LRR3mXGQ10vEgY
	kJsSE0VZE+1A16QzwekuCbabNnNM
X-Google-Smtp-Source: AJdET5dxQpg7jTBvYb+lVh47GThIDlo9FZW4X27CywgWS0oOrdOe+jSjrqDRECyjoqdPe61CCzJ6sw==
X-Received: by 2002:a1c:8fc2:: with SMTP id r185mr10016892wmd.54.1542901317886;
	Thu, 22 Nov 2018 07:41:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:29 +0100
Message-Id: <20181122154136.121480-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/16] vala: update to 0.42.3
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:57 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.42.0.bb => vala_0.42.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.42.0.bb => vala_0.42.3.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.42.0.bb b/meta/recipes-devtools/vala/vala_0.42.3.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.42.0.bb
rename to meta/recipes-devtools/vala/vala_0.42.3.bb
index 2b02e0c8404..0d11ff6ba76 100644
--- a/meta/recipes-devtools/vala/vala_0.42.0.bb
+++ b/meta/recipes-devtools/vala/vala_0.42.3.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "aa6eb8097d25b5847ad3fab34c0ff865"
-SRC_URI[sha256sum] = "62a55986da23cf3aaafd7624c32db2a1af11c8419e0bb0751727d10f1f7ab7be"
+SRC_URI[md5sum] = "6fdd6fadbef27e3dd05086d6a3220556"
+SRC_URI[sha256sum] = "5fc73dd1e683dc7391bb96d02b2f671aa8289411a48611a05265629e0048587d"
-- 
2.17.1


