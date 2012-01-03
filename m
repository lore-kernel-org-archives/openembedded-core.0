Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri7dA-0005OD-06
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 17:54:32 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri7W5-000150-Mo
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 17:47:13 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 16:47:12 +0000
In-Reply-To: <5ddaf71a4148625744ed202bfb80c99583bae056.1325608510.git.sgw@linux.intel.com>
References: <cover.1325608510.git.sgw@linux.intel.com>
	<5ddaf71a4148625744ed202bfb80c99583bae056.1325608510.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325609233.28005.4.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Rename references from POKY_*_INSTALL to COREIMAGE_*_INSTALL
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
X-List-Received-Date: Tue, 03 Jan 2012 16:54:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 08:40 -0800, Saul Wold wrote:
> The names POKY_BASE_INSTALL and POKY_EXTRA_INSTALL have been renamed to
> COREIMAGE_BASE_INSTALL and COREIMAGE_EXTRA_INSTALL

Actually, it seems that they haven't quite...

> -POKY_BASE_INSTALL = '\
> +COERIMAGE_BASE_INSTALL = '\
>      task-core-boot \
>      task-base-extended \
>      \
>      ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
>      \
> -    ${POKY_EXTRA_INSTALL} \
> +    ${COERIMAGE_EXTRA_INSTALL} \

[...]

But:

> IMAGE_INSTALL = "\
>-    ${POKY_BASE_INSTALL} \
>+    ${COREIMAGE_BASE_INSTALL} \
>     task-core-basic \

Does that patch actually work for you?

p.




