Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEC86CEBC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:13:33 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id c11so9013206wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yhvQFMe+Iqg0bkevzqiccDYa+9s7dDsxQGUBw7mQqjQ=;
	b=bLHCfEM8lgNkD7ImUeBT7jKwhzULQJtuyRs+chnGJN6XzVB4287AKpwrLVk7plWn02
	MQr7b5hxs0ZSZmVBMBc94TPcpK+GH1/xJpN9bXKmgYGpUQeylJr+XTyfUulxU37VAc4P
	axNi7NCdn+08IOavZW0cDp5VX3HVuIAYXe3D0Y7GSt66+6rr6Wfn1FXnDDVGVWslvYAc
	CmL4j6hRveOSKMrFRPeF42CHOnDr17IL0OfzeVbkRi4C+jZ9tfd40FixKkb4/GQhvcB/
	tQ7f6Lxwpx+qvLX0U1y2p7TuRKbRcTNg5vcpYX3JXCmb4SwpJDXdCN+iQOeqvd1awWvV
	3LxQ==
X-Gm-Message-State: ALoCoQnhvGhXLRQvYk2AjZJOJjku/MpWPSO68+q5JlLLPA/97Mn5xmyXPwCIfZKXce87ZvKfEvbP
X-Received: by 10.194.175.193 with SMTP id cc1mr2011242wjc.54.1381241615032;
	Tue, 08 Oct 2013 07:13:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dq11sm5551459wid.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:13:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:13:21 +0100
Message-Id: <1381241603-29429-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
References: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] libmatchbox: remove unused configure options
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
X-List-Received-Date: Tue, 08 Oct 2013 14:13:34 -0000

These options appear to have never existed in libmatchbox, remove them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index 244a495..d162a78 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -16,4 +16,4 @@ SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
+EXTRA_OECONF = "--enable-jpeg --enable-xsettings"
-- 
1.7.10.4


