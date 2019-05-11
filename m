Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D27867DDBC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 06:58:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451Hx72V49z4x;
	Sat, 11 May 2019 08:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557557931;
	bh=PxrejHfMes5cUgKlhc6+GOta4PLSjdckUqrj7EbZNbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3K7Dxvz9b+ceOt7R3a9yQN7qNuXUKdDXq7BTXV7Z1VOeX+zoTmFN1z6hj/yHo/Qj
	3acze1YhS82jb/LX6NTnOhV6Ooo05WxTj3uiMsHutwjVGRchiBDtR1G1yVl9u3rnni
	27JaC0slSOzSwEoDoSNHyO1ZxRbkJ0SqrT0ZQTiaqDf5GjMTuI760esxiGzdWsVcUm
	ZsKwT3XX/Wl1dRrkO2hjEoZuAciLkfvmPDcNKgHcjQhhAvTGaXW+Tp06dtGzrdH8lc
	lWsTO2UTezHcs1YtOF4tY5tgFr5XKAzYmFozICJJQVlI97waXsz5W8a7olSmCVNTaE
	95O/DZyWPbwrKrgajjGp68RimsGBGaIb/qzrmstZ12fVYXG4tl4ZpvXkmrwgTrcjpj
	k8twonEq3JHC+P0616cHtyb7NYqQatzA96bVLPDpCNYFoD4+/0drunqmnmEC97o5Dl
	DkDV+j57hPsONYGHqN0qxk2yTdox9mfs0HC+5oiPZG9k5XCn+Vt3IvkZqrFPGanLy+
	fOgDIZPffYV3mlopAM6j65qkquhEuj+7N+HJA07EnGyGmslP9YVfywiXlBVA/FMnMf
	rddhk167/rJ7hogQnBwDIBQDCikbfQs92Z3JKwlAD4NEZ09y72D+/sZHtCc+iv21gd
	3BBojNoF90vM6ux2A4jGA6oU=
Date: Sat, 11 May 2019 09:58:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190511065849.GA24494@localhost>
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Sat, 11 May 2019 06:58:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 10, 2019 at 04:00:45PM -0700, Andre McCurdy wrote:
>...
> It wasn't possible to build glib-networking with openssl until very
> recently but now that it's supported upstream I think we should
> switch.
> 
>   https://github.com/GNOME/glib-networking/blob/master/NEWS

This states clearly that we should not switch:

  This is the first stable release featuring the new OpenSSL backend.
  Please be advised that this new backend is still experimental and
  known to not work on some systems, including Debian. Linux
  distributions are encouraged to stick to the default build options,
  where OpenSSL is not yet enabled.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


