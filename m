Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDB778291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:52:08 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f21so13939458wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HPeuKqZqFuMYx38A8sNJvr8dH2TU8MkruyUrGi1sP7o=;
	b=PAPN3w3OSu+cY1ugA0UDewPLvKQCr5+B+/PuBQgfBRCsSr9AOyzhVmkmwLSsAE6zA4
	Fwwyn4vaytkiMsr9iEhvFzHJnufdOVAl+r+R9sZwL927uOKYasXu3jeBLlnsCjtWkUzj
	nwL5rYhjoX2J5AVxYYVwkl1e3dKdeN09ZSH91ZG5LoB4NOQ86qgpaHgEkCvqtCL7UyfM
	bFsAODIvkFOjmtmZxNrUYOdjtu4hWQkottsyQScpHNJ8QtYP8lW9CeLYeIktW1i3yPDa
	cZgnw7lPT+XaUsLRyEuQz5d851R0X36EUapJcE4mhd7DSHOB6oP0Y4fRMwVJIYGeKPO3
	uyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HPeuKqZqFuMYx38A8sNJvr8dH2TU8MkruyUrGi1sP7o=;
	b=iyqqzMZXX+XIop8MCBW7QsCRvfdtOcRplB4gHt/C4XYQZd+UaRa2uvczDrnekkmFxS
	JbBecKLgS0EAQHTvdBcmyqLD87homomgzwTOCoYOjXUU5ORKzXz+QukYtChdLI3w5U+t
	T7yx6PTvR9gHS+w4cp/ezuB07FpPEMZifp0seNI7hsc+EM61+36450gJxKCUaai79byW
	plC01z3/AHXG5IxGgpNyGV37n5gxeZwd/StOL5jgVZHQnImihQWfrxAXc4ZMNBwH/PVP
	giwig/zqwC/IkWiBNy/HmfXaFndkr3NKm1H/8q4H2u6bk5YQ7wjRsUC0lTz1flHtyaaR
	yPtg==
X-Gm-Message-State: AIVw1129nwxZlexsJsjLUPzfK7Tym36ybPS2J7x+2+CSzYETCaGoJ9xG
	DRFdzZGO9Maka+2f3ZU=
X-Received: by 10.223.168.110 with SMTP id l101mr2864749wrc.251.1500555128947; 
	Thu, 20 Jul 2017 05:52:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p23sm6827045wrc.35.2017.07.20.05.52.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 05:52:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 13:52:05 +0100
Message-Id: <20170720125205.25608-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glibc: fix upstream-status tag in a patch
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
X-List-Received-Date: Thu, 20 Jul 2017 12:52:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
index f6530774057..09ad04a4d4d 100644
--- a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -17,7 +17,7 @@ environment.
 This patch replaces the hard-coded reference to the gcc binary with the proper
 environment variable, thus allowing a user to override it.
 
-Upstream-Status : Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
+Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
 ---
  locale/gen-translit.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.11.0


