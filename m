Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbDlk-0008SA-HD for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:30:36 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbDiE-0008OU-KJ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:26:58 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308230863.25285.4590.camel@phil-desktop>
References: <1308230863.25285.4590.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 27 Jun 2011 16:26:57 +0100
Message-ID: <1309188417.21613.326.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] dhcp: don't try to move files from ${sbindir} to ${base_sbindir} if they are the same
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 15:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping?

p.

On Thu, 2011-06-16 at 14:27 +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-connectivity/dhcp/dhcp4.inc |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp4.inc
> index 159ae89..885cc19 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp4.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp4.inc
> @@ -47,7 +47,9 @@ do_install_append () {
>  	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
>  
>  	install -d ${D}${base_sbindir}/
> -	mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	if [ "${sbindir}" != "${base_sbindir}" ]; then
> +		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	fi
>  	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
>  }
>  




