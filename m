Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.4610.1591077297501935926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 22:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=XoGLXgKZ;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ahm2=7p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49bh8F4hVbz4N;
	Tue,  2 Jun 2020 07:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591077294;
	bh=WBzIX2rzrR44Uwn5/piS7zbZxSowTXynAgHVX8mo5tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoGLXgKZXT8rlTNkA5WsfCpIEXgI24Lu4ygK6lO7OW61vTOzxI1zh3Cd4vqdWIimR
	 rM49xvC0+ij/Sq1lAgy8/A8VzDV74RdxBij9H3KWvJ0NiCJpVMFK4K55X0W7Dfttr8
	 uO3XNvHlOvYkj9v5V+r98Nm+v8zABUP9QkVG4fycyZZMjq5AY5z2LHPYnYVhA6wvWh
	 tf/dYvQ/JTXV1pWcPGBrT6vFAgxbaJhTgL7YwOWnYvkFHXhrIXIgwjXBfXRmyl8xZ4
	 sPvO7MdVPbsuRhQ24+br8VPtdsc8Cj5jmeRh6Asso6p5xz63WxsuoE/S7FLiXqZUA6
	 la9VSPxnja/woIDkV2JAptYUZzqt/IJ8x/9Eg9c21DgKgZ196bgIc6y2GFEh4GWH2T
	 0WJBiQrpOr+9nuZuUms2ewc/l5cSFKf2v3WkekTzZmI4CDw/arDpsNhbZjBVRsI3i7
	 KgCUgRtRDS6Cu5/figeFaAE+dDgwU7AwHglHKngG6p9PszWfjyjVeSvdv6sQRlU8Fg
	 snH0ziWQ5NNKe2T2gRRt4SLZsOhlBKVlRyWBGlPIURAKXJXJ0399XQp9cPMV+OAKAz
	 NJLzom/RONXCRQ2VwWwcY1mYuNIOz5fNODzXsKKdBOOm0neiR/yZC1N0w8x42URzK8
	 8CPNl7tjgMX1zCsKJUTP0MLs=
Date: Tue, 2 Jun 2020 08:54:45 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
Message-ID: <20200602055445.GA12053@localhost>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com>
 <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 01, 2020 at 10:12:16PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 31 maj 2020 17:53
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
> > copyright year lines.
> 
> Eh, what? That's definitely not the right thing to do. For a license 
> that says "The above copyright notice and this permission notice shall 
> be included in all copies or substantial portions of the Software.", 
> removing the copyright information makes the file useless as part of, 
> e.g., ${PN}-lic.

This is not what the patch does.

>...
> > -LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
> > +LIC_FILES_CHKSUM = "file://License;md5=51591594753f05018680f6db765d5a46;beginline=3"
>...

It only excludes the first lines from the checksum.

> //Peter

cu
Adrian
