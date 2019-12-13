Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 71AAD7F8BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 23:10:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47ZRGr2xJhz22;
	Sat, 14 Dec 2019 00:10:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576278644;
	bh=XoepFgsrUcvVU8jMCVVEFjl1AlX6zVpIUS3le4KqizE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVSnAIQVuSLgHyutCSTUEMMHAUeDpFZZnT2YV0DnvJ2J/34n8co7gbnnVJ6Kta6Fp
	U7p9i0wH1sEPLb7eUEAvFpNH1g5Jaqi+uZROl7+XSxKTEJHxgcxY6+3dalB6xrIda/
	a1r2qcY24qsoixMlJtwedf1pQGnkRmNe5CjuLB9FH4yRSHb/ETHbcqdLiO8FH+0vYP
	YYsRhEZx0GvGaH7PbIkIJ0zmPoL5Vjd0SK3hz9ij55MurTbNOGxfTFC03+pgejeMqp
	N7ob6MSIG6qe6aat0vtZOoE1pUJFHqnUZ2ckupbVs0hYNnB/TSSqJmxjTs86RjcA4D
	qb9tvyevazKPYwk/M56ZGuaXdBsVGye0YnONSFXceXWnjRNTa/LYUFBQBvBKyad5fn
	F9ubU/Xq6xhZJbr0GpL/un59oO6eDyZElPoOV6u0O1xxoxb25GoN0/JKw2Axmif6Hz
	uzkT33sYur5ZwZm9JoHBm8Pjml7mqso2CYIe/HKxmMiQfjgqgiXofLKBtmwbSxi2kP
	8g9ZxJNLBgO2zS/VXJHuxRTEABc+kR/4sKLqUAmpUSOTBInvz00Z3EV9r5YJtHU4CS
	rWZH2DHrrh7E7fNhInsMG1XhaCz3RkTpni148tMpG364dlWoPQ2QZjKWsvy0+OForn
	hKuHupX2FfVVDB9grr4SMf3s=
Date: Sat, 14 Dec 2019 01:10:42 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20191213231042.GB8776@localhost>
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191213220309.3964324-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Fri, 13 Dec 2019 23:10:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> RK3399
>...
> +TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
>...

Looking at the gcc sources cortexa72-cortexa53 defaults to crc enabled,
so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.

The RK3399 implements the optional crypto extensions,
it needs a TUNE_FEATURES_tune-cortexa72-cortexa53-crypto.

cu
Adrian

