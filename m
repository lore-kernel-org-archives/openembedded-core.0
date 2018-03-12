Return-Path: <matt@madison.systems>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 172E978878
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:29:20 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id x3-v6so2624319plo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m/IcmNBprqFJXop/QtAgE6OVMWL3yWCUPQEFJi2h/f8=;
	b=hUWSIu9XqZDZZe/hBI7ptL0Ooe1eBA9KiLJvUxgjUSmvq1sLmK11/zg1xyYBMWgVsE
	Sj57kVOljcAMh3sXr3DR44Inu6s7lgAmhPX8E/sLEuvoLbvFdgEEBTrpUptRhZZ9EZmb
	9Oh65F9ZiifyGKdvc/MTvm4YriXR1FInZMLb/zJMMFWaJUvSbHTTo3GbO1sO5xaLyLXt
	u50zSj6Qw24eVPXw/PbJVumNKb1AvJAnqxkBAALNgr+5XNDSXV8acoszkqni6NuVlzIf
	gdIo0OJy9uvdGRVGDH92Y3sgbX/lnTuLrkyTvLyZBjI9KqSjPUJPBMkbIzMg+DmjzpHu
	thZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m/IcmNBprqFJXop/QtAgE6OVMWL3yWCUPQEFJi2h/f8=;
	b=i949OReb7pcb1WYsMnBPGBnWk5ztu0t7SOgmFA2bRh66bukUV03rOSLUbpU28Hb8Xj
	bJdV7V3K4d/tLBGQOoZy7jm4XdpK2xfpDUF1DPHbC48R141jw5yjLOGSObs1cYPJZ5dd
	iGrrYMeR7kN+iVR4AXB9ufIb3Bd/W6M3F6B5eEnHb1Xxj4/ZpnylAVHMhCPLnJkmFNHN
	nikse5ZFB4eXKIpwQ8m+QI+fRQqHfho5d5tknZm7o/ociBbrqFGR/Df2Fff7KLZTyEgK
	ZKA4Dq0cNuTYqKUw9AYe8XSmOt625gBLBhfVm/Pu6GJw6MKx7+Hqh/Ciyy712zodUVM/
	hy9Q==
X-Gm-Message-State: AElRT7FbKIvo1op955K56ff/aZZTpZ9HjsEiG51QkJqXzzMP5D/5R5gG
	rvVJWv/bWnDOOBUow/PJdwJGmsot
X-Google-Smtp-Source: AG47ELt0W6f1WbCB0nfyfgSM+7mwNehsGS+7mrg6vRxXEMMTg2qB8Q9TSxxsMMRqFFTZDvErpE2TUQ==
X-Received: by 2002:a17:902:149:: with SMTP id
	67-v6mr5146734plb.296.1520854161849; 
	Mon, 12 Mar 2018 04:29:21 -0700 (PDT)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	t20sm15340573pfh.182.2018.03.12.04.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 04:29:20 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 04:29:00 -0700
Message-Id: <20180312112901.9844-1-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [rocko][PATCH 0/1] backport go 1.9.4 update to rocko
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
X-List-Received-Date: Mon, 12 Mar 2018 11:29:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One of the changes included in this point release update
fixes an issue with the construction of Go's shared runtim
library, so it would be great to backport this to rocko
to fix [YOCTO 12592].

Thanks,
-Matt

Otavio Salvador (1):
  go: Upgrade 1.9 to 1.9.4 stable release

 meta/recipes-devtools/go/go-1.9.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.14.1


