Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQKdF-0000QR-6f
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:45:55 +0200
Received: by mail-wg0-f51.google.com with SMTP id b12so1865128wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=t/SkWlScOtvSQEHO5qtHGu71kAvTmUsLUxTtOHhQ1kQ=;
	b=fLWtFwDAgmRuoUxA8R+rIrOKumgym6jsMlgqs1hbPzkvwjwWCcyN6eTnPV+mQ2Q8be
	rXUrMJim/b5oMZ/NbEysK/UxrnZFgS+e2H765iJqNgvWuZWY+5lN0PDk+jOPsR12XhsS
	Bzwf+TKJNAV9xcuRZTNUlJ6GyKtiz4XNsUm7KaRe57Ti/NcKljLaUieRmYAES2mn00Ts
	mcN9/NHBQ+/FcYOtRuTCB0ygosHU5puYc5AEYIHRyPxPk0f1CWuefNuZ/51Cz7mf0Lg4
	ThmievXRQy5wkmCz+q9ft8R+P9UF09Fomdpj4019Nkbq5uz5nQh8iEv6F0Ltvd0N/PMO
	PpMw==
X-Received: by 10.180.24.65 with SMTP id s1mr11764048wif.0.1365697710034;
	Thu, 11 Apr 2013 09:28:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gl11sm4092039wic.8.2013.04.11.09.28.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 09:28:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 17:25:39 +0100
Message-Id: <1365697540-618-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlppnMzN83pmocoFLGcn7ye42zSHRVxV6nncSW+Xg4xispimPZKFygAHJzYu7PiEp82kM0u
Subject: [PATCH 1/2] systemd: use ${BPN} instead of ${PN} in FILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 16:46:06 -0000

Otherwise in multlib builds the wrong name is used and files don't get packaged
correctly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 3ee1283..2de9c14 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -149,7 +149,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
-                ${datadir}/${PN} \
+                ${datadir}/${BPN} \
                 ${sysconfdir}/bash_completion.d/ \
                 ${sysconfdir}/binfmt.d/ \
                 ${sysconfdir}/dbus-1/ \
-- 
1.7.10.4



