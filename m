Return-Path: <jpuhlman@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBD8E605BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 06:03:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id h17so1847633otn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=LPUj0aocTNmf8WdVdrTAQOu29YwyVAd/DtirJyVnRkM=;
	b=Mdg2axD0iKyhiLlBUfcVunQCJghC5t3LGs6IO6k4ORiDu8wgkXo4OCQJdWqM0AEnzj
	nqzvtZGKTZ4s/SVchF6TgGsqeoWeZHv9TN2sodLWqnNBe95TA0bG/EXG//GlsAnb/J59
	vzSTuuC1UiUN7drQP5hFxdNP0y4szjUlmvynyPADX7Lbm8GCxbH3mlOJzEyUD+rAgeaD
	EfdrSU4R4ymiVEZaoW7jBayO8vQ/zsY7NodNsbpBBpJr8Ctk0mpN886jVojuMrS/d74f
	6PiOj6RYEPlevzr5X0BIAx+BcTWRm2uVhmput7qUBYQ580YkwrrGgBDEkFHZ6FkQgpdh
	Jmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=LPUj0aocTNmf8WdVdrTAQOu29YwyVAd/DtirJyVnRkM=;
	b=DDs7ay+zyunCOd1muQoVLQNfgnlnx6u00vwUfrA89vHMDkzAaAjul365b/09p1rC0c
	q+u/6OAcLjqdOpzVBLLNse4tR4uUFCY8/eif6rNW9m5zaFJ4AcqHowXcTm7ZmJ+g5gA6
	Qc41a/CV1iAy0Ak+KiyJo6CgKsTvW8J4L1Uf0hOuXlrHlsDKmUOGe6iorbKUC2ydQaXp
	JLprSdLI93c3NSO6LyFvOXGc3xwsM53U8szsqTyYgt/anwy5znd2H6nHa2KpY0d/bJBu
	SbCPp6ybnWOc0tNXTdjbVi2nH7r+hz9pJ89S3klNh5vLRme12ujja2l0M5wZF2srJsdg
	iynA==
X-Gm-Message-State: ANhLgQ2gnYrLy+gnPuOoY0lywo1Nfy8DJ52bQDSsF4rDppGc5S3AeEtl
	WThQhmdWbDwW9pPw81WBcsD6gnM/gWk=
X-Google-Smtp-Source: ADFU+vvqeKLvyS37iqUcNYnFKOSWyUffzQERK9MgkuxpWOTC6JG5HUzs4chgjiZ9bPR/syU+qWzBGg==
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr2468853otf.185.1584424991375; 
	Mon, 16 Mar 2020 23:03:11 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id h2sm775881otm.44.2020.03.16.23.03.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 23:03:10 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 60A1C2A099B; Mon, 16 Mar 2020 23:03:09 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 23:03:05 -0700
Message-Id: <20200317060305.25237-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] glib-2.0: update ptest multilib fix
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
X-List-Received-Date: Tue, 17 Mar 2020 06:03:11 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

The updates to the tests are done in do_install instead of do_install_ptest,
so the changes need to consider ptest not being turned on.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index edecc51fdb..7ebed0e5fd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -128,9 +128,11 @@ do_install_append_class-target () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+	if [ -f ${D}${datadir}/installed-tests/glib/static-link.test ]; then
         if test "x${MLPREFIX}" != "x"; then
                 mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
         fi
+	fi
 }
 
 # As we do not build python3 for windows, makes no sense to ship the script that's using it
-- 
2.13.3


