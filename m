Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id C2F9C6FC70
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 01:40:10 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so2031964pad.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 18:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S6XNTvRx9I+QXbQwtfY4WsRRMil1TKBH5inARYhcZc4=;
	b=ZzqJ2UON/1ZSnaRnePZpiJwP3x43kLQenio+2RXAJj8HUnMHqhFnKTSe/7bDBt6LJp
	tKY3zeD7pufrxf3S9YBtOqWxvyFlBXdQznN3t7kAzIOEPtGZahPGQql4NE4IqZRRF1yB
	vugUVLxFu23jZdxZf2teLMq/lCNeGEpoQgJYYq2/sffb92dUvydBxF/NOMlmmVKPOcfb
	yGjC59w1SdF4Vyj6cX/BvCFjJg+nZuJXRTfvXaH/GVtLKWUYzRUUTbs4S22tBd3Rxf8+
	s2O6T0k8AKB1fQ+tNWvsAeirBDhvZGTQoP/O0DmsGyjSlcxYA6Ov/tPwrBccLE8cCerA
	axhQ==
X-Gm-Message-State: ALoCoQlqkjUqcJslW2OQgOj7eqH52Y8sUPtYDKrsN1VtWuJ15DRK98ACXeYjcJZbMLUWVKSxiiND
X-Received: by 10.68.94.66 with SMTP id da2mr14075310pbb.106.1402796411884;
	Sat, 14 Jun 2014 18:40:11 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	qq5sm11021999pbb.24.2014.06.14.18.40.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Jun 2014 18:40:11 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Jun 2014 18:40:02 -0700
Message-Id: <1402796404-12726-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [Patch 0/2] Timezone update to 2014e
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
X-List-Received-Date: Sun, 15 Jun 2014 01:40:18 -0000

Changes affecting near-future time stamps

Egypt's 2014 Ramadan-based transitions are June 26 and July 31 at 24:00.
(Thanks to Imed Chihi.)  Guess that from 2015 on Egypt will temporarily
switch to standard time at 24:00 the last Thursday before Ramadan, and
back to DST at 00:00 the first Friday after Ramadan.

Similarly, Morocco's are June 28 at 03:00 and August 2 at 02:00. (Thanks
to Milamber Space Network.)  Guess that from 2015 on Morocco will
temporarily switch to standard time at 03:00 the last Saturday before
Ramadan, and back to DST at 02:00 the first Saturday after Ramadan.

Changes affecting past time stamps

The abbreviation "MSM" (Moscow Midsummer Time) is now used instead of
"MSD" for Moscow's double daylight time in summer 1921.  Also, a typo
"VLASST" has been repaired to be "VLAST" for Vladivostok summer time
in 1991.  (Thanks to Hank W. for reporting the problems.)

Changes affecting commentary

tz-link.htm now cites RFC 7265 for jCal, mentions PTP and the
draft CalDAV extension, updates URLs for TSP, TZInfo, IATA, and
removes stale pointers to World Time Explorer and WORLDTIME.


