Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 48E357FD6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:03:00 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k4so7036494oik.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3wLsYaQlxBE4K9daiMYBY/Vh2xfQW5n2IdPGdPptMMY=;
	b=TgEfjFa1IXQRhDLajzusrlO7L8NUjGthGSidrZApm0zjGpDEqq2GIkmxM4pcrgpDDE
	XxEvHBySiXjM49u0VydqEfMhazGOJKCjyorg26x3MMMDdy0zin+WM5tAk49HMcxxgUJI
	Nfb12wmPyLrxo24KZbhaFCrgVK5XlVfMcOTZdzmfWR1LibjHcyVrB5StmiuWwrL+aLwq
	+lSNAWe+1btXl3EEzOcjNFxirWfFPZzTWQnmOGH41OJ8fp86LBFV5BB/7ANwv14cbZ9t
	Xd3sKYfVqCHrze53pt2j2R48+OOjzyHYQs0AKLitKFA0NaiexdZH5omxTLaGsUyseT7n
	0swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3wLsYaQlxBE4K9daiMYBY/Vh2xfQW5n2IdPGdPptMMY=;
	b=e8CNPsq/lA4HPvX+hTjnoG9nGuX+FNY71jHUM5HQGNVNrl1GsSrUDZwBYhjL4EazAV
	2y0vvCaMtVIjgxLRq34L42H4u1e0xCFoEoZagGvkTjiuGb7MUzHZ9Yq6CikCmzfki8bc
	0kih+pWQ5AOvhOXERv9sDIFftO/+bHvSHVnnA2WgjrVXpuGX+HVabo9yveUD8RFesd8T
	hr2Mm89/rue0135Hs6dK1b5Qw3LnTT9el2ch88f2vdW6asUbgiiQVuLUAXt91om2ehoe
	NbENkGis8344E/ycZZOm32ItZ2iE+UzJ426uhmoS+Xoea3SfHD/m61pHZ4kaIYsDyzex
	EWrQ==
X-Gm-Message-State: APjAAAXG79XLp2bdAeUnsAEk7fYb5FRl/k6PEgFlnGgvMErdTbJ703Tb
	aKnD6dGggeTvkLalNx8HUV3wA4GD9Ow=
X-Google-Smtp-Source: APXvYqxRZDbBFsyz/P7uAsBgCPnNKDCmKazoFFmgMwGngAj2SyNxXS1jaEofopps62dg2h8o7kZ5cg==
X-Received: by 2002:aca:490e:: with SMTP id w14mr4558133oia.67.1578600181086; 
	Thu, 09 Jan 2020 12:03:01 -0800 (PST)
Received: from blackbox.rga.ip ([2806:109f:4:e36:908a:c7ff:fe6a:e9f5])
	by smtp.gmail.com with ESMTPSA id
	x17sm2508796oix.18.2020.01.09.12.03.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:03:00 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 14:02:58 -0600
Message-Id: <20200109200258.410279-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] meta/conf/bitbake.conf: Add BB_SIGNATURE_LOCAL_DIRS_EXCLUDE with VCS
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
X-List-Received-Date: Thu, 09 Jan 2020 20:03:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new BB_SIGNATURE_LOCAL_DIRS_EXCLUDE allows you to specify a list
of directories to exclude when making taskhash [1], set default as common
VCS directories.

[1] http://git.openembedded.org/bitbake/commit/?id=923aff060d8aba8456979c35b16d300ba7c13ff9

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62b5466b71..b3688edd9a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -885,6 +885,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
+BB_SIGNATURE_LOCAL_DIRS_EXCLUDE ?= "CVS .bzr .git .hg .osc .p4 .repo .svn"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.24.1


