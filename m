Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3546BC7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 18:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43r7fc3K9nzMs;
	Thu, 31 Jan 2019 19:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548958456;
	bh=QASuHHUkTi0NTVKlWWShwv3lOCQJwlhh2re8RBt/MMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icl0rbTN03dlHfVK+vE7pitl+vIUEbCYEmLj59u8AEWbqMHsM8mptILOTi67X5wq6
	72hsrF6K0APU0CXn72ItVXS5y9+7Cqe1/2DgAliwtymDZasoU3mqoXMFSfShTWKfrp
	Bts0ZLInwjvz85thU1wIDk+gDHaCDMIbcu8PYEaJ2vGR+xF1xOLcEAXE1NzOQnfQ+e
	bocVbKk7W1IIR3nXlofwVcVmMofD1saaTFa8xSIXmrVPB8S3gB2QeEWo/saMd6Pluz
	qgtYt6eBxjizFmyldJIEzGqd8lDc67OxEf1Th08MV9Z0WVByq0pZ9Xe7KouQsTZhyv
	IvF4LPss6KM1+BUrpNJQ9VJATVeDTtfBktL0a0q6mX0MISFrWpmAZwrNlM4UXbBdu3
	0phMmJ62SwYAR+/a5mmj5JHFq+h7UTUrhwWuxKlXnIZEtv17oDJwvg64f2ofc7kvVo
	eu+CFMLE8UbDrjIZLgGYUZahYSlzSzUAw9a22Hh6SwOcM0baNiZxRPkKSE/T35zR66
	Eul2ARzojLC2t853MiKqHZVYNWcpWK+QEOuSyPxL+0oUjGmB7RE0RutxfYaUkMK5LO
	+g/XjAdlkj3E/3HFF/GY43GH66X7S3UHCy88b0EpXMVDx7oEb8StuS5WNOO0XkW1nj
	toJWc1Tt3/B9wiqFJVqJsUVs=
Date: Thu, 31 Jan 2019 20:14:14 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Philip Balister <philip@balister.org>
Message-ID: <20190131181414.GB28875@localhost>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<64cf5467-80f3-735d-c894-088c918c54fe@balister.org>
MIME-Version: 1.0
In-Reply-To: <64cf5467-80f3-735d-c894-088c918c54fe@balister.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Thu, 31 Jan 2019 18:14:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 31, 2019 at 11:06:22AM +0100, Philip Balister wrote:
> On 01/30/2019 05:50 PM, Khem Raj wrote:
> > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> >>
> >> This is a tiny but pretty useful tool.
> 
> Also there is http://layers.openembedded.org/layerindex/recipe/1069/
> 
> I was told a while ago the busybox version has some issues. Hunting
> through brain cells, I think it always does a read back after writing
> which can be bad for some hardware. So I've always used the recipe from
> meta-oe instead.

The broken one for that is actually devmem2, the busybox copy of the 
code has the read back commented out.

> Philip

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


