Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 610667DC1C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Lw3X6R3qz1n;
	Sun,  1 Sep 2019 16:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567346745;
	bh=4y6xC2cs9mK4phZbg+xo/uQpPJ9qXbRU1tPcSgeUjak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mk4MKq+9PoY9aDQ7pWlzuOS4gtO1Nk3TZ6DWogM10eD2sSli2Oj90c1nBr6mHKYvX
	rh8bPwXAliuQVSakb1EzKvL5xxG1YO3A+D5AY3O/ypOZtYrig0b+lf5mtuhXkgsq1F
	QbmW/gsrv/Y9KablC1VZ05dMRhFKrYwPS4Y4zGuXrHx3GZqdQAxpkrAyEjonwsDzxy
	2YV9QlnEECmV9SP6DsXiYZYMGar9sAa/d8bxtHgBJZPOBipQsodrprao90UAq7Iq88
	fe8LEpzxBgCTjEal54hmYumlYae2pyFxk6SE6w6/oTpgssidQ/Upg5qt8qJc+cL3pI
	WGHokPwF/1ihnu59f2gTLnmm5k0IRMRklC6ESaNuovGZlpd40+0yxR8UnUTatRPemA
	1xIJJQFea2TXTSa+5VL6NxSI6p8MpvS/dtuyGeWBmCv5P03YkGBp2+HDhFe5zEpDr+
	Qie/ZMkiSlZoHbjoacHlv2MggUP/Ucy4n55gPoPyWBTq7hJh1t5GHnhFhyjvqXOGsB
	4Cz17P7t0dsD1+i7gNlQVc1PMYDS5v8sW9C1Ubuk15wHpg78yV1iyoyUqrH8lCk8Xw
	VMlRWkVR50OuEV+sdVcXHBkN+MlftDx59Hqlw5gFk1QpRMp69AyDc5LnHd8saP3Ph5
	Wf6qmIh2ycg3JTjqyDH7gkA0=
Date: Sun, 1 Sep 2019 17:05:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190901140542.GA11574@localhost>
References: <20190831211549.23729-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190831211549.23729-1-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Sun, 01 Sep 2019 14:05:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

thud and zeus are providing 2 gcc versions each that need fixing.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


