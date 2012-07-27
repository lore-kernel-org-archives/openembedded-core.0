Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SuoB0-0003tW-II
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 19:18:10 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Sunzs-0000Nv-HD
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 19:06:40 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 18:06:24 +0100
In-Reply-To: <1343370137-30705-1-git-send-email-radu.moisan@intel.com>
References: <1343370137-30705-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1343408800.5878.112.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH v5] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Fri, 27 Jul 2012 17:18:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 09:22 +0300, Radu Moisan wrote:
> Followed suggestions from Bugz 2261:
> 
> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
> This makes the build dependencies reflect the feature list.
> 
> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
> is now back in dbus where is belongs.
> 
> 4) Potentially make dbus provide dbus-x11, for compatibility.

I'm not quite sure I understand what's "potential" about this last item.
The patch below seems to do that unconditionally.

> +# for compatibility
> +PROVIDES = "dbus-x11"
> +RPROVIDES_${PN} = "dbus-x11"
> +RREPLACES_${PN} += "dbus-x11"

You probably want RCONFLICTS_${PN} there for completeness.  Also, as I
think was already noted, that PROVIDES is most likely superfluous.

p.




