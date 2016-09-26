Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5901460123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:42:32 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id w84so158643991wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 08:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Bw5WZH7kTtuB0QG2S6NK37G/8WOS1A2i/B31LE+RBek=;
	b=i5hmnMuNm2nteRI0IjQVoGtXXtbpU+FWnVcikBBmr6eILz7ZDq3/uONCbp/PgrmYul
	mN4Q2FXFlet/+n5KaiMC1VRHQGjnAp0CyKYu4yJNoi54LdnW1KozELlplcut80uSgNmR
	bX1ncT2thh0DPxwSqikj/MGmss+KQMVWiNWrudhk8GX+vKKAYI+bsKeV09KdxSiR5jW8
	KP7hL2/3Iee2vJMYDuUE1KWfhifEsgVXUTMg91iG6LJgewi52/tKr0kK1qW/s/nzo2PI
	tP28LBKeYHV2Tr7yCL4MUu8Xrv8l17Hx6TYfFfLl7TxnjD1h0iFzNcKmOkBM/mXw9dJU
	cSzA==
X-Gm-Message-State: AA6/9RknvI3MDJz9JqaFtPrx64XBAqDTU8NZITaM3/x67ze5Gj9kHJt/0nQnKIAGo/8ALw==
X-Received: by 10.194.161.68 with SMTP id xq4mr6065702wjb.135.1474904553522;
	Mon, 26 Sep 2016 08:42:33 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l206sm11847903wmf.15.2016.09.26.08.42.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 08:42:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 16:42:26 +0100
Message-Id: <20160926154228.30567-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] cve-check-tool progress reporting
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
X-List-Received-Date: Mon, 26 Sep 2016 15:42:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches implement progress reporting for cve-check-tool when
it is downloading the CVE database.


