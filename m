Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.3638.1585250192738436421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=H8Ir7+mf;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48pF8Z6Tkpz3Q;
	Thu, 26 Mar 2020 20:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585250191;
	bh=mDOXA3j+/k4XNhm2ttnmy6P2lUWKB9NA4ohMuU24oEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8Ir7+mfiy9CYQNKRdWJd9lvdLltIY+gUIgWoRgVKizmJd7K0EoZyKBFdWx7/i0Ns
	 2NmCNVVXy1CrriUt0uhvK7fLm6zesTlEcSZVSEZK0eVZxgX/3j2jBOsB9/4r5KkBq2
	 hdERrJbxOw+a/+w5ZMvgpDEGCFboUO5ByW+XJoLudfnppKwHXtqK88RLP9j/+qutLk
	 dUoMD5NAunREQBVUkv1wK/Lsk5tqGql4pKUZCqHffhdrrnQRYmkP2DcZ/6YPOyirJ7
	 bxaG2cTmFeUHISXybuDl02kiONwdGRe27q2YMVfxNb2yUNxg0uvJWqeqFT3UnPVfkb
	 OYn1gSWRhSPRtTSvbPWe9CkRxninpA7zn3IlxxAritl53Fcn0MZa49CbYkSw4LzP97
	 zc7TVa76d1yhTJlTP/ApTWzi3CvvkKT3cwqGF4MrhaLiTYKkQk9DID7H23ES0x+OMB
	 Z8vzFiNa0grd3s6bnPw4+2PvtUbCIeBXwCKACx4x/0oPkAbFtbJdYav89vEVNogEOV
	 AfSBihGh7zcJaTXr8VsXs3P0cnvfzMve+nzod8/G1Y9gVy10sqFANPg5Wn4qep+yVB
	 /LIaBMkbngeWbRRHeBRFHNY+lYGrcHlsXq6i+hciUfj7/wpZgiQ3b0dVEMUZKHGvDu
	 1Ou7Pa4N9v2Le2TnSOHYCJ2s=
Date: Thu, 26 Mar 2020 21:16:28 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Stefan Ghinea <stefan.ghinea@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
Message-ID: <20200326191628.GC5401@localhost>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200326152629.29272-1-stefan.ghinea@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
>...
> When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> since the Thumb frame pointer in r7
>...

How are you reproducing the problem in pulseaudio?

This sounds like a workaround for a bug in musl that was fixed 2 years ago.

cu
Adrian
