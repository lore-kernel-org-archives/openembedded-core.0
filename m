Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5706FFCC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:12:06 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so39784677wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Y8G6j5CgMIsUfwqGJ4/u4fzP0YBDJbaNFQ71CKPiaEw=;
	b=K/7qr947QqUhvGZa1aSkhRwOj1bmovnVfji8Wz0tQOkdTaQyc0NIpqn3s41nS/LlI4
	oPJFnwlqfS4AYlSr4zMMlC+KiJ8VILJPGXywNWsTXi6AF4ohXbycFaE+EeNe6D1RikzC
	zUXlxl4/xkF71O8oCR8SNLrXmNoUm3j8m64yJlN3yBgQLSruylPolXZqWtF2KWzNtmae
	lCNhCnj62CcVFGoJfvCZfJB91XBJRelgr8X6kGjx1CigEmd4W/wD/W1zw4sYWq2n9bEK
	aBbFiP0DgniKUHgXL2vRn9sh0T33EauqSwRbwA1890o+f4zgjdfZK9ZmHmyHUdaI04cW
	4rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y8G6j5CgMIsUfwqGJ4/u4fzP0YBDJbaNFQ71CKPiaEw=;
	b=FAy8APVQo63Dxx6Doh58Qyf9DMeynptGR81d1knwxpBVASjSF17gwcHNVhFbU3RDvm
	KXEHZKTO6XePr/T+2mfiB08UYw6+oJzsGvf6Jz6HU1w4tcS+dvNGjieYzqJKG4oxD3wb
	tbD5dXGh2bqU6KjA5/gxocW4VYKM+jiYmvTCRRI4garZ26lWpQ9oLLTTWbgeZvF06vrl
	CJeqQWN2cV6eST4DkT84qFz5jf+4OHRHZIk9yxS3sS1gLbOb9UnYFNlZmzGnQ1p9DcXF
	aMFdusRR5li1oRilwybz01YhBA+bAh49yeCcINTyuUnDBWKbB9b5qIevsvBDoA//Lj6W
	eY7A==
X-Gm-Message-State: AD7BkJJipIFfKgazLlX2JPwfFHSxQxpkDRIRROoKjpCE5a7+09fDD0WoLvS+c0luIsS/bXzw
X-Received: by 10.194.121.99 with SMTP id lj3mr12898850wjb.55.1457136727474;
	Fri, 04 Mar 2016 16:12:07 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	hx10sm5638075wjb.25.2016.03.04.16.12.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 16:12:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:12:01 +0000
Message-Id: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/3] xdg-utils: remove trailing whitespace in multiline string
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
X-List-Received-Date: Sat, 05 Mar 2016 00:12:07 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
index 6f66c6e..c1472cf 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "The xdg-utils package is a set of simple scripts that provide bas
 desktop integration functions for any Free Desktop, such as Linux. \
 They are intended to provide a set of defacto standards. \
 The following scripts are provided at this time: \
-xdg-desktop-icon \     
-xdg-desktop-menu \  
-xdg-email \ 
+xdg-desktop-icon \
+xdg-desktop-menu \
+xdg-email \
 xdg-icon-resource \
-xdg-mime \       
-xdg-open \     
-xdg-screensaver \ 
+xdg-mime \
+xdg-open \
+xdg-screensaver \
 xdg-terminal \
 "
 
-- 
2.7.0


