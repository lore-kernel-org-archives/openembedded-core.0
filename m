Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.22383.1593612208553808935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49xjcW3YPLz5tlF;
	Wed,  1 Jul 2020 16:03:23 +0200 (CEST)
Date: Wed, 1 Jul 2020 16:03:22 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Kjeld Flarup <kfa@deif.com>,
	Per =?utf-8?B?TsO4cmdhYXJk?= Christensen <per.christensen@prevas.dk>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kurt =?utf-8?Q?=C3=98stergaard?= Frandsen <kof@deif.com>
Subject: Re: [OE-core] file checksums versus SRC_URI globs
Message-ID: <20200701140321.wueczs4qd34rbhwh@qschulz>
References: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rasmus,

On Wed, Jul 01, 2020 at 03:51:19PM +0200, Rasmus Villemoes wrote:
> Hi,
> 
> We have a recipe that uses
> 
>   SRC_URI += "file://somedir/*"
> 

Glob aren't supported. Use "file://somedir/" instead.

Quentin
