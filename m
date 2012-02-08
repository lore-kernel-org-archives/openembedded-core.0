Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RvADk-0001ux-4Q
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 17:18:12 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RvA5y-0002WM-Pw
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 17:10:10 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 16:10:09 +0000
In-Reply-To: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328717410.14363.46.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 16:18:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-08 at 18:06 +0200, Andrei Gherzan wrote:
> 1. Update to 4.2.3-P2
> 2. From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
> from bind that are linked to libcrypto. This is why i added a patch in order to add
> -lcrypto to LIBS.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

[...]

> @@ -66,7 +61,7 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
>  
>  FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
>  
> -FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
> +FILES_dhcp-client = "${sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>  RDEPENDS_dhcp-client = "bash"
>  
>  FILES_dhcp-omshell = "${bindir}/omshell"

This isn't just a straightforward update, you seem to be moving dhclient
from ${base_sbindir} to ${sbindir}.  If that's a good thing (which
doesn't seem totally obvious to me) then it ought at least to be
mentioned in the commit message.

p.




