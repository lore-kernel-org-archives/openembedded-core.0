Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C73F1787B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:42:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 141so3975935wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/y+rcwvVnxjKbCO0HuLs6CLshetSeMrLnmAhj8L9G0E=;
	b=Pbva3GTLuSZ21LBoETq5K6x3k2ZuhePxzZY9SKEcFtEhUBUr6DTUm3yNMNwcSeguqs
	mzNZ+tKXdEClRhGsKRRwl5lAc25IpkSwAmba/WlLrOaMeOTn5PmPJfVBQkBgNwa/LFUO
	kXLcRKmoLgRAPUN+F3x6K6gm0Lv5hF9h3pj4/qJhyEKkEmtI9uVz14ecuD+ukeuccrc9
	SwjClEArnhZo57dFUWatCPHpALzAkKIDfSqcQtP32FYEWuhPqZg4MtfnEMeW+XFDj5We
	wCvFqgnetY6lNPDOq9yKVvAi12/8P5q64MDSqCFCy0NiUB19NBRkthlxRTAWpxUZMOeu
	aVgg==
X-Gm-Message-State: AKwxytf8sGZ2IKTmSVFk5ezvWrNrcj48l8rACBaNapgkj8M5GokmWrt2
	6Xo224yXDDO3lxIkcI8+WsV3CVQ2dvs=
X-Google-Smtp-Source: ACJfBottwlUMgwtTYcmuYFmJcCBFJYyhwxLZ2bh2uuT/IkFJzQWHRF3VQj+byC0gAzJlvCgjWBAXFA==
X-Received: by 10.80.201.134 with SMTP id w6mr11972162edh.22.1516372941202;
	Fri, 19 Jan 2018 06:42:21 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x25sm6749148eda.8.2018.01.19.06.42.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 06:42:20 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:42:10 +0000
Message-Id: <20180119144213.7364-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [PATCH 0/3] connman: add a few backported patches
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
X-List-Received-Date: Fri, 19 Jan 2018 14:42:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches backport a few connman fixes, as connman
hasn't seen a new release since August 2017.

Cheers,
Andre'


