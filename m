Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8726BCD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46xXnQ6LLHz44;
	Mon, 21 Oct 2019 12:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571653483;
	bh=xUrDclwclop3gfWObsPujUDuogoWjEVP4nHV6PTMXJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcNjUsc+4xNYjdC7xQC5FaI3rwtw5fjoS/a3ULwtVRVE9rRHkrFA+cTtvtQTSTdl0
	M+IM8iwJIP4ULT0sKhGFb1FXUefK2lvPXU44/+ZqsTK72WuPQJhTdseputQD9wKvld
	/oeR0rZio9QiXGKBsOFXErnwN/fWOzm8FYs1+5x3BaU4uayuzo5Xwc7QJCAe+imzf1
	iY2fcDsyI+3wkQ9OsIVM3kuSOR6fVnhqGqvhr15wnmCyYQfpbORNITu6DElCoBsxwi
	Jq7ac9xte0Fp0/H8EQSUgKIdFJhLVU4Sc2HXrZqrUHhw5Q2mlXwb9ea9xJyuHcnblJ
	sBdijZH3yzl/VzTBUQyQKiZK+BzkEiS/ULJNba76I/057fTkM+A9Nspi7ImA5cH+SF
	Gep9YiHAubAmlq3f94gpgCvkZ8UCaQ6j64mw6wsopUBBdl17nx6/RK1RQQXRRA17WQ
	duvZHBXO6Bv2tUeSqOA3bYSigFXMLJswouwk4AbPkScen9Y3coqReg7hiSm1QXk0r1
	AQwt7D3UloSf2M/m7L8BTzIW6/3v/AWzoEL2wojtIfTOaSo7YBOGEson34V41PBXA1
	nWSt4niGVrxhiSVQg4hvKZ+wGhGTN2H9yIeNZ35FOPUvOLidvs1UPi5N5YgFp5xGoN
	47Td1RqfTQHh2Zy1HzySvnfU=
Date: Mon, 21 Oct 2019 13:24:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20191021102440.GA25961@localhost>
References: <20191021094149.uwvkismntthgd7i3@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20191021094149.uwvkismntthgd7i3@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mfe@pengutronix.de, kernel@pengutronix.de,
	openembedded-core@lists.openembedded.org
Subject: Re: Why do we still disable mke2fs 64bit support?
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
X-List-Received-Date: Mon, 21 Oct 2019 10:24:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 21, 2019 at 11:41:49AM +0200, Marco Felsch wrote:
> Hi,
> 
> during a initial system-setup script the mke2fs tools complains about
> the missing 64bit support:
> 
> 8<----------------------------------------------------------------------
> mke2fs 1.44.5 (15-Dec-2018)
> 64-bit filesystem support is not enabled.  The larger fields afforded by
> this feature enable full-strength checksumming. Pass -O 64bit to rectify.
> 8<----------------------------------------------------------------------
> 
> Other build tools e.g. PTXdist or Buildroot don't modify the build-in
> config. I know in the early days this feature break something but
> shouldn't we (re-)think this decision?

Already fixed in zeus:
https://github.com/openembedded/openembedded-core/commit/f5edce401cfb31ebd0200adaba9a201caf7ea705

> Regards,
>   Marco

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


