Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiTt6-0004Yf-CD for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:40:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GX5Qn021201;
	Wed, 4 Jan 2012 16:33:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20732-08; Wed,  4 Jan 2012 16:32:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GWn4j021137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 16:32:50 GMT
Message-ID: <1325694769.20759.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:32:49 +0000
In-Reply-To: <4F047D08.6040900@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<4F039FA4.6000709@linux.intel.com> <4F047D08.6040900@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: koen@dominion.thruhere.net, martin.jansa@gmail.com
Subject: Re: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 04 Jan 2012 16:40:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 08:23 -0800, Darren Hart wrote:
> 
> On 01/03/2012 04:39 PM, Saul Wold wrote:
> > On 12/28/2011 03:38 PM, Darren Hart wrote:
> >> In preparation for defining a poky-tiny distribution for meta-yocto, I found
> >> I needed the following patches. They mostly enable finer grained configuration
> >> of dependencies and allow for building without widechar support.
> >>
> >>
> >> The linux-yocVto-tiny recipe isn't poky-tiny specific and could be of use to
> >> others, so I opted to keep it with the other linux-yocto recipes. It is a
> >> placeholder until the linux-yocto_3.2 recipes are ready for oe-core. At that
> >> time, linux-yocto-tiny will drop all config fragments in favor of the
> >> to-be-in-tree versions and make use of a new yocto/standard/tiny/base branch.
> >> For now, this recipe allows us to build a reasonably small kernel with fewer
> >> dependencies.
> >>
> >> Thanks,
> >>
> >> Darren
> >>
> >>
> >> The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
> >>
> >>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
> >>
> >> are available in the git repository at:
> >>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/tiny
> >>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/tiny
> >>
> >> Darren Hart (3):
> >>    eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
> > This patch was not taken at this time due to the comment on the Mailing List
> > 
> >>    linux-yocto-tiny: New kernel recipe for tiny distros
> >>    task-core-boot: Allow DISTRO to disable keymaps via VIRTUAL-RUNTIME_keymaps
> > These two were merged into OE-Core
> > 
> > 
> >>
> > 
> >> Richard Purdie (1):
> >>    native.bbclass: Fix variable remapping coverage
> >>
> > Richard rejected his own patch as being too much of WIP.
> > 
> 
> OK, just so everyone understands, poky-tiny (merged to meta-yocto) will
> not build until we come up with alternatives to the two patches above.

I rejected my own patch as it results in other build failures. I'm
working on addressing that but fixing one thing properly is breaking
other things and its a mess with changes like:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/useradd5&id=3177faee7859f416da72d7d49ae05db5356fbdbd

The first patch is a harder problem, I'm still trying to find something
better way to address it. I did wonder if we could just disable nls
entirely for tiny...

Cheers,

Richard



