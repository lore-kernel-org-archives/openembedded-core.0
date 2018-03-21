Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 99E4A78955
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:49 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d1so1439352pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3opJ0VDxb6x1vAffnG41LH198Idj5VQDtFD41VVl3yI=;
	b=VLenEq+nCl9iNUmvI4uT/7DTRYJvgbOuM/nNhUyUOa+RLuARAIsxKd2mN1KNaTa3Uy
	tsU8FSzoIfmmP4DJqAuoS9nHFvTNrkuSbc5Z/nFzn9q6OOlLve6YkkGZ7+F6Ny9q8Ana
	g/280h8k+hgima635Mk5Ka9BcJQ6B2XGjV63YnPbRURgval8FCxnLjSvaKFuwhlHNQWN
	XBU+m69xh3umhBiATlUOWpB7RANpTIPPHjILtyR3N5PPG66C91mm+HfXZMT7y+x4vSMS
	/9KMBIA4jiWqy+xhmt2tTfH7FeKVSs3gPsJTlulsOCiVtKdKoY0C+ItXDD572q1U869R
	DHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3opJ0VDxb6x1vAffnG41LH198Idj5VQDtFD41VVl3yI=;
	b=U0cwVLAQ9jO0KfY1yzQ4di6c8xXo2jPZBThy0kXvf+CkuQGBBkQwDEaXLeAMqdpjXC
	/bcVkPTT7pF0uRkfVzGd+gUm2fN8BzVDsI0Bd9iVTK0IESVqTQGp9JXdHUGJ7jhp15LZ
	dIa4mXiURVTtw3PWPNOYlq5uKnTf2HbHQWAf+dhvsOFtEJK7Q9gilEY2hTcok5E1qIgf
	Ui0fmoiSreGa+ZupOpW68ZHLeg9TZ/vfg/RJOx/U/OXB3ycZg1aRyqk7ih+6jKv/0Tzi
	/+UwFAQTrJkPRZWnnInyDgYA4g1CSu9mJkPG2fdbGdJ0ABu9zA5FAezD8oQ+nZiuoUqQ
	+l8A==
X-Gm-Message-State: AElRT7HuDdOVNkJfqvU0H9PZFfjAIrM5B0pH8p/5Qf3PTqZ3EyN54/6e
	l9hmrUDqU5FiIUvAxkzC5rS7YQ==
X-Google-Smtp-Source: AG47ELt6YBMbG3WoSzveN/cbS/XTSHzCYJNbDpalfBaKCdHExEiwI41Awm2E4cESy4CdVImjGWKTKQ==
X-Received: by 10.99.120.74 with SMTP id t71mr14056902pgc.310.1521600170398;
	Tue, 20 Mar 2018 19:42:50 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:29 -0700
Message-Id: <1521600149-3894-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 6/6] mesa: fix SRC_URI
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:49 -0000

Switch from ftp -> https and use older-versions path.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_9.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
index 737ed1a..51a22f8 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+SRC_URI = "https://mesa.freedesktop.org/archive/older-versions/9.x/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0006-fix-out-of-tree-egl.patch \
            "
-- 
1.9.1


