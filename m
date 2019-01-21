Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 562B76BC44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 09:14:56 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id n21so7757711ywd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 01:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ThjrCSuKQIWYx9+khJVnZX63pli2CfZhbvXjkJNqpws=;
	b=nQ8SSEQMgVVIjAEnXnekk6eGC+hZ+EVFWcV+UiWabkJBkKAshVFkWeTnw9CSLYKfgn
	b6MfvoSGfovpO1yxXElUd1gk8Bz4ZnomVt5WHEBvHVM1Wnf5a8uFrDdysIAHhAg1e/Kf
	6/QmgjKJWoEcI3TIp0jQGu3Xt0r+Q18weGXpkvuA1J8CKws0oG9/VqBxIMjt+gk8yPg2
	6RNNN5kZwKuJYB6gv72oMo76OU+GoKxwYGjJXIv4ADcia41ZzDjTCoK2CgG9XISBB+8G
	f9YtyhCj2j5GGhMvfe8peS+LzpLrKwQPqvM5MtzT2fXirYzAhXfwij8SkVIyBOg6UIyy
	wHYw==
X-Gm-Message-State: AJcUukctbNxubJPdf2BSciMkeAFrt1xbtmCXDi+/kuMRoNGB9WdQ5zvN
	Tfgw9voxfaw7n5A6MVVTM27zYSR5
X-Google-Smtp-Source: ALg8bN5ezYYERoEY0zIfVkwQ0Pw8lIbcAdPzDPKtACJlulkyr5+guYzGm9xsiUfxxhT4XkQuM5cP3w==
X-Received: by 2002:a81:3e07:: with SMTP id l7mr27398915ywa.447.1548062097090; 
	Mon, 21 Jan 2019 01:14:57 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	i13sm4649985ywe.53.2019.01.21.01.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 01:14:56 -0800 (PST)
Message-ID: <3287314d6f8a7a23be48eb9ea168b3f148da7ae5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jan 2019 09:14:54 +0000
In-Reply-To: <20181129175214.3041-1-raj.khem@gmail.com>
References: <20181129175214.3041-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] musl: Update to latest trunk
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
X-List-Received-Date: Mon, 21 Jan 2019 09:14:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2018-11-29 at 09:52 -0800, Khem Raj wrote:
> Complete changelogs are here
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..39ef612aa193cc6e954ac5a01574300ccd4b7ef9
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2: move to latest master ( 3 more commits for regressions )
> 
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> core/musl/musl_git.bb
> index 0d8f8eb2a4..b416ec45bf 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>  
> -SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
> +SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"

With this, link detection doesn't seem to work correctly anymore, instead
constant messages in the syslog:

    Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)
    IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
    fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
    IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
    Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)
    IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
    fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
    IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
    Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)

etc.

I've tracked it down to commit d1395c43c019 ("allow freeaddrinfo of
arbitrary sublists of addrinfo list" in musl.

Even latest musl master de7dc1318f49 doesn't work for me with the same
problem. The only way to make it work is to revert d1395c43c019 in musl,
even with latest master.

link detection should be a kernel thing, or not? So how can a user-space
change affect the kernel's link detection?

Any ideas?


Cheers,
Andre'



