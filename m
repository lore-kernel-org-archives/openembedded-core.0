Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.138.1592336958042159612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 12:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=XW+CCI/m;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=tws0=75=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49mf0V0Y39z43;
	Tue, 16 Jun 2020 21:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1592336956;
	bh=Ll/R/IndJAt8GxjQZGwUOUoqmbKetv61z7SFxKCGMUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XW+CCI/m0+9yFHVszFT72IATEabQW1Jp4E+iEAzQZiYYITGqFQYl6Wv7CEUrkdjVy
	 fyGiFuxaD/7WXNRle2U6lIgoLrWBEC/UzfXp2i52naEM8SfsZmBcWcouvR0TqLAHCQ
	 iwP1KQhEsEJvPKQR2mZKCp26eLhe3h4/4uIqaI1V4j8qqGnmmqOk7ZD+cc6ZpjcGdn
	 EPnifn8xZd+lZLwhtyJ9ee4A6w0A0vQPzt45BFCJWnl12lk4f/sQgEVRPi8MpK5akt
	 glA9lLIqkctVPwGsNuy36SPL2MEiVwXcJx7NbjLjg/hiAxAc3aFBNDbWe55aa/TGsC
	 FQrjH4Nu2QpSSmzM+cJnr9JFiKJ+/55PaBO47DHScEWqddolhsQu/VDutzBtfR2cni
	 eNoNNzncBerEkvfq0ao9jjSxsU2LzatmBUbejmEaTlCxlHAEfw2RLD3s+ES2YXnDE7
	 ByZkfxnRHqbHdbIFbVSCIae8quUVWk48fDK9FLuQ0ZHI3zaZ/eN6kwk7ekF9eDCe4F
	 zydjJz/6I0keUOgCqYax+n7h9bi/d+Sp+0qydpwq0qVKaInMhaw4TYO6aQ5dSN12EZ
	 d6InW9KZcSSU20PdbM0TJgjRug6L1dS5ffMhRUjbjTBz87d1P5fCT2ffpW4Cxuekm9
	 HNy8QFYac3RQ3315ZZw96xE0=
Date: Tue, 16 Jun 2020 22:49:12 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Steve Sakoman <steve@sakoman.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 08/21] cairo: Do not try to remove nonexistent directories
Message-ID: <20200616194912.GH14969@localhost>
References: <cover.1592249381.git.steve@sakoman.com>
 <5e33d1d1d655c50a817acda85f2df67c67196daf.1592249381.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <5e33d1d1d655c50a817acda85f2df67c67196daf.1592249381.git.steve@sakoman.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 15, 2020 at 09:35:27AM -1000, Steve Sakoman wrote:
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> 
> Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
> native/nativesdk from target) changed the default PACKAGECONFIG for
> native and nativesdk so that it becomes empty unless "x11" is in
> DISTRO_FEATURES since "trace" was also removed (propbably
> unintentionally). This highlighted than an empty PACKAGECONFIG would
> lead to a build failure since /usr/bin is never created under these
> conditions, but the recipe still tried to remove it.
>...

Isn't this a fix for a bug that is not in dunfell?

cu
Adrian
