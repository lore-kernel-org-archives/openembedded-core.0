Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5F3D6BDE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:08:46 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a6so417047pjh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OSN+h7OLGNnc5hXW/NTlVPbmwwStpg86IzAQ5QmXypg=;
	b=ZKV2BNa2+GhMf8JqjQvW31ZzeBOQFTk4l2rj8sDD+gOmvDj/X1lyzDmWenJAEnLvNI
	PinFE1NFhSgTLiG9hs90AoKeD56Mv2YTaFmk49Wbyg3u/Jy2TYOSqTEUMQnaFJszVwWt
	hqcSIfNNyJ9J9wobN8bePYRA7OCFPXouiJJcveQaRTRQPyL1G/Jo7rVSYPJWBI9+wVrN
	1BV6sOupTqvoJdCeYCSdLfzoauMnbld7DalrYEsgwFHWBxo9uhcdlpWhqPJ3e4VyqOBD
	EAWYUZ6/s/s8oXTzkEDp+Mn6//scxf+0hee9DpcEfglJZLi6qhr9k2OoU4H+uzGHrI+x
	8uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OSN+h7OLGNnc5hXW/NTlVPbmwwStpg86IzAQ5QmXypg=;
	b=MtLeIst6VbO71SBeaMLCgAmQcXhbXo3HHFQRtWWDyON3VZwQBZTfC9IWlGv9D/lNsV
	J0yMNMhqj/udi6/7zuRkGuE81c71tEGg0O7pyAZjbvkGWvumLcWYblwYmlV+Z6TD+lrb
	EJeBhxFleVGE1sy6TzrQh52IDma+u3Exm//olRQwjyVthOUyaNSZPtTQrPjl6Tq4BDtK
	UJcT7Bme9GKoPs2FEVAd4WWrx/XMwfGJpvYHuhXd+cjx4Ex3VWlbNeeYZo4vRk4SiJz2
	QSX0mD4KzDNO8HMRZ3jTqoMYEWGyuA9u9IcWmHL6YziuQ7nIR8yDEun6QuZYXxt3Yub4
	pWiA==
X-Gm-Message-State: APjAAAWoaMdAdVgLN7WiBC1zTFIHzOEFKzXDb1i0UiUlyAuj2o1eatGA
	UONWYYw/TLyCHAjQ7bNW7G9l/UlCXPk=
X-Google-Smtp-Source: APXvYqwVufxDgCM9UQbz+s3Xvt4uNaIUSqY8DepQ22aj4/ZRWv3Xid279F1v2k3ff1/Z0BdiUm3UqA==
X-Received: by 2002:a17:90a:17c2:: with SMTP id
	q60mr2259584pja.111.1580184527588; 
	Mon, 27 Jan 2020 20:08:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id o11sm599748pjs.6.2020.01.27.20.08.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 20:08:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 20:08:49 -0800
Message-Id: <20200128040849.2719363-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] musl: Update to latest
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
X-List-Received-Date: Tue, 28 Jan 2020 04:08:47 -0000
Content-Transfer-Encoding: 8bit

Changelog [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=91e662d1d941215eb024787db5e910dbfb5b169f..83350eb17b9cb355e3f08b0340c4f1e8c437fac9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1676e2844c..629872050c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "91e662d1d941215eb024787db5e910dbfb5b169f"
+SRCREV = "83350eb17b9cb355e3f08b0340c4f1e8c437fac9"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


