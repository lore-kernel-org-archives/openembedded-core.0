Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T3NPB-0000wJ-C7
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:32:13 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T3NDZ-0002Tg-C8
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:20:13 +0200
Message-ID: <1345450697.24626.67.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 09:18:17 +0100
In-Reply-To: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 08:32:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 10:46 +0300, Radu Moisan wrote:
> @@ -97,6 +97,8 @@ do_prepare_config () {
>  		< ${WORKDIR}/defconfig > ${S}/.config
>  	sed -i -e '/CONFIG_STATIC/d' .config
>  	echo "# CONFIG_STATIC is not set" >> .config
> +	sed -i -e '/CONFIG_LSOF/d' .config
> +	echo "# CONFIG_LSOF is not set" >> .config
>  	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
>  		${S}/.config
>  	sed -i -e '${configmangle}' ${S}/.config

Why is this desirable?

p.




