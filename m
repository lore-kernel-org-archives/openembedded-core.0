Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id ADF0977F79
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:56:26 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c69so2256472qke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=iQOKFJDIYT04sxKfjW/IjB7HfaoJ99KekNZ829Zi80w=;
	b=kgYwm87BCEr4g+w/fyiProzlYxg1b3olYQZKQ+JZCcqrqvd2B7Qbh5DF7Oh0/0cGl8
	SROpIAQ8pouSS0wMLi6GcbS2cQCHnPKI3C3mcNO1xffqnPwce5aEG3qaGnhlWmLvsLqY
	plV6uSlq+/SUaro73qX+qVGMC1HHIkfejL9XCAdMuxhF9V3EPfuNg+SfiulDXDZzPG30
	jkIvdCSvOaPL4xHgjGgwqB10Vl9c5+eNv2tRpRwN3zOlVogM6oZhofcXG9UzKLnUb2rT
	0HoeweZXK19QnBkHIl1dyUAzmfSeyUjUKoqti6ZshoZRMhsRs6HbEqnP0bfCUXmt3Efh
	nJlQ==
X-Gm-Message-State: AHPjjUhwPw+8RlVFym4PdgwF6NSfJ4bcnWeE9Do/VyK8dsnmi1F8KHVN
	yCv7v+D0NBLCypCN
X-Google-Smtp-Source: ADKCNb4MtIaO21Jpb67oheMoWIkuEn4GyHVbUm3nXspu/hoC7eetJ6I8Z1U7Fj6HuY88TmVuWeyzrQ==
X-Received: by 10.55.54.12 with SMTP id d12mr5306994qka.20.1504623387853;
	Tue, 05 Sep 2017 07:56:27 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q5sm559159qkh.43.2017.09.05.07.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:56:27 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:56:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:33 -0300
Message-Id: <20170905145536.21149-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 5/8] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Tue, 05 Sep 2017 14:56:26 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 7960ac5f9e..dbec6ee2c8 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -47,6 +47,8 @@ def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a) and re.match('arm.*7.*', f):
         return '7'
+    if re.match('arm.*', a) and re.match('arm.*5.*', f):
+        return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


