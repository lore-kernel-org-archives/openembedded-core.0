Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QrWUA-0000jA-HI
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:43:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrWPp-0006V7-4m
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:39:21 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 15:39:20 +0100
In-Reply-To: <a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
References: <cover.1313072334.git.lianhao.lu@intel.com>
	<a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313073561.6733.135.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] image: populate site config files into roootfs.
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
X-List-Received-Date: Thu, 11 Aug 2011 14:43:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 22:31 +0800, Lianhao Lu wrote:
> [YOCTO #892] populate the site config files content into the file in
> {target}/cross_site_config in rootfs, which can be used by the cross
> toolchain in meta-toolchain when the rootfs is used as sysroot.

Is that going to cause ${datadir}/cross_site_config to get created in
all rootfs images?  That would be undesirable, but I couldn't obviously
see a flag to turn it on and off.

p.




