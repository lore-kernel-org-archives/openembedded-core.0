Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A311B7F2E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z1so95500006wru.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VIhe/XpcZxhj5pZINKmS/+/bUksyGdQ5gYzxG54xFmA=;
	b=qLOMQVOO8PkLtzeEKLxlx065HlQdquc/i8a7PC6N4LCgaedI+FLQ1GhVQ7FsKcOnnH
	iTrJ+VlTO9xm0WN+1LggcvOeVhPI3rh/uefUfguAuo4mAw4kLpYK81FjFwuTCh0PXbUT
	btFBuM4MS4kxJkngenrjXKLUR8/6T+MGQOjtcXDq/BWNd3yXG81uIx2Hf3A2NUAE374M
	NIv0GkfwQvz4eMOmyStHOZacgrfXYyjD/FvqhYDW3QoZfvBspeKo1pkkALTLgsbYTj5I
	widZCGLWZluyfg5zQr5o+leXwMp4OZ7daUT3SyvfLCPnWRblZsz0WFxEcDv4LnxLHOZR
	0u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VIhe/XpcZxhj5pZINKmS/+/bUksyGdQ5gYzxG54xFmA=;
	b=PAQJyqNOmSx2k4iwzMI6dQ9CdC+WpyxtDidgcedMP4QVLrFmZiBzDITwHNyXlLzHar
	JqUoHR+goM/dsr+6efgl1UNKyxzhBMYHIdBcmu1tolfQXUD0Y9MGk9CI328OzpXokPoY
	lz8o10kYObo4YFbLKdbZjDzXLqnSTMNZ4+58cQ9Q3JrOXX9zUUUBG1JhLPjHaPtjhe/K
	1DYFwk6QnoPWu+juYSDN15iIXHE+3wyZc6TLGzPYCFfmJpNvnQffsaoN2AWj/SKGb36D
	NoXC3cOTUSArTNE3gbXyPf5GjCNV73XvzZ9MbryZLq7lERn4Ag5EuXnbho6sRqwN6nST
	TWgQ==
X-Gm-Message-State: APjAAAUzG71aMnEGTkfdOHpwAk07j4MxG0WyvvZ2EYrDjfXibFQuZUWU
	YjHNBRD2uTuwuATBgc5hs+Wmc5x2jgw=
X-Google-Smtp-Source: APXvYqylKtYR8JAPPynZgDjjpHYRFEDNxfG+p5Gobi/grgrQp1f8WfwIKnVouwmGUKU3y+FE//0UKw==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr18721464wrn.269.1565280720277;
	Thu, 08 Aug 2019 09:12:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:50 +0200
Message-Id: <20190808161150.44877-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/7] python-nose: remove the python 2.x version of the recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:59 -0000

With removal of python 2.x numpy, nothing needs it anymore.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc          | 1 -
 meta/recipes-devtools/python/python-nose_1.3.7.bb | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-nose_1.3.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 08fd83d3c4e..a595507948b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -587,7 +587,6 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
deleted file mode 100644
index fab609df901..00000000000
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-nose.inc
-
-do_install_append() {
-    rm ${D}${bindir}/nosetests
-}
-- 
2.17.1


