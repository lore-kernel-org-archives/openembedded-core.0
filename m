Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1432B7DD6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:20:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so9748287wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qJ+wFRb5rGHjYhciOEKrtvZn4CnpYlpH7RnXUo7bkSE=;
	b=gLLIZNbnvd3JFZpaH/x/dvAsM6H72GjL0iQqSw8gEl5a4zYz4mzRG6uEp7GS/FGt5Q
	3IRH8tOmDCTFJBQ/Uh3lDbr9IIY+qdUC8Yl1BOCndzuMS8XECdJbgywWVZNblSZpHi5y
	rBvsjbJpINI8PFQxjzgzC+vSWjB8xXWiFyyeV6YFj1dvbgo5ziWmQgKLt0pcGC8n/4Va
	bpi6gQv3jHPY3cIDb6IxOYfEEYJTSQEW7nouuIcvBmrJbI4GoV3FQOEUZotACXCsPEF5
	zD6o2qP/kXKuxCh4r/mGiAa8a+ycKXDcCfVGQjPoSxST1AogffJXDG/+/YdH2sgTpMit
	PcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qJ+wFRb5rGHjYhciOEKrtvZn4CnpYlpH7RnXUo7bkSE=;
	b=EobElLtLFyJ8yMu8Eb9V+f64JFGsE022+8EMprNmmsy2ysqgAoTm2RBM4Wua8Fs/3S
	7Ejw4crRxrLlpZHR7alAeP8JtwbbXfjpxyTefjhS/l7SdB6b6wUeie4chuMqWu2DcVfH
	PX6K2Asd6wP5zghiDEpiPW9KGM4/fmwxwfDFIYRQeYU1EbQHcER5eDBIbl2e2ag0iefj
	53WijhrWfdeC7Y5d+y1gkr2krScccwvSmebZRhMzbvowZtJ90AbfJOE0OoyPTvEDLs75
	Fnh1qn5sL//Gdo/Crysoo8hC1/qZpWoFd0a2sqnBdEf+L+PkaVO2Np6Vuo8B27AN6fKI
	scYw==
X-Gm-Message-State: APjAAAVB8Cmb0xhA0nusEvMtRleiH2Yr7z8GUI137uL1Hs3QlEEdEcYR
	WrH1jgFrc7mjKgo+SXrWCWxCX/hidXI=
X-Google-Smtp-Source: APXvYqx9zmcNGh9asx8kdGZdEintwV1iRcx/6gZ1OIM9ASKv+bRh43PsFxeQBKzZeol5Afn5SrRrAg==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr3957562wmd.22.1562343623729;
	Fri, 05 Jul 2019 09:20:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm9358102wrv.34.2019.07.05.09.20.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 09:20:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 17:20:15 +0100
Message-Id: <20190705162018.28251-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [RFC PATCH 1/4] alsa-utils: disable tools using GTK+2
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
X-List-Received-Date: Fri, 05 Jul 2019 16:20:24 -0000

Change the default configuration so that it doesn't need GTK+ 2 to build, as
GTK+ 2 is obsolete.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
index e1b50fac523..c1f4acdb038 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
@@ -22,7 +22,6 @@ CLEANBROKEN = "1"
 # Remember on upgrades to check that no new tools have been added.
 PACKAGECONFIG ??= "as10k1 hdajacksensetest hda-verb hdsploader ld10k1 mixartloader pcxhrloader \
                    sb16_csp seq--sbiload sscape_ctl us428control usx2yloader vxloader \
-                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2DISTROFEATURES}', 'echomixer envy24control rmedigicontrol', '', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'hdajackretask', '', d)} \
                    "
 
-- 
2.11.0


