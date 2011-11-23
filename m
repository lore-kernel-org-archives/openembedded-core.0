Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RT9vM-00081o-M1
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 11:19:28 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RT9p5-0007uA-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 11:12:59 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 10:12:58 +0000
In-Reply-To: <4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
References: <cover.1322027494.git.nitin.a.kamble@intel.com>
	<4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322043179.29435.307.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Wed, 23 Nov 2011 10:19:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 21:55 -0800, nitin.a.kamble@intel.com wrote:
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> index 66349e6..10c3b9d 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -14,3 +14,7 @@ ARM_INSTRUCTION_SET = "arm"
>  acpaths = ""
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OECONF += " --enable-cxx=detect"
> +
> +LEAD_SONAME = "libgmp.so"

I think it would be better to put the C++ libraries in a separate
package, otherwise you will waste on-target space for the people who
don't need them (which, presumably, is everyone who was using gmp prior
to your patch).  LEAD_SONAME is almost never a good thing to use.

p.




