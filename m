Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09609C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:06:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7661.1654758368842770752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=khKEMrTo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF2DE2000D;
	Thu,  9 Jun 2022 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654758366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08YBg0yAU+xe2fHGQAoGSIDQlCQt9Ey1SN1LacaxmcE=;
	b=khKEMrTo1Qu8UUWtnJZMtq2E5/GaMeQCphSI/WVIDcOIhjPgi0LQ7gqMWHWL8IN88ingit
	H7uPSpMtils06Dc+sbYxIzZuJcfFoKhmvzk2kqTqFQRLiJwc+BCWWiThMdsQvmMwohSzjz
	lgXcI0+GiNbyvHS+wvYxmbUUqbGcr/q8vMk/SylVCCJrsXiH0OqAXslvrV5W5p/PJLqHOi
	PWqqNdfWJH644qUqBcFIvepKAoAhBqv1gobi+T7tKXoQXryToAPcs1xAGkt9nN2PvpKXom
	/xGIg2eVKIdW3Dxa+VW3v4H0lkqfbFTc24h+vMs25XnxQ02mZWpjhMtV8JbhWw==
Date: Thu, 9 Jun 2022 09:06:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-cryptography: remove
 --benchmark-disable option
Message-ID: <20220609090604.067b8258@booty>
In-Reply-To: <20220608093120.1532299-1-mingli.yu@windriver.com>
References: 
 <d037486615787f0c2f53edf1d2e09688ee8a2e62.camel@linuxfoundation.org>
	<20220608093120.1532299-1-mingli.yu@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 07:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166758

Hi,

On Wed, 8 Jun 2022 17:31:20 +0800
"Yu, Mingli" <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The new version introduced below change, so remove the option
> to avoid python3-pytest-benchmark rdepends to fix the gap.
> 496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)
> 
> Fixes:
>   # ./run-ptest
>   Free memory: 31.283 GB
>   ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
>   pytest: error: unrecognized arguments: --benchmark-disable
>   inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
>   rootdir: /usr/lib/python3-cryptography/ptest
> 
> Remove the case test_x509.py to avoid below failure:
>  file /usr/lib64/python3-cryptography/ptest/tests/bench/test_x509.py, line 9
>   def test_aki_public_bytes(benchmark):
>  >       fixture 'benchmark' not found
>  >       available fixtures: backend, cache, capfd, capfdbinary, caplog, capsys, capsysbinary, disable_rsa_checks, doctesty
>  >       use 'pytest --fixtures [testpath]' for help on them.  
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

I currently see all patches at v1, and a patch has one v2 and two v3s.
This is confusing and chances are whatever I take for testing will be
wrong.

Could you please send the entire series as v4, updated at the
current state of the art and with all the changes discussed in previous
replies?

Thanks!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

