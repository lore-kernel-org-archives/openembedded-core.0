Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 712D6745FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 14:16:02 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r8-v6so8381606ljc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vps5tz7qlJAX6Z1dNayU9338xjPor4Vr6dYdgJwBH10=;
	b=EliMJ+pH6CtjKmOZKlNHTPV6j2OLFeeOQI4IvJg5NbC/nb5Zw66ZQzkP9/+tQzYWyg
	YUaGzSGPq7bGxzVkyz4+54qWb1hnv/4lX1ryQQoZRLRumI36V3V0k3aE/CUo+bHgNRLx
	OZJW+IS9yPjLwVVKIR7ewowaKmp7EBgLPSN82BWXoTnE8GbP9No1ov519tOxDPUlpYd5
	MNkvEISw5QPz8UsNv0ynXmkBAtA/9LYAC4Ffy0KWF6cTCFd6qFl7KGqebtGs8sm9Devw
	HBYEvf/uuehwkbmuE6nH4+zYLpEl/rTeZWGBQB2UEa3/2lStmF8VvHIctWfLCh/g+t5e
	J9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vps5tz7qlJAX6Z1dNayU9338xjPor4Vr6dYdgJwBH10=;
	b=NbuTTZrbSu+tqjUYwVKkKwS0Pv3wnP77pKn0pr8qR9hdmD0uleu9+flSca//Nk27iR
	8NmQCdSkpkvTHceB7dcCZ+AooGoCpgZs16bURutE5aPxOXYOnnRivB77O78YFpZBnBXX
	GFC0VmMwe15BQU9I1eOFT/MRGKo3Pc/g3H83XWAfFXdwCAS8lR2Vj6d4QT9t7nPUiLuw
	hmQ3JmvKlEFq7d3Z/pwS6kvu0sFBeg8sa8xq7xZQKUzRu3T9WC0k/x+5Y9qeu7RgIktt
	NgZaRVE5pPx6BTiTUszOSdpHarsmDChNANMeZ/B2qZbUJ3ukB7VmCgwyxESszJCRgKfS
	UVDg==
X-Gm-Message-State: ABuFfoitwiOAg2/YsfZleGjbWOL4ajxQPxjXnm5dpmvRAczl1PZndEjz
	jpr/kLd7fzbhT3nXxee+kRqrcCuJUe4=
X-Google-Smtp-Source: ACcGV60m4xhmw8hFwIz/g+TfB3SuX3gV/qDMLlE40KuZfBqXOX6Y3OFH7txF2RdChtB0jnv8TkXTuw==
X-Received: by 2002:a2e:8050:: with SMTP id
	p16-v6mr1471563ljg.178.1539267362673; 
	Thu, 11 Oct 2018 07:16:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-246-212.cust.tele2.se. [77.218.246.212])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm5564628lfh.10.2018.10.11.07.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Oct 2018 07:16:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 16:15:54 +0200
Message-Id: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Cheuk Wing Leung <cwleung@kth.se>, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] python3: set PYTHONHOME for nativesdk
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
X-List-Received-Date: Thu, 11 Oct 2018 14:16:02 -0000

From: Cheuk Wing Leung <cwleung@kth.se>

commit c5629268b0f8ae0a425c98337d13e8dc83107e13:
[
    python: set PYTHONHOME for nativesdk

    This ensures that the nativesdk python functions correctly without needing to
    set PYTHONHOME in the sdk environment setup script.
]

it's also needed for python3.

Signed-off-by: Cheuk Wing Leung <cwleung@kth.se>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index e179658..c481aad 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -179,7 +179,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
2.7.4


