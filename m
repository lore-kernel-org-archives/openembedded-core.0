Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48D6B72FA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:04:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so21087856wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L0neGVzmxaltC268RRVAc1bL8Izf8wvue2QRAOLcjls=;
	b=CR9/MevjTagOWv479SzKoqno6AeowGd31NN1wQUM/KxsYNqZulDhuuUeZDg0VyQsVX
	6x+ldcMHwqhzOeQsMu0WszxwbAkYFCLHQ+jrFLWVkSR7l5p/Cn41XixDGYInP7EShTrm
	7BQGjd/78/otG54WjL7iJpCeghVCXTSI5s3LC/z4f9RmEmdjVHHl4D7JrnYSAKm2uGzR
	0vH+eZbwvUugih1DDPRHOrOxlKI0n4f1tlG0peKFP3Wj0xeOvj345cKUgJoBca2TD4nG
	YAVEqMf0KPtTRRIyydOFoMmKwFTaGSRpQDGu1TlHKdiSM4vHEZYzxgRRaOcXZQquW0LO
	6ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0neGVzmxaltC268RRVAc1bL8Izf8wvue2QRAOLcjls=;
	b=LJ8u9izaxABGVIsgP6arVK5vODdSp0t/lC9fLzO5iGAJIpX7yrv8yQ+73R4bBjhxdE
	VHEF4SBFCZELdpCxVFMQ8000zArtssDtS60Ha5hGTk7Q8g2J3rHgSj0wUaY1RPmdn2F9
	4k2cN9AaTeSvaolLRuCjmLAK+YFLWwvoF92xEoHEdIyyoqRjkSZth95a2B+VIfCD4qNF
	iiJ5syH/AsTwJk3spIOyoxmtGn/cZyMc+MxSK1oSfKRDNpZuWcwQYVUSGFZFO+w+S0Y6
	VQTWvybq1ncK9xYSnVK4bRvRl5R72dRQiexByuAgdYPN1mxAqbsjH5aDbSczApGS/C3S
	fpxg==
X-Gm-Message-State: AMke39keG8g0OxIUlJx+75SojG0zHnzTmo+Pn6MigS9bDzdhKk0uYJI/OuYwCFJFRHg5NA==
X-Received: by 10.28.157.70 with SMTP id g67mr26030937wme.111.1487700295848;
	Tue, 21 Feb 2017 10:04:55 -0800 (PST)
Received: from localhost.localdomain ([62.179.106.250])
	by smtp.gmail.com with ESMTPSA id
	d75sm14290546wmd.25.2017.02.21.10.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 10:04:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 10:04:48 -0800
Message-Id: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2][morty] Backport image dependency chain fixes
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
X-List-Received-Date: Tue, 21 Feb 2017 18:04:55 -0000

Andre McCurdy (1):
  image_types.bbclass: fix image dependency chain collection

Randy Witt (1):
  image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

 meta/classes/image_types.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
1.9.1


