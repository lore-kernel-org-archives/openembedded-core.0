Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AA4C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:28:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9323.1747387707747490985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hbdhP2lr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73DA743AD3;
	Fri, 16 May 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747387705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCh+PX+Pvv8uaJxv6wZ2vp2QkchERPW46AxqiKH3XX8=;
	b=hbdhP2lrTfbrJnquRM0cnxMRmrKdMTv4y1FSzADUI4zIO5pk93fvu6lFEZPVmC0mDLJFjc
	5FlnLCtpjhZOdJDFx8SuIm+6GK2IxrVqCr57EJDpHBfrVmbMTPTlS4iKWap5ukHILYRqZv
	/U2EUOmDFaEJFjRhDhgmkDgwhJpNWfSwujfCxR8rbATpvJENzSCpRlE0rkRCcTGliijY5j
	Zt3/d67sMQLz5BRNsDxpB7QoZjpv/gsyo47kbouKiZLEcfhdS0T5FjXmod2Z0sE+7TvDZr
	+ZJR9APIwFo7VKp8cYKkzzJd5954gVA9qvGvAJNSJd+HCIVUjWrizURp25L1ZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 11:28:19 +0200
Message-Id: <D9XH8R0GB5NL.1S7KKKLYOG14Y@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/5] perl-ptest: include libxcrypt-dev as
 recommended
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rajendra.desai@emerson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
 <20250515165010.242349-3-rajendra.desai@emerson.com>
In-Reply-To: <20250515165010.242349-3-rajendra.desai@emerson.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvudeuieeggedujeehhffhhefgkeduleffveejudfhfffgueetleelveehkedvtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdigshhushgrghgvrdgtrghtpdgsrghsvgdrphhmpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemudelvdgumeejtdgrtdemiedukeemgedufedumegrtdekjeemvghfkehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemudelvdgumeejtdgrtdemiedukeemgedufedumegrtdekjeemvghfkehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhgvnhgurhgrrdguvghsr
 ghisegvmhgvrhhsohhnrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216729

On Thu May 15, 2025 at 6:50 PM CEST, Rajendra Desai via lists.openembedded.=
org wrote:
> The following perl ptests:
>
> dist/ExtUtils-ParseXS/t/001-basic
> dist/ExtUtils-ParseXS/t/002-more
> dist/ExtUtils-ParseXS/t/003-usage
> cpan/ExtUtils-Constant/t/Constant
> cpan/ExtUtils-MakeMaker/t/02-xsdynamic
>
> are erroring out with:
> In file included from /usr/lib/perl/ptest/op.h:700,
>                  from /usr/lib/perl/ptest/perl.h:4553,
>                  from XSUsage.xs:2:
> /usr/lib/perl/ptest/reentr.h:126:16: fatal error: crypt.h: No such file o=
r directory
>  126 | #	include <crypt.h>
>      |			^~~~~~~~~
> compilation terminated.
> error building XSUsage.o from 'XSUsage.c' at /usr/lib/perl/ptest/dist/Ext=
Utils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 185.
>
> This is because the tests require crypt.h file which is provided
> by the libxcrypt-dev package. Hence, adding the package under
> RRECOMMENDS to make sure the tests are able to find the required
> header file and not fail with the above error.
>
> Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
> ---

Hi Rajendra,

Thanks for your patch.

I believe this is breaking builds, at least the musl ones:

ERROR: Nothing RPROVIDES 'libxcrypt-dev' (but /srv/pokybuild/yocto-worker/m=
usl-qemux86-64/build/meta/recipes-devtools/perl/perl_5.40.2.bb RDEPENDS on =
or otherwise requires it)
libxcrypt RPROVIDES libxcrypt-dev but was skipped: PREFERRED_PROVIDER_virtu=
al/crypt set to musl, not libxcrypt

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1679
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1649

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


