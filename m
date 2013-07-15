Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 405C961642
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 16:31:36 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UylgW-0006YA-Kn; Mon, 15 Jul 2013 18:31:36 +0200
Message-ID: <1373905894.2651.41.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 17:31:34 +0100
In-Reply-To: <CAJTo0LYHNwSaBE+mHq=YzUvwq9JywXQ7ii=xXeopL_CmWh6qaA@mail.gmail.com>
References: <1373895869-25256-1-git-send-email-cristian.iorga@intel.com>
	<1373895869-25256-2-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LYHNwSaBE+mHq=YzUvwq9JywXQ7ii=xXeopL_CmWh6qaA@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] bluez5: new package for v5.7
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
X-List-Received-Date: Mon, 15 Jul 2013 16:31:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-15 at 15:55 +0100, Burton, Ross wrote:
> On 15 July 2013 14:44, Cristian Iorga <cristian.iorga@intel.com> wrote:
> > +PACKAGECONFIG ??= "\
> > +    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> > +"
> > +PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
> 
> Just noticed this "pie" thing.  There is no defined "pie"
> DISTRO_FEATURE.  PIE is generally a good thing, so just enable this.

Didn't Saul have some patches to enable/disable PIE globally through
an .inc file of some sort?  I'm not sure that having random recipes
turning it on haphazardly is all that desirable.

But I agree that having a DISTRO_FEATURE for it that only bluez respects
is probably not all that sensible a plan.

p.



