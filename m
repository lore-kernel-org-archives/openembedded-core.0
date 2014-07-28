Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7BC60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:30:16 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so6768215wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 23:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=xPz2AjyV9zOmJAUYH3BmiH+N4DdLXZmanVolvPQOTJs=;
	b=EdRu7naI5F5ItX2Ak4trE+/A9PFYLqkqZhBqFvrzdoRW6MUrIuKqS1xYhk+a1nPD9z
	WCo0jettjZduq8302LnRrbISAaJ2fdd0JXafAruEWQokaiywc9SfauSSkmkmnq2N+Wfa
	V458Bg9sU0gGI1PLOIHHUzNUfdbuEgzJP5Tz5AW1qmn04XGQ0ijidszeKx+9nFma3Bd3
	0KI+DoDywx07CCN6kJmR0590JrieN/sPisV1Sr5yFw/LJRMWjUUVZlmx8HoLJZsaucWA
	2ir1vPA8hJkRNn3BDIswkeSU+ZR29Wd6kX57WdsWCG3AHPrdfM38fQHMnf9pwENy5Jl1
	3tnA==
X-Gm-Message-State: ALoCoQn8/zAysn36z4DrXktHXGX+v9cHZL/KCkKV+09rCW7TUdO+5dJDYH1Qb/lZEc0gRxTDmuuG
X-Received: by 10.194.58.83 with SMTP id o19mr7869558wjq.20.1406529017145;
	Sun, 27 Jul 2014 23:30:17 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	wi9sm47063027wjc.23.2014.07.27.23.30.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Jul 2014 23:30:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
Date: Mon, 28 Jul 2014 08:30:14 +0200
Message-Id: <FE5CD361-F77F-4383-B608-E216734EDB6E@dominion.thruhere.net>
References: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
To: jackie.huang@windriver.com
X-Mailer: Apple Mail (2.1878.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: remove non PN based -dev packages
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
X-List-Received-Date: Mon, 28 Jul 2014 06:30:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2014, om 12:05 heeft jackie.huang@windriver.com het volgende =
geschreven:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> All dev related items should be packaged in the core
> PN-dev package not in seperate packages.

What's the upgrade path here for image and users that have 'alsa-dev' =
installed? Looks like there are now 2 conflicting packages, 'alsa-dev' =
in the feeds and 'alsa-lib-dev' on OE, without and RREPLACES/RPROVIDES =
in place.=

