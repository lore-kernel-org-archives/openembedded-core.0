Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QYx4T-0000yp-ND for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:16:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QYx0z-0002aP-Mo
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:12:57 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
	<42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 21 Jun 2011 10:12:56 +0100
Message-ID: <1308647576.21613.10.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/5] connman: Upgrade to version 0.75
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
X-List-Received-Date: Tue, 21 Jun 2011 09:16:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 16:08 +0800, Dongxiao Xu wrote:
> -DEPENDS  = "libgdbus dbus glib-2.0 hal iptables"
> -RDEPENDS_${PN} = "wpa-supplicant resolvconf"
> +DEPENDS  = "libgdbus dbus glib-2.0 hal iptables ofono wpa-supplicant resolvconf bluez4"

What does the dependency stack for ofono look like?  If it's non-trivial
then I am not sure it is a good idea to add ofono to DEPENDS
unconditionally.

Ditto bluez4, I don't think that should be in there unless
DISTRO_FEATURES requested it.

p.




