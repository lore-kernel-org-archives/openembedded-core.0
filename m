Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.14599.1595406620117691072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4BBTDT0wGbz5tlH;
	Wed, 22 Jul 2020 10:30:16 +0200 (CEST)
Date: Wed, 22 Jul 2020 10:30:15 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] "DEPENDS =" versus "DEPENDS +=" in recipe files
Message-ID: <20200722083015.dv4bavjfl47txecp@qschulz>
References: <20200721172650.Horde.Ywym1orCr19y5sktKiavBRT@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <20200721172650.Horde.Ywym1orCr19y5sktKiavBRT@crashcourse.ca>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Tue, Jul 21, 2020 at 05:26:50PM -0400, Robert P. J. Day wrote:
> pursuant to cleaning up some docs and tweaking the style guide,
> i just want to clarify that the *proper* assignment to DEPENDS
> in recipe files is:
> 
>   DEPENDS = "..."
> 
> unless (of course) that assignment is preceded by a "require"
> of a .inc file that assigns to that variable, whereupon the "+="
> would make sense.
> 

And inherited class(es). In which case, I guess the use of _append or +=
at least are required (in the class ideally I'd say), otherwise if
DEPENDS is set in the recipe before inheriting, it'll be overwritten by
the class's `DEPENDS =`.

Quentin
