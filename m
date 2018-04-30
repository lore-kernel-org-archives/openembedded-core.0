Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id E42246E5FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:04:12 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id i5-v6so9584108oth.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=a7uoU/k11RcFaVJwGDyNbrs1lAaeYWf+ozG1Sdd/IRw=;
	b=BBvGo5Ip9LTCrEAIHzu4CNuIPW6KNtcIECC/8+Hf8KE+d9bKPvFn7kLTujeBXMILsX
	UQQH3Kutjl07idpN+0O7TzaOCAaOaqFOQtt6sxYwXCRrWUcbD6MW/N4+5TNgMQKl8rHH
	Zk8L2vIva7KTeZlLOctwE3kI+J1CLMZ3u6EIxLLGvtMous0EMVh3bhJFMKcxMpXlR6GT
	RVzYCEU3HedzwAzY8B0f7k1A4ByaSY4zYfA84Al94B7soGjtWynOhlIBjaU7VFQyWf3Z
	XXnjsJMoa7DdyR3bY8P6+4CLiDk3lElN6KhaD5oxB6CehF+ks7cN32GJomh9Y7nh0WeC
	mxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=a7uoU/k11RcFaVJwGDyNbrs1lAaeYWf+ozG1Sdd/IRw=;
	b=XjrC4uytdnIu/gVkIyPRG/b7gXtdvn4iHepRHddKbJ5SnUimMyCGwpOOCV05WgVGIe
	PPHJsJNcJuRD9PhLgx2SBS5vIFDVmti9ny0cwZOaExr3BbvQkKz9/WdlWP+y3Iidi5K5
	v1d6TNsQlyCtQEB/EPrm+p3tPCyQKDmH7RhZPEfC0agmYeRTc4Bmrl9Js5DNtqT5IAIQ
	aj43EIb0fS0FKsQYg6H0V8RROKUHWvuHpUH61E7g3tRRO7T0SZbJNyOUMw9aPgr3RvZU
	lVOW7rcoH9RZBh9ibl7iNGT5R8jEHV0ltsdpqHmctdVl71K0GnKnztatp9nSwNR+yoqy
	O4PA==
X-Gm-Message-State: ALQs6tDsh56mumUcufbFCDDa+CePaxZ47R85JBLWcs9dUeano3gpGqKD
	7tWAcYd9w0D6mB3lE5DTEMK+bnpI
X-Google-Smtp-Source: AB8JxZreyP8D0losGNptydso4dFg0D/PRe6IKSJtfh9cPT6ZaHrn+hz/HPcunWJuiWl2dD35p2XORg==
X-Received: by 2002:a9d:133c:: with SMTP id
	f57-v6mr7877434ote.219.1525097053189; 
	Mon, 30 Apr 2018 07:04:13 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	q55-v6sm4917509otc.24.2018.04.30.07.04.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 07:04:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id e80-v6so7453804oig.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:04:11 -0700 (PDT)
X-Received: by 2002:aca:110e:: with SMTP id 14-v6mr6903360oir.56.1525097050836;
	Mon, 30 Apr 2018 07:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<20180427181521.1bc4095c@jawa>
	<39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
In-Reply-To: <39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
Date: Mon, 30 Apr 2018 14:03:59 +0000
X-Gmail-Original-Message-ID: <CAP9ODKp5xiLTCrZNz0z9EhmqDO45CWX23ovBLkUQZi7svXRZMA@mail.gmail.com>
Message-ID: <CAP9ODKp5xiLTCrZNz0z9EhmqDO45CWX23ovBLkUQZi7svXRZMA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Mon, 30 Apr 2018 14:04:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 27, 2018 at 2:37 PM Marek Vasut <marex@denx.de> wrote:

> On 04/27/2018 06:15 PM, Lukasz Majewski wrote:
> > I can add this functionality as a separate recipe. This is v1, so ideas
> > are welcome.

> I think that only makes sense.

Also, we likely need to make use of the mkimage recipe so we use the tools
and not build it all again.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

