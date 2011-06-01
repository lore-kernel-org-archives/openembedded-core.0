Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRizf-0000bO-IB for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 12:49:43 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QRiwd-0001Xr-Bt; Wed, 01 Jun 2011 12:46:35 +0200
From: Phil Blundell <pb@pbcl.net>
To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE5DA86.7040808@gmail.com>
References: <4DE5CDA3.1020000@linux.intel.com> <4DE5D4AC.4090805@gmail.com>
	<20110601061050.GA3281@jama.jama.net>  <4DE5DA86.7040808@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 11:46:34 +0100
Message-ID: <1306925194.2529.38.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
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
X-List-Received-Date: Wed, 01 Jun 2011 10:49:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 23:21 -0700, Khem Raj wrote:
> On 05/31/2011 11:10 PM, Martin Jansa wrote:
> > On Tue, May 31, 2011 at 10:57:00PM -0700, Khem Raj wrote:
> >> On 05/31/2011 10:26 PM, Saul Wold wrote:
> >>> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
> >>> error: output number 1 not directly addressable
> >>
> >> this is a coding error you can fix the source code I guess instead of
> >> pessimising the whole package
> > 
> > FWIW: I haven't seen it in my armv7-a builds (nokia900), but I'm using
> > gcc-4.6 from meta-oe.
>
> this is because gcc 4.6 in meta-oe has fix for it its this patch here
> http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html

I'm a bit confused by this.  In the first quote above you said that this
was a coding error and ought to be fixed in qt, but now you seem to be
saying that it's a compiler bug and should be fixed in gcc.  If it's the
latter, can we get that patch applied to the oe-core version of gcc?

Either way, I agree, working around this by just frobbing the
architecture options seems like a bad idea.

p.




