Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.4465.1610643172124247437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DGr345l62z5tlG;
	Thu, 14 Jan 2021 17:52:48 +0100 (CET)
Date: Thu, 14 Jan 2021 17:52:47 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Dominik Schmidt <ds@technokrat.ch>
Subject: Re: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
Message-ID: <20210114165247.hge4fupuwayzk2hv@qschulz>
References: <20210114161153.17719-1-JPEWhacker@gmail.com>
 <267dc42c-ac1f-8955-b67a-4f8a8867adee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <267dc42c-ac1f-8955-b67a-4f8a8867adee@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

On Thu, Jan 14, 2021 at 10:14:57AM -0600, Joshua Watt wrote:
> Argh, sorry. This is not what we want.... I was supposed to make a different
> change and forgot :(
> 
> On 1/14/21 10:11 AM, Joshua Watt wrote:
> > From: Dominik Schmidt <ds@technokrat.ch>
> > 
> > This allows the users to specify SRC_URIs of the form
> > git://user:password@host.tld/path/to/repo.git
> > 
> > which allows pulling in private repositories.
> > 
> > [YOCTO #14065]
> > 

Don't forget Dominik's SoB too!

Quentin

> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
