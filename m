Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.7968.1589441909764979247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 00:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Bin6/Jj7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49N3LQ5Qsxz5l;
	Thu, 14 May 2020 09:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589441906;
	bh=tD6hPYuhAfxCI2xlrWVV33OI6onoTcDWXp3Xg3cncc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bin6/Jj7ZsCZg66ta5iscm3KCfq2YJJEQ+x2kSI9apVqgi8vs5Ila8ZEly0frw9RZ
	 DbMWbjlo20TA3vWwK9m4TbiLuBc6Tu1atvveOEjbFm0yo/1XXL41Z+k2AwBzOyaNaA
	 u2zBnhauVuLOM2/Qds7ThvAzj+9F0yiyvUpKImXyXMaxOufj0g1ws+2AD65P7Np16u
	 /EKiWAAqNbquCpcwBw1x8b8n/5NRK4FQOxoBw516zSV/Mh8Exh7GXmbII2jjF/fd1v
	 AuDxZ+XJxmlZQwfc0XfIg9P72lktQBAWbPwD1Me5cGcGVXC+ioMTh7j4wp1wE7oR5L
	 sDVNRpZEva0p47y/4NA3jdWbT8ZwUFAWim+KvL2H29hPxKiqseYs7jW5Rf8P1ePKLB
	 PROYCMGW4Z3D0ydRamgyAvoDMUpzwnH3fHbgkMXw92fCNHpHY845naXX2zULa+zjns
	 LWKWqZMl8nUo/O2stt3fNxw95HDMc5w4JIPirYEGaX+TKTxrTFOPhaWmI3iImUtCBn
	 siRxYk6UajLPRFqtRijNyC8eDconJBG6ff2gZgPdLOfJ9tcFqYqGkqfnGOg8Et0OED
	 p0FUgIv7S4bEG0F70pTzLRRJUxzFffSH/LVPdUN1PGiJqEArNloytTSB6gUHw1bzAW
	 8/7EIHQw3Qv6Hn+ZF8tjX6LQ=
Date: Thu, 14 May 2020 10:38:21 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514073821.GA16323@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511182812.441561-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> This was added recently, but it seems be chewing more than what it
> should and causes non glibc packages also depend on it.
>...

Is this only valgrind (there is a upstream bug open for that),
or were there more recipes with a problem?

cu
Adrian
