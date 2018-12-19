Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id A41E37BDC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:08:09 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id ZcVwgsaw4iZjyZcVxg9NAV; Wed, 19 Dec 2018 14:08:02 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=QeFIQPTv c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=2ur7OfE09M0A:10 a=QyXUC8HyAAAA:8 a=iGHA9ds3AAAA:8
	a=Q4-j1AaZAAAA:8 a=3SjlPiS_qf7tiJdw-xwA:9 a=CjuIK1q_8ugA:10
	a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gZcVw-0000de-Kd; Wed, 19 Dec 2018 14:07:56 +0000
Date: Wed, 19 Dec 2018 14:07:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <20181219140756.krnjfebehdbrpsyt@mcrowe.com>
References: <46DEAC02-3743-4A88-A5EA-52C671A19E1A@linux.intel.com>
	<87ftvv69fg.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <87ftvv69fg.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfCcpm17ZTWAiqc9cWMrAHjOJfmdgCmh9iDQ4L8ec35pkNFozKKwO5JfZtjQopA11p0YgvKsu9pedtbSb+JnKUy9tSSK+YdmVOyE3WjuSO6BhjkSaFtwF
	UOfnQD+2imavw+a5rHT+FeLfgbSCaEi5H/M=
Subject: Re: [sumo] cherry-pick request to fix bison on glibc 2.28
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
X-List-Received-Date: Wed, 19 Dec 2018 14:08:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 20 November 2018 at 16:44:03 +0100, Raphael Kubo da Costa wrote:
> Tim Orling <timothy.t.orling@linux.intel.com> writes:
> 
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5e441f3f8aa896e264f44ba8b699e5841cceade4
> >
> > or
> >
> > http://git.openembedded.org/openembedded-core/commit/?id=741415c58b3565764000028c26efd081212eb989l
> 
> +Armin
> 
> I was going to send a patch with the backport but noticed this email.
> Would you still prefer a patch anyway?

I was just digging up the original post to reply to request the same
backport when I came across this request from nearly a month ago. The
backport is also required for Debian Buster but doesn't appear to be
present in sumo.

741415c58b3565764000028c26efd081212eb989 cherry-picks cleanly and works for
me.

Thanks.

Mike.

