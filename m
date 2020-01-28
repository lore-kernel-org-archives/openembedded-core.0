Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA457FED6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:16:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a6so1844215wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dBGCPaGXTIs/v15XhpK5Y+6Nki4FDcdLIqa2v9jVmsA=;
	b=JHn9jSgOK74DYdC7Q/2m0N5XNts9G6UvoytmFpzvH7uWFzPlzAJ/JQL9dAjwCNH74Q
	ONuV2z3IwMRYtwesloCB7W9eOvtqT/JvYs9ZIQ/qB0cv/3/MoUHwTKv9N5j6J+1A2IKR
	0LJav7BEU/9lLJlqdIkM3Unuvh7KxJ48e+5TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dBGCPaGXTIs/v15XhpK5Y+6Nki4FDcdLIqa2v9jVmsA=;
	b=b72QypyI/qEWuirVAs7JocQQxdIoqwi0+XHYFXl2b0oUVS9MTzRrFN9GZZPpccu5H2
	cTKKrYxdlj7wKCFrXM5BTWqo9hqrEOO1SUPjO7r1Z7nB4uN5YAmlBFrwg63zmOPVbh12
	gMrsl73rLp0plMSOhDPvFTA1+Nn3cc8Y98+DEqX+oEtcERePb+WKdq4SMMzPxmFP4/FQ
	QH3Y/o49YmuUiYxNuUN3Z/NbW4adDKl2RgoWIcntqN7P4ufUmp262fzp38rLDQ01g1gg
	3QZcsUAqRyJCyBnhh29SephTobrxh/vu9aKaBmtb1evGQI8zI7DY6cfHSPJXsdjMUy0a
	KAXw==
X-Gm-Message-State: APjAAAUJhVPtqgQGiUPJTAvEFNAhG1SHlOdjhtUHMJI8cM46vT7SyGbW
	kC9oYIJO+o+Oc8dpdSip/UOCiAQcCCA=
X-Google-Smtp-Source: APXvYqzfR/Jl6c0i1vBHoo0KpEK9uq6FbmpqOWjNNpCiraEOhn7gtvxg2PsqfY4HLfms7dSDGy7hXA==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr30683290wrp.71.1580224605130; 
	Tue, 28 Jan 2020 07:16:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm25711302wrt.1.2020.01.28.07.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 07:16:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 15:16:39 +0000
Message-Id: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] bc: Use texinfo class
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
X-List-Received-Date: Tue, 28 Jan 2020 15:16:46 -0000
Content-Transfer-Encoding: 8bit

This recipe uses makeinfo so inherit the class which can provide it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 4a51302492d..61fc6486538 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
 SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
-inherit autotools texinfo update-alternatives
+inherit autotools texinfo update-alternatives texinfo
 
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
2.20.1


