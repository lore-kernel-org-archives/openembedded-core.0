Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 298896FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:49 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id p9so1709901vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=Rsm368riZ55LcQB6oL4tFb9QqmhLKrkAAF8xOaPXMEQ=;
	b=MxGFxFeKHRNzro2oSO+czDHwLDGcQWumtPsudEmj/7kEf9yqWoCKq5iUIcOYnMEorB
	SFqMG3L2CvM2l/OFIcFQF15lXbZWv01Bv8YVCSzPw1wwgn30rynwR0fzaFedVAhXWxQR
	Clo1mC+pH0PCjo0r20hHOqkhSm5jSPxc59M624v6L4cIhKVM48wQGWtH3LzU1nO+A7+q
	hgyzTofvlGIUP7zFK7CJKn02jz4yl0fT6IqeZLN2aT90boudsQ3tgyJu+HkBDmZBbzC6
	Lk5m5viK6/afGvSQzPDNtFlTHR/LLRYu0jJ3qSxgNQJyr1nLFX7GfHWwC7Rz9livzr0K
	tN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Rsm368riZ55LcQB6oL4tFb9QqmhLKrkAAF8xOaPXMEQ=;
	b=GuacF4XB4jJYIjWATm6LkBwK7HhXZrMTWHCxg9k85wj2BzmXOCCD92wp6ThcrpmxuT
	PjBAFWS82X5P3qzL1kbERdYLftdFKf6s5odVhbKPYuSajkxicV4qNpvpC58D1QGzGlnJ
	T1wvyvlWPSoOciAADlaH3SFbalgCgmx2s2J7xLtjI2559IN5/lEzy07bP0SrQMLONh8/
	3w7y8z046SLFiB7Sl/Lv0K9idWsgZCwRElTN9PaDIs+FtTVOKW2e738Wmrkc0tuSY8XR
	tGHEFhYNANVmmM7u9P2fioIMs3jw/7D0UqvIe3/Sa2GCtJ7Z8+3mXhoyZWJemyvjYqfH
	ZADQ==
X-Gm-Message-State: ABUngvfY5+szYjLJOVj+biYDzCbcMMGNvgccyDIrlUYKwizYYmzI1dwIt91MRJLz4PrXsA==
X-Received: by 10.31.213.70 with SMTP id m67mr30535425vkg.43.1478030091333;
	Tue, 01 Nov 2016 12:54:51 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:50 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:59 -0200
Message-Id: <1478030040-20670-7-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 7/8] gawk: Update to version 4.1.4
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:50 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest | 0
 meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}     | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (89%)

diff --git a/meta/recipes-extended/gawk/gawk-4.1.3/run-ptest b/meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
rename to meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb b/meta/recipes-extended/gawk/gawk_4.1.4.bb
similarity index 89%
rename from meta/recipes-extended/gawk/gawk_4.1.3.bb
rename to meta/recipes-extended/gawk/gawk_4.1.4.bb
index 6ca7f3e..ad18237 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "55d37f4069502677f25d1340df8eec97"
-SRC_URI[sha256sum] = "524effa5b9ecd4ed940f2581c5d3c1df4e4bd7e6f768aa033c1916f47dfc6e29"
+SRC_URI[md5sum] = "f20c94ca51b6ebfc9bffb90f95c8ffbb"
+SRC_URI[sha256sum] = "8c03080e2b5a56263e8783f6f1f306398d4591be18254041f3f547efef944d35"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.1.4


