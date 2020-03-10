Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 44B966101C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:28:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 6so224646wre.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5CdG+rE6gdtg4M5MrNhH5Y6aDgo+mXqzK5U4xUZZ2Oo=;
	b=IELPSiPBJWSsKQe1EO+WTIadCtzJRHuieZi7Z+rhs/UHQRKnIGbqD3D3bcQi6Pd481
	Q3GS0D4rJtVp6B+5ad3M5TLaHNLuK4Ic6rWJtjcSuXL3+5/9NOlK8QHNdlcnYlkizm1r
	O+ZWGhRElhFy7AAem0q3hll1CXX7BQekw7Jfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5CdG+rE6gdtg4M5MrNhH5Y6aDgo+mXqzK5U4xUZZ2Oo=;
	b=DDTca4KBc0ZJpuoApDkmvKJCr2LtCw9UvxUbqvJh0OvzFGKXXVCQs5Cav2GdQhQ8kL
	lK9G88itv3EpsSeJosbMis7sTa0KHgEQVlXcWnfHPIf/QgyVsMiE9RDlaB+cxVOcUwyx
	15CoqNZOSSGZLrToxiT29ch52fK0ExTuiwYTy80SsFF1O3xx9NsF4R7rOx7Z7pwPYgQ6
	0gasPzien6LiY8E2TWcFRoIpF3rHzX46RD0+es9noYHXU1b6nVMrZuWOiybg1lIno5N+
	PP6LVFqMZMjCO3zrV8vjxXjmmb+zLdpUgyJe2BJ30BarB61+kq8ZlcWmF1iB2xkjuarv
	swQA==
X-Gm-Message-State: ANhLgQ1MK6iR+Y2JMVitPYIWyh4xt+BXDI0cN4plhdYDykxWeewAJ6uK
	0iKFNo7p5xrrajsIr73/f/MkNV7jKOU=
X-Google-Smtp-Source: ADFU+vvmbUFIUqYmTKfdPZHkpPyzfnRy3o31hgxusaxm5i5mi11SiaXB2ypkR7zuQubPa9p4o27etw==
X-Received: by 2002:adf:ed0d:: with SMTP id a13mr228403wro.167.1583882900568; 
	Tue, 10 Mar 2020 16:28:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c85sm6254460wmd.48.2020.03.10.16.28.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:28:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:28:14 +0000
Message-Id: <20200310232814.48572-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/6] buildtools-extended-tarball: Add locale command
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
X-List-Received-Date: Tue, 10 Mar 2020 23:28:20 -0000
Content-Transfer-Encoding: 8bit

The eSDK installation code checks installed locales with the locale command which is
from glibc-utils. Add this so that we find the correct locales from the buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 4a79b09fda9..dd780c5d57e 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libstdc++-dev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
+    nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
     "
 
-- 
2.25.0


