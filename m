Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 297C060102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 07:02:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PyQJ0V1dz3k;
	Thu, 21 Mar 2019 08:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553151720;
	bh=nlsKJnlCAH8ikuF1HYzfPWVxVTdJgHkFMH/V/Qa4AX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/wK3OrEvAt3FFZ52r3A2cRaz57ordo6Ey/3QO02N3hpqMDoDMrRbFR6Sqhqb8DQc
	YRNGiyedepbngdC28tUPIebC2WVlZPC20wfaENEwFfWlLZi9nKV7saMvLsX2Vv1NSj
	SgeJI3AIOd7ywsOgRATmL9LwIcPW6LapAjXtPp5S2WnDFxJV8lBkjQLMQVXWdtw62S
	QFRxBUet556y2+q4BHWTsztPIx6UiLmRAS4me1Tcl/Q6gbkJumNVikc0QE9of3gSZt
	BVjHqVMyLyA1694Y9by7niySAVNsw+qmZgDaRAfXqQRU4kWwNc9LbTDV7WPb/kN5DM
	YXeON0oT8r6rNEb4NQ/dLDqSWaTKg7zrnvpo7buXbOqmlY5R9GpL4vfge88cMgF8Ak
	MCRYE8ZeeMX0Ui9uDoOOvQZjpwC8k1wWS4VSgbJxRX+bj98M1+9PH1b9iVrKHh01Pk
	MM2I14BpCB4qK1cWjOlteiaOj2tMIrbam7Lm7z8k8g+LKwOqpM3kII9ptQIL9v9nI4
	kGahA1r16I+NzatK6VJ7A1gnaLvR9VVeUteT1LlnYUTEsiMQFsom3fFQ+on2F/+pgp
	GZ2dQpU3v7sVhbwrPh4txKNBfZKHNXYNEfaeWcMfCxegsqkGZsw/F4uarHlgIelc1m
	2epbNJ/sRxOH/ydjYUsrxapE=
Date: Thu, 21 Mar 2019 09:01:57 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190321070157.GA24066@localhost>
References: <20190319114536.2925-1-bunk@stusta.de>
	<CAMKF1soK74hWae1h+C9+23Shre2EBaUSp+HiK7q8GCPZcTeXLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soK74hWae1h+C9+23Shre2EBaUSp+HiK7q8GCPZcTeXLA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove the simd tune for armv8a
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
X-List-Received-Date: Thu, 21 Mar 2019 07:02:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 20, 2019 at 07:56:45PM -0400, Khem Raj wrote:
>...
> Has need to turn it off then they should chime back
> Since removing this just removes a detail which we can actually keep
> without much effort

Turning it off is the only part that would not be a nop,
but this would require adding +nosimd.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


