Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4457F225
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:54:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v17so2492770wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6tUsoHzUgh2RHO9Xc5m31PVKpLgw4QhKrVPFS0B7dx8=;
	b=Nqg4MbniJWufgl0Rax84VfM8zFznr73+yo5QIaXxd1i92wa4piyLbscfUeh3WsOo+c
	PdZ97QKl7cD5Q1iM4hl0dMABxrKc57kMSxr7X39ydo5Qirb/Nfq07BD3P6dFoJXWCq9e
	kgQ81TVba7SsNDEEJuYq6Hq9JVrmPsGT1fB36JH227NqOSWOMLElJgOYgg0X/lKfLEwM
	+l8zstTyvxzr9JSf9Wx7UuYrfdA5MAjsNNjbdi9JhooVS+Hps1VF4idnWJx/n4oFkYYi
	4sr4vFrbXmao3hYhDecE9qcQUj2+9uHN5gxBITFFUbv2ds4eXwLXMsiiixE+xcKb6iRf
	X8FQ==
X-Gm-Message-State: APjAAAXgdAuyk/9D6bQN4+PcgROgtD+Knw1Tma77I68aLC/4YVJg+3F+
	LEpOkIedbtXKoyXSFXTlJAG4bSb7
X-Google-Smtp-Source: APXvYqwpQ8hxWSimgT3dCSb9gAKDe+4sDTYSmsvzRfWG5GF277iXgIAtUWWXjQ01Fxry7nhjoExnlw==
X-Received: by 2002:a05:600c:351:: with SMTP id
	u17mr2830996wmd.1.1569923700014; 
	Tue, 01 Oct 2019 02:55:00 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g185sm3070875wme.10.2019.10.01.02.54.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 02:54:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 10:54:48 +0100
Message-Id: <20191001095452.37335-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH v3 0/4] ruby recipe updates
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
X-List-Received-Date: Tue, 01 Oct 2019 09:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates the ruby recipe to:
* remove duplicated patches
* make it work better on musl
* fix non-IPv6 support
* update to v2.6.4

They were all kept as individual patches, in particular
the version update, so as to make backporting the
three first recipe fixes easier onto OE maintenance
branches.

Cheers,
Andre'



