Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id BBD2B7D117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 23:07:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f3so1639283wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=G/APcy7LtmHCCP9x+MRH+xyqvE+AktnCujV0AxqIc+A=;
	b=S2esQ7Mkfpn12r7y1fhOAa0oa89oNH2S59ozzrcFD1bN2Wj6TdgsYwQTld6CGd4qOV
	KP/StEW2rjWkw218ZrKAiUa887rqnCZU5SF9LMQqkq1k65WTF+Oxyxpsky32QXl4HXoW
	okmV9vwE8m7GoShoMK9HUVRXXk8S9sidHUz6FEJnwNyL9g4B+dPYxw+SN18pLezHEhYq
	74NnS6tJkrWdqyoEeNy4/hQhSkI7k3RqBwBgQ3Pfg/BEGYmLyVH2BrFMdlPB4rUxP7py
	QE7ZDm8vUl/5EVwNzexROmu2Lirj3AjykM21rzTA6BNIQ9ov0+BeQswbTuWxUFQOIXAk
	b+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=G/APcy7LtmHCCP9x+MRH+xyqvE+AktnCujV0AxqIc+A=;
	b=XSG8bwmBcSSx+YrpIDyiazE3Dt1EYTGZ9bcMjNSxi/ch8Sjmquq3KWASM+vyfBMipz
	qyfwCw1YRVSlBIipuuKtAsbXLp/aU2g7gq6syUKh70t6qnL0S/XMgZQa8raSBaRn1N74
	QKM9AfYzitkLgrzJ93sFJ8zQrJxKxoOvkGUHQOlD6AdYuxliWgEKReisJSBsGvABQACL
	rAXJLw5EMClZR3nUR4SOlOZHkoKy2sfUVsKkwVaeABrWaz1wNlys28b7M3kgJvgQzbv2
	9NazkSJHymbkDhglbWgH7uN+ECr7XvSsetJyd4ZwqhwpwXwzCy/U09oEATZKdPyQf3Ea
	Ak1w==
X-Gm-Message-State: APjAAAWfgpkbOEZLOte55u+n5rPj3xMEf2+bOKCL2/mcJZvmbWEAJFwM
	hquCbmsqAYdFRkHXUIEHHn2LYGkeGvo=
X-Google-Smtp-Source: APXvYqwhVXiz5tdK3TQQAYBwGGRMd9Zva6eI2qF2Tf7u5ezinrXsIRc7TbsQukMgF260xbB62MtnGA==
X-Received: by 2002:a1c:16:: with SMTP id 22mr13037408wma.91.1553728036368;
	Wed, 27 Mar 2019 16:07:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t24sm1263617wmi.10.2019.03.27.16.07.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 16:07:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 23:07:12 +0000
Message-Id: <20190327230712.4930-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190327230712.4930-1-ross.burton@intel.com>
References: <20190327230712.4930-1-ross.burton@intel.com>
Subject: [PATCH 2/2] llvm: don't inherit perlnative
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
X-List-Received-Date: Wed, 27 Mar 2019 23:07:16 -0000

This doesn't appear to be required at all.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 31abadcace5..2a8cd4a3e4e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
 
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
-inherit perlnative cmake pkgconfig
+inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-- 
2.11.0


