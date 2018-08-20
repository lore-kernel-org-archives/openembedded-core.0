Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EC47879092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:45:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7K9jJit001903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 20 Aug 2018 10:45:21 +0100
Message-ID: <9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 10:45:19 +0100
In-Reply-To: <20180820024616.12501-1-pkj@axis.com>
References: <20180820024616.12501-1-pkj@axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Mon, 20 Aug 2018 09:45:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-20 at 04:46 +0200, Peter Kjellerstedt wrote:
> busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> index 8c6dbbaf9b..a8ba10d21c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of many
> common UNIX utilities into
>  HOMEPAGE = "http://www.busybox.net"
>  BUGTRACKER = "https://bugs.busybox.net/"
>  
> -DEPENDS += "kern-tools-native"
> +# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not defined
> +DEPENDS += "kern-tools-native virtual/crypt"

I'm not a bug fan of adding dependencies which might not be needed. How
common is CONFIG_USE_BB_CRYPT not being defined? I assume that isn't
our default config?

Cheers,

Richard

