Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.9855.1611652824413506892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4DQ1RH3XYvz5tlC;
	Tue, 26 Jan 2021 10:20:11 +0100 (CET)
Date: Tue, 26 Jan 2021 10:20:10 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Message-ID: <20210126092010.oxyjs253ndo2j3ta@qschulz>
References: <20210126005347.7452-1-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210126005347.7452-1-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Tue, Jan 26, 2021 at 01:53:47AM +0100, Dorinda wrote:
> If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.
> 

Commit log is usually wraped when reaching a given length. I personally
have it set to 72 characters which IIRC is what's used for kernel
contribution.

This does not apply to actual logs provided in the commit log.

It's just nitpick, as I saw a commit or two not following this implicit
"rule" in poky, I'd say there's no need to resend a patch just for this.

Also, please add a version tag when you send revamped patches.

You can do that by adding -v 2 to git format-patch.

> [YOCTO #14179]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---

And if you want to do it really the very nice way (IMO, as always), you
can provide below the --- (the one above this) and the list of files
changed (the one below this), you can list what has changed between v
N-1 and v N.

e.g.

 v2:
  - rephrased error log,
  - added a check for empty paths in pseudoignorepaths,

>  meta/classes/sanity.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index e527c13746..c6842ff549 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass

Only nitpicks, so nothing to be done on my side if no new change is
requested by other reviewers.

Cheers,
Quentin
