Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3547.1588883404897382545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 13:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C3A940C6E;
	Thu,  7 May 2020 20:30:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mex2K0Ov6DYw; Thu,  7 May 2020 20:30:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCFC140C6C;
	Thu,  7 May 2020 20:29:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6ED731730E6; Thu,  7 May 2020 16:29:59 -0400 (EDT)
Date: Thu, 7 May 2020 16:29:59 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ovidiu Panait <ovidiu.panait@windriver.com>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
Message-ID: <20200507202959.GE11927@denix.org>
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
 <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com>
 <20200507195709.GD11927@denix.org>
 <32b9edf2-a77a-65d5-8c1e-e7cb03a7d29a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <32b9edf2-a77a-65d5-8c1e-e7cb03a7d29a@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 01:20:40PM -0700, Khem Raj wrote:
> 
> 
> On 5/7/20 12:57 PM, Denys Dmytriyenko wrote:
> > On Thu, May 07, 2020 at 12:44:15PM -0700, Khem Raj wrote:
> >>
> >>
> >> On 5/3/20 3:51 PM, Steve Sakoman wrote:
> >>> Should I consider these two patches for dunfell LTS?
> >>>
> >>
> >> Yes I think they are fixing a problem and are safe.
> > 
> > I don't think it is safe though!
> > 
> > The code has been moved to create_sdk_files() which is a POSTPROCESS command 
> > for SDK creation. What if SDK already provides own /etc/ld.so.conf? The code 
> > just simply overwrites it.
> > 
> 
> but are there such usecases ? looking closely if SDK is extending the
> ld.so.conf then they should be appending to it instead of overwriting
> and same is true for this patch for master.

Exactly my point - should probably append, not overwrite.
As of usecases - I can think of a non-standard nativesdk tool that adjusts 
/etc/ld.so.conf during install...

-- 
Denys
