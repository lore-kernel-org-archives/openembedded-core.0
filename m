Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D09F27DAA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:58:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so7106473wrs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XYQLIpWzdGmWX4MUWUbud6f3JZoqE9o3NK8p1voEX4Q=;
	b=XdajbBuiGh65YnzimlO4goZBCB7+nGZLkSHBJM1PmKGb6fb2iWBGdaO9oniZNk5bFo
	dg+lU70oEteTbtY1cRM9n5B7N9R1rhQz0+s5w5gm0KQ8khTedJfvrtF3cNeshO/ZwnKy
	S+FNuzta+DqwQ6Emrpfg2Zmx10E09T4ka3XA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XYQLIpWzdGmWX4MUWUbud6f3JZoqE9o3NK8p1voEX4Q=;
	b=b5/BxSEXHxBSZFspjYZs0nV9ZG/NsPTJ2Qorv6tH1wUmOFiPMDbWkUB4g2015q4oO+
	8IizF1P+sUi7Z3zpoTBk4nxCmuWXsOigqKcoST6UOsxo5FWujftY1FR5bZMl/2milOD3
	ZNCZdVp5X8qyBtcM0L66RSjb2N8d/UFngPCWs29J0xRU9Y4+/9u+IFkZjQ/DooSLD9L4
	WukwNhMFlSgUQEHA/CeJOAqEK7wQCNi0fghKQc1DwMVp9TpPk4gUxaHOaD8QNGRVJnk2
	FpEYcyhXNXqactA07Clk4xybPs/tOtE++b6Fjbf2OHND5b353XXsgyqMF/SHa7TmPz0R
	HpqA==
X-Gm-Message-State: APjAAAXJTIrsfMlTNxfQwI8GXZW9HgkGZgNqfMcTjVohTyqMCP4DwoWu
	ZYmRQWZdixoiyHuk7kgmCdE7/nPBquM=
X-Google-Smtp-Source: APXvYqx7FrHHt4DijhvoA/01CGoHgGwRUshqXLKQ/jsbsx3AhPo/3KRfiI2YHsnyktysXXTh5hjjuA==
X-Received: by 2002:a05:6000:9:: with SMTP id
	h9mr22261668wrx.194.1556539099391; 
	Mon, 29 Apr 2019 04:58:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u8sm9634172wmc.14.2019.04.29.04.58.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 04:58:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 12:58:15 +0100
Message-Id: <20190429115815.20734-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429115815.20734-1-richard.purdie@linuxfoundation.org>
References: <20190429115815.20734-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] ptest-packagelists: Add m4 and gettext as 'fast' ptests
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
X-List-Received-Date: Mon, 29 Apr 2019 11:58:19 -0000
Content-Transfer-Encoding: 8bit

These new ptests run in under the ~30s criteria so add to the list
of 'fast' ptests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 768ba743ed0..52f7439e252 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -19,6 +19,7 @@ PTESTS_FAST = "\
     gawk-ptest \
     gdbm-ptest \
     gdk-pixbuf-ptest \
+    gettext-ptest \
     gzip-ptest \
     json-glib-ptest \
     kbd-ptest \
@@ -37,6 +38,7 @@ PTESTS_FAST = "\
     libxml-simple-perl-ptest \
     libxml2-ptest \
     lzo-ptest \
+    m4-ptest \
     nettle-ptest \
     openssl-ptest \
     opkg-ptest \
-- 
2.20.1


