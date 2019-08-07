Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1F97F394
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 18:36:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k2so6504383wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rMw0BFVtGl7TeG0VW+bFWNqxJGXkYL7JM2yU324RaDg=;
	b=gYhkPOptAJBOjaqfObp8MKbvXEOde2c6PmK2d46nexNmcD8LaEMOcwQjsGLxglFIqM
	SvkXjXksL098yqYts9+a3q+2Mo1GP0343UZB2K/yHC6pN4V0HX3/Dqgh/kS9DiqEjVKS
	J+4CJRWIr5TgcdbhkWPUkK7ZZJ2NW0n4KpDXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rMw0BFVtGl7TeG0VW+bFWNqxJGXkYL7JM2yU324RaDg=;
	b=Cx3jAB228Z/J+2TbHlw+6EfpsKN2wFVBKDvia1vT0jhK3swzcksDJYXvj0hBCTfWHe
	a7FC71skXubTz99Pt8m3cdixihUWK6Fvln5mWsk/Ar1OIDIrucE2JiBaYEV0nQc6yHga
	8tIIr7JCWqr0pBbcYUmtieC+b9XzrjI9IYA32B947GvNtMslqThXEz5IUqerghuhheeP
	IhklA5iLboBusNaaC1Kaqx/kIsbtJ6iUCPh2aJmcvtB7NJv30175NFsxK+v0NOEido7v
	5wSCmld5sFQF0LC4w9VVndgO70otEqjSiIDF8+iMIiG0BVD31e66YLavmXJ507EuE0jd
	hiUg==
X-Gm-Message-State: APjAAAVUF3FfK6Ug4sSs4d/u3nbZzTIzByYOyV7P0wYTgGPNZVBode46
	hPNQz1O3eui/8OdUCrxN2u1gbQ==
X-Google-Smtp-Source: APXvYqzhMEqeM3IwtG4slneZP/sTNb5c25gu3I4RL/qbl203d23Ty6IFv1v0MuT7ynvLYMgWEWTd1A==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr11623872wrs.200.1565202988103;
	Wed, 07 Aug 2019 11:36:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm5463635wrq.15.2019.08.07.11.36.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 11:36:27 -0700 (PDT)
Message-ID: <6832330c6d1ccc57020c0a2916e8309468b5b196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 07 Aug 2019 19:36:26 +0100
In-Reply-To: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] ovmf: Bump to edk2-stable201905 and add improvements
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
X-List-Received-Date: Wed, 07 Aug 2019 18:36:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 18:44 -0700, Ricardo Neri wrote:
> Hi,
> 
> Fixes [YOCTO #13438]
> 
> I have implemented this patchset to bump the OVMF recipe to the
> latest
> stable release of OVMF: edk2-stable201905. I continued Ross Burton's
> initial work to update the recipe [1].
> 
> The majority of the patches we were carrying with the recipe have
> been
> taken upstream in EDK2 and I have removed them. Plus, EDK2 now adds
> openssl as a git submodule and not a patching script. Thus, I removed
> support for this script and switched to the gitsm bitbake fetcher.
> 
> Also, now the EnrollDefaultKeys EFI application requires a separate
> Platform Key and first Key Exchange Key certificate instead of an
> hard-coded certificate embedded in the application. The hypervisor
> shall
> pass this certificated to EnrollDefaultKeys via the Type 11 SMBus
> table.
> I have updated the ovmf recipe to create the needed certificate and
> also updated runqemu to provide such certificate when using an OVMF
> binary with support for Secure Boot.
> 
> Lastly, I defined the recipe's PV and took Ross' change to use
> python3
> from HOSTTOOLS.

Thanks for the patches. I can't get the to apply at all. I know we have
problems due to the line endings in ovmf and the mailing list is
probably messing them up. Could you share a git tree with the patches
in somewhere please?

Cheers,

Richard


