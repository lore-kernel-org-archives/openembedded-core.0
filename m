Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RE6Pl-00065K-JD
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 23:32:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RE6KG-0001yk-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 23:26:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9e0189cadfc1211c918dac076619f71ec3e4d19a.1318405370.git.Martin.Jansa@gmail.com>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<9e0189cadfc1211c918dac076619f71ec3e4d19a.1318405370.git.Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2011 22:26:50 +0100
Message-ID: <1318454810.3052.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [oe-core 3/4] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Wed, 12 Oct 2011 21:32:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 09:45 +0200, Martin Jansa wrote:
>-TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
<-TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
> +AVAILTUNES += "armv6 armv6t"
> +TUNE_FEATURES_tune-armv6 ?= "armv6"
> +TUNE_FEATURES_tune-armv6t ?= "armv6 thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv6"
> +PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv6 armv6t"
> +
> +# Little Endian +  VFP
> +AVAILTUNES += "armv6-vfp armv6t-vfp armv6hf-vfp armv6thf-vfp"
> +TUNE_FEATURES_tune-armv6-vfp ?= "armv6 vfp"

This patch doesn't seem to do what it says in the subject line.  It
doesn't add an "armv6-novfp" tune, instead it removes vfp from the
existing armv6 and armv6t tunes.

p.




