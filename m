Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 80C9A7FAA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:17 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r18so9916462pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=32EZqbdwQr21NXzJlqZNdwpehsrvsihsInbOWtYAYiI=;
	b=tH3aHLs7UR4mszxIQmJ7J7fJtl5Z6eZnNf1cJIxtgPRmtPxFpgEJLIXUt1QxkQ8z1u
	5dy2N8K6pRWqnI8tyZ3pD/85uFsYR0WsAI7Ghvvo+9xg13tpAXJ3Q8nW1J6b70I8+1Iq
	hemNccOqlm3YOyzCw01CBpZuziVySqhvJni4vyqWLsXXdOIaSGh5Gfy8+1dNSiztWocW
	YlSaLlkTmwIVp/MArQKXiviaqmIU1CSF3MuTYRBSKe/Yfz6YM+y7CU/sAuTy6OYh/xlc
	EwsiybKqUhlbPIzkCSh6JJ4L6lsf7u+6CUq5H6IOzfbLZ425IpPpst2U7bGpYYoG5uhe
	z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=32EZqbdwQr21NXzJlqZNdwpehsrvsihsInbOWtYAYiI=;
	b=Q2mYDFnjtCjUbd0Wuk6RKiXipPgCqnvt2IvUxm1BbP03xeMbgUxT1xB7ws9oWyPf5B
	/SKtAvohirq6vADDmgIkLkfqyW1wNTcnl2ak/n06OaeQUjG2Bq+2xblBVJQzxTEF4HNi
	IcTlakuJp8IadjmWCnQCBxQahczJBN/1IdPevG69+mtOwKfVRnY9oaw06X58xrrivipS
	39phXYZkUb4nMkDJY2Lpkx+j8ZZvv/1+EKKbaw3Olz4T1YVUo3uHynl4laEOS1P1uaEK
	Uca7s3udeUfyKjwJoNv5Vs5F93qOykbEi7J2PG2mtSOgepD7W3c/rgxTBxc3is7vHaOX
	RVFA==
X-Gm-Message-State: APjAAAWK+xwZV1wrWnyFnHV3IfF3AH7wHIHNKOBC3b0EhrkBn15iHIp8
	NB2CLqUZ+E9emnJUZ6QWxi9TSHzD
X-Google-Smtp-Source: APXvYqw5/Pxspw/gufvnSJMcW7NWcLTgWBqwE5RtzaeJ6dnKxXvGcIvDlA0j6lR1kYYfzkv9QtDv5A==
X-Received: by 2002:a17:90b:30d7:: with SMTP id
	hi23mr566319pjb.10.1573497018505; 
	Mon, 11 Nov 2019 10:30:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:52 -0800
Message-Id: <b5f8274d75cb61beaf7dab3420bda206e45697ae.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 10/21] qemu-helper-native: pass compiler flags
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:17 -0000

From: Ross Burton <ross.burton@intel.com>

Pass all of the compiler and linker flags so the build is correctly configured.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index d9d9da0..372eebd 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}"
 inherit native
 
 do_compile() {
-	${CC} tunctl.c -o tunctl
+	${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
 }
 
 do_install() {
-- 
2.7.4


