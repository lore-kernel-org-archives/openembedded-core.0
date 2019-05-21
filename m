Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8C607DF94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so34795wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qgadRS03rjljhEqcsqmsF2PbVBjDA7X71IxjiH9kaeE=;
	b=cofp1oOu46KYoXsWfFU3L6qo7Vhp2y4YNjMxJFu0dwMuaXub5UjqNVg3FY0Yy5DSo0
	KFPUoIX0Z9FjmhvO/XBN29dBFtQXGqoq+M7YC/rzbH0DsKhxxfrz+1qpWBCyxZhhSyLr
	7+t6lJGM0dUV7UZtp4R8GoptIkuYNUcBkL6q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qgadRS03rjljhEqcsqmsF2PbVBjDA7X71IxjiH9kaeE=;
	b=Sr6Fv/IoxoTRcVqQvl+Hhf83bCw1E5xCs8T+IR3Lg2xsK2+01ejH/L891Oo8iAAquk
	v3t3E119IPU56WjvJ+pUmp+7S8iwQFA6D5p9yTeH9fIA7NfepnUB30K33qxTBMvuM9LX
	ERgR0ApIM+eOMSyFZTNQ30Jagz9UAOLJhAY3ybe8SHWEhw/G+/qRVi9fGZr7gH+wEB2x
	zpQfDnp2/qkZHpH/D/5Nd6KfTkErBoXZ6p1xkv1t+h6YxkWhqkT+4tf1VHxlBAr1isuR
	l3auPqneg9o8Djpg8hlLAwfy7JUK1HViDxMFlVR+eAAzMYALM0jyfhc4vyofpqH/4o7i
	kK/g==
X-Gm-Message-State: APjAAAV6KuNzjmHp32Npeuwu8FK5AivktALcDHuli9NQ/avjUb0Z1Wok
	/OS4/gt8bFwmf0nUp24gClS4sZWulUM=
X-Google-Smtp-Source: APXvYqwcoeMCDPjCtVmUvqHb64g7152SJk8cFylq7+xGQ15gc9OcSE+S5oJDk5n2vGkrwOeWGLKE7A==
X-Received: by 2002:adf:f909:: with SMTP id b9mr8377179wrr.119.1558477717080; 
	Tue, 21 May 2019 15:28:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:30 +0100
Message-Id: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] perl-rdepends: Add missing module dependencies
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
X-List-Received-Date: Tue, 21 May 2019 22:28:36 -0000
Content-Transfer-Encoding: 8bit

Adding these fixes the acl and attr ptests to work within minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index f93bbc76463..362d317da7d 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -954,11 +954,13 @@ RDEPENDS_perl-module-io-dir += "perl-module-file-stat"
 RDEPENDS_perl-module-io-dir += "perl-module-io-file"
 RDEPENDS_perl-module-io-dir += "perl-module-strict"
 RDEPENDS_perl-module-io-dir += "perl-module-tie-hash"
+RDEPENDS_perl-module-io-file += "perl-module-carp"
 RDEPENDS_perl-module-io-file += "perl-module-exporter"
 RDEPENDS_perl-module-io-file += "perl-module-fcntl"
 RDEPENDS_perl-module-io-file += "perl-module-io-seekable"
 RDEPENDS_perl-module-io-file += "perl-module-selectsaver"
 RDEPENDS_perl-module-io-file += "perl-module-strict"
+RDEPENDS_perl-module-io-file += "perl-module-symbol"
 RDEPENDS_perl-module-io-handle += "perl-module-exporter"
 RDEPENDS_perl-module-io-handle += "perl-module-io"
 RDEPENDS_perl-module-io-handle += "perl-module-io-file"
-- 
2.20.1


