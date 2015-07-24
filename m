Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB3460962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:53 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so26572254wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=4VSyeohNJQIyr1Wo/oBi2gr0MJXqTvtZbW+J4l7rq8E=;
	b=hglhPHqZcybjnpiC9D1P59QweIj6vIv5XEhZecvncVsx6q1lCv0lNcG96Eci0HGeVL
	nxb7NMS3T3/tEQHHHvlV7rG0S3yon9IT9WSnWYcSWruJt1gEbjA2O5ZhNO4koRurT4bL
	WTPwMmnLkpxuJpwyuu9FmGP1X6Vv0+WQ8GpBmRzCw1v5eQGSzIUHjTIvglk1Op0hIJAl
	9M1ZHycWRRG1myP3m2tea4tMyKOJ84nlf8C7woID872oDv/MdNhfrvOWjFpE2G57n1Ve
	CvrvEzJQksq/T4RlQdLyVxaz81XkKC7dFc7Zgqo+NseKMaloVlEkWkHcsJ1Lk1CPvpB1
	wCAA==
X-Gm-Message-State: ALoCoQl4pbMg9S/x3PwTZzgFwLUvtlK3UH/G6ON4v25IMhWrFL+2PVBeshDmxC/tfBF76n0h9Jgm
X-Received: by 10.180.7.130 with SMTP id j2mr7210511wia.29.1437742133337;
	Fri, 24 Jul 2015 05:48:53 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:43 +0100
Message-Id: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/5] fix some hardcoded paths
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
X-List-Received-Date: Fri, 24 Jul 2015 12:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches update a few places where we can use ${sysconfdir} ${bindir}
etc. instead of hardcoding them.


