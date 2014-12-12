Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id EE17272336
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 08:42:38 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so1753428wiw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 00:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=FU87M3Hag0aOkOy3sdmm++ETInc+WsNQeehF3b6RHtE=;
	b=KwNyKax3gJMGaxIMmRLekve7ncqyuijI4I15JFQHlr+0MqRnfSXdcvng+B/MifZQc5
	5lqFx72Mm4WmNxZMnLIN5QrcTm+shc8G0AnBN9zu8QJRxBtg+pEiHF3LwJW6rag44tuj
	7Czz3VDQ6piDFAztz08dqCGjuBrzJYWbihpam07imEjLHT0ymBSNefEMKbjODlA4whmQ
	H+OP+Zes8RgnniLgYs/y5ceYBAzRMK0jv+ETD6HW/fC1Tgo0ZRUARpWHNiq8a6Y8Y3kk
	6bYTS/fzbOIJAUA5cb3rCL2CQLztJmvOwcXQk3DG4n5HoMW4OnalawDD4DZaFufL6G6+
	ZoJw==
X-Gm-Message-State: ALoCoQno5Gd4mIZy4hNHduK1wvd8X25tpzVMAp1EDX+Zr3wjof7W/gQ5VAIwBjRovDmi3YZ3SHaW
X-Received: by 10.194.172.72 with SMTP id ba8mr25152663wjc.13.1418373758469;
	Fri, 12 Dec 2014 00:42:38 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id gf6sm919850wjc.11.2014.12.12.00.42.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Dec 2014 00:42:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
Date: Fri, 12 Dec 2014 09:42:36 +0100
Message-Id: <8E0E364D-3B9D-406A-902E-557D58E366D8@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1993)
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Fri, 12 Dec 2014 08:42:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 22 sep. 2014, om 14:12 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>=20
> The configure override was too restrictive, it needed both 'arm' and =
'neon' to trigger, which breaks on aarch64. Since TUNE_FEATURES is the =
only qualifier that matters, drop the 'arm' override.
>=20
> Buildtested for 'genericarmv8' and 'qemux86' machines.

Ping, libpng is still broken and I'm still not clear why this bugfix =
hasn't been applied for the past 3 months. I'd like to get this in so it =
can be backported to dizzy ASAP.=

