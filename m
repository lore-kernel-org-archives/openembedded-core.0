Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 754A87E391
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DXcX1GDlz3L;
	Wed, 29 May 2019 16:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559138908;
	bh=aavQWd6oUMQoSDjJ11/nxGHNTBd5sNBC5lPhIOHf2wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tt0+KJv5kRPp8vRsTQ9o7jMHsjcHv+KetjLX4rpf9QHq6dDrGTt4Z8bLIdaaBA8lm
	VdI+ezrQF0gqbR578KegJm9zNgYDjGk230fJ853JW2OKYUix4//K8z2RrTJre1Uv2S
	52MCOfSQVqRL9J+dUh0AroaX+HuTVGN5HNrlE97xnbjuMOQB9MC9CR+I+XZEGBoEm1
	dLW5xRtr3L2F5Z5Zgfe3+6UWLuhPWgtdLwgA/zJHF1RM82OQZ7z8MCOHE3TKBDw67E
	lk3L2yo8s0S89CyxK2e/9445pTo2wvM5Q51a9i5mwlN0xxNOEvoOdV+XmF1C5PX9hm
	eIHGr/fsDU0VdnSdPVYQzwt7Bkrjby/w2w3Tyu3YY/nPIUO+7hjR7kbzU7sMEXZzs8
	WOSFc518/DNEJY6QlXSEaUseFX/yEAc44HE6N/xq0viqe0lCVhElGjG44AAL+WSVW4
	BM95DUq3wRnIB08/6i10euKmGPOMSYXmstbW/y+r25ny5zKIuoKyKO6HaH97M+jaCs
	S1ZaMqZiKXPMDEVUaMCBuLgCK6hOb3sZcnL7e6JE6k39ajjmUGG0BltYm0eHKeX/6Z
	q0bm9pxtKRpS+tpB5QP2hqCKE3YaVMw+LoPbeQKo9s222xL3VTdmi3w2damjIRZMe6
	9n8DCu6ymsD4IrTYOhd0aXfc=
Date: Wed, 29 May 2019 17:08:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190529140826.GA28892@localhost>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
	<1559137838-8972-5-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1559137838-8972-5-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 4/9] gnutls: update to 3.6.5
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
X-List-Received-Date: Wed, 29 May 2019 14:08:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 06:50:33AM -0700, Armin Kuster wrote:
> Bug fix only release

It is not.

> Full details:
> https://lists.gnupg.org/pipermail/gnutls-help/2018-December/004465.html
>...

...
** libgnutls: Added support for TLS 1.3 zero round-trip (0-RTT) mode (#127)
...
** libgnutls: Added support for EdDSA under PKCS#11 (#417)

** libgnutls: Added support for AES-CFB8 cipher (#357)

** libgnutls: Added support for AES-CMAC MAC (#351)
...
** libgnutls: Added support for GOST key unmasking and unwrapped GOST private
   keys parsing, as specified in R 50.1.112-2016.
...

These and other changes might or might not be acceptable for a stable 
branch, but it mustn't be treated as "Bug fix only".

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


