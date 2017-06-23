Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id ADAF6781F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 21:37:52 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 185so8403396itv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:subject:date:message-id:cc:to
	:mime-version; bh=2OT49Lx+PiLN1qE0rkxXIwr/WDdGw0+EzhQRMjWpI1A=;
	b=a80Vwf1nJWL0FhQo5oPdSkcFH/hjSaj3MgnXqS5J4MsfnUu8ojdmPrJYG5+DFC0mmm
	mooKCrjxbT9CaE1hTavrwFiad9Fa4md1W0RbpOEtvdMDcopezmJd1v7oO54CnLZeKNSQ
	NT7UiWCGz2WJ/wWtAb2MQV4oaOfIvVhoj78nrBBfUkUG0AwhV6etNLEKLAIFNaCLbQuZ
	75dKXxZ4w5dVqKdVxNTGf//ZcRwLFtrL3y51tuHrVzXdOBRCtWa7xvQ80dABxho3tM0Q
	ls0/AtOF9x1eqCz8Z+KJp/j2wEQrCADBmPAOmp8GdmjCrnazjdI8s2bfXfGeSE9pDLCm
	su/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:subject:date
	:message-id:cc:to:mime-version;
	bh=2OT49Lx+PiLN1qE0rkxXIwr/WDdGw0+EzhQRMjWpI1A=;
	b=rkXPLV/8kw+C0IAuf285Ete9sig2QU3lkU4fzZVuVkUI2IqAs3F6pPY32loGiSsQyu
	q4ZktIXDabLuGjnYILsBbSXg+uD4ACsMfXr/S5VcA4j6nAvih/miLivSBo/DWrFbpLic
	FlguP0PsqbWWiJ0G7JMufSQK/r0Og82Z2qDr0OEJUSkKVrKo1IWf1ohE179dN+3W0fmh
	LoQzLVtL0IoxrbAAkp+dh3v9kdIsorR41byy99R8llUYcs5EBqhDeVnCS8AzP7bXOEeW
	HmKOh/1NjQNDiApuDfbtroDQUBwJ3VWQA4aA56ZUs8E4PCvZe2fSbVHJ+tiEZ8o7sTVF
	d9SA==
X-Gm-Message-State: AKS2vOygYufcgX1ncGOz1NRB+Ym5c/mjUiv5VWtQKPoqQKvnqU+Du/bh
	3e8JjUzZFGRIYbj8kVI=
X-Received: by 10.36.196.8 with SMTP id v8mr9451354itf.30.1498253873627;
	Fri, 23 Jun 2017 14:37:53 -0700 (PDT)
Received: from [10.0.0.18] (modemcable012.206-58-74.mc.videotron.ca.
	[74.58.206.12])
	by smtp.gmail.com with ESMTPSA id b6sm1578873ioj.31.2017.06.23.14.37.52
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jun 2017 14:37:53 -0700 (PDT)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Date: Fri, 23 Jun 2017 17:37:52 -0400
Message-Id: <81D91794-A353-43A9-A245-8095CFC1EEF4@gmail.com>
To: openembedded-core@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: [PATCH] wic: remove extra double-quote on documentation string
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
X-List-Received-Date: Fri, 23 Jun 2017 21:37:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
scripts/lib/wic/ksparser.py | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d026caa..47afda4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -114,7 +114,7 @@ def systemidtype(arg):
  return arg

class KickStart():
-    """"Kickstart parser implementation."""
+    """Kickstart parser implementation."""

  DEFAULT_EXTRA_SPACE = 10*1024
  DEFAULT_OVERHEAD_FACTOR = 1.3
-- 
2.1.4


