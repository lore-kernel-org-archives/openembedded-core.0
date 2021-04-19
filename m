Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.8774.1618838185897550440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 06:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FP6lW0rDbz5tlC;
	Mon, 19 Apr 2021 15:16:23 +0200 (CEST)
Date: Mon, 19 Apr 2021 15:16:21 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Message-ID: <20210419131621.npuxcqtg52fftkz6@qschulz>
References: <20210419125618.584909-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210419125618.584909-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Apr 19, 2021 at 02:56:18PM +0200, Alexander Kanavin wrote:
> Particularly,
> - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
> - all necessary component tweaks are enabled by default via DISTRO_FEATURES
> - provide on-target examples of what to look for when things work properly
> 

Looks good to me.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
