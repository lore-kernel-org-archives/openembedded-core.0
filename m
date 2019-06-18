Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DE7137E8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45SlWQ2gqGz4t;
	Tue, 18 Jun 2019 13:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560855683;
	bh=7dKqIFLk9v4vxEu+/2smrAOMgp8E5Sl9f0O1i9JKTew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj6thoYGBKFNGRSqbRfsXlozWtr70pGITBRW3lS5cwT+uiobZfe8GM3xm0geciwnH
	RwCuOVndewAqtbEBV81rEeR2qnK2luErc0S/6UN6oSoQY1DrRalg0hZ2zjBHhcQKry
	P+kBUqv61037YJHIaVvzu4oTw7YBA8I6LgNWBdg0yFqcLJnEcG1BwmH/4fj9KjGJb3
	EoHrvQLf173A3kOsbmLxlIm5oXsDIoHlQg8UZx007xuxDUT6jrEcVxTMSsni9z9Ij0
	P9m2X4jygiHUcTA/XytoiXqmcg1ZIewYWT0gGI/mXnCZWWlukw2RXEgJCjduaQJkz+
	liCCRoeR2nZ+eMurSH1mrqsz07Ezr9eScRRfw5OtkCDnkeOLdc+1Xl2Iz1UPvQY0fl
	igI073M9WbuiLtAIsCJu6s9JKeLprXbH38q3YFfHYT9JWbc8tPBKoBFkOhDlr3KB1E
	+gKArZCZ5mPJf0TcjGDWMMb/5odrxJC9vO3z069BAaRugAnircJKkeW2/BMmsksdcr
	dc8PmWW5RrhiXzok5qiN3z52e7nGsSFDRVZMLrAZ9YpIwr5WleDISjtiwaHjk+ODNO
	ob/OWeuSDVAgZztCb1i/tvwqq2jTRKKO/fXUXmjuBOKAeYm7GtGGV/kyDlaQrK3EnS
	/MWA1EFmGlp9DMB7UZY0GkFo=
Date: Tue, 18 Jun 2019 14:01:20 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190618110120.GA10836@localhost>
References: <20190618034219.13116-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190618034219.13116-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lighttpd:upgrade 1.4.53 -> 1.4.54
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
X-List-Received-Date: Tue, 18 Jun 2019 11:01:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

WARNING: lighttpd-1.4.54-r0 do_patch: Fuzz detected:

Applying patch mod-eke-prio.patch
patching file src/Makefile.am
Hunk #1 succeeded at 419 with fuzz 2 (offset 15 lines).
patching file src/mod_eke_prio.c

The context lines in the patches can be updated with devtool:

    devtool modify lighttpd
    devtool finish --force-patch-refresh lighttpd <layer_path>

Don't forget to review changes done by devtool!

WARNING: lighttpd-1.4.54-r0 do_patch: QA Issue: Patch log indicates that 
patches do not apply cleanly. [patch-fuzz]


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


