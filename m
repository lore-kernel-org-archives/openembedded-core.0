Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8542BC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:24:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.9413.1742297065788130179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IX3oPfvP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC6D420452;
	Tue, 18 Mar 2025 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742297063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lx/+F8OQtBYeUkrtI1hsOrzOx0oXOTLQdItZ6N5yh5A=;
	b=IX3oPfvPtwtDD57/fDsM78xQWfOJaoUBqjq4ef48Ft/5ZACbXUaPaGlDUWCaq8TUooGjmI
	KXgwe93RsY5MuqeG7EjGcyqIjqchJD1U22W7u9yk6JJi8xelEQAUVE5oLKKEBG66vPO5D7
	xn7PqbXvsN6RbKNzudl1fA1MnOgL3k/0VAmi6pp60bEmggVOF5Bk+ov/oE+L7ynQTdNopj
	km9+KRhXmwa0c63+z6UduTGTNuJKH5Cylt88LGl65jEanjvvGI1x699rTE1XUVjm5oNgXt
	8ivvnnIF5U/cwxZfc22K7zpWNkKbXexD8nqL3Kf341Z0GNr4XLXoOq5N38F74A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 12:24:22 +0100
Message-Id: <D8JCRGWX5IPP.18VHS4KCXDFH8@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/12] dnf: upgrade 4.22.0 -> 4.23.0
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
 <1742278912-2989-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1742278912-2989-3-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213205

On Tue Mar 18, 2025 at 7:21 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
> 0005-Do-not-prepend-installroot-to-logdir.patch
> 0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> refreshed for 4.23.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

Thanks for your patch.

It looks like we have some unshipped files with this new dnf version:

ERROR: dnf-4.23.0-r0 do_package: QA Issue: dnf: Files/directories were inst=
alled but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/dnf-automatic-notifyonly.timer
  /usr/lib/systemd/system/dnf-automatic-install.service
  /usr/lib/systemd/system/dnf-makecache.service
  /usr/lib/systemd/system/dnf-automatic-install.timer
  /usr/lib/systemd/system/dnf-automatic-download.timer
  /usr/lib/systemd/system/dnf-automatic.timer
  /usr/lib/systemd/system/dnf-automatic.service
  /usr/lib/systemd/system/dnf-automatic-download.service
  /usr/lib/systemd/system/dnf-automatic-notifyonly.service
  /usr/lib/systemd/system/dnf-makecache.timer
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/1237

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


