Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 976127E319
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:27:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DVMw4xXqz5l;
	Wed, 29 May 2019 14:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559132844;
	bh=Q3aEkQtUDN8elrNToDGolSfDFCDZGaEcMqz1nQYyJj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0apHCBGsJwrvU/sUQjQUzx1sCVrHubbt4FYKiAQgyI5zQ6j3tAsmAxgROFEVw/Ex
	2MUKDcZdUPPYxNQtKYDpfDdLKKaLEQPNrJTFzIIOYB4adSano0a80MQ7VyL+6FamT/
	y//xbdqVhTV6c0hV8ltT3TQTrzZ5G+x6vk/K8r8yuisrjvIAb9ntJ4UOr5AbYj0OS2
	eAkNEdUjFo5/aprMav5ywELDzHne7oDWeqG+hqoLGCxPgaFjyh4i8iqvMRAJXIi9vC
	fzXUAfL7VxT1IVuHCPbVFWHZQa6E7druq3u0HiQNxXCzd0/hTNGP3SNJScgYQ6l4O0
	DXlO491TzuqfIw33tV/cs0JbVzTo8CbNnsBO3BRJ8fvjmN+dw8k+vyznjUS+S/51A8
	t/nHBCwO7vgLHO1iginAqAtBqyPGGmisNBu+8HhZ7NtOggugNyp30FC+4rkBi5F4C5
	D8kyeTC91kemwYWN9P4AD3a1zIUds27g6l+0ihwyqvlJKlOyScLZiQ2QnT9QIHwBxK
	2cbl+taul1Y+2jLc4v9IGqB8JIqLhh2S4444j5ICHZZGFKH2Tg+Z40srirsPCnjhsX
	WP0sUkNa2M/qpqcSLZpAawNVD9GXi/5JD3E99xs3ut/OG7+Z6eeKn6H0pVK+3I18Zb
	uKLIaqeZbxP3KnFY30okmLf0=
Date: Wed, 29 May 2019 15:27:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190529122721.GA20876@localhost>
References: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] add rconflicts for systemd/resolvconf/tiny-init
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
X-List-Received-Date: Wed, 29 May 2019 12:27:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 05:35:04PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 
> Changqing Li (3):
>...
>   resolvconf: add rconflicts
>   systemd: add rconflicts
>...

This is only a conflict if PACKAGECONFIG[resolved] is enabled in systemd,
other configurations should be fine.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


