Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D31E47316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so11566648wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rDT27Ba5wuPo0/t/TkCYzonwq2Qw8Dh7OnCVB3M2zKY=;
	b=Qi5TGBH+CO47ZOmuvBPdQ0CcibVFAOkpwDZpp2QBQWtt/lrMsvyEywkwUK7zmLFwbs
	/bgKR1YvJa5nGlsYhq3VI2bE4jtjcqkUSuqKQhxb0iR9Kj9SsEzJXYalMSpqKMxus43d
	ui82kU9viIDKR8WrH4KjL+uPYM4xHnOz5gHL8W8mWSPgKYhTjtN5Pnwm5yLKD90rqbcf
	xTI51d4QVLcWxU8AoDUq5UqHMAqocvGb7iUz8bTPhAa4Qx30O90efYv4spZGJMi/NSj4
	hIGLNNaquJE4tDS+ajzkEs/QCR6UpZLqWC9Uc5bgkWzmlVATHe2eI/8+lMz3mNu4CNb0
	0mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rDT27Ba5wuPo0/t/TkCYzonwq2Qw8Dh7OnCVB3M2zKY=;
	b=cg96m95zbPBIPbzn8Aid+8SsIXvBkjGujQqsYuWY27IlRmQeSbykhPCKjgn/Jnp+99
	EZi+gvAeG+Ol2Ut+0pgzN6rc3xt2Xtp4XhLaDV1tmtEyXO/QqNExRzQVqaB6cvc85Wo3
	5s1dF3y7KtZhJzgkJ8RqGM6R9rVc2rCBLkfWnoszoHxijUSRX9fT/iSSRUPgTfOTd/WK
	GhLB8TmzCxQ8oBkONldxc00HF7eVpXuL2tjvGA/bW/ZY10sBdH8RXei/t8u7ZCNhw7s0
	MV87fKBr+6znTQCPrmWTCCujTzTXqHP11O7h09R++z3vhTDHP3PP91CRwEosI2XfpdNC
	M9sA==
X-Gm-Message-State: AD7BkJLUo30fSgjqo1l9cwot6rHfP6P7yqdDFH8Ma1ywkOWupdSYPs0P3vBw3u0/VvHIPg==
X-Received: by 10.194.87.161 with SMTP id az1mr20492550wjb.163.1457896517471; 
	Sun, 13 Mar 2016 12:15:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:16 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:31 +0100
Message-Id: <7e7372c37c6fc41acbc5cb120cdcb655d7484357.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 33/42] consolekit: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:17 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 2974e36..1ae054c 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -28,10 +28,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
 PACKAGECONFIG[policykit] = "--with-polkit,--without-polkit,polkit"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="
 
 FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
-                ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
+                ${libdir}/ConsoleKit  ${systemd_system_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 
 PACKAGES =+ "pam-plugin-ck-connector"
-- 
2.7.1


