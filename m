Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1E3C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:14:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7127.1743153247915564229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LnsHxQRU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 486B9433EC;
	Fri, 28 Mar 2025 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743153245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9GiQCSFThXci956rjdV9T1oiSF6XawRB4z9hcrgy2E=;
	b=LnsHxQRUx4mBnsNw1GMoJCayyq3KPPtCbsUQLpPgK7K1oAOwEBRcB2EtbyC/zXbzTa/k4d
	lQBV/pcTf7yKMjTK2ruIui0ICusEhTF1iPceQOG7+yxzjCATo+lbg7c0qOdZ4PWki5+OcX
	ufqkhUf1nr5s6ocBpxXqc99Niuj+VbVztRmn2GpFTckkNdznt7OiDc3Aaatyn48KwVjZZZ
	E2s9PKdezhAR7lIRlVwZoqgGl1bh+lAY6Nc3fQrBBiPrOVwW7Peb7APU+yqjXO2NZwwEIg
	RMyEFeE02Lnstwp0p0tBMEiZEkH2pKoN8PcS/Aaa8r7CwgGJUFafon+3Jt/62A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 10:14:04 +0100
Message-Id: <D8RS95G9K1J4.1DKE4JABXAL7N@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
 <TYWPR01MB118618605B50AB18CCC8B118FDCA02@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118618605B50AB18CCC8B118FDCA02@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffdvleefhfffkeeuvdethffggedthfevgfegteefhfehgfeffeelhfetuddvkeffnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213814

On Fri Mar 28, 2025 at 2:38 AM CET, Mingyu Wang (Fujitsu) wrote:
> After synchronously upgrading libdnf, the issue with dnf was resolved. I =
have submitted the upgrade patch for libdnf
>
>   --
> Best Regards
> ---------------------------------------------------

Thanks, it seems better but it looks like we have a python dependency
issue:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  [Previous line repeated 1 more time]
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/runt=
ime/cases/dnf.py", line 35, in test_dnf_help
    self.dnf('--help')
  File "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/runt=
ime/cases/dnf.py", line 23, in dnf
    self.assertEqual(status, expected, message)
AssertionError: 1 !=3D 0 : dnf --help
Traceback (most recent call last):
  File "/usr/bin/dnf", line 56, in <module>
    from dnf.cli import main
  File "/usr/lib/python3.13/site-packages/dnf/__init__.py", line 30, in <mo=
dule>
    import dnf.base
  File "/usr/lib/python3.13/site-packages/dnf/base.py", line 32, in <module=
>
    from dnf.comps import CompsQuery
  File "/usr/lib/python3.13/site-packages/dnf/comps.py", line 27, in <modul=
e>
    from dnf.exceptions import CompsError
  File "/usr/lib/python3.13/site-packages/dnf/exceptions.py", line 22, in <=
module>
    import dnf.util
  File "/usr/lib/python3.13/site-packages/dnf/util.py", line 28, in <module=
>
    import ctypes
ModuleNotFoundError: No module named 'ctypes'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/1267
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1303

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


