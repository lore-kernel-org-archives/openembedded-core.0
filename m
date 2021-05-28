Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.7999.1622207162224421602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 06:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4Fs4gW0Jcpz5tlD;
	Fri, 28 May 2021 15:05:58 +0200 (CEST)
Date: Fri, 28 May 2021 15:05:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
Message-ID: <20210528130557.zr762og6uvyv577b@qschulz>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 28, 2021 at 08:51:51AM -0400, Robert P. J. Day wrote:
> 
>   as a short followup to my earlier note about creating a bunch of
> externalsrc-based recipes to demonstrate their proper structure, it's
> easy to add the recipe files to a layer, but i then realized i needed
> to figure out where to put the corresponding source, and how i would
> refer to it with the EXTERNALSRC variable, and after some thought, it
> occurred that the simplest solution is to simply put the source in a
> "src" subdirectory next to the recipe itself, and use:
> 
>   inherit externalsrc
> 
>   EXTERNALSRC = "${THISDIR}/src"

FWIW, we use multiple ../ in the variable and it works just fine. Might
be a slightly better example than having it next to the recipe, since
this would actually be covered by SRC_URI = "file://whatever". In that
case, you could add the sources in `yocto-docs/externalsrc-src` for
example?

In any case, an example recipe is very much welcomed so thanks for
suggesting one!

Cheers,
Quentin
