Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id A774F6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:53:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t6so11411552wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LaB+bVcBwk0UYTZ9F8AbrwzIDAgA3c4RCRZpdfKSCwA=;
	b=evGHYZZpfRQWPMVbNVIuXNncEEeeGMede1J9Yh2u/IYwQ1FHMVoR2eKofuCTQe6ZwC
	xNVmU6f2UZCLMKO1yLMCc1GVgn3/WylHpxwN4ZQXMOJZIfwX8yXNeAOHra23JauS+k3F
	MXhlaKjtAw9X9uN5rpckpQyvI5+LPNYwtGF3P8EXFohwLS9FzqY97yvcghmMw7gxF+xH
	VpOZsvGa+s7A86f+pcQC5bhA9lBsScCknpAcBetYykEFo1t4f5N9iDdhykqmRbTZm1Gi
	eEfu1hMXbTR8BB03d72dIjxRLGWau+6qUSICXa60N9W41WSpa8jlutTMLsoXG29b0Mkw
	QoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LaB+bVcBwk0UYTZ9F8AbrwzIDAgA3c4RCRZpdfKSCwA=;
	b=jGJhF+va0PobK25VDcxTfjkQNNtZ0h5yJkbvijpNofv86xmuDfLCzObnqpDOCfI3Oh
	kfBvf2cx22Oz03La3i0oGH0IXRsTdYjh/TYHBUkMzNt1Uby9wUAnH9m2SL15OCr8HQEx
	kFDsIgxw4DWg2d76tWqAG0wTiExavUikJzfwGQoDMutQPGLvaofOA/lCDhjb7B/cybr0
	aW709VJer2vxLsmBiIWYzBwqSytl8F8pQaMkLu1qP8qJIbMnXe5gD97aPx1EgjrL5mqj
	JG7YgjI8kRyV+9c2N9E/t9ErgWqMZaMrt/AuPwklYCSB69FcUhJlKAJ+61xczUmELJXq
	uYUw==
X-Gm-Message-State: AJcUukeD1YLY+FVlqAMPAUIFTa7b0s+/9s+qIYfcGwcMIlqYIbzIZqfv
	giYXbK9L9koFy+POCIB04G9UZOpNV2U=
X-Google-Smtp-Source: ALg8bN6DU+MMnEs6SU41V4gPrKbgexsl3f+WhcwTfEfd/fLLcECXlidUXP8idU1oB+58AZ1gsMx2cw==
X-Received: by 2002:a5d:56d2:: with SMTP id m18mr9912986wrw.113.1547128385147; 
	Thu, 10 Jan 2019 05:53:05 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm78248587wrp.0.2019.01.10.05.53.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 05:53:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 13:52:58 +0000
Message-Id: <20190110135301.1888-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190110135301.1888-1-ross.burton@intel.com>
References: <20190110135301.1888-1-ross.burton@intel.com>
Subject: [PATCH 2/5] pulseaudio: enforce empty PN
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
X-List-Received-Date: Thu, 10 Jan 2019 13:53:05 -0000

The intention is that PN is empty, enforce that so new files don't end up in PN
silently.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 82b31580b7c..f81027e655d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -193,6 +193,7 @@ SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
 FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
+FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
 
 CONFFILES_libpulse = "${sysconfdir}/pulse/client.conf"
-- 
2.11.0


