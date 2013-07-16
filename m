Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 454E46B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:33:50 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uz6K6-0007IM-ID; Tue, 16 Jul 2013 16:33:50 +0200
Message-ID: <1373985229.2651.84.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Tue, 16 Jul 2013 15:33:49 +0100
In-Reply-To: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
References: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 14:33:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-16 at 17:28 +0300, Cristian Iorga wrote:
> Observe my investigation below in order to decide if RREPLACES is needed.
> Conclusion: BlueZ 5.x will be eventually an upgrade path for an already installed
> embedded device. As such, RREPLACES is needed for a system-wide upgrade.

It wasn't very obvious to me that these results make a compelling case
for bluez4 needing to RREPLACE bluez5.  Indeed, this section:

root@qemux86:~# opkg install bluez5
Multiple replacers for bluez5, using first one (bluez4).
Package bluez4 is already installed on root.
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0

... seems to illustrate (modulo the usual amount of opkg craziness) why
having it be so is not a very good thing.

p.



