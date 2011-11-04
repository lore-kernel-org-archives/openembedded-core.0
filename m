Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RMRCO-0007Pj-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:21:16 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RMR6S-0004lo-UA
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:15:09 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1320440872-28420-1-git-send-email-msm@freescale.com>
References: <1320440872-28420-1-git-send-email-msm@freescale.com>
Date: Fri, 04 Nov 2011 21:15:01 +0000
Message-ID: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Fri, 04 Nov 2011 21:21:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-04 at 16:07 -0500, Matthew McClintock wrote:
> +    idx=0
> +    tmp="${SERIAL_CONSOLES}"
> +    for i in $tmp
> +    do
> +	j=`echo ${i} | sed s/\;/\ /g`
> +        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +	idx=`expr $idx + 1`
> +    done
> +
>      if [ "${USE_VT}" = "1" ]; then
>          cat <<EOF >>${D}${sysconfdir}/inittab
>  # ${base_sbindir}/getty invocations for the runlevels.

That looks like it will lose if ${SERIAL_CONSOLES} is not defined at
all.

p.




