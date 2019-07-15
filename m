Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BC6517D65D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 06:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45nD570knfz3P;
	Mon, 15 Jul 2019 08:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563171851;
	bh=pmFSsUgWYg3uRdFyvhnMfPcfKSKXUM3mIWOoqjD2cNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNsqtRfsq0E4cbGbXw9fOGe+tEbPrFXTlB3Ml945C8Z/FVpWZlc53JW/lZX8/gDGJ
	/elhDu3jzvy/bP2Irvfc2Rd3VphdfYufWxSsZ0UcGKiLzZmFc6cjUB/J6Ja7Ek9RC+
	Yzk25ZhwHuJMEKGHuv7mA5FHIqEu6r3avKCHGZt+UC+lHYBViX8kMDHYSh6pNap23A
	MH5R4KTPMbrdyneG5jVvJOjkkeJMDb4tGnclA5xkUHMwdM3uQZxLI5N0oEcNBIsMVj
	NB/9FlPGgpQ48jZACbHqVvdD7DyJ/EoVXojJRocdtTejWY5pfHOIM6umXDcnSPKP61
	O8vxVJAIDLdufMhITAR92+SWonL1S5eMYkyVrN0NbWKcc8YXwjiB8/bKnEMGa3DzqC
	GEOJH6AmaYvyfxysRqEJQOfm66vlBOd8ZF1VAYhPS+IIoB5/yb5YBLQjRFwypmA1LI
	MIHDo8lSkPdh6HYUiSUdn2fPdD57jlUm/+R636N0hwKN9bbRq+iOahKHc5gUDpvhCY
	eQRdV9Y5EHCi3r1PIMRMRc4Dcb3t4Ze1zGM6YZD+EcosyNxZ2fwk1Be3KgJOcKPm2V
	mK4i0UVnVnivf3DEadChJrpYzrlGvcUOemvDPGomxp+MrInSe9jE275tKzEx4n4aK2
	1WDTvaRtGJsWUtn8LyQ01l3o=
Date: Mon, 15 Jul 2019 09:24:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20190715062408.GB21719@localhost>
References: <cover.1563155700.git.Qi.Chen@windriver.com>
	<e424c6b5d36ff1051144cf39911efb408f2f4834.1563155700.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e424c6b5d36ff1051144cf39911efb408f2f4834.1563155700.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: mark as incomatible with powerpc
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
X-List-Received-Date: Mon, 15 Jul 2019 06:24:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 15, 2019 at 09:55:32AM +0800, Chen Qi wrote:
> The libunwind has a README file listing supported archs,
> powerpc is never declared as supported, thus marking
> it as incompatible.
>...

Builds and works on Debian without any major issues reported,
not listing it at all in this table (but ppc32 is listed in
the next table in README) looks more like an oversight to me.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


