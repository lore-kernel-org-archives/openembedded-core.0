Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.63188.1595876597960993759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=AcnOu/3p;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=yaqv=bg=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BFq2S5Q2rz3l;
	Mon, 27 Jul 2020 21:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595876594;
	bh=L/WOvPg0k+P+BX8+P3NqjwQ11sxpeT/XnSTPjjYW2Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcnOu/3pP06DRvICd5+gk8b2Zmd7yh0JJljRihHBueT5m3UXVYGxcs7CS8oW5Yeg1
	 3z7mc2mMYVoR20HjDBanY4/ewydUKK9Q3NlELjk8WztaCMT5DrgH3x+NONcE3YJueL
	 3D5Sn5czm3l/8BSzfI7ytKA0OdkVm/gIeTya4afuzIqyQtfMdiIfHZK21NhyIVPxEh
	 3RWFtNy92TIHJhNb00ULsI6vPRP0+WIPyDkGppskunuXzi7onhNhau5QLADPqlRLWA
	 Bp4wiLm8kmoQc+eTOh73WD3tByj/ODKjZ2BS0hGzHW7PhmkClVsMH41+VT+2L5bxPz
	 bKbJzNJ/zUkf+r+yGzRTMsacCW0q7Dx5yBcPLPfD6mmf/C5pHcLzKMBUYshYrjQIWz
	 QuAelH+XgQ+j2HT97iGg1Ug73GWOVcRLvojZ35VQpLpNmx6DA+IB/h/KgfjNJvl1M3
	 LnpU9M76fyQAkBLa9d12tNoMqjZu7jwywdwsWnOXIwM+yBvvJML+s/mO3QYKAawx+H
	 vM17i2rPLRJWYKDecdyGBh6Bk7mHpPuU6Rzu4QqmrGzwSTE7osm/rGJDlq/NNVYVKC
	 HJhYSBD9mfZZ/fLnHxOG3G2U23r8cIymzfcaEVLVR7WWT7AWAVTXVbnwwplGQhjXzV
	 hYGZfHbP28At0/Pa3aTEydz8=
Date: Mon, 27 Jul 2020 22:03:09 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-numpy: Stop shipping manual config files
Message-ID: <20200727190309.GC29335@localhost>
References: <20191027173648.6095-1-bunk@stusta.de>
 <b2ee3e9e-9d8d-5bd4-d82a-918f7c380c5a@kontron.de>
MIME-Version: 1.0
In-Reply-To: <b2ee3e9e-9d8d-5bd4-d82a-918f7c380c5a@kontron.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 21, 2020 at 12:28:15PM +0200, Frieder Schrempf wrote:
> Hi Armin, Anuj, Adrian,

Hi Frieder,

> On 27.10.19 18:36, Adrian Bunk wrote:
> > Automatic generation seems to work fine,
> > and does not become outdated.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> Can you confirm this will also work on zeus, or does zeus miss some other
> patches this depends on?
>...

I am not aware of any reason why it shouldn't work in zeus,
it entered master shortly after zeus was branched.

> Thanks,
> Frieder

cu
Adrian
