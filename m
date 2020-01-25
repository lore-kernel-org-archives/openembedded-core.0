Return-Path: <sivakumar.bs@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9487FD9D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 08:52:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s64so2392668pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 00:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9f8/iVDM0ZrWHvjYv9cPN6FlxJocLENqHUk6lMNWFUk=;
	b=DD6C7zq5f6iD7WMGIPI1RzDM9dC8xhqg2954dKgXKoJf+GhzM4SNhUGzPy7Yp4DgKZ
	Eci6+wHJtBCgRRR1uU8jOgUfKMJ0o8LoPKQE6N5QrqCQ29vXu0WRFN+JYglmnGVoTJ14
	y9qIRv3jDUiH4CkAVWNdXtZvLp0TU3T4SBn+QdeRMu/JEgYbCOyQbgi7RX0nnFo1MO89
	yvFL/J5+e6LK5khsFg8foqDF7lBsUZNvIQlzbhgU5Md7wq6ZV3eLTNL5g+5bjpPhWznj
	BMxWGylBfRX8aiFCpbTfVGF4sWn8dFwMlqpkEq0HLJ7IAdWv7i81xXwpbkCmIlOvj9Wm
	68jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9f8/iVDM0ZrWHvjYv9cPN6FlxJocLENqHUk6lMNWFUk=;
	b=ieaFIWsRPrWwjiYm94gaukHKmHe4HqHo+Pcec5xlfOBNHyWxs1HrrCV7Ra6yx4l9Qp
	kT1dV6ctYNarImv2LLF7hH/j6BNjdgHrwhBV5OLgMl172Z2zek58n1gDJ0lxdr5Gi8CO
	XYUXQrkzAsmCr6WG6o5ojZvxkHp84KgNzSw65lpsuWJ5r/3fRMkWLXjye1lSESHPCHpR
	Zhr61VWVvR/qKp0yuuJzOLC9QjEq12FCJsMAVBt4nqngfYTBl6WbwZJjyyQBfFaspu2J
	tU+tfwScop/gAsevA4bqoXqyTsFGuuGgJUZtmjWHP3xOnXbzs9o1C14IeDVNK/McHPF4
	uVUA==
X-Gm-Message-State: APjAAAUi+kNCrb4fcBd/8roxiJH8b+b3NyIUL4N8jcYQsm6QCnwte/qE
	ZE6WAMx+s2UNdb1uTAz9/bvKWqamjyI=
X-Google-Smtp-Source: APXvYqzwe/SjDHS30IEO0D+cLL+9AMTX2UhxrrC5+sjR1Yu9+XEEenH0SV5iL52rtjF+gXokXdftWA==
X-Received: by 2002:aa7:9d9c:: with SMTP id f28mr7198923pfq.20.1579942367108; 
	Sat, 25 Jan 2020 00:52:47 -0800 (PST)
Received: from devel.timesys.com ([49.205.139.80])
	by smtp.gmail.com with ESMTPSA id
	q25sm8677425pfg.41.2020.01.25.00.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jan 2020 00:52:46 -0800 (PST)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2020 14:22:40 +0530
Message-Id: <bc6acc24336713780c7a4fa2fe29baee115db975.1579940252.git.sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1579940252.git.sivakumar.bs@gmail.com>
References: <cover.1579940252.git.sivakumar.bs@gmail.com>
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH 1/1] sudo: update to 1.8.30
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
X-List-Received-Date: Sat, 25 Jan 2020 08:52:46 -0000

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} (91%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.29.bb b/meta/recipes-extended/sudo/sudo_1.8.30.bb
similarity index 91%
rename from meta/recipes-extended/sudo/sudo_1.8.29.bb
rename to meta/recipes-extended/sudo/sudo_1.8.30.bb
index 8da2d64..0aa9c59 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.29.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.30.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "b28dabff9c460f115fe74de4d6a6f79d"
-SRC_URI[sha256sum] = "ce53ffac9604e23321334d8ba8ac59ded2bcf624fdb9dbde097ab2049bf29c7c"
+SRC_URI[md5sum] = "d56cd5835b1cc9852bd76ddaaa572475"
+SRC_URI[sha256sum] = "a35ad3ddc7465703e04190d3ff0b8d78ded9246749becf9a014dcb9c31c579e7"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.7.4


