Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF6477B95
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 10:37:34 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b127so3059940lfe.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 03:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=HVMSUXGBPqVfoKN26ZnduDtVv171xTHkeQt6RttgX9Y=;
	b=b5C44/23ikKOrvdBjEzkhpGIZlFPOefSN+SYu3p0Me0w2WWCZLHhkKyrMo/SOgTVgl
	7wQQdyZAG5W8xtakrqNbzwtJzDQzWXPw1SAe3n9NeVXpO/gaM5AWgSxqDCardtDbaoOH
	aqfAUf9byiPv2LwIc4dnyQOTg0J/kXysayXK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HVMSUXGBPqVfoKN26ZnduDtVv171xTHkeQt6RttgX9Y=;
	b=qG4mU++8OCmIfSDZPQ+MH9z6K1n6o717GKinqmETcBmi7FVLp4mH5YVtw6GQ9uiqg1
	Xp/6fgRtDIrJLNdGHyZFzdtPBW31nkK5gnd3kwRdJp6J4HL4R9GSDjUHrUOUBAOdBB9T
	7KgooZ1OJ3YSnpEx/1THesJ1dfAJc4AB0+ocCZzreW67E14evkHLepuk1eMFMKMUtUYO
	S3en7fVY9HrNNdU0i+/kg+g/3j6lhU4+Gp2gpyaCVhaXk9hSXsvtpqjWAQJtz3b1hVnH
	D2BNxX8OCLfoz7+DPNS5Z4/Kay+PGKYRX/sZ5J184Nlrh4wUKEKK6Lt1i7a8C29IlKGw
	XLlA==
X-Gm-Message-State: AHPjjUjj/THdB9tNzVK0cb/ntczjBIJ+5yH8mUQEgKyRDQC+lT/5sgpn
	IHPQ2V9PryQb0oXV3j7k7aP/3MbHkQY=
X-Google-Smtp-Source: AOwi7QCnb2u1STcGCs8yR2URGmK4yKly4yan0+UvIYzaALaRFuXQu570SL4y4HAh5BU1HzJMdQXxvw==
X-Received: by 10.46.84.67 with SMTP id y3mr759696ljd.74.1506163055420;
	Sat, 23 Sep 2017 03:37:35 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id 18sm401518ljd.38.2017.09.23.03.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Sep 2017 03:37:33 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Sep 2017 13:37:30 +0300
Message-Id: <20170923103730.12571-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] systemd: move org.freedesktop.machine1.conf to systemd-container
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
X-List-Received-Date: Sat, 23 Sep 2017 10:37:36 -0000

The file belongs to systemd-container package , not to systemd package.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-core/systemd/systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 2695e15ac6..881896bfb5 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -388,6 +388,7 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${libdir}/libnss_mymachines.so.2 \
                          ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
                          ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
+                         ${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
                          ${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
@@ -485,7 +486,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
-                ${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf \
                "
-- 
2.14.1


