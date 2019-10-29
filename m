Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6AE7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z11so12826579wro.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QPFE17Vup8EbpJ/V7azoF+QXupviPKT8VN6/NX+UEQQ=;
	b=IHpfcSbHeciDx+Fk0jEUSITB7v7K3nDVOTYQ4oUDyTibHEDKEp6edVohz6xDr36hL4
	aKLDYfM8XcTLwPku0kH2vkYUh2RXdhJv1fQVmP0qvvf0Xz71NlGILvmsFpHpFxvE8+rS
	StJDbwxEjU9DVlfNzrJaumOjlvVvlZ3lf8H0N9gZBkS5iMpc2gKPrtaybI4vrGjR3p3V
	5Mpy+5gn0amZS/wGRZclUgisxZUkFAJYvbxWndUALLc9pt58OUn/u+H1VVll/yhtcZtx
	NI1R9z7tx2tCf1jNz8bSztgKF54unYkQo9kiH02M+FrfEMkfk0AHcUxULfPbuX/YC6qj
	9MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QPFE17Vup8EbpJ/V7azoF+QXupviPKT8VN6/NX+UEQQ=;
	b=bSDr+ul8wrI7VEfNhLlWrPNR5SsOnPRHZH2C4ztlAqFQKGhM512qCEZOOp86YIC21t
	nVn/wzRIb/iT7nMTr3AA/hwSv0FcucwGQJq0tEr6gipIGixMA68ppAkeXsf/78jjYBG+
	qvv/fYUGgFtQIixmhPIc0BXd0aEMtqUZQ4QbYABhqfK4UgiFBeRKqP9dnT65AvKlFfFS
	lugUlniEXLpsnvwXaZl0AD27x3G2NwRb5FZ1e1E70TXfcedMdE2L2HueMc7MM3kOYu05
	UX+48zks/vBTwkxFYvDqf7QIPqslV/4HT66XlMuDJM+dBVjelg5lMG15uyR5acLhvOTo
	5gNw==
X-Gm-Message-State: APjAAAWK3+7gDVaOBYN7Pi2vnAROLnWgJO8AKs6e7txrW1s/eGb9sHN1
	HXESG30ZP78lVzSOazvLDunphmkGd6o=
X-Google-Smtp-Source: APXvYqy3o5zV1XEUJOupr6+woVK67caZdJzFSh0K+2UCrUSrCoU+EchUjs/ipo0P4o5PLdJh3k6t1A==
X-Received: by 2002:adf:8011:: with SMTP id 17mr19637727wrk.367.1572342464491; 
	Tue, 29 Oct 2019 02:47:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:15 +0100
Message-Id: <62d0b698a4652573203a26c29912decdff355211.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 02/19] gnutls:upgrade 3.6.7 -> 3.6.8
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:44 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-Upgrade from gnutls_3.6.7.bb to gnutls_3.6.8.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b34486a616ab4d4b30247a5dff58a18ef26ed709)
[Bug fix only update.
Including: CVE-2019-3836 CVE-2019-3829
https://lists.gnupg.org/pipermail/gnutls-help/2019-May/004527.html]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.7.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.8.bb
index 01dd23c..bd752d3 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "c4ac669c500df939d4fbfea722367929"
-SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2"
+SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
+SRC_URI[sha256sum] = "aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


