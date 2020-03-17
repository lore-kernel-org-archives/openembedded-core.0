Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 886C960B44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n8so21929486wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qOELTYPN6jNub88owJ9fq7r9r0IxNMRbkNyW1k46nwM=;
	b=ZP+VG/JKukifGD6KcXzhir+beC10BVH+fReTmuG9/uhvj46zOLmUap6qvWj2jtdAD7
	muMBjgK97lFd8MwAHxKsr0iuXpZISOn8cp0J3rQSz+kedBzE7KAy+2Z6ElKp5vEOsA+v
	DqT+cDQYSkF6MupU0eMgnVdUvjVd+K40LwDqjuv9CPzFrXTkNgvNc8Wd75CBqhO4wL6G
	+ZZ2nuJlMMhzjBwuT0nQzycpoUUXDlQ54/tHp+X7SMt+H+wsuYRS0VHKRsmVCZO9jTra
	3AQhzieOzQV23A+lCyqn/yPATj1r7faqytNOfyEzbB72z6bchZmNnZ2DqljgYx9Oejlh
	k01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qOELTYPN6jNub88owJ9fq7r9r0IxNMRbkNyW1k46nwM=;
	b=qq0mU2p8P8obAta2TqC0VXo+x7v9ZtEPt+GqZxKZAasBpXqnk1nl71fC7ynExhvdMU
	SCcx2QlL78r7rFnbJDtZe803jrDI1aS26DO4U3bIW98KOj90Yok5bUBkvKUms1h9InzE
	/DcJmePVrmR1EZaybAwjRrj7ozbZK7Rd05WnkG1dO/IzFz80lPwD5/y+cleEM1PvSd70
	0TJ9JmqjEfm5ZmaqcFC14tfHmKxdZDdzBNFEEqK5RjOOE8b2SrRjpQbgz6MUNvAhqDwS
	O5el6yxdXwWSCWEDNZHK9q9MdHB+Y/bkHoxkOUkJF51+4N0HTQdxRMuzAQ0pmBwyyQ32
	+QmA==
X-Gm-Message-State: ANhLgQ2uQj+LB/v11LeD558O65j0FPHsoQHZz9O4HewgfaGLWYb+eqgF
	9c2AoyqwlL8FOeAsmmENs58miBKz
X-Google-Smtp-Source: ADFU+vtasz5Lo3wZUSNdK2oog9JGDsRdAAx6O15gWFUMqWwSm4HxBfsZ6zI1UILkrXSc7mVZwwQn7g==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr5712384wmi.174.1584458936506; 
	Tue, 17 Mar 2020 08:28:56 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:57 +0000
Message-Id: <20200317152303.4600-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 05/11] systemd: Remove X11 related files when disabled
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:56 -0000

When X11 isn't in DISTRO_FEATURES, remove X11 related files.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_244.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 7c33bde21a39..279e0857244a 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -274,6 +274,10 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
+		rm ${D}${exec_prefix}/lib/tmpfiles.d/x11.conf
+		rm -r ${D}${sysconfdir}/X11
+	fi
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
-- 
2.17.1


