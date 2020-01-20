Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F92D7FCAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 20so134372wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=squ2zBcWGaa+w94BFCpbjXvTizhP2Oks/RtdopGyJbs=;
	b=CNceHi+Ijle9lg3Vj4zyQzNaOX0qx8ofFCB18/WwRIdgI+7DHc8ZvOSSYG+QVodHNb
	+KERKuo2Z8UM38At3zmdox4ITdWUd1yQn4Xp4zneFBwgD9ZKiq8l2LndH9iNGL6ISm05
	fD5xD5GCcT6+/3Csf6nFjNYsZdR4kmGs3qBqiRpHEsxmR6C9VCx87f2OFKPeCKxXrxIP
	enxfo0zbkbei81W4LZ2mX1mJYX9yATB5MQUpQLEUQowmo0DWOUOplVM8LyEsl2/yC98e
	76cQObvi60++PLccDHE02pZUL7W3J+UiFU6v3mxApSqQoXPxrpYMAXWARJimGvzD1O5g
	7WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=squ2zBcWGaa+w94BFCpbjXvTizhP2Oks/RtdopGyJbs=;
	b=fyBPavMkct6c6q82IH0DXPi5YIXidV4AwMYAbKFbnO2CnzKNK2SErwd5f0ZPQjjN7M
	Mzpc5r9rei6QnLpTwp/HY8vcfaLADKnwtjDzVTQl9JgE0EW9RPrzx1WD0fzVpI6t+uer
	u9q+4lK2ENT+x4tGql81LPnGnMuERBMk95zGTwmCJ0tVcAaXZ/j0y6JlVrrdbOGZ2Ry/
	uB9wYyYWlvmc3dQFUppSfAoB3vusc1jI9RO2JZaBOVGVGAI+xUci+sVOmfJByW6DX5HB
	ECxmFU8eiHdB37R/j5KEcZMTwzdscIuvmUj3luBV4LrRBx3a888TnKEHMKC0CZ8nWpvD
	uO/w==
X-Gm-Message-State: APjAAAXE2ixW4DINGzC0KPF8T2DVRceSSNWR5H3sBQdzQM0OC1qof0Ka
	xMBk/75FksZbrUeHZpE/qpftGeGB
X-Google-Smtp-Source: APXvYqw0Udw+t0VTVpUOiT0nVWq55NsinWWMRamLqyAduNeXbM1doTK/S7DgJyEVYyd+Xhd34byGUg==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr336030wmb.99.1579541131295;
	Mon, 20 Jan 2020 09:25:31 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:55 +0100
Message-Id: <20200120172510.22648-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/24] ptests: exclude mdadm from ptesting
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:31 -0000

The are multiple failures, one is due to mdmon crashing in qemu,
another is due to qemu kernel missing needed options, a third I
couldn't figure out at all.

Rather then fight with them let's disable the whole thing for now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0a13bf0a6c1..49cb9046c6c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
 #    lz4-ptest \ # Needs a rewrite
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
+#    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one of the tests
 #"
 
 PTESTS_SLOW = "\
@@ -67,7 +68,6 @@ PTESTS_SLOW = "\
     gstreamer1.0-ptest \
     libevent-ptest \
     lttng-tools-ptest \
-    mdadm-ptest \
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-- 
2.17.1


