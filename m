Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 96F7178266
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:19 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id g13so6591231pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JK77h3cY1p+msVqvJcQVOi2RJUOeCNc2kDpzqLVvEXk=;
	b=IwBLniwkwqGgXr2D0qME+VFBYXgYD4VmZeer71s0vr0GJNXaR5KZuNHAROMWEESOzS
	0AfQD+sopwTGS1eY0IhO+cCIFvZDoxfwE5QI2UWnuhVx13l/S2sM6NJZZV2JeLvA8+7u
	K3gzRe2O4i8nrU+YjWW/3hKJPlZFa78LA817K4ntgN6cU+5D1Pe/rMgTow9zVj+mUOVv
	I+KmE9OEF0ZKY7wNAq7ke3e9n7PJEo+wx0h5ROr9mA8acwuC/VjELZDNR9jXJ4Iq2fCZ
	UDg4uvRW133hcnGM6H5+tsgEoM5V8Ua3Xq2zec9O1wjHKq0uZip1hgWJA9A9I/VdAbSm
	jsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JK77h3cY1p+msVqvJcQVOi2RJUOeCNc2kDpzqLVvEXk=;
	b=Sh17EyD4ak6Og3fxMsdA8rVhNwWLSj7vCIQp9ebo/w8RR66TGo3NT3jZPz27yF7H63
	OtGtay5V81xmmoMsm9HUcoys8wHu1B3PPBdpNWxvEMwMyyNRg6UyDpArg9kZaEHCLl+G
	hIQ+/XBDnirNSi5pRC8/2yAm6T+a2ERFMXjttf7dxSyFwAdiir6c4EBy6quVFX76urlO
	/2KfZZOe3P5n3lDVq7kzOFqFVxRNmXN7okZR8zfYrZvsYVp/gtOFh2uhQQ81BYXkrXt1
	UaRGyiV4jRE+jFX2VBKCTSGvcdRB62U4kQHZItptnOWaFVfHAEt/KhxQdKw+UeEUoBb4
	PdSQ==
X-Gm-Message-State: AHPjjUgPes2eUjykB07SJ8xRA/zuBejAxXi4oIw3ifLqerH60tC0aps8
	tkz/O+JIaiOqH2YK
X-Google-Smtp-Source: ADKCNb6LISP4G6ltzbDi/1hF9qDaIOgaKREUurBb/ogFCw1xqSqA0iLQAZ6vfNNv5OOVHRzxxn6Kzw==
X-Received: by 10.99.186.91 with SMTP id l27mr4557347pgu.279.1504912940298;
	Fri, 08 Sep 2017 16:22:20 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:42 -0700
Message-Id: <1504912911-23120-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 06/15] stat: fix SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:19 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The old SRC_URI is redirected to the new one, fixed:
WARNING: Failed to fetch URL ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45034239c7e38ec991aa75d7c30417c22bfdef28)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/stat/stat_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index c9edb1d..afee06e 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
                     file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-${PV}.tar.gz \
+SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
            file://fix-error-return.patch"
 
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
-- 
1.9.1


