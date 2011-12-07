Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYEpF-0007G8-T9
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 11:34:09 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYEih-0006R1-Qx
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 11:27:23 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 10:27:22 +0000
In-Reply-To: <697ca68b7e47d0392273fa5a07df0e4396e709bf.1323246565.git.xiaofeng.yan@windriver.com>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
	<697ca68b7e47d0392273fa5a07df0e4396e709bf.1323246565.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323253643.26081.311.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 07/10] pango: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Wed, 07 Dec 2011 10:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 16:58 +0800, Xiaofeng Yan wrote:
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
> +PACKAGECONFIG[directfb] = ",,directfb"

Hm, really?  I didn't think pango had any inbuilt support for DirectFB.
Does this really accomplish anything?

> +       [ ! -d "/etc/pango" ] && mkdir -p /etc/pango/

That will fail with a read-only rootfs, and I think it will also give an
error if /etc/pango already exists.  It would be better to just ship
this directory in the package.  (Also, it should be ${sysconfdir}.)

p.




