Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3090A731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:56:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so3788811wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iPl2dOa13J602sLvZ1tvI7ijdeBxJ8t6qid3nROowD8=;
	b=XawBK9tZrH/C7o5WVt/KQXQ8huwO8v95MYOZAb9sC8E22iJm42v3vJ+4m+nwIy3DtF
	oTbtKeTCJdC3P0hWRg2+waUF+uduN71Ay+8iw9NV3y+UTU9E6qTmWb0bEVvS1Qz5ga3B
	tWJ2GePdbjADXb0IK3MoOCOjyHMUWj/Bgvp6ryFiUSQGUwh6Af3PyTrD1X1lq7WBKsDv
	RCF3uxxlvwQ+Mq8PKdJHXXdQVLC503T22++p3UUw/Hi02YkrTAhK1P+yKqewlw1cDBwo
	OIgWMLXvQVSWoKxHennPDktW7tlQqEu+31s9gHvZvW8Bv2PyfG3shOmUiP7vP5f/3UrN
	bC/g==
X-Gm-Message-State: AEkoouuy2SbByY0lUho2dOFgoyIF+ld5wwNsEbanmsCbEg7xnDzfJwdL9yjCtc6JUeexYw==
X-Received: by 10.28.24.5 with SMTP id 5mr30798425wmy.6.1471506990354;
	Thu, 18 Aug 2016 00:56:30 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q65sm1318701wmd.24.2016.08.18.00.56.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 00:56:29 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 08:56:23 +0100
Message-Id: <20160818075626.15973-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160817152538.14181-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 0/3] fixing kernel module cross-recipe dependency
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
X-List-Received-Date: Thu, 18 Aug 2016 07:56:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In a situation where multiple external kernel modules are built
from multiple independent recipes, we currently don't generate
correct runtime dependencies of the packages created.

This (small) series of patches attempts to address this.

It's working well for me but there'll likely be cases I haven't
considered.

v2 of this patchset:
- slightly rewords the commit message 1/3
- fixes a typo in commit message 2/3
- removes some variables that are now unused and were missed in 3/3

Cheers,
Andre'


