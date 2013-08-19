Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 317896AFCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 16:09:49 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VBS1d-00020u-6O; Mon, 19 Aug 2013 18:09:49 +0200
Message-ID: <1376928588.17787.64.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Simon Busch <morphis@gravedo.de>
Date: Mon, 19 Aug 2013 17:09:48 +0100
In-Reply-To: <1376928263-9092-1-git-send-email-morphis@gravedo.de>
References: <1376928263-9092-1-git-send-email-morphis@gravedo.de>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: add PACKAGECONFIG_DISTRO variable for distro specific options
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
X-List-Received-Date: Mon, 19 Aug 2013 16:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-08-19 at 18:04 +0200, Simon Busch wrote:
> In some cases as distribution just wants to extend the default PACKAGECONFIG instead of
> rewriting it completely. Therefor having a PACKAGECONFIG_DISTRO variable which is empty
> by default and included in PACKAGECONFIG helps a lot.

Can't those distros just use PACKAGECONFIG_append?

p.



