Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.22078.1594739678617549533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 08:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B5kZg5rd1z5tlG;
	Tue, 14 Jul 2020 17:14:35 +0200 (CEST)
Date: Tue, 14 Jul 2020 17:14:34 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Mark Deneen <mdeneen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ppp: Add support for setting ifname in ppp options
Message-ID: <20200714151434.vthcngsgjyzeafkq@qschulz>
References: <CAP6JJ88RJ0LJZb4=kOUZNtBBYZMXHbP3q40ECaRMZ4kLeaBwKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP6JJ88RJ0LJZb4=kOUZNtBBYZMXHbP3q40ECaRMZ4kLeaBwKA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

On Tue, Jul 14, 2020 at 11:04:41AM -0400, Mark Deneen wrote:
> pppd is patched in most Linux distributions to allow arbitrary naming
> of ppp interfaces, allowing users to create consistent firewall rules
> rather than having interfaces named "ppp0", "ppp1", etc.  Yocto is
> missing this option.
> 
> This patch, originally from SUSE, adds this option to pppd. It is not
> included upstream because there are some pppd-supported platforms which
> lack the ability to rename interfaces.
> 
> Signed-off-by: Mark Deneen <mdeneen@gmail.com>

Please follow guidelines from:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
to know how to contribute in a way that is matching OE patch management.

Your mail content should probably be the content of the commit log. Your
mail should directly be the output of git format-patch (send it with
git send-email), the patch shouldn't be attached to the mail but rather
"be" the mail.

On the content of the patch, it'd be nice to take the patch with the
authors, commit title and log from the original place where you took it
from.

It probably is:
https://sources.debian.org/patches/ppp/2.4.6-3.1/ppp-2.4.2-ifname.diff/
?

No author, no commit log :/ Though, I could find
https://sources.debian.org/patches/ppp/2.4.6-3.1/ppp-2.4.2-ifname.diff/
which is slightly different and the changelog seems decent between
Suse's and debian's patch.

Thanks,
Quentin
