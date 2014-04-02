Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7D06F896
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 15:52:55 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WVNTD-0007Ie-9H; Wed, 02 Apr 2014 17:52:55 +0200
Message-ID: <1396453974.5879.121.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Date: Wed, 02 Apr 2014 16:52:54 +0100
In-Reply-To: <1396451750-10888-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1396451750-10888-1-git-send-email-Matthieu.Crapet@ingenico.com>
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
	Content preview:  On Wed, 2014-04-02 at 17:15 +0200,
	Matthieu Crapet wrote:
	> +USE_DEVFS[doc] = "When building images,
	specifies to populate or not ${sysconfdir}.
	This variable defaults to '0' (leave directory empty,
	surely because devtmpfs
	do the job). Set it to '1' to use makedevs (or consider using a custom
	file with IMAGE_DEVICE_TABLES)." [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs.py: introduce USE_DEVFS check
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
X-List-Received-Date: Wed, 02 Apr 2014 15:52:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-02 at 17:15 +0200, Matthieu Crapet wrote:
> +USE_DEVFS[doc] = "When building images, specifies to populate or not ${sysconfdir}. This variable defaults to '0' (leave directory empty, surely because devtmpfs do the job). Set it to '1' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."

That's backwards, isn't it?

p.



