Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCE374568
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:49:51 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id z4so3566214pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v3uSor5u5QRZvfnfTn+gVbytdCEbIqEPom1pWoEAQW4=;
	b=RhxGdeR65Xk5Ia7jg1lEUzHxQUQ5b26GOvH5pfnL35/pnzV1xJkm4cEKJu8hdSIQT6
	lPAAOn39uj/8MC6dV1Q++h9OJtcqSW1dLdI6KajGjVqutmRjtNKbTSldMnsyvMKdK4QY
	xk6dGsZbMxfMAiEOr9DhsAXWlBlHz+4teMim+5FhXSZNlJO2OlT6JTAbiVCVl7gzKlNF
	Asjsxp/nCxSbA/NasyIZr6EYUsLpvfoKH39h2S+P7UNxJo349OeXk4sfzEYVr6c/ivtT
	nULILCAhqVrdIUz6vYO+sEVUsDkP94vGL45D+9kOff59YMoCVvIXqUH2mSW7fpPkwQnP
	FqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v3uSor5u5QRZvfnfTn+gVbytdCEbIqEPom1pWoEAQW4=;
	b=Djx0hfyj8uYL976Q6/ONGy8bohdFcdabnLwQ4ymXUBp0iOFIO7tSo+JqSL4P9MEEBK
	PPyt5P3QLpUNZVd6B+iNCWVsQwtokB/fDxZb205Kfx9VrGrCQZOODE9moScDzRoep5v3
	sey9Bt9+valCJumoubRntVh40MdG78K0swT9aC8TTdlZDufN9sfyNqThqQ67l1mXU4ir
	bEDAqFLkzUhQofgPAE7J9ISr5IDw9hTwxmcrVjj7aP4t32AX5/woxckNVwF433lGTqc5
	XIInwadTIqdQDnhiHj+VHxzDphl0QzksgncnYjGbwTt4U3hO6nkyWxY1hvida7cFez5O
	0WEw==
X-Gm-Message-State: ALQs6tBp/VpZygtKJhmBR7u2IyuwRKpKVJeFbHMKHzGC5EBq0QvLCBwc
	laIfwM6RDSiy0hquoF1Eh5i2GA==
X-Google-Smtp-Source: AIpwx48K8L1wceGgUc1YHpqyeJ3TGy0c50wZlvTglPkvYuSvgeTlapra5gWGIDzYDgnLXGfrmYvi5A==
X-Received: by 10.99.123.93 with SMTP id k29mr28275722pgn.249.1524764992652;
	Thu, 26 Apr 2018 10:49:52 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	l3sm41884698pfg.49.2018.04.26.10.49.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Apr 2018 10:49:51 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:49:41 -0700
Message-Id: <1524764981-2774-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1524764981-2774-1-git-send-email-armccurdy@gmail.com>
References: <1524764981-2774-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] tar: control acl PACKAGECONFIG based on acl distro feature
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
X-List-Received-Date: Thu, 26 Apr 2018 17:49:52 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/tar/tar_1.30.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.30.bb
index 3f31622..bd24f47 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "87592b86cb037c554375f5868bdd3cc57748aef38d6cb741c81065f0be
 inherit autotools gettext texinfo
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG_append_class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
+
 PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
-- 
1.9.1


