Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA6BE7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 02:41:21 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fl4so26978971pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 18:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7RH+rBHTvwQPN7poFAaq1G1yTvTJ5F89Iacec11bUvo=;
	b=VKey0ozABHBFfwCrcOM6ad16wVUwX9bhFMbq8apeK9fr1WPFfZOxZqRrDuxB+cAO3S
	vN/7xFozZ3CGQlLCk50iUPAQ2CAGTfEVmdrsqRj0LupDUaFU0vfxFdsemmkCALAnIRXY
	LlUQtVysZA83yW6+oriTuWfoQriGVSPQa9/KJmIUs5x9MBq835wbgNdQV+xVLN9QkqPl
	pY1jxhzJAFT0IXYyIlWy7iusbWFcc+TfKMos4sgJxeouTFngmxAziSsvMewjL4pPdj3Q
	W5QeHCtmrnYfK/iGB3AyL+73gA45KpqXH4ttpjpCUOW8s0mh9GPJe0olQ5dgSUTGnlcU
	kxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7RH+rBHTvwQPN7poFAaq1G1yTvTJ5F89Iacec11bUvo=;
	b=kjZiUdP6T8RcPg7qAONohZ5Cd+Eko4aTJl0WG8saI9zX7sePPwbehJFm0IWy/9pIzJ
	U8oDZ3Gqa8Lu65nxRX8SWGr/T5pwwaOiJ/OqVvlYTsWMIJln0biHZF0sA+5fGWCgKpF1
	scMQhm9TtKX+5brVJbkgnESuZkVU7tgFLJht9efP/UjeCm5f6CR2ILvPXQa9GLPYrdqI
	wmvuo7HPVWCnvuAs3CzIAdbtJNvJ7E2wBImFaf2e0WV6nBDMlOgoQSBnDaEtW+WbiM31
	niNUXp5HAdH8gSsNW1og8JUwoTthJHNgQwFGjpCD6rh/wfJPAuBOSO6rgvSPXotBGXE3
	QVAQ==
X-Gm-Message-State: AG10YORrt5SCrrLIsiZoPRo3ylRPXESWDF4CSIMIXlTOwfG+lMuLbJPLSLeTHxwnf/NrOg==
X-Received: by 10.66.216.69 with SMTP id oo5mr69937728pac.126.1455244882142;
	Thu, 11 Feb 2016 18:41:22 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	mk3sm15215631pab.20.2016.02.11.18.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 18:41:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 18:41:17 -0800
Message-Id: <1455244878-7901-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [fido][PATCH] Security fixes via package update
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
X-List-Received-Date: Fri, 12 Feb 2016 02:41:21 -0000

this is to meet our obligation for Yocto compatibility.

Armin Kuster (1):
  libpcre: Security fixes and package update.

 meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} (91%)

-- 
2.3.5


