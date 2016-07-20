Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7649560746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:54:10 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id l69so32138894lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m982aFUfdFRKi0HMqHu6VBjI76/bPZ6eU5JACQ9naRk=;
	b=ZVTQkK/qd6OK4FjztyRRBitbVKuM2r6i06Xpq5lPcQftKvQwX5x3XBx//TRQf/SjfS
	bqCU/piICNKtKyBR1bO0ky3vAnWowp3YVstl3Fb2qRO58IuY9XAIggXLWsbO/k1mSO5N
	2Zc8I6/1Tlijn8cFitkZKEp6uTOix7+EYEstbcH95W7e+3yaUS6ze3cCTIrsErv3R3va
	k0wv+7NkIkVsqRqlVdp18oCgW4L1cGNqbRx3YVmeROrtoD7YjlhBZLBDZiqyazPvvRoO
	WmUsqpi5eBEaepbcHRJAYWCNcIVvfZIL3yJDdWH9H2pa1hPxvxrmrIArl9HPWcYBco9F
	mcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m982aFUfdFRKi0HMqHu6VBjI76/bPZ6eU5JACQ9naRk=;
	b=mwrucznZRCOUARYn092QuGeusD6tV/EQQSeiqCOYkTQpuSw9ugbsPLbwa6xNPBgW+u
	Y8qeFV33XOmqpMr8gaZaRNywH7O/PgRHZ8dBNOn40FRCC9BKDvTlm/72/hLqCzjzqDee
	XmCMvUIg91XU6iarc9cpI9rzh/5orZt2TtQz1sn4s5kU41CL6Wvfh+actbAP1DK9AVUP
	n7TCqMFupPJKGn7LvSD5DnElvzYsM8BiaDmHDnashY19Pop/gy86BepErSt2RnFs5RCF
	0y7ODFpX0e1kv4Fh/dPoU/VuSY9v5G8RaHO8v/u5YQj3sYDqwS94DtjInO1ELR21Kmf0
	1lDQ==
X-Gm-Message-State: ALyK8tKIAe73Z7rTKUzaMJc88xCvrxiUZ6mgnxucc7tAPaygrfoWVBX6ofNgWlMDQCG/aw==
X-Received: by 10.25.16.162 with SMTP id 34mr21999249lfq.127.1469001250327;
	Wed, 20 Jul 2016 00:54:10 -0700 (PDT)
Received: from localhost.localdomain (cm-84.208.203.118.getinternet.no.
	[84.208.203.118]) by smtp.googlemail.com with ESMTPSA id
	s187sm334770lfd.3.2016.07.20.00.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 00:54:09 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 09:53:40 +0200
Message-Id: <1469001221-26502-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH 1/2] systemd: Create missing sysusers offline
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
X-List-Received-Date: Wed, 20 Jul 2016 07:54:10 -0000

From: Khem Raj <raj.khem@gmail.com>

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

(From OE-Core rev: d18957925c6c073b7194e3a233efea24e436f74e)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd36a447d0da53e713d992b17ce86dd31ea63c67)
Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..a2d35f8 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,16 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.7.4


