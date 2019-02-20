Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A51CE6025E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:14:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 444Bky2lsCz23;
	Wed, 20 Feb 2019 10:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550654090;
	bh=WBl6qnoN0mdKLjOoCPkLIU6KObK+dAAgHYdbrtMZ6p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQprkIcy/W0nivXr/WXcAhPAaiccEwGerfZDINJgXso90M4noWXwA7w8Dac1+dPwU
	2ef5sZvAQ1ax72U8KlRs9jXzlESJer4gW0qI3uix5AbhzdAE2LIjZyWaT8ErPwBTdS
	dxNUf9bwmuY34W9c4Tz8X6hT649gbDMRix6+iEUyBfC+PR4wRr4A485Z1CnQYJUDXQ
	rVS4oCgHX+8Qoy3nRB5Tr4Bg1JFukrKNKBLwRrlR4gYcCdJ+RbT4AXtTEBEEq5IR2c
	/qyNy4MxGAtbQD8aP9r0srvU4HF4bCEYIu+d/DkDVxjDD/qk7yXkIfZ1C8asg3dqMr
	7WxVBhAtyQBjzA+qGi9KcY+0cCg0zHYIYePQ8RYyh+0y2FFHKiqOsr5dmeuMDiiG1J
	CP/8KNivzEaYWUC2HoHqZVVqj6TKFZeQXUDHP/2XGG/tieEXZMVtBK4WTeMNIEBE6X
	dG/vGMpftPRhslZnpH12LtWMBAynKVVz5i9RAK21q54Fq8UpmuR1VcL2r7GI2vMyKt
	HELADUPtXYv7IfbWouh86FMhpK4zbVJLWe/C/Uhy0FuL4rAqe9KoGTMmjj1BFMVjMe
	9Z0x3YWKP63pdlsMTo3vIsOgOgIP4/adXC+YDSDEuihl/QkcINQPujDrL+Zr8mW36H
	dXSArujOfHlyq3klWAfZv+Fc=
Date: Wed, 20 Feb 2019 11:14:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20190220091448.GA11931@localhost>
References: <cover.1550626729.git.Qi.Chen@windriver.com>
	<893bfb66e32bb3bc8a2ef21fa5255873c508f0a3.1550626729.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <893bfb66e32bb3bc8a2ef21fa5255873c508f0a3.1550626729.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: upgrade to 26
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
X-List-Received-Date: Wed, 20 Feb 2019 09:14:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 20, 2019 at 09:40:35AM +0800, Chen Qi wrote:
>...
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                     "
>  inherit autotools gtk-doc pkgconfig manpages
>  
> -SRCREV = "aca4eca103d6699543f7ed663335c28c2e9908bb"
> +SRCREV = "58133a96c894c043e48c74ddf0bfe8db90bac62f"
>  # Lookout for PV bump too when SRCREV is changed
> -PV = "25+git${SRCPV}"
> +PV = "26+git${SRCPV}"
>...

Shouldn't this be PV = "26" when the commit is exactly the release?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


