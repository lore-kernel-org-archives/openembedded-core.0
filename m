Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TlMOS-0004jZ-1g
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:21:16 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TlMAE-0007oP-KA; Wed, 19 Dec 2012 17:06:34 +0100
From: Phil Blundell <philb@gnu.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Wed, 19 Dec 2012 16:06:31 +0000
In-Reply-To: <1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
References: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
	<1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1355933194.24487.159.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gtk-immodules-cache.bbclass: allow for offline cache generation
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
X-List-Received-Date: Wed, 19 Dec 2012 16:21:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-19 at 18:02 +0200, Laurentiu Palcu wrote:
> +EMULATOR=qemu-$(echo ${TARGET_ARCH}| \
> +    sed -e 's/i[3-6]86/i386/' -e 's/x86[_-]64/x86_64/' \
> +        -e 's/powerpc/ppc/')

Maybe you could use ${@qemu_target_binary()} for that.

p.




