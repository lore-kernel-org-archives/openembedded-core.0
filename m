Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id DBC787D848
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:56 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e67so4416296pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wvHAeDXS9lx0xgbbLGjwyvjyd2VvW+MzlpXSo8iVNKM=;
	b=gCcJADed2osTh6SKS/J7RQcRT0QbKrKLgpkXjUOtbCT1DgOpX4t2x4NV+3Ha9nm7Nk
	FL7Tbdt67dqqe42bYeUA71BgkahiXnsNUh0xoFQY//8bxKf4i7f4nHpUQmUCiKQvaT85
	zmg4+Q4ypKGHlO2XR1Y0bQzshanQ3bq91/QACDLox2Zhe1+N2yr/si1oglBHxseddQYr
	yVNAwoIWwSgR/lo0ERX2ZMCH8yc6Ju8p9K7uqZvW94q68SPmyxJPccmgbxFdpl1HGHhN
	SRTlF+XrkVaonZrYtpNH9GlJQ0vXeZtjlORSCQLbF2MsULw7VPZn4i6nTARkYsMyDtWB
	dATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wvHAeDXS9lx0xgbbLGjwyvjyd2VvW+MzlpXSo8iVNKM=;
	b=YCkIaeR9qA7Ws/RNM9qrgVO7Odh96tFFJEnmkF/4hZHUja7WLOxKC8nCrlhGZD2sFZ
	10ul/Z4dXfBq2X9OJ3pcDv8B2EBeqexkB4VUHyp5mKbp1wap9Jr2UqHlEjVnMIXaIQS8
	rORNDLvMt9BFsIUDquLzyHf4WhsHHzhpISpBv3RKxaxGNvzSWqGRLD70x5Z4MZZaKtN9
	Aqe2kRa/xjbhICLe77K0KtMtvpjF18IIQy84avUTxO0BA65CknFRdeXLRpw1ARp9v6NT
	GXkhCvWV96jtJ1gZ+HXzkEs/eh4Ep9TUnM/F1YUOFUZCe8Lqic35fh/xH1YsvYmUm20M
	QIiw==
X-Gm-Message-State: APjAAAUgEdPB5n41KxtrymAteuE1jZ/6uuRt/4pg8ncNPAosNj0qkZNr
	M+eAsTAvXE6r7Ih1bbxdksDl7bhe
X-Google-Smtp-Source: APXvYqysSI2QDA7KezqwcVhO4ALerV49s2Vp031IZ6y89MpfEQc+2SnbKxLD7sZYMHm4IUI8GgolUA==
X-Received: by 2002:a63:2c01:: with SMTP id s1mr846581pgs.261.1556983677996;
	Sat, 04 May 2019 08:27:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:08 -0700
Message-Id: <6f0dbd81ecb998904ee58e1e4efcdc7a0e087497.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 32/43] linux-yocto_5.0: set devicetree for armv5
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
X-List-Received-Date: Sat, 04 May 2019 15:27:57 -0000

From: Dengke Du <dengke.du@windriver.com>

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index f34cc7b..4ccf907 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -39,6 +39,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
-- 
2.7.4


