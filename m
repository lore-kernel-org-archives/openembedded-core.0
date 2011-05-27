Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPyjr-0000ND-HN for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:14:11 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPygu-00067V-Nf; Fri, 27 May 2011 17:11:09 +0200
From: Phil Blundell <pb@pbcl.net>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDFBE03.9060603@linux.intel.com>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<1306407015.2525.311.camel@phil-desktop>	<1306420679.27470.186.camel@rex>
	<1306426688.2525.377.camel@phil-desktop>
	<4DDE9206.7020007@linux.intel.com>
	<1306505097.2525.457.camel@phil-desktop>
	<4DDFBE03.9060603@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 16:11:01 +0100
Message-ID: <1306509061.2525.464.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Fri, 27 May 2011 15:14:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 08:06 -0700, Darren Hart wrote:
> In fact... why are the parens used at all?

No good reason.  I would guess that we started off with something like

COMPATIBLE_MACHINE = "pdp11/(23|34)"

in a recipe, and that got somehow generalised to wrapping all the
alternatives in parens even where not required.  I imagine most/all of
those parens can just be removed.

> All this said, do you have any objection to using UBOOT_MACHINE in the
> machine.conf with the anon python check for it in the inc file? I think
> you said not, but I want to be sure.

No objection, I'm quite happy with the UBOOT_MACHINE thing here.

p.




