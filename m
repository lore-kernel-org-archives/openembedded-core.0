Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 13B327FBF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l10so4676558wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9t/iJfn7BPelTVhyQjfQPOJlbSnabOnHAkbhvlPHF78=;
	b=r4U2gNRSW60IAbniqxNj35+66Oo7oKAP2GkiXIFBFNUesadsJtooc25+/jq+9ApsRC
	vzspoXOAYPAJqwp3CyawSSAgdzq1QwtDDIqGQsTU9nIRgE2nHJ5E97LlNsi2YNN9UZid
	Oq23BgAS1R+jvNoieUYolME/muSphLVVKG3TXVXpyLA/DJrSBB/wSJOd4sYI3mQ3XQu7
	RJeGrA1v9Hq/EK93J7YGWE1s5qDaRUoinQEErxAuyiTpLEROQEVSJ5rv7EA2p24FB7wp
	Xe2mRoa7aCn1Vm6H+nRJ0J+2mCP35VWuWFLvY148Rzm4i6ZLTQGfQ1fyCFwz3p5vpwiG
	JUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9t/iJfn7BPelTVhyQjfQPOJlbSnabOnHAkbhvlPHF78=;
	b=O1a6bN1DkKGQb+4ged+q54GmGR79J0YRrSMrX7nihhIMcthVi6klfiPivFPLxJf/Jt
	cIwjpC4Jhzfwh2A8faYK+AzpzYrBVYdabkSqv9qlXPlTbecnSYTmtjaHphcLwYthtXL2
	KCMCF8ZzJwiImGNvD7JSmFxI8PilBFJtRkln2YpwDm45MSG0QzKNMx1aQKAlVU+5g4D+
	vrjHMBNwZKIp9j3CKL6QIbg1fl6J4ecuOzmRonY022QLOFOHLFFclL9+8X/04m8Ne9bV
	N/0I/EYBANXBwYRTPL6IEmoHO5TAfZq4nSuK8sDZz5eVR834ZnVQGFOoTOFc9UkYg9S6
	g/Tw==
X-Gm-Message-State: APjAAAWD6TGVFBbDt7vPHNHBX7LiAZqw3s81JcWrAD+mwhXx/teaaIjf
	BmArAqvEMchbg1sBx7E7mDj0/unxfUE=
X-Google-Smtp-Source: APXvYqxtTvIdkZGuD0bk7HQo39OVgQyaakagl3/yPrlRdEPogb9mEHZJAJOltjY08SJiOkn6WWznfQ==
X-Received: by 2002:adf:eed2:: with SMTP id a18mr6700393wrp.273.1572072623589; 
	Fri, 25 Oct 2019 23:50:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:55 -0700
Message-Id: <ba559a8067844f4da5afc4a954558cf3117b0c79.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 23/28] dbus: update dbus-1.init to reflect new PID file
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tom Benn <fridgecow@fb.com>

The PID file referenced in dbus-1.init script was out of date and no longer existed. This meant that dbus could not be restarted via init.d without force removing the old PID file.

Signed-off-by: fridgecow <fridgecow@fb.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 2ed6f06f30cb54b9c70f1a92d93c920ec4d01ffe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dbus/dbus/dbus-1.init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus/dbus-1.init b/meta/recipes-core/dbus/dbus/dbus-1.init
index 42c8629..90e167e 100644
--- a/meta/recipes-core/dbus/dbus/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus/dbus-1.init
@@ -21,8 +21,8 @@
 
 DAEMON=@bindir@/dbus-daemon
 NAME=dbus
-DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
-PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
+DAEMONUSER=messagebus           # must match /usr/share/dbus-1/system.conf
+PIDFILE=/var/run/dbus/pid # must match /usr/share/dbus-1/system.conf
 UUIDDIR=/var/lib/dbus
 DESC="system message bus"
 EVENTDIR=/etc/dbus-1/event.d
-- 
2.7.4


