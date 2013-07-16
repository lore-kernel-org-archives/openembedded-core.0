Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB5C6B218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:55:11 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uz6el-0007JM-Il; Tue, 16 Jul 2013 16:55:11 +0200
Message-ID: <1373986510.2651.87.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Date: Tue, 16 Jul 2013 15:55:10 +0100
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
References: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
	<1373985229.2651.84.camel@phil-desktop.brightsign>
	<969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 16 Jul 2013 14:55:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-16 at 14:36 +0000, Iorga, Cristian wrote:
> " why having it be so is not a very good thing."
> 
> Sorry, I did not understood this part.
> 
> Judging by my investigation, is RREPLACES needed or not?

I don't believe there is any justification for making bluez4 Replace:
bluez5.

I think you could possibly make an argument that having bluez5 Replace:
bluez4 might be a good thing, although given the way opkg behaves with
them I'm not entirely convinced.  Personally I would say that there
should be no replacing here.

p.



