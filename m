Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7B49F60B3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 05:17:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Qr1729Txz4M;
	Mon, 24 Feb 2020 06:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582521467;
	bh=6ld5lVI2cXmumo5vNKRyoj2Cb5U/QBeoRx80FCeOCtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBJcYOh+seCZnEp4GhhRIeDd96JiLvjEGgepl171XGjcBpXuYCFqnGTrkceOPLwcb
	CMgjDXL4i1CD3r9yg74Tjs59Jf3tNl+e9zAGu7OLfS6LBglL4nodrHpo5nRkX2sIIH
	4sSSGATANO9do3pOCl5WV4F9t2f2tfRx9oC/9kbqc2nMsTqhQsn+B7UTcl5sc9FcQz
	ccZVatH+p2T8Y7ueBjqr1snBKf2gevs7239SgSJdzxK4MsWhHP7PVA35v35FGoB5AI
	J75DQKFsQB3/44mBCZpk8H4DMgUc8qnqgv9gYOhzEoKCRsNJC41aza70miXY+Brzt1
	eYICCk+abiEcNZVPtVDFDdGNE+O7ekJxB0ar1pfzFOvkczenfolgKopJU4UF7ReMt3
	tnU+HkrgDz0SjCP0pW9DqTQDEadsm3DSLUGxp/XPALJ0qDWBCOa7b8seAU0X4yoOYW
	YzFWomgAtemoLB01e2FcP64Idl0gwVSu73s03hkbn8LLti7NWAiW0ZinFxUDvVxsO6
	2JFhk2J7KmiMTKLX73JLI7RSzegWxQbW4SWx3FmmGrw+La7rPxUEsrixZLrFXZyxwZ
	rU68CA1WVF+HkkI7G/f67xJCei5+xIUsQfywKoqGJtVZTuzrEWrX4wD72Y/jRml7cH
	dDvQRjewvhN1McBk2Ns1JK7o=
Date: Mon, 24 Feb 2020 07:17:45 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200224051745.GA6683@localhost>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Mon, 24 Feb 2020 05:17:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Feb 23, 2020 at 04:25:18PM -0800, Khem Raj wrote:
> On Sun, Feb 23, 2020 at 11:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > rpm was the last user in OE-core.
> 
> we should also assess external dependencies especially on libraries,
> there might be layers which do not depend on meta-oe but use nss
> or enable nss packageconfigs in core components like curl.
>...

Is providing a crypto library in OE-core without providing security 
support better than not shipping it?

nss in warrior seems to lack fixes for at least 5 CVEs.

cu
Adrian

