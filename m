Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CA8B26110E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 20:33:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IKlfbd024214; Wed, 18 Sep 2013 21:47:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U1XcJgfK7XIP; Wed, 18 Sep 2013 21:47:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IKlcPZ024205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 18 Sep 2013 21:47:39 +0100
Message-ID: <1379536390.18603.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 21:33:10 +0100
In-Reply-To: <CANyK_8fotVWZMkFO5kMJ_GFjGT2O79TsOWrCQV5Xez+rgdKbMg@mail.gmail.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
	<CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
	<1379522909.18603.52.camel@ted>
	<CANyK_8fotVWZMkFO5kMJ_GFjGT2O79TsOWrCQV5Xez+rgdKbMg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 20:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-18 at 18:24 +0100, Paul Barker wrote:
> On 18 September 2013 17:48, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> I'd rather have opkg and opkg-utils merged together or next to each
> other on the same server if/when I move opkg to git. I think
> OpenEmbedded/Yocto is probably the main user of opkg but there are
> others and they'd also benefit from opkg-utils, so having everything
> in one place would make them easier to find.
> 
> My personal preference would be to move opkg and opkg-utils to
> Bitbucket/Github/similar, probably merged together, with at least one
> of the core developers from the Yocto Project having admin access to
> the repositories so that the bus factor is greater than 1.

FWIW, personally I dislike some of those services as they can be
temperamental and with some of them, I can't actually get a view of the
code in the repos as well as when I'm used to with cgit. I know others
have different preferences, its just life...

>  I know I
> could probably ask for opkg to be hosted on git.yoctoproject.org but I
> think that would make non-Yocto Project users feel a little bit too
> much like second-class citizens.

The Yocto Project is there to be an umbrella for projects serving the
needs of embedded users. Pseudo is an example of something which can be
used standalone, yet it is hosted on the YP servers.

I'd say that opkg would fit under the umbrella and that we'd be more
than happy to host the repo if that was appropriate so the offer is
there. 

Having more varied projects in the umbrella would actually help people
understand what the Yocto Project is verses OpenEmbedded (the build
system/architecture) and Poky (reference distro). We already have others
like eglibc in there but that should be merging back with glibc,
thankfully! :)

> I want to avoid flag days where possible, at least one will be needed
> for the libopkg API but hopefully not for the command line interface
> or package format.

The API has the .so version and can be managed. The package format  in
particular need most careful attention.

>  I am planning on proposing that opkg explicitly
> follow semantic versioning (http://semver.org/) and I think a stable,
> sane API is important regardless of whether opkg-utils is separate or
> not.

Agreed.

Cheers,

Richard




