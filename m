Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5bj-00042G-AQ for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:09:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O9ucQq027414;
	Mon, 24 Sep 2012 10:56:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24783-09; Mon, 24 Sep 2012 10:56:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O9uR5X027408
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 10:56:28 +0100
Message-ID: <1348480587.4486.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2012 10:56:27 +0100
In-Reply-To: <CAJTo0Lbi+KEu1=857m0v5xX0geWHA4pDuQqHgALyMt2rPLD8XQ@mail.gmail.com>
References: <1348436710.4444.247.camel@x121e.pbcl.net>
	<1540243.ihgQ8YivHP@helios> <505F99C3.1030409@balister.org>
	<CAJTo0Lbi+KEu1=857m0v5xX0geWHA4pDuQqHgALyMt2rPLD8XQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] kernel.bbclass: Allow modules.tar.gz generation to be inhibited
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 10:09:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 09:36 +0100, Burton, Ross wrote:
> On 24 September 2012 00:22, Philip Balister <philip@balister.org> wrote:
> >>> Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.
> >>
> >> I'm wondering, does anyone still find this file useful?
> >
> > I've used it to put modules in rootfs when there is a new kernel version and
> > I do not have easy access to packages feeds. This speeds testing.
> 
> Sounds like a less than common use-case.  How about setting it to 0 by default?

I know I used to use this file a lot when working on Zaurus kernels.
These days I don't get to play with hardware as much as I'd like so I've
not used it in a while.

It is extremely useful when you need it. I've always argued there are
much more problematic time sinks in the build than this tarball
creation...

Cheers,

Richard



