Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD000786A9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:51 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id d2-v6so5164837pga.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aE7Y1n6o3PnU3BmkpHeiLfobHPsZljROs7ztW+D9ID0=;
	b=kIOpCA9k1YxvbDeu5wuEVRRoAQVlmlrg9Zc/0QVpthoPqDOjJsUQIa/faplda/r1Px
	EoJde/boEX13sW3wlKycACSVeXpVauoMYKu2h52e3Zdlsmct8fqzckdchPUjv09qNJl+
	jLzrA3L94Iot1ELvR/qCbkaLPzIxwxp/jybOIHovmbRN6UGS/L7k4g7Tdsq9EXuy8T5J
	VkwG6DHpS+ggHARoQ48q2kDLOE1ytsKiAVjiz2g+rJs6S6Gpo4pKJWVM9E96c9PJjDFN
	bVD93aPXWAi/MWkaGkxGbLFp3snTDV1Sx2tMaKo9bF4ycGBpeCzowV9oQZmAyBqu+zEC
	P7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aE7Y1n6o3PnU3BmkpHeiLfobHPsZljROs7ztW+D9ID0=;
	b=itriX+tiSu01F/I6HJsTpeJeaaHtLsKyztE+6yoq/ugl+SlbADBUl/RkNoy8CoT9na
	gbJxb/wE2PdEtC5mJZaZmuik8nLYnCygwAEjSgCGAKU0kVdYeHANhSseU4MHQ7Ryu+kE
	oZ6PXE4orqdALh7y2EzorMTcYsfspOTxL83LWOuouMl/L2td0sC3z9VBnJUysDLHVuPl
	0t2hs7Zt7rXc326HcnDs5qpGBzUPZWomY7C4WizYf7bCD7oOAF6blLEFU1pCBD6xlRvx
	1jPfUcbv2sZxWcvUkTzSbwhQAgWlZB6uXo+O8UB2JIHUIcYz4CZ+h5goxmNbWageZfv5
	CPpg==
X-Gm-Message-State: APt69E0jnWOYw23u9t/rNa1pxWGjdlosWm0g2nz+l3jULN/5BGHMGJkR
	13L6o686no/C3eVgvQnqPESfZQ==
X-Google-Smtp-Source: ADUXVKLVWYcuKI/an5moIrHwu2s6sRJYFoKMH2nMms9pWFo6PTOQUfzjAQ25DB4mKHaE5jZsRhiEDA==
X-Received: by 2002:a65:6390:: with SMTP id
	h16-v6mr2547210pgv.382.1528397332785; 
	Thu, 07 Jun 2018 11:48:52 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:37 -0700
Message-Id: <1528397320-32269-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/7] openssh: minor indent cleanup for sshd init script
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:51 -0000

The openssh sshd init script contains a mix of indent styles, mostly
inherited from the Debian script from which it is derived. Leave the
indent from Debian as-is, but for lines which are OE specific (e.g.
where Debian's log_daemon_msg helper has been replaced with echo)
make the indent consistent with surrounding lines.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 34ba0f8..8887e3a 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -36,7 +36,7 @@ check_privsep_dir() {
 }
 
 check_config() {
-	/usr/sbin/sshd -t $SSHD_OPTS || exit 1
+    /usr/sbin/sshd $SSHD_OPTS -t || exit 1
 }
 
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
@@ -48,19 +48,19 @@ case "$1" in
 	@LIBEXECDIR@/sshd_check_keys
 	check_privsep_dir
 	start-stop-daemon -S -p $PIDFILE -x /usr/sbin/sshd -- $SSHD_OPTS
-        echo "done."
+	echo "done."
 	;;
   stop)
-        echo -n "Stopping OpenBSD Secure Shell server: sshd"
+	echo -n "Stopping OpenBSD Secure Shell server: sshd"
 	start-stop-daemon -K -p $PIDFILE -x /usr/sbin/sshd
-        echo "."
+	echo "."
 	;;
 
   reload|force-reload)
 	check_for_no_start
 	@LIBEXECDIR@/sshd_check_keys
 	check_config
-        echo -n "Reloading OpenBSD Secure Shell server's configuration"
+	echo -n "Reloading OpenBSD Secure Shell server's configuration"
 	start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/sbin/sshd
 	echo "."
 	;;
@@ -68,7 +68,7 @@ case "$1" in
   restart)
 	@LIBEXECDIR@/sshd_check_keys
 	check_config
-        echo -n "Restarting OpenBSD Secure Shell server: sshd"
+	echo -n "Restarting OpenBSD Secure Shell server: sshd"
 	start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/sbin/sshd
 	check_for_no_start
 	check_privsep_dir
-- 
1.9.1


