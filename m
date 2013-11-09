Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0632B6D13F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 21:55:13 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VfGUr-0004tJ-Bt; Sat, 09 Nov 2013 22:55:13 +0100
Message-ID: <1384037660.3798.42.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Sat, 09 Nov 2013 22:54:20 +0000
In-Reply-To: <5bcdd19de289a55e7cc28a1d0d4f09ea6ec4be41.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<5bcdd19de289a55e7cc28a1d0d4f09ea6ec4be41.1383974819.git.Qi.Chen@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
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
	Content preview:  On Sat, 2013-11-09 at 13:28 +0800,
	Qi.Chen@windriver.com wrote:
	> + install -d ${D}${base_bindir} > + mv ${D}${bindir}/udevadm
	${D}${base_bindir}/udevadm
	> + rmdir ${D}${bindir} This will fail if ${bindir} and ${base_bindir}
	are the same. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] udev: fix dependency and location of udevadm
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
X-List-Received-Date: Sat, 09 Nov 2013 21:55:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
> +	install -d ${D}${base_bindir}
> +	mv ${D}${bindir}/udevadm ${D}${base_bindir}/udevadm
> +	rmdir ${D}${bindir}

This will fail if ${bindir} and ${base_bindir} are the same.

p.



