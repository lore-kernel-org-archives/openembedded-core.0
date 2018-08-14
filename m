Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1ED478FF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:24:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7EEO5Rq028844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 14 Aug 2018 15:24:06 +0100
Message-ID: <520af9857fc5f36d1328f24cc1462776967257e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 15:24:05 +0100
In-Reply-To: <1534255849-10649-1-git-send-email-andrea.adami@gmail.com>
References: <1534255849-10649-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] tune-xscale.inc: restore specific tuning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 14:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-14 at 16:10 +0200, Andrea Adami wrote:
> Since commit
> 
>  a11bdc36a1be
>  tune-*: define more generic DEFAULTTUNE to share feed between
> machines
> 
> we are using armv5te to share binary feeds.
> 
> After 008085450417 gcc-8: Fix spurious mcpu/march conflict for xscale
> we can use again the specific optimizations.
> 
> As of today, there are no public feeds for the legacy devices so
> let's prefer
> the optimal tuning.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/conf/machine/include/tune-xscale.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/machine/include/tune-xscale.inc
> b/meta/conf/machine/include/tune-xscale.inc
> index 0d07333..cd08b93 100644
> --- a/meta/conf/machine/include/tune-xscale.inc
> +++ b/meta/conf/machine/include/tune-xscale.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv5te"
> +DEFAULTTUNE ?= "xscale"

Does this make any real world difference except for duplicating feeds?

Cheers,

Richard

