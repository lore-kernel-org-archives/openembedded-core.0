Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 051336EB26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 14:44:33 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WDb3A-0008IW-Qe; Wed, 12 Feb 2014 15:44:33 +0100
Message-ID: <1392216272.14769.270.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Wed, 12 Feb 2014 14:44:32 +0000
In-Reply-To: <f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
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
	Content preview:  On Wed, 2014-02-12 at 16:33 +0200,
	Laurentiu Palcu wrote:
	> diff --git a/meta/classes/rootfs_ipk.bbclass
	b/meta/classes/rootfs_ipk.bbclass
	> index 6d4f9fa..1887dd3 100644 > --- a/meta/classes/rootfs_ipk.bbclass
	> +++ b/meta/classes/rootfs_ipk.bbclass > @@ -21, 7 +21,
	7 @@ OPKG_POSTPROCESS_COMMANDS
	= "" > > OPKGLIBDIR = "${localstatedir}/lib" > > -MULTILIBRE_ALLOW_REP
	= "${OPKGLIBDIR}/opkg" > +MULTILIBRE_ALLOW_REP =
	"${OPKGLIBDIR}/opkg|/usr/lib/opkg" [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Wed, 12 Feb 2014 14:44:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 16:33 +0200, Laurentiu Palcu wrote:
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 6d4f9fa..1887dd3 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -21,7 +21,7 @@ OPKG_POSTPROCESS_COMMANDS = ""
>  
>  OPKGLIBDIR = "${localstatedir}/lib"
>  
> -MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg"
> +MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"

Why is that change needed?  Doesn't this imply that ${OPKGLIBDIR} is
wrong?

p.



