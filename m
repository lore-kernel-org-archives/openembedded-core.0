Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C94106FFEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:24:19 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t190so10393450pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=nKm9fCYzqdIyN1Ey/JqoVjTKuPErUEjgTYb/qTCOyM/eZiX47UtZQf+0P/5D1VTuOc
	aMLOeC7XSxB1uH/amVRGMy9XrsOjMRWaaxQrNiLv3hHz5/nu2OMHt0W1N4I3HF6nptcX
	Za8d1uAEtmJjmanTTIb/6UAiAm+hYVFMh0Kdoc4pYl/F1N/FNkSK0Ggw5/OAuViIMjz1
	MpRSWuoSoQLGNf9jUXpIwkJasuz9PTSVZCIhr0CFrUblxS/tbOlw5y/Pp032a+VYIcJ4
	q2xmR505JkeMQeEEfVMMDIPllCshWuXFZkvpTa/3AEqqwmLn6vvPge1jX4/Xnw1DGO65
	/f/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4Gt8TLDvpY/xzGpj1/wCFYh7CLCyut43jvBKkFzTFAc=;
	b=M9rkdAMPOSdOLdTmbZRWJcq3oqSxmrmf8Z2UXzvbJMpIdt144982KjlZgRHpmLCdc6
	vGWCgdaR29MLE6kSXBagEtL+g8dDP7O0DmX3WE9jEH/2uP0mI1VUhgGlle/OKGiwhIpz
	/qzTYsJJydStvyiGh01rVdBW89fuheLb64raBAQECd1FkjY0GiyKZBruI6GXAikWITjV
	5DSDxS4yg+VPgNVVNU0A2dCK3K3gxJAqRBtRSMRon+4wcp3U7y/0vRR2SZlfUIDAWu2/
	xlNThycqQi4qgFeJAQAG1PCSZ9Tdgj0mwh4ekjFJuAJ9Ry/VjKDlHHLJNo3S9lI8XT9o
	1LEg==
X-Gm-Message-State: ALyK8tKOWfin+z71XZDsFTUKjlOW9duTJUT7h7lIenUOTeigGZUqgTEuZPimPSZEb3XWkA==
X-Received: by 10.98.76.211 with SMTP id e80mr18732631pfj.28.1466389460540;
	Sun, 19 Jun 2016 19:24:20 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	b67sm32347269pfg.85.2016.06.19.19.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 19:24:19 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 19:23:46 -0700
Message-Id: <1466389428-4438-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v2 2/4] linux-firmware : add LICENSE line for iwlwifi-license package
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
X-List-Received-Date: Mon, 20 Jun 2016 02:24:20 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index c39a9ca..bce2c0b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -460,6 +460,7 @@ LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
 FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
-- 
2.1.4


