Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id DBD027F39D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:54 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id m3so6373898pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JM0x+FKE965Df9jFsov2wqH7X14xDjvOtQ5+E8OlC6A=;
	b=jC5p+cRzk7pWrbx91B8c9lrdQsrizv4fUGqY9W+jviFEun06d24QJXBRQ3iGaXP2gS
	1ZEx3BWtgzWzCsU5H/8T99K23ck7RLyAr9pfzNdJx2OSayeWhrIZOgi9td1kjfysSXq1
	/IOjBuHhlwYXTeP6ozWHOsMnpbPmUwlJ0E87cjfGYKe1378d8ZB9T55k2OBG/3hE/I51
	ll5QkkwKINZf4Pp3Bk1qV4UHRb5TkZ9LjgZY/j3mPvGFH07qNFhXoM0yVME43yLWMLUn
	rwGyIgr9TIIJKQ4D7Vz6xfC8nGWQnUfXEN6JOYHUNSVaV+qt95Bao7Ao0HGqQYQYEO0L
	wcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JM0x+FKE965Df9jFsov2wqH7X14xDjvOtQ5+E8OlC6A=;
	b=SampZSxAdQcR0YMTbs5BFaH4rDHVKuUgzQG7tNhuBErqgKzlNPLFgZWGTeY70GqGxk
	cCJMIurA7VVeXX4px/MNdoDLofolRrDlQjxZtk2wiZgKuaBWk/ENPXoCYxlL+CDf5ek0
	JI98rpYD5+7/BOyChhdyIz5h3+n19cxaEJWfOs948rh1rqOTyAdPh7R0K3p2CFVS/Ro0
	N1QTZ6jjM5Hpd1b5dBqlwfhSsiS1E8SZwIXbUxf/3F60kC5Z+6/jU4vOg+XgT3nI4o88
	bKR3mWOXhgzqUCWLsQDxOGAwFjvedLs1TSuHKOKVCDxfPJvF6GpmGb6NM0aNQQki5N33
	zpZw==
X-Gm-Message-State: APjAAAXCHB2Mx8qx0x1Y6r7bZMLuVrZpdZ502nJ1THzEiL3joj8Vyz8S
	t/P0mNxGDbHt+X46d5zUwtc2F/Gj
X-Google-Smtp-Source: APXvYqwcSjaRVSXHA2mF0sgN8CPF9x7SL/XnEsWP0j5voofX2YDKRUZmRUrO3YodkkuKzscfiiGivg==
X-Received: by 2002:aa7:8753:: with SMTP id g19mr7444897pfo.249.1566593575899; 
	Fri, 23 Aug 2019 13:52:55 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:39 -0700
Message-Id: <1566593504-21918-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 08/13] base-files: nsswitch.conf is glibc specific
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:55 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 4b4027f..2b1f217 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -129,7 +129,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
 	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
@@ -142,6 +141,10 @@ do_install () {
 	fi
 }
 
+do_install_append_libc-glibc () {
+	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
+}
+
 DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
-- 
1.9.1


