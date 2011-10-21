Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RH93k-00083R-98
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:58:28 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RH8y5-0005jq-HB
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:52:37 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
Date: Fri, 21 Oct 2011 07:52:29 +0100
Message-ID: <1319179949.3244.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 06:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-21 at 03:31 +0000, Otavio Salvador wrote:
> @@ -37,7 +37,7 @@ do_install () {
>  	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
>  }
>  
> -pkg_postinst_${PN} () {
> +pkg_preinst_${PN} () {
>  	set -e
>  
>  	if [ ! -e $D${sysconfdir}/passwd ] ; then

Doesn't this break on-target installs (or, more generally, installs
where preinst runs before unpacking)?

p.




