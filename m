Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 95DD76C125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:08:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u5-v6so27147556wrn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T+S4erwPgshQeoYBRiNJ5lXzizcXq4zx71XHFEGOIHk=;
	b=F5i7ZL/zoVB2mt+/PKfrIP+1dAnezBoy2bnYEIwiwdoZtXg1qOMTS9lQs9jLFbLZMf
	fD+VVfCYHSTB1ugAkyLH/JBEvtRffN5XN8uXHDSzWmFdk78vdzBBc9v8QNxVKEqZGTW5
	dMFBI7lO+9x85OgtoStRhICZvdcGU8kZwnaXAiwBrV/h2E5WCTEIGpqCszylbuHSvejM
	I28yDSYW5aiDaOrF0QwWa5wlqvP6JrqLcU5M/4UgS7ssslCKoMt5BLYRYmHhJwOx3BK3
	Pv1jgtX+T37Yw8kHkSpRKKtVO0xmsMhwofLSmAs4ajZ2M47kiVMpNoJOftCE6a8+9COU
	Am6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T+S4erwPgshQeoYBRiNJ5lXzizcXq4zx71XHFEGOIHk=;
	b=H/fY+57JMk4P/ULAapkff/hr9oPLOexaFsok+2oo4oNUU5YNOvNiqlwHCbYYSfDl0e
	CFNab7Ks8axF5hrjNg2WAkxfpj8XktCIUVB7kkoHQOPegB7q6oBdBI2OyVEQ/O6HXxrg
	pD8JNVXnlDrkM3jhVPZ3Gng2X49fTV6y8bEGCvVnWzZKkdM8VcIDtPzOjYN3ksZaw9yL
	MD1CwIl/JFYzE9o7E8ptRU5h2CqcPNbI6C26NQlz7OrFfuGkhB7QjU7+iRAJmpIux+mD
	4gWMxs5c/iDcE9O+4BWLNr4pN909tfxqRSp+xygZnYrJD7YbGBxcDYrZFFnczYeI10/y
	lGnA==
X-Gm-Message-State: AGRZ1gJ1mX3a5rhBwDidPg5by6M3wIf7kktHDQapc+/yUMZ7Free9rlK
	FIKB0LQxhGQZwBPBv+aN9dAUxFCW
X-Google-Smtp-Source: AJdET5ePo/lzqFQNhU1bcpHkduaizvnadhTFGvzeGek8/9RruOYUWU6bKU20jlRvjd3ssf7SY5D8xA==
X-Received: by 2002:adf:ebd2:: with SMTP id
	v18-v6mr19714506wrn.109.1542640097999; 
	Mon, 19 Nov 2018 07:08:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm78042526wmf.22.2018.11.19.07.08.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:08:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:08:07 +0100
Message-Id: <20181119150810.94381-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119150810.94381-1-alex.kanavin@gmail.com>
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/6] rpm: update to 4.14.2.1
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
X-List-Received-Date: Mon, 19 Nov 2018 15:08:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rpm/{rpm_4.14.2.bb => rpm_4.14.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rpm/{rpm_4.14.2.bb => rpm_4.14.2.1.bb} (99%)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
similarity index 99%
rename from meta/recipes-devtools/rpm/rpm_4.14.2.bb
rename to meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 200fe4da26a..ef5d631917c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            "
 
 PE = "1"
-SRCREV = "753f6941dc32e94047b7cfe713ddd604a810b4db"
+SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


