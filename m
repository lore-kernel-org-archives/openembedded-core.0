Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 16C1C7E07D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:25 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id c5so7558416pll.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=G35jkizKWuIX/mNwuUthsAay0wh8kqvMTgMDJUs1beY=;
	b=iaeX/dQVTY075LxkCrKJRa+W3BMbqclLPufjryUW12qlSK6LBAyE2AUIKvRSzMATQE
	VtoTaUPM2JfmKhD0ghBFDCx87mut2xSr6hRUB3Wblr36akNjUnS4OCbpYRUAA8pwB2Co
	+K9/LrxtIQyi45VlWr6Q9Wr4Goxl3Ed5V3JXuXohBIOU3xj6RQoEcxR8KeP6a2OupPN3
	8MO6wXIoK7st2NWsJjwrxg62qUvS9/Wp1oEHjPdPtUYlGlJUGy1ibHUwZQ7c4tchCAFy
	MZZ7f5q0hdl1EeD3/YppdUQqyl0N+CAIa3sQOm68ov17ekBn6JK83cN7sxTGwiFchuHk
	u0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=G35jkizKWuIX/mNwuUthsAay0wh8kqvMTgMDJUs1beY=;
	b=RBRkHwvhX//BHauEK5RsLufNBCDybySelAXQLsYnXhinod34v5q+T9lUNXTkllwjFg
	w6B7z38qf5XASwKKrdpZxgadgxDAbgT3Kfn2aiyxUOcqc++6S5fE+GY6+mEsfRaIuZT6
	+IdXTTnRMSCarxdp+BlWS2qNChurCa/JimNTE5NzhIjpmHJ0bWegO5Ouz3av1SuGQLgu
	oQ6mcJYoszaeaCGUxEkA1sBf1rRyDfo4zZwCIjVu6sxR8e3mr4YixlJ9/NhpCZfZ4iR3
	SnWdGawLjfUNozNiGTelmcie0qKdJDsDWwzNzHYnsIQoFKOxrSfB7Qy74EgQNlUAVg70
	5lXg==
X-Gm-Message-State: APjAAAXgFaBXXEpMSyA6eW0mHxezKfHA+JThreo8xTavavzy94s3xNrk
	/DLT+STTr4Zs0Mn3Tvc0YcVJOZma
X-Google-Smtp-Source: APXvYqwGWkRvVji/60Tv6wO5MeV2irf1G1EihxHxlqFMe4+rWJn12rZ/bGPvmzQgYHJjGaMelx2nCA==
X-Received: by 2002:a17:902:ba88:: with SMTP id
	k8mr5659861pls.16.1558403006142; 
	Mon, 20 May 2019 18:43:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:07 -0700
Message-Id: <8a5b92792df5d108e576d838e3c3a6ed3ec5f066.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 05/15] bitbake.conf: set NO_RECOMMENDATIONS with weak assignment
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
X-List-Received-Date: Tue, 21 May 2019 01:43:25 -0000

From: Kai Kang <kai.kang@windriver.com>

Set NO_RECOMMENDATIONS with weak assignment then it could be set a
default value somewhere else.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a8bafd2..c996301 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -845,7 +845,7 @@ COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 SERIAL_CONSOLE ??= ""
 SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
 
-NO_RECOMMENDATIONS ?= ""
+NO_RECOMMENDATIONS ??= ""
 BAD_RECOMMENDATIONS ?= ""
 
 # Make sure MACHINE isn't exported
-- 
2.7.4


