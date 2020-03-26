Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.38818.1585234580814920414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 07:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=uS3wOmM2;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48p7NJ3cqCz3Q;
	Thu, 26 Mar 2020 15:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585234577;
	bh=PyNDHzVNOa9prslJwpvm8+//ktuVeLAns4W4a7754Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS3wOmM2FmRC86kPZl47D/CjbraA+GgDsRJMpq6VlJ8zXbFgaNJnskP9swR940lmU
	 117m0MP0V/HldLSeT99+941gsajoU1T6CE2KcIMUN2rXdppBboLMtXelxwqa8F60Td
	 vbNelwhlPHcOpjBaQDziJpjggh+37tFlbvbenAkxTmMtDtP24YYGJH+qBVMfcKNEWS
	 4VjwRcDuiY+r9pfdavZYNkofRbqN3b6XNOs9rI1gk2mGPW3+G5diPeP+4IkO+PHzYv
	 cOdWyLGb3xb/tsWv9zkf5ir7zWxjL3ZkJZ8v+M5DOKu0BCizPpJnWTLRR61jM6kASg
	 /S8D9l6xkdk95uT44z8JmaWpuYPAkKK2ji/o+W9woK4jo6OkITdsf1Ma9YlUC1qflE
	 UcUlwm2btml6M4w0wKeFK+EPfnoNut2ibp19I6YeJA38YXV2yY4g5DYBPJJpVQ9zJM
	 8h4D8MLa92o9eu/pLmMZ5MuxpUsaV3DoCOCiCxsgDZeal5hvqVuVcW4EE/NGABYPMx
	 izAyUBMosnChbUWrBTo80daLNnpnrkCOatN/R/Jsgrtnsi5UiVppbrBeBMJNRD280s
	 s8WQFKAe0LqUzZUZVuJD6xQo4H8MjUeZNBfsYHWLv+znOuFQmT/90/fodk594Tm7dc
	 5m621OMG+7jpkidFXiapoU0M=
Date: Thu, 26 Mar 2020 16:56:14 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
Message-ID: <20200326145614.GA26693@localhost>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200326085426.117209-7-alex.kiernan@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> then disables all sysvinit handling in systemd if it isn't present.
> 
> Consolidate sysvinit handling so that when it's disabled we exclude all
> sysvinit features.
>...

What exactly are "sysvinit handling" and "sysvinit features"?

It seems to disable systemd-sysv-generator, and this is wrong.

cu
Adrian
