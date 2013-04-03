Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNPot-0003KW-Ox for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:41:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r33FZ6L4021256; Wed, 3 Apr 2013 16:35:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y7bTinMfmMTH; Wed,  3 Apr 2013 16:35:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r33FYxwe021225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 3 Apr 2013 16:35:01 +0100
Message-ID: <1365002659.6526.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Wed, 03 Apr 2013 16:24:19 +0100
In-Reply-To: <CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Wed, 03 Apr 2013 15:42:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-03 at 16:51 +0200, Samuel Stirtzel wrote:
> 2013/4/3 Burton, Ross <ross.burton@intel.com>:
> > Hi,
> >
> > On 2 April 2013 15:15, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> >>>>> For xserver-nodm-init we would then have something like:
> >>>>> inherit update-alternatives
> >>>>> ALTERNATIVE_${PN} = "systemd-def-target"
> >>>>> ALTERNATIVE_TARGET[systemd-def-target] =
> >>>>> "${systemd_unitdir}/system/graphical.target"
> >>>>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
> >>>>> "${systemd_unitdir}/system/default.target"
> >>>>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
> >>>>>
> >>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> >
> > This really needs to be a series of two patches, with this change
> > implemented too.
> >
> >> To comment on this change:
> >> A developer would expect that a system (hardware or software) behaves
> >> in a specific matter (the default behavior).
> >> By changing the default, the system behavior is undefined (as the
> >> default behavior was changed).
> >
> > The behaviour is not undefined, it's perfectly clear - the default
> > target is multi-user unless changed, and by patching the X startup
> > recipes in oe-core and meta-oe we handle the majority of cases.
> 
> When we decide that we handle standard behavior different than the
> rest of the world, then this patch is basically a fork of systemd.

No, we're not forking systemd, we're talking about configuration. 

This is like saying that booting your Linux desktop at a different
runlevel is forking Linux.

> Also we tell every affected software developer:
> "No your software won't work with OE-core / Yocto Project without
> adaption, we are incompatible with the systemd standard to make life
> more comfortable for (some of) us"

We're saying that graphical init scripts need to somehow tell the system
they're a graphical init script. There are only a small number of these
out there and adding some identification to them whilst an annoyance,
isn't a big issue.

Integrating new technology like systemd into older systems is hard. You
sometimes need to add new information to allow the system to work
properly. This is once such case.

Cheers,

Richard






