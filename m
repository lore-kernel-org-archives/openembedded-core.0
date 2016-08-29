Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 609B86FFE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:55:14 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id q128so15571649wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b514/PH3HYc6UfU44XHnoWtOB8CBvf0rebfOxxAV0IY=;
	b=OwrVSpdNPuokat3cAumJNZl/Wngt2U/PkC0KD4a1IhLMBKdOmhMT5mn4ITUbnX8Z0l
	3O+1NG6qjaa/Vq+VvTu+20YC9ZmTU2UX69ymEMISTOF6/qhtXiMm4aaueNjhUHWqGF5K
	bW2AZJ+1gDOBaGMoxI7wNrVb0WRQdZGiSVJdmf/RBFM+tdBJ58IYN/cOnuae5pgfHuDl
	WJIXb4rMSiQmM6v+9d3kiSGdY9iUiUIqiSo1/QLaFTYZgG29GxZWgCtRPA3Z/UdBB85c
	K7FVpWeEHImQwaP+Is9vp65pCggvwCfYWsKwm47nUoAhrTLbNDdAndT8+Wp3Reioebrf
	b/lw==
X-Gm-Message-State: AE9vXwOMpBOqFNN/W3DylDDWuOv60O5OiW2xRRL9PI2dDB4BvP4tEo5wSVc8lyOHKOimkg==
X-Received: by 10.194.173.4 with SMTP id bg4mr14962072wjc.28.1472471714304;
	Mon, 29 Aug 2016 04:55:14 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o5sm9137789wmg.16.2016.08.29.04.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 04:55:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:55:07 +0100
Message-Id: <20160829115510.19560-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160829110341.13100-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 0/3] boost mips16e and soft-float fixes
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
X-List-Received-Date: Mon, 29 Aug 2016 11:55:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An error crept into the previous series :-(, fixed now.


