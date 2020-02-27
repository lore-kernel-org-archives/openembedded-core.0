Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id A622C61893
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:56:09 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 15so449382pfo.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ZQwd+lTe+jZL3KXmVebz4MH4puh2q4WvheQ2BZlW99g=;
	b=koc3Zr2iL1eUqTglc8CnWkASr6yHzvlw85ydEGpTxAVrGb9uJ0ozFsEcvcn7o2gMXe
	JXe58mHT1SSs826Azt+WWnut4m9TPHfQcJ4gOemwW4lbMAHZQ2NL0vkJjXYaqyEsHBbF
	18NBY1JBwe4JTAngad7iQiQz9RGyuErmuFslWltwBIhFjbSqKju3c14T3YVJZ0HSlfXc
	gDvaHmylAmonJzf3T0K20Pv58rCsedglPev7CoOy6AowY6+arZv3qPyxiHmJUMVBwnrR
	7SYsYExV2g6jSLqzQIKP7W9YfkR2FvQp4QzIp2Khf1qQfqSedv5wjoi5mRMYYQCPxZQx
	oKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZQwd+lTe+jZL3KXmVebz4MH4puh2q4WvheQ2BZlW99g=;
	b=uRwy1XLYLP3GAekih+za6Gvx1zd7ZUIabgXeYyBC6zWZscCwoWmYR4/4d2podF8ljH
	MPmYhs4v8mMWu7jXWx89l3KPzqgXKFg50iDMecfXZt9Sabk7sL8yRpvdGvuIc/VlxlW3
	Qw2O9wwMTv36hUb1XSRHYMOF+mXBmPq7WTmoRUy/t3mdLEf49uIIuH6vpRV2lMT4+D+/
	vBQw2jYyjT8K69QJCTVKUnC9y3RwIJ0BZleJEJeB7R1wdRTERGQuP3MMz/d+d4FIOIy4
	xMCq5XlbGmY7nbA09IfOsgDXgGw6OIG0b/XsHYJ/mePs3v39hP/zdSvaMu+9UK3nICQC
	xdcw==
X-Gm-Message-State: APjAAAURvrclZybvfsQR7ZzoK2xN9Fl2DPNF6QtK6ITVZpg2s2JZBS4n
	VFUf7yJVp2TBrpXWt3+FGnXCwOQV
X-Google-Smtp-Source: APXvYqzFNEIOuY5jZtFwEFmOscaoRsivTCQ3x3l/FYpIOtdS7Kzsvh49WBdjGrUzc9/fbBGTWbJkYg==
X-Received: by 2002:a63:d20d:: with SMTP id a13mr1161965pgg.257.1582836970290; 
	Thu, 27 Feb 2020 12:56:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id
	f43sm7150784pje.23.2020.02.27.12.56.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:56:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 12:56:06 -0800
Message-Id: <20200227205608.26788-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/2] Update bind to lates ESV version 9.16
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
X-List-Received-Date: Thu, 27 Feb 2020 20:56:09 -0000

Please consider this last minute addition to 3.1.

Bind 9.16.0 just dropped and is the latest ESV. It requires libuv from meta-oe so 
please it should be added to core too.

The current 9.11 ESV is planned to be EOL'd in the middle 3.1 LTS release.

Armin Kuster (2):
  libuv: needed by bind 9.16
  bind: Update to latest ESV version 9.16

 ....in-remove-useless-L-use_openssl-lib.patch | 30 --------------
 ...d-V-and-start-log-hide-build-options.patch | 33 +++++++--------
 ...ching-for-json-headers-searches-sysr.patch | 14 +++----
 .../bind/{bind_9.11.13.bb => bind_9.16.0.bb}  | 40 +++++++------------
 .../libuv/libuv_1.34.0.bb                     | 19 +++++++++
 5 files changed, 57 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.13.bb => bind_9.16.0.bb} (77%)
 create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.0.bb

-- 
2.17.1


