Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5914360017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:40:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 9so10423942wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AGX+xgRg+amDKJDXhqf8IMY7Ts7h25NxHsNR2xG0mjE=;
	b=u7WX976LTQ/Ael4RknwGc50snPilvScaUbd4g+RxJxfxpOBo59QTr5iK/8QWXrVzfr
	i+mqW+3UqWaRna1oklowpcVDMVu4i0+eKnK0DFQlX+AfHrF4xHfM/Cos9+v6E4xEpeyd
	fk10DJA2lrljyvCTRMSCBOWwmsPtM7pLc3iKzo+6swWldh0RZnMsOPLk3O9x0M0zUVjx
	8P/vzsQPq+wdxC7f9c5CVt+3gTuQhmpOqnc/BG6+SeiAFhI2uudP0HFPcl3xVJTYFV8V
	giOYDN3ozyZ59oansHabwSSydvhgDdctN0sle9R3VQnR8x1JMAtEkQsvabeovHrrCSpM
	DZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AGX+xgRg+amDKJDXhqf8IMY7Ts7h25NxHsNR2xG0mjE=;
	b=PgFFXUi5Sxq4ieRRwswZH9/T9I3azXaGDuSKr+e7vbXR4agnxgMY995s2FDQsBu/jt
	k1gcg4Hf+05ccn06wL75EH21AH00s38K4aZJNza0cpAsRcsM/1GfD+L9ZRcUer+vJcKR
	l0ILS+LBabwMtUauHgGPL4aKB3rDLHY5DcoCQPALWZhRSOfFSWyS7p+U9P2F/eCnlhi6
	KJkr0wc2fbmv3dHfRYmRsiAhZiYkgVf1OWpRLyi8SkEgy0u5vbzjWRywfadr4R7zqkGJ
	wnS+G6VJD9brUSpSKi2XMopVOLzz5Y5Oa7IPWxdqXe/p46xmNb5c/GZLyLs2evcOXOpu
	p5gA==
X-Gm-Message-State: AJaThX4KrmwJizeuRX6EM78i2+keiIAR5euWLff9Gsrakpp5c1n31xRf
	ZLp5Z4jtIZ1A0jG1awsMzSsB2Q==
X-Google-Smtp-Source: AGs4zMblFJSknGR5duQVNuS1sibWDlH6wxeclDsCo2VgdCbtyDbW6OTjhXVxngA5jqQMFzETB2uqxw==
X-Received: by 10.80.150.69 with SMTP id y63mr30085571eda.75.1511358044987;
	Wed, 22 Nov 2017 05:40:44 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	a52sm11025363eda.92.2017.11.22.05.40.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 05:40:43 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 14:40:33 +0100
Message-Id: <1511358033-22327-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] wpa-supplicant: add a missing WPA_COMMON_CTRL_IFACE definition
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
X-List-Received-Date: Wed, 22 Nov 2017 13:40:44 -0000

From: Ming Liu <liu.ming50@gmail.com>

The WPA_COMMON_CTRL_IFACE definition is missing, which leads to obvious
problems since there is no way to access the ctrl socket. So add it in.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
index 5c9e5d3..35a1aa6 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
@@ -4,6 +4,7 @@
 WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
 WPA_SUP_PNAME="wpa_supplicant"
 WPA_SUP_PIDFILE="/var/run/wpa_supplicant.$IFACE.pid"
+WPA_COMMON_CTRL_IFACE="/var/run/wpa_supplicant"
 WPA_SUP_OPTIONS="-B -P $WPA_SUP_PIDFILE -i $IFACE"
 
 VERBOSITY=0
-- 
2.7.4


