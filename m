Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3rk7-0004eT-Vt
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 17:51:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2011 08:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48390069"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2011 08:45:49 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
References: <1315978760.26879.1858.camel@elmorro>
	<CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
Date: Wed, 14 Sep 2011 10:45:41 -0500
Message-ID: <1316015141.26879.2469.camel@elmorro>
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
X-List-Received-Date: Wed, 14 Sep 2011 15:51:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 05:30 -0700, Otavio Salvador wrote:
> On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote:
> /> A future patch will factor out the common parts of init_install_2.0.sh
> > with init_install 1.0 - this initial patchset essentially just fixes
> > what's necessary for YOCTO bug #1428 in order to get things working again.
> 
> Wouldn't be better to drop 1.0 completely?
> 

You're right, and the original did do that essentially - on second
thought it was much simpler - I'll resubmit something like that...

Thanks,

Tom



