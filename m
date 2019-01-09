Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8AD7C038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 15:28:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x6so6311891ioa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1RrIbgov+OPWVWOdVgGzBKJdpoPkYzGxJkKwfAWWalc=;
	b=LyhJKqIC5cI8BqGqnmkISTMWShc/lvc7pkrtCPBOa+q6CXkpHUmCSdDszh+ad5A9dC
	CJHjfVZKFZB0wPCku5XdzzaLBqQ1NQvXGNJomLG209mtFDJIUOBIO9Upg/iN4JkBAOiN
	NUWvdsLrDr4akeOJTFSioPsZcX317V5k5FumyXTLXmQxboNh05rFX9uJqvpk2RNuZ3fX
	ObC4TyGQv0yTXIqEA4JNcBTKIxEpYSxDVPydTsYGKlRLvTgxP3Hxjsp3BK/aclEd+TIJ
	mGXhrsSggPjhYg/PAFJXKonF1h79cLzp8539h9YNHVaAMmdiMUU9vxj03eiLYmsPO8la
	PNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1RrIbgov+OPWVWOdVgGzBKJdpoPkYzGxJkKwfAWWalc=;
	b=X+qi8KIuHUkanZLWep6RbrfYb0FCkojLhS3m/8FqU3sl7uQK+Tt4szERJh6tm6tY1m
	0FyEjCyBwj5XFtVwMmo7AoFxvorZr9nd9ZPpHHKl6KwTN+8bnBmEJuBzAE34FdWkFQzj
	CwhSRSHFwjRz9wCKfCnuuBqqZrlYhAbBawWxhPyuZXhS02rhBywj5lbmsYAJwtQrWKop
	4sW877gJqC28dcyuxZe/WlOwnpPTPXryXXgjrcyKy+pd4z4279qyKiwOsGZnt3UV9P6d
	9rhEmgvJeh2JWscVxkxJq3LkBf/QCe8Y1G2ZMhZG5MZ7ObJYw/ukucCBVFJUGClT1O5i
	VYbw==
X-Gm-Message-State: AJcUukdZXLFC9FyROlJ/kydIt6aUakI2aD8/LaGT0JOwmbO/8l6XSKHH
	yM4ua0Kfoq89tC91cQTtD132LJwQT5A=
X-Google-Smtp-Source: ALg8bN6wQe0icgtP1tIAXOleDsI/Flaib39Pmzgyj+tMWsNSNyApdRp/LKF5z3fopiW02n717W7F5g==
X-Received: by 2002:a6b:c544:: with SMTP id v65mr4181136iof.118.1547047705713; 
	Wed, 09 Jan 2019 07:28:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b18sm15809828ioh.28.2019.01.09.07.28.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Jan 2019 07:28:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 09:28:19 -0600
Message-Id: <20190109152820.16845-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109152820.16845-1-JPEWhacker@gmail.com>
References: <20190109152820.16845-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] classes/icecc: Remove trailing whitespace
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
X-List-Received-Date: Wed, 09 Jan 2019 15:28:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index ed3f0d36e14..0d6ee55c15c 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -386,7 +386,7 @@ set_icecc_env() {
             ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
         then
             touch "${ICECC_VERSION}.done"
-        elif ! wait_for_file "${ICECC_VERSION}.done" 30 
+        elif ! wait_for_file "${ICECC_VERSION}.done" 30
         then
             # locking failed so wait for ${ICECC_VERSION}.done to appear
             bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
-- 
2.20.1


