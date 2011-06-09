Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUhDU-0002XU-6s for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:32:16 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUhAI-00084D-Po
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:28:58 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 16:28:55 +0100
Message-ID: <1307633335.2529.4947.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 15:32:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 17:15 +0200, Koen Kooi wrote:
> meta-intel:
>   /OE/tentacle/sources/meta-intel/meta-sugarbay/../common/recipes-core/initrdscripts/initramfs-live-install_1.0.bbappend
>   /OE/tentacle/sources/meta-intel/meta-crownbay/../common/recipes-core/initrdscripts/initramfs-live-install_1.0.bbappend
>   /OE/tentacle/sources/meta-intel/meta-jasperforest/../common/recipes-core/initrdscripts/initramfs-live-install_1.0.bbappend
>   /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_git.bbappend
>   /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_git.bbappend

Most/all of the recipes that you mentioned do exist in oe-core but have
restrictive COMPATIBLE_MACHINE definitions.  I wonder if that's what is
causing your problem.

p.



