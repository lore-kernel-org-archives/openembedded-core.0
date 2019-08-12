Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D83260685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 16:01:57 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r9so98781529ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=LI7+NmCvwMvvhEEQldzLlpjCMZQQMgvCdAXBKqGUzC4=;
	b=su8jCTvWJ01yNDSj7/ctBNvF+Oq6OylK/UUsWGAvbLaI9J6bCLFv3f70HH5KHUmFt/
	UxBw4yGVWiFAz6kOTMQbr79SAgoEYAb6sY0cWUKahti3MyOrkrYkhk3SUipkFTWcW4Wb
	643o/Joj8EiEJF8sawRjK/uXZzFvxM8fzK8r5aHFZXFZbkv08dfejltSvYH0fqRNaOG8
	CnL1egwTX3xi39bcVI4/H1Eyw63oa+4CHb2z3IgpsM/Nwm4KYzdCqDjICeZUrUSH7Qpk
	UHtCWJK+uXV+OemIeCDSuoy5GPgxyRZEnDXf2YEQ2RPIhRp0cgu08l17BXsTn08Nc3EW
	CVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LI7+NmCvwMvvhEEQldzLlpjCMZQQMgvCdAXBKqGUzC4=;
	b=GBnR1DK4D6Xu7eAVBssQOhykytl0tpEm1Ina4grVjxP/r415iSXTbpDx9tMg3YKRB2
	zE6/M4ERqx5CGj5NFFDuW+1+Y4fjsvnJ9EZVbhbv8OWL3+bouFBgYR5RinjPNPDW0N7l
	/kDNFCWt5D9qKTbxz8HcEczYl7jonDB2GSPsaaxZ0G8DA/zas9S4PdDp764qXlf7Cvsm
	X88vjhFLdwEu6FNJSha/T91TsCC+rjXgQL7/gU0vSW2rt1rgV4SlEyk4sYD6nC4Rzw4V
	+hud3TAVJyI1mor+VPsgSZl7h98gGM92hoKVuGtqqiLs+1IRl2gRTUZX2YDhe8/63hVn
	1BIw==
X-Gm-Message-State: APjAAAVJGhJwlsHxSqxI+1zukKY6BStf5dtIoj8ucelzsiTY4Ev8z2PI
	FeoLFgetuAo+idiZQRLM72SvZSNpoXI=
X-Google-Smtp-Source: APXvYqzWOgZwsKRwR+ERO+MOa+UX+Jipdr3tLDyopUQV4JkEMyFdQ9MRYIMH1yKjnAiBZg6rmW2RLA==
X-Received: by 2002:a2e:b167:: with SMTP id a7mr19810283ljm.26.1565625717570; 
	Mon, 12 Aug 2019 09:01:57 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id u3sm6059277lfm.16.2019.08.12.09.01.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 09:01:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 18:01:53 +0200
Message-Id: <20190812160153.567-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] linux-firmware: add PE back
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
X-List-Received-Date: Mon, 12 Aug 2019 16:01:57 -0000

Add PE (package epoch) from the previous version of the recipe to avoid
problems with package upgrade due to changed versioning scheme.

See:
http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285633.html

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
index acaca955be..9afaad73f3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
@@ -190,6 +190,8 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
+PE = "1"
+
 SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
-- 
2.17.1


