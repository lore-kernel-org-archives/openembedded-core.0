Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A59CE6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 12:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44k4bp4Dmkz2M;
	Tue, 16 Apr 2019 14:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555418166;
	bh=IZMS5pDH8BQdYEU3gPQrzGxsSGWZ4xxo1LejW3TCSN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHbbCdzw10Rdgmtenq1LjZ8LgcW1IC5F+UDPt0s4jMdQWFInbSsJduoukCj0N/BDb
	N+/ok4eqB156QIfyzHoLuaW8YD7WCj5aMse2hY/HoVka9rWjwK8IF0tQ7adlEn0Nhd
	H6pjYwHXZorKrhWlmwfQ/wD/Bwvx+Jmfq7WQofgF0XmQ7hTbBJImJvP7711igEbuzt
	ejhzqRwdL9gPfmmRREcX2sm/Ho9125K/uRRRGJ46pIpDSJi8YqJ6mR2TWQsTxmLExG
	HgXfpf8HZyrISKHCoTvwshSTI9oNpYD4PfkbCj2ErcDnC9JVAT554MXVDG2lwjZ1ze
	9hwcT/ZMtggWfiP2nCYUnmo5GReoUhb9NxbRA6dRr9JmiPntvwPWJN4zBVvM/Hkbtv
	Ic3V39Ynwc+qZwob5p087Ok1HHYOA0ovbJSsMroVpxPyZQX2ONEPlQW7Fhf6G69J3o
	gu81K/ceL93w5AQBvRbzSn1BUmwF+qaFo+jRweWhRguoUxJ4BhL0O0kfKBDys8Zfj1
	gv0Wq6gX/VJC8M6Ehldi3I/lR1oHy2YDrXEQIjPP5mQ7wkNv7vlHj1nUkknqEjdCte
	Y6jRnUHrz7D4ogD9EF4B0QSiFe6RnKinIhS5I0Y0shDX/siyAOQ69LaRuDw6bk4r8D
	aLdWaKbDb4OWASVfD+lz6VnU=
Date: Tue, 16 Apr 2019 15:36:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: John Ernberg <john.ernberg@actia.se>
Message-ID: <20190416123603.GA25920@localhost>
References: <20190416120224.6737-1-john.ernberg@actia.se>
MIME-Version: 1.0
In-Reply-To: <20190416120224.6737-1-john.ernberg@actia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] i2c-tools: Split binaries and library
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
X-List-Received-Date: Tue, 16 Apr 2019 12:36:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 16, 2019 at 12:02:04PM +0000, John Ernberg wrote:
>...
> --- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
> +++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
>...
> -PACKAGES =+ "${PN}-misc"
> +PACKAGES =+ "${PN}-misc ${PN}-utils "
>...

i2c-tools-utils is a weird name.

It would be better to add a new package libi2c for the library instead.

This would also not break backwards compatibility for people 
already installing i2c-tools to their images.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


