Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B53C282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 06:58:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.47969.1740985120316895978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 22:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kwCjEFVL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1B841DF6;
	Mon,  3 Mar 2025 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740985118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbgtLjNA7v7VHMZbhGCSbNQB8FSPu2oVevZaqi0Aiks=;
	b=kwCjEFVLqnWrPNq9UbggQX1JP6QARH+fnFtUJgGwlVEx3/eGgzCyZVlz4bBf/hA7mF+BvS
	QcFybjZobrHA+XXpnk8+dB56sLqAi/cn8B6YwzW6WR61VAGfUWMVBFQkzCKL4ZolTXv5Po
	sFHbmgpmSXl25UtI3GbUtlNT0a0llOVsMWlZFOUi+7zDDAz03S7S41wmibtrYo+xqws39u
	IixFMRsboOM6ehx0etZ4yNFzelNBzcp8XOU3g2qIV8kkwSfTSnCNMXh0j03OWKYOtkqFLB
	wvjccPtTRz4c89lHhGvf+sD7Hmg/S3cytT9DdN5hWvmElUeVwztN1nq6t4fJsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 07:58:36 +0100
Message-Id: <D86FPT8WQCK5.1JY6070V2BEXW@bootlin.com>
Subject: Re: [OE-core] [PATCH] tcmode-default: bump GOVERSION to 1.24.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250302045339.3836626-1-hongxu.jia@windriver.com>
In-Reply-To: <20250302045339.3836626-1-hongxu.jia@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegvkeelvdemfeeileelmehfudegmegugeelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegvkeelvdemfeeileelmehfudegmegugeelledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehhohhnghiguhdrjhhirgesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehop
 hgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 06:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212198

On Sun Mar 2, 2025 at 5:53 AM CET, hongxu via lists.openembedded.org wrote:
> Due to we have upgraded go to 1.24.0, we should also bump GOVERSION
> to fix preferred version warning
> ...
> WARNING: preferred version 1.22% of go not available (for item go)
> WARNING: versions of go available: 1.24.0
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like we got some warnings because of the Go preferred versions:

stdio: WARNING: preferred version 1.24% of go-cross-core2-64 not available =
(for item go-cross-core2-64)
stdio: WARNING: versions of go-cross-core2-64 available: 1.22.12

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1109/ste=
ps/13/logs/stdio

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


