Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RBY0t-0008VR-79
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 22:24:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Oct 2011 13:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="60282104"
Received: from scimitar.jf.intel.com (HELO [10.7.199.177]) ([10.7.199.177])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2011 13:18:47 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Oct 2011 13:18:47 -0700
In-Reply-To: <4E8CB801.7050003@balister.org>
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org> <4E8B6D47.9000600@intel.com>
	<4E8B8C05.5050508@windriver.com> <4E8C662B.4090300@balister.org>
	<CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
	<4E8CB801.7050003@balister.org>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1317845927.10776.3.camel@scimitar>
Mime-Version: 1.0
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Wed, 05 Oct 2011 20:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 16:03 -0400, Philip Balister wrote:
> On 10/05/2011 03:35 PM, Khem Raj wrote:
> > On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister<philip@balister.org>  wrote:
> >>
> >> 1) I do not want rpm in the image. This would confuse my customer base.
> >> 2) I am tired of dropbear, I want openssh only.
> >> 3) I need the full versions of tools, not the busybox ones.
> >> 4) I am not limited to gpv2 software.
> >>
> >> Richard, it looks to me like we should add an item for the next Yocto
> >> development cycle to review how images are built and try to make the base
> >> stuff in oe-core more usable by everyone. We need to define what choices are
> >> made by distros. For example opkg, rpm, no package management in image.
> >> Images may want dropbear or openssh.
> >>
> >> Short term, I think I'll copy the tasks/images into my bsp and get some
> >> stuff together for testing. I'd like a better long term solution though.
> >
> > There always will be customizations needed. But we can strive for
> > better basic blocks
> 
> Sure. The immediate things I noticed are rpm being installed and lack of 
> a way to chose between dropbear/openssh.

Core images automatically include the correct package manager when the
image feature package-management is defined for the image.

It would be nice to define a variable/feature to control SSH server.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



