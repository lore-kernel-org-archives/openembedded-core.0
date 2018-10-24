Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81861745F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 21:32:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9OLW6dn024855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 24 Oct 2018 22:32:12 +0100
Message-ID: <dd89dabb53db006d0b4ba34028361d27e1e3cfe4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2018 22:32:01 +0100
In-Reply-To: <20181024115135.10434-1-schnitzeltony@gmail.com>
References: <20181024115135.10434-1-schnitzeltony@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] systemd-conf: add CLEANBROKEN
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
X-List-Received-Date: Wed, 24 Oct 2018 21:32:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-10-24 at 13:51 +0200, Andreas Müller wrote:
> > DEBUG: Executing shell function do_configure
> > NOTE: make clean
> > make: *** No rule to make target 'clean'.  Stop.
> > ERROR: oe_runmake failed
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-conf.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf.bb
> b/meta/recipes-core/systemd/systemd-conf.bb
> index c694efbbf14..111ef2497a3 100644
> --- a/meta/recipes-core/systemd/systemd-conf.bb
> +++ b/meta/recipes-core/systemd/systemd-conf.bb
> @@ -18,6 +18,8 @@ FILES_${PN} = "${sysconfdir}/machine-id
> ${sysconfdir}/systemd"
>  
>  do_compile[noexec] = '1'
>  
> +CLEANBROKEN = "1"
> +

I suspect a do_configure[noexec] = '1' may be a better way to fix this?

I also suspect Mark's other patch needs this tweak too?

Cheers,

Richard


