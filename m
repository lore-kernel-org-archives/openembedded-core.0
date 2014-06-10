Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8F965FDC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 11:57:10 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WuKft-0001Tu-6J; Tue, 10 Jun 2014 13:57:09 +0200
Message-ID: <1402401428.10715.132.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 10 Jun 2014 12:57:08 +0100
In-Reply-To: <1402013345-24930-2-git-send-email-sgw@linux.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
	<1402013345-24930-2-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2014-06-05 at 17:09 -0700,
	Saul Wold wrote: > These
	dependcies are needed to ensure that thier packages are created >
	correctly
	since these classes have runtime dependiences in their packages > but
	they are not actually created yet at rootfs time. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jun 2014 11:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-05 at 17:09 -0700, Saul Wold wrote:
> These dependcies are needed to ensure that thier packages are created
> correctly since these classes have runtime dependiences in their packages
> but they are not actually created yet at rootfs time.

Can you be more specific about why these
dependecies/dependcies/dependiences are required?  I can't, offhand,
think of any reason why update-rc.d requires initscripts for example.

Also, what's going on with the PACKAGESPLITFUNCS_remove_class-nativesdk?

thanks

p.

> 
> [YOCTO #6072]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 ++
>  meta/classes/useradd.bbclass     | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index 56eef4e..ca9486b 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -1,6 +1,7 @@
>  UPDATERCPN ?= "${PN}"
>  
>  DEPENDS_append = " update-rc.d-native"
> +DEPENDS_append_class-target = " initscripts"
>  UPDATERCD = "update-rc.d"
>  UPDATERCD_class-cross = ""
>  UPDATERCD_class-native = ""
> @@ -67,6 +68,7 @@ python __anonymous() {
>  }
>  
>  PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
> +PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
>  
>  populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"



