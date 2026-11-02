Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15278.1793633871496959905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YjYyaoC/;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so20452725e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793633870; x=1794238670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=YjYyaoC/Ua0Xc7jWO0tcv1jA55hZKmXqbQG9u7OqD+Ku3AXbw3vSNdM6DyXgYskGEk
         aVDq42wcqIqJ63dx5mprGCamj0XJO/kS6SzXwIUy0XOjwplPXPiqSmIGmXOhYF7N8b7j
         rhMMTLU5FnctA6bM5W8E3IPUMtu0UznplJVb+E5+vnXBBxgU2MgdlRzVza0wONFs9b7j
         qUJQLvN+/pOnN8Cfd3kjFlom4S02TtNVoc4SaDV5AYlgL5hTOxJQhg6wIaQ2PFDLJChn
         ae20U996LtWRRigetnaOfWM5WJwyeRzPAlRtGItbbPKY5k51gfNnWj2jPFI5BivkfASv
         H5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633870; x=1794238670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=GkZTNCLkrv1mmV+3sUXIbjA5ENIucdE+cKR7GW4XiCEIoiSbd+tVD0hKqNGChfyjpH
         cKa5sCvWQqL7/cSa7PT+ZWHW2yQcR3MfE2IqbqG6E4pOLBXJWgPSd0EmtuJ3nMgOZQNe
         /BxnrJEbI73bHUHTEwKeg5WB31140dQVbq1zWJvMXerKNwc2MAb+RhN86zuClbvnRNuV
         k28rUJEMvXMCU1AqggQsIoo8TmuQcc7gWNInGQWh1hfztpBWL+BkSojsc29KBx0fPBwb
         d0V96oq7yUHZjENRLQ++ByfFYeIA/6aHNxCC6bDEl3ReMuEv4J0gegyAufP2Xlzgl1LM
         1Pow==
X-Gm-Message-State: AFq9FYIW736bnViVHqcCcE5VL7M3cSFF7V2R1zUJzoBv2OtyUMt3yktd
	DrOAWcwmGCkpx3TWJ42SbzFL+PMD6vNvFtCV2x0eBEJyUr1/lFp90CFnGOt006i/UZpB7AeA0oQ
	T8PgvhY4=
X-Gm-Gg: AYBFou1Zu9RgH9M6VH6MBzQCz6e9VXBRD6WvHYqoTAnDaJGRwf+wks9J2YV+8+41Ypw
	zzVBps7QUj8HyrUJoQdFQ+GVWIgXNOOge5XzuyJVP9xJTf7zn1GiMWfsnFScfSbZdsV4F7DMv00
	1paxKZPl20NN7CtJRcSMr2RALGjrW3JaA+KoARLcfIEpYDJtOMHVaCxBPt5vdHTuJOEp/7oPuNs
	057/Og92VHOGDx8Lhf3Q4uAC+F+8uv+XUfuwHcqK15coxXZvIQSJDAIoPbBa2Mq/ZsIKUBwJ8EX
	TcVGu/jHyiyFGfPJkuhamOTQUN/atnjXyOozGFv7N4xtZdiF4AWBezYlIUdSByfXtKYxyOKnnja
	gYMJwTQY7NsbsMGiw0lkDAzubS+YOWb55aQtxYxZiqtJEi22JXHUoNB9/SppGXrtjNCqZGDVBT7
	tUhi9kK+TQ+8/qwGTlKyAci2Z+h1ZCnVnQVjEOC/0jV2RcgFcdwotCwWLhmEqoPPlLKKzEdf4jI
	/66h7LO5CBntnQPdYik5smL/pLXl3o1DdX+x3TlqLDOSeSV5MFL9DSmYuAFXlOz53rPFNJ4zq4I
	4XNnw7SEEF1u7w62qnADxPq+xXb2DGN6O+1fHXDjzmUyBOCpGOrFHIP0yc4HstqHrSx7weKXff6
	Mc26B1zzgeNwuzugyWV7k+3ZcH05x/J1bBXYt
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4ac16acfbd0mr220589475e9.7.1793633869607;
        Mon, 02 Nov 2026 07:37:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a762bc1sm127422305e9.4.2026.11.02.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:37:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] scripts/install-buildtools: Update default to 6.1
Date: Mon,  2 Nov 2026 16:34:45 +0100
Message-ID: <20261102153444.416219-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249218
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Update the default to the 6.1 release.

"The last main release" makes a less surprising default than an
arbitrary (now-EoL) stable point release.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4e6f6e25d72..b92c26c4567 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -58,8 +58,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-6.1'
+DEFAULT_INSTALLER_VERSION = '6.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
