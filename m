Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T2MGm-0005Pv-Ul
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:07:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T2M5E-0007SP-Gd
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:55:24 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 13:55:23 +0100
In-Reply-To: <CAOd_LFz6abBqUcMvOVBudGF_ec_ezs_=y5e3qKyC5c0Js0J=7A@mail.gmail.com>
References: <CAOd_LFz6abBqUcMvOVBudGF_ec_ezs_=y5e3qKyC5c0Js0J=7A@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345208124.2673.2.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: DEPEND on an image recipe
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
X-List-Received-Date: Fri, 17 Aug 2012 13:07:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 08:51 -0400, Cliff Brake wrote:
> I would like to add a DEPEND to a kernel recipe that causes an
> initramfs image to be built every time before the kernel is built.  It
> seems that a DEPEND on the rootfs recipe triggers the rootfs build,
> however it appears that the kernel recipe does not wait for the image
> recipe to finish before it builds.  What is the best way to accomplish
> this?

do_compile[depends] += "ramfs-image:do_rootfs"

p.




