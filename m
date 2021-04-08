Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.5157.1617870536692835947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 01:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4FGDtt2kqpz5tlL;
	Thu,  8 Apr 2021 10:28:54 +0200 (CEST)
Date: Thu, 8 Apr 2021 10:28:53 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: douglas.royds@taitradio.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] Revert "externalsrc: Detect code changes in submodules"
Message-ID: <20210408082853.css5jnydjqq5zeg2@qschulz>
References: <20210408010855.345237-1-douglas.royds@taitradio.com>
 <20210408010855.345237-2-douglas.royds@taitradio.com>
MIME-Version: 1.0
In-Reply-To: <20210408010855.345237-2-douglas.royds@taitradio.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Douglas,

On Thu, Apr 08, 2021 at 01:08:54PM +1200, Douglas via lists.openembedded.org wrote:
> This reverts commit 4525310d49d115a37705f04ac5c03d639e5e8f8c.
> 

Why is this revert needed? The reason needs to be explicit in the commit
log.

Cheers,
Quentin
