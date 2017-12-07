Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 634B671A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 16:58:03 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id b5so16341789itc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 08:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fPj5AtGUjl7LEG0+rPHPkhK0qjC/Xs5ASHzlGr9bcfU=;
	b=qj4oyy5LclcUndlxXj0x0dvamikRcW8St/b+uCrejmqeUHSbNjlzNDGZQJbt1ySu5F
	u1OoZaqrUGFBeSL7rZnxXptYkIPiGflta4Niv5pKEoDzgyIX98cR7gBJb6l1bB/WvaU0
	NO4dt+vTSbY5dRTWGtVUBqd2H9TZ1zkpgO5XwgNYruJxBgRolHEzACkMRlyI+h/ZCYPk
	E0YHz9saRDb8GZpctvrUOJ6+mFUy9Q1yfmVjiOu2Wab3zN/EPrQ9wPcp0/kSo6cmoy52
	5+He4CGp8c8iEv/l1zhPhks7eWW5YxgVE5EO1ULaBWmrqTbmaj9AsmHZxQGLIIqcuUz8
	71QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fPj5AtGUjl7LEG0+rPHPkhK0qjC/Xs5ASHzlGr9bcfU=;
	b=kb/EEPBgx2IILZCQstfOM9Uzvu8ATgQlaHqLOsiOsmB7RFB1wrpyrLmkNxTheq/9ZN
	ZgAOyAMSSpngnZsVgePD8e9UvHcDYnf2kgB9WV5f3h2fzNmcw4MBH1kslD0dk9rSDaZb
	qP01Ehiw+PeFTTkbUdHXnNR+asPFdwf+Rmt51Ikz8LSiqmLiP+3XsjfIYWOHZdVyG1sk
	gD24vqNmA0KK3/1DLjV04XS36JNDBXc4br0+iIN6nGVQ/88vZHEDIoXkupeqG9EPrRr7
	e5N0D61OxsT9R/Jm+6F/QnIczvtoS+vDstS+6NMakjImKZHoMpwtK+6ETYY50GuJ1KFm
	vC8A==
X-Gm-Message-State: AKGB3mJaZma6Gzq9PY6zSpiyX3D4ouOd05DC38yv7+2aBsFKeA4TXEzI
	ORGOaDPHoE84sEeV6X360xsFhI/I
X-Google-Smtp-Source: AGs4zMbaYQr5bxvVSaeMLXHb3H+52w/df/w2cYN7MK20IEip4aEdbb6sRw9mqCoyOjcJ8puA8g3+Sg==
X-Received: by 10.36.145.1 with SMTP id i1mr2075762ite.122.1512665884474;
	Thu, 07 Dec 2017 08:58:04 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b74sm2928418itd.19.2017.12.07.08.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Dec 2017 08:58:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 10:57:35 -0600
Message-Id: <20171207165735.10171-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171207165114.2007-1-JPEWhacker@gmail.com>
References: <20171207165114.2007-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] waf.bbclass: Add compile progress
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
X-List-Received-Date: Thu, 07 Dec 2017 16:58:03 -0000

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c4698e910a4..e2ec542e49a 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -29,6 +29,7 @@ waf_do_configure() {
 	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
 
+do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
 	${S}/waf build ${@get_waf_parallel_make(d)}
 }
-- 
2.14.3


