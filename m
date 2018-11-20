Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id D07326B1F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:04:22 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id a205-v6so5294677itd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jhptocROoGKFetlTUP71fOdFO4u2AgKc2lyvfUZc/3w=;
	b=XBUdBW9+7kYXifrJuXdNv3NeRd4S/dyD79VlhIlXon35/FvbgzlkmPvgVx1U+5d3Nd
	dHxh6hor0wjjrCNmhV56KSoh9FuWsiPM18WFJnpe2WgIg/bTMqWV3NtpDlPI04PXoLAO
	7ilc+Mwl+OxgOsIjzu3w/V3FZUKzC8nobxCjqltAJUFU9zvDWrKZOee48rAlPNbgP4wJ
	6qnTVRry/CHYyueg5bHIvWSkCXQ3/t8fZGpuECF8awZkOyFt/cj8tPYr7NNFnNxsAUay
	aodLSuxPfHZCPWgg/GWtXAsjFYdQPX7nkAfDKVDHzYvHNLPWBE9GYybkw1Za+xbZvtmf
	amnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jhptocROoGKFetlTUP71fOdFO4u2AgKc2lyvfUZc/3w=;
	b=B/0KhI3TDP561lksFMD6PwgHIjUMJ6C90RKGKkduJ6aOA1dpbxT1aezl8VO/ORlxl1
	saiPrB+Pxh7ZL9snzATtPo6pvUHYDT4I0MUvtYpzQlejj1/037SF9JqC0eHvlCRO6is/
	5/8krDdbU3Kgl3GloqTXYwBUDC1DHrIJM9/quYqeoS2+YuDT1p/MfMt+DpZAPkl46lD0
	gUyvc/6lES9IU/nER2EcdNR0FKPZ0jULeqI+a5OgYNoNukwlOQJFpuzKusXKLSO9mPoj
	sHHxY7XFMq7BjXLnNnghbkhnUceJ3aBX9ovNpmfcru59iFzKY4OGqKaG5hD2Lnz/f8Nf
	g0QQ==
X-Gm-Message-State: AGRZ1gK5tuQ2d6gDJPSgdf7q0eDiuZ7HCPJK6opojx6WaPvuL7+h1MCe
	d/rlT2PLUGfFKzyGGA9/09uPuDerNxg=
X-Google-Smtp-Source: AFSGD/X7d6VLA3pShKd6uXWoI+jN8ryXirnxvmeug1UQIeQr6bxfzdnf8C4ZRpFTlYw6sD8XCfFogA==
X-Received: by 2002:a24:e14b:: with SMTP id n72mr3511989ith.170.1542744263477; 
	Tue, 20 Nov 2018 12:04:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k133-v6sm16414194itb.16.2018.11.20.12.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 12:04:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 14:04:14 -0600
Message-Id: <20181120200416.15895-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Update icecream blacklists
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
X-List-Received-Date: Tue, 20 Nov 2018 20:04:23 -0000
Content-Transfer-Encoding: 8bit

Updates the icecream blacklists and makes some changes to prevent such
updates from causing world rebuilds in the future.

Joshua Watt (2):
  meta/icecc.bbclass: Move system blacklist to variables
  meta/icecc.bbclass: Update system blacklists

 meta/classes/icecc.bbclass | 39 +++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

-- 
2.19.1


