Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3rz2-0005F8-7Y
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:06:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 09:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="17070567"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 09:01:32 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpsEx=05bVBVYvxLhuDfb=14gdZ2KaERrWCkHQYQOfHpQ@mail.gmail.com>
References: <1315978760.26879.1858.camel@elmorro>
	<CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
	<1316015141.26879.2469.camel@elmorro>
	<CAP9ODKpsEx=05bVBVYvxLhuDfb=14gdZ2KaERrWCkHQYQOfHpQ@mail.gmail.com>
Date: Wed, 14 Sep 2011 11:01:15 -0500
Message-ID: <1316016075.26879.2487.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 16:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 08:55 -0700, Otavio Salvador wrote:
> On Wed, Sep 14, 2011 at 12:45, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > On Wed, 2011-09-14 at 05:30 -0700, Otavio Salvador wrote:
> >> On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote:
> >> /> A future patch will factor out the common parts of init_install_2.0.sh
> >> > with init_install 1.0 - this initial patchset essentially just fixes
> >> > what's necessary for YOCTO bug #1428 in order to get things working again.
> >>
> >> Wouldn't be better to drop 1.0 completely?
> >>
> >
> > You're right, and the original did do that essentially - on second
> > thought it was much simpler - I'll resubmit something like that...
> 
> I prefer to have 1.0 dropped since it avoids duplicated maintainence
> work and support. Besides, since this is gonna be a base of newer
> Yocto we ought to ensure that the layers do get their bsp updated
> (even thought I think the only user of it is meta-intel at this
> moment).
> 

Well, my new version handles both grub 0.97 and grub2.  We need to keep
grub 0.97 around because grub2 is GPLv3.

Tom

> Nice that you agree with it.
> 




