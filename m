Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8CF7E063
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 16:07:01 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id s11so2069501pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=shvie6MQ079r2cS7JV01FjxEo2iqrEUf0vGG+ERny4Y=;
	b=LmDBURhGyxXhCP1LFzYlgwYUqsMYLg97FbQ8q4k8drl+Xs9bKr/NsAfMibSqcxFCri
	gzgDSR47GePAB70uOPTWx1rgndACEeI2BaMbQqgnBbVIwMTiEybWq3xq9KUWDeCdP4Af
	FN1Oy/4jYxZ8Xeotzntf8T2EnwHL5Q9GYyMqcpTKjlhQBqZAeK3ZAYcxss92StU5xSaV
	ZQEAnIWhmAbJQAVZ5//gLhZIILifPgJEkAjfeRUR/mQP2CNwi8U0F5NSDXoERGaNLfvD
	YEaN7ZXCBJ85L7CgUqLk37kjuXdZB7CYY+X60G8ZryL5ZYEd0r+M2p9zgveQsrsmeN+T
	6hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=shvie6MQ079r2cS7JV01FjxEo2iqrEUf0vGG+ERny4Y=;
	b=pOjZUk2Thj7iIS9tJxRPcg6lgR05tSObEh3n+OwssNYSzajVi0GyUmqEjEugaypweG
	c6bdu5LKYuML7e4NHWQeObw0t2/Acbf7eq911bMKGcTs+0YOZOs3V+VSmzhNQN4yqw73
	Fyz4oNjfoFozNdVUBEXDFpS5yhiD1Smbq52MgSAkp5wBmqXMZ24W3zSSYO3AzE7VMPwa
	Tr2mcNx33mzZFlyS3NX/R1MiTezrBs6nkqdtTEyhz4iHXNvO8Z7GvjyOf3EHT0Ctg7OY
	eTIjdomL06dLX7jK2pS1uYHBgZZFo2k1nbxKHREOCuxfNkd/zC2dNqCYOfN9jPpHrVmp
	rWpg==
X-Gm-Message-State: APjAAAWMlNuPzPg1kkVGIP8VUHue2qOFtPaH0a1/Sb7zvDDBfCTDyuGS
	2RzPp5gJMz8BwFZyzhvwjYbeRhQi
X-Google-Smtp-Source: APXvYqxCsxSjaYlb6O1kPS8r/JmJnUX2owzD1q/5aTXWyE/ToZixg7qPEP1opKO+qaaZJ+AQaM93mg==
X-Received: by 2002:aa7:9159:: with SMTP id 25mr24081965pfi.64.1558022822887; 
	Thu, 16 May 2019 09:07:02 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	q10sm6156148pgh.93.2019.05.16.09.07.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 09:07:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:06:58 -0700
Message-Id: <20190516160700.20685-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [v2][PATCH 0/2] refactor ptest.py
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
X-List-Received-Date: Thu, 16 May 2019 16:07:02 -0000

Sending out as a set.

Ran fine on AB for fast and full ptest.

Armin Kuster (2):
  runtime ptest: refactor for future work
  runtime ptest: run each ptest separately

 meta/lib/oeqa/runtime/cases/ptest.py | 122 ++++++++++++++++++---------
 1 file changed, 84 insertions(+), 38 deletions(-)

-- 
2.17.1


