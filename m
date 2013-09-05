Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 34CF16C6C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:24:55 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VHZYM-00023I-Uu; Thu, 05 Sep 2013 15:24:55 +0200
Message-ID: <1378387494.6940.90.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 05 Sep 2013 14:24:54 +0100
In-Reply-To: <20130905131422.GD17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<3518999.x3yV6XY4Eo@helios>
	<1378384174.6940.86.camel@phil-desktop.brightsign>
	<3397753.WTGSduA6kl@helios> <20130905131422.GD17481@lpalcu-linux>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 13:24:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 16:14 +0300, Laurentiu Palcu wrote:
> Before the rework, the metadata (for opkg at least) was deleted no
> matter what during rootfs generation. So, there's no way this case (no
> 'package-management' in IMAGE_FEATURES and opkg installed) worked
> recently.
> 
> Anyway, do we have a better idea? The solution Phil suggested, is not
> quite ok... We'll end up with useless metadata if no PM is installed and
> delayed postinstalls are present or, the other case, have the PM
> installed with no metadata if the PM is installed but we have no delayed
> postinstalls...

What is it that actually causes run-postinsts to fail when opkg is
installed?  I guess that's the bit that I'm not understanding at the
moment.  As far as I can tell from a quick inspection of run-postinsts
itself, it ought to be unperturbed by opkg's presence and no harm ought
to result.

p.



