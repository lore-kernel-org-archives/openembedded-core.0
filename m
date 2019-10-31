Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6968A7F8C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:06:08 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y23so6616502ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3BtezKuENUE49/alfSRjMvl9LevRAHqKBBv2iYKK9/Q=;
	b=Z5PWoKrU9hg4DG5lBww23XH/KrdirjkNOyJKFgAIsyxaybXAVd9QMdKGvgsYgEHYsu
	CYiGacBEhMqb+iOnz3nSD6eNOIhSS//6cj4/Yb5zYB7NStE+sqRK/9WiQMknlNduOnNb
	0rnI4WeHnXGnQMKQbP2GPJKy7h8xXSjhZB6K+hqjbFBS6XaBBzWjkqjkeS9NSkPgDY08
	twY7WdsnRMQVkySY6RL2VuKCKdzpoTRcTa1c5+rZpJJBdpLGtcPtwKWjZqUgfR+V2ZNW
	Ol6Y4Nw+kbbtEPzFlM8v4S+NEPJBVU3Ka9gtHFbXs7TCcGj+LaOp53qDSzHbx6C6oBBP
	wBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3BtezKuENUE49/alfSRjMvl9LevRAHqKBBv2iYKK9/Q=;
	b=M3GUK3y+wfbH/maG1C/3GIZjoAEmFTnd9klgtcEWzWITU9X/lz2qHqCKv8qvVaO9pu
	P7lsdmABsQrCtRCE2pcpml0MgBurXoUdYuD7Lmj1TQd4/O4YAYw8liHhSHztBr45jJvh
	pxTn4h/CJNZ8iboLfJ5sIjWVkIyA8DdMvXdA4GQlPsv0BQM0Rd1o5WwHQi2BwtPwoSoD
	KmZKZJpagYtAiKrUUtMhB2Ug1xfqjNEL5dIXQsW+HufWw1hBcd08iJ7+OU1vagr2KAY4
	u1FvC6dT4yUdbfSSeml92++FKn/Cpe6hp6qWoqGrCEve7IsDJLuc1ztpxKMcf49qE+gw
	syxw==
X-Gm-Message-State: APjAAAX24wtwT/Ir4I0bNW/MNqs32S2HY/KRY1wlUz3J8Rp6+Iv6xlly
	6SnCUm9eoZFoOcB5xzhtQYKZLvOmecg=
X-Google-Smtp-Source: APXvYqw7ZeEj77kF+oOVW/bVrlVOkeA01YXekc04GGNsHvWDNmhZXlvr98G/qrU0Ch80X1qGFZJLdg==
X-Received: by 2002:a2e:8852:: with SMTP id z18mr4615492ljj.230.1572534368529; 
	Thu, 31 Oct 2019 08:06:08 -0700 (PDT)
Received: from lund.luxoft.com (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id u12sm2122916lje.1.2019.10.31.08.06.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 08:06:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 16:06:05 +0100
Message-Id: <20191031150605.14643-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ofono: update to 1.31
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
X-List-Received-Date: Thu, 31 Oct 2019 15:06:08 -0000

Changelog:
- Fix issue with handling CID 0 context identifier
- Fix issue with handling detach state and running LTE
- Fix issue with handling SIM states and Quectel modems

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ofono/{ofono_1.30.bb => ofono_1.31.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.30.bb => ofono_1.31.bb} (56%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.30.bb b/meta/recipes-connectivity/ofono/ofono_1.31.bb
similarity index 56%
rename from meta/recipes-connectivity/ofono/ofono_1.30.bb
rename to meta/recipes-connectivity/ofono/ofono_1.31.bb
index c916cb1b22..7869ac0cf7 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.30.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.31.bb
@@ -5,5 +5,5 @@ SRC_URI  = "\
   file://ofono \
   file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
 "
-SRC_URI[md5sum] = "2b1ce11a4db1f4b5c8cd96eb7e96ba0c"
-SRC_URI[sha256sum] = "8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c"
+SRC_URI[md5sum] = "1c26340e3c6ed132cc812595081bb3dc"
+SRC_URI[sha256sum] = "a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"
-- 
2.17.1


