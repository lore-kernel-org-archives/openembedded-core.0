Return-Path: <akshay.bhat@timesys.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 23EA27D861
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 18:46:12 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id k189so36048qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 11:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=timesys-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YtWGpVMArR1ys0BPDsHNf6oRLePjWTM8xebjgTt1MgQ=;
	b=tf+6sWo4ERHborPePDI5D1JrJKMrkCH//3WTc19mUFRNPJwJAC4y5Mi0aFieM/23ev
	W3WPcrcZrnlXa1PLAc5vSAed8/7Ka9vcbWT5I/efb8qPVPfgkEBebYXqndS1rAUgHchE
	v4xwsJ6C85FyNqSgrWGgWvY0I262kCRPbLcKffvXtu8FCQRdIgprvVLG/taMQq4fnm0C
	C2xOJV74D2gw4Hz06uo0NhmyylHVN+0dRQCGrb5jpPu16rCV8TyMAo1+/Ihmhorvp6dy
	3EQ4bsDHGUwOITMepQtfM/l8u7MM3Z1OiVNNMQdrufs+gx2gmppBtP9ZLUu0/emW3Nf8
	Xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YtWGpVMArR1ys0BPDsHNf6oRLePjWTM8xebjgTt1MgQ=;
	b=N+pKn+jM7HYaa1RbxbeOC8sFu+UGp4c9AmGrH9o089C96LDSpVDGIL0ch+lbm6W2SF
	si+WlFM6+DdmrrO5kckunOucjzYbjakGlQib6JPatn4TYAiUM7+u+J7PH19gYHKz+fup
	9jqeHQgV5HIDbzX8iygmZZJ3u6EmValaKdMWCUxNTSO325HntF4E804UIRZIXFTvbOEm
	F9nGmEZIUofonax1nPRoiu0atPrUPnzgXbi6ZbbZ2ssbllfy2Ml71rjy0iskCDXCiHpr
	Z7CZLn0PeUjqVLSn40pvSKLXuosuNMxTVkEOzRnlZUYeyhrZ/xPzU5HvlX+sLJCqqPst
	vRmg==
X-Gm-Message-State: APjAAAUSfSIssfusxGrs1jkNkU9BexDEoIJOCnWJii3YNq0ONsdq9tSL
	bI1Y9PwPnNfCTuv9f7zlLMYg/o/Q1R3eiQ==
X-Google-Smtp-Source: APXvYqy5bffAdrnk6qV4TInDb5MOA57DwX+dqYcFB+YRm19Tk862/58rgkBrOE9+AV/vbhMC3EdX4g==
X-Received: by 2002:a05:620a:135b:: with SMTP id
	c27mr39194713qkl.92.1556736373636; 
	Wed, 01 May 2019 11:46:13 -0700 (PDT)
Received: from timesysax.timesys.com
	(96-94-100-129-static.hfc.comcastbusiness.net. [96.94.100.129])
	by smtp.gmail.com with ESMTPSA id
	o44sm2440144qto.36.2019.05.01.11.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 11:46:12 -0700 (PDT)
From: Akshay Bhat <akshay.bhat@timesys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 14:46:08 -0400
Message-Id: <1556736368-1614-1-git-send-email-akshay.bhat@timesys.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python] python-urllib3: Set CVE_PRODUCT
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
X-List-Received-Date: Wed, 01 May 2019 18:46:13 -0000

urllib3 is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-9015

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 288ed8b..34f1478 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -16,4 +16,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
 "
 
+CVE_PRODUCT = "urllib3"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


