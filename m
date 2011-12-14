Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RarS7-0004Rp-0K
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 17:13:07 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RarLQ-0002us-C2
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 17:06:12 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2011 16:06:10 +0000
In-Reply-To: <38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
	<38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323878772.24417.183.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Wed, 14 Dec 2011 16:13:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 11:34 -0800, Beth Flanagan wrote:
> diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
> index c78dbaa..f198692 100644
> --- a/meta/recipes-extended/less/less_444.bb
> +++ b/meta/recipes-extended/less/less_444.bb
> @@ -7,11 +7,14 @@ SECTION = "console/utils"
>  
>  # (GPLv2+ (<< 418), GPLv3+ (>= 418)) | less
>  # less is a 2-clause BSD-like permissive license
> -LICENSE = "GPLv3+ | less"
> +# Reading LICENSE and COPYING indicate that GPL-3+ is suffient.
> +# openSuse .spec and Debian seem to agree here. setting to GPL-3+
> +
> +LICENSE = "GPLv3+"

This change is rather misleading.  The point of the "Less
License" (effectively 2-clause BSD) option given by the README is that
it provides a non-GPLv3 route for distributing the binaries -- i.e.
makes the package usable by people who can't tolerate GPLv3 for whatever
reason.  If the recipe is marked as simply GPLv3+ then it will appear
unusable to those folks.

If we have to pick just a single license for less then it seems that the
BSD one would be a better choice than GPLv3+.

p.




