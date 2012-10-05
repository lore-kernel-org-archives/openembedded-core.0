Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TK6h2-0002sD-Km
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 14:07:48 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TK6US-000359-D1; Fri, 05 Oct 2012 13:54:48 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 05 Oct 2012 12:54:47 +0100
In-Reply-To: <1349437649.15658.20.camel@ted>
References: <1349437649.15658.20.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349438088.18625.3.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 12:07:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-05 at 12:47 +0100, Richard Purdie wrote:
> diff --git a/meta/recipes-graphics/drm/libdrm/nocairo.patch b/meta/recipes-graphics/drm/libdrm/nocairo.patch
> new file mode 100644
> index 0000000..f9b7f3a
> --- a/dev/null
> +++ b/meta/recipes-graphics/drm/libdrm/nocairo.patch
> @@ -0,0 +1,39 @@
> +We don't want the cairo dependency. Unfortunately simply checking whether its present 
> +isn't good enough. If its not in DEPENDS, it can disappear half way through building.
> +We therefore need to explictly disable it.
> +
> +RP
> +2012/10/5
> +
> +Index: libdrm-2.4.39/configure.ac

This new patch seems to be missing Upstream-Status and Signed-off-by.

p.




