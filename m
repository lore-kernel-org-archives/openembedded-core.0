Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Rs6FS-0001bg-8b
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 06:27:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 21:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="104421125"
Received: from unknown (HELO [10.255.14.174]) ([10.255.14.174])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2012 21:19:23 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1so+zagwZL5e4cSLu9XPaPDng4X9UnzSBVggnz656y3amA@mail.gmail.com>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
	<d7e2e04d416b8ea8339b1bcc40af3043feb908b7.1327638861.git.raj.khem@gmail.com>
	<4F275CE2.4090801@linux.intel.com>
	<CAMKF1so+zagwZL5e4cSLu9XPaPDng4X9UnzSBVggnz656y3amA@mail.gmail.com>
Date: Mon, 30 Jan 2012 23:18:11 -0600
Message-ID: <1327987091.24970.38.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 2/5] task-core-tools: Divide it into 3 recipes
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
X-List-Received-Date: Tue, 31 Jan 2012 05:27:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-30 at 20:19 -0800, Khem Raj wrote:
> On Mon, Jan 30, 2012 at 7:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > This patch is going to require some coordination with meta-yocto and
> > possibly other layers that currently have .bbappends on the task-core-tools.
> >
> > It may be as simple as moving the dependency into this new -profile.bb task
> > file.
> >
> > I am going to hold this one for now.
> 
> Are there other layers than meta-intel and meta-yocto that needs it.
> Please speak up. Can I request meta-yocto and meta-intel maintainers to please
> coordinate fixing the respective layers. Fix is that if you have been appending

I've created a meta-intel branch ready to be pulled in when this is:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/log/?h=tzanussi/task-core-tools-rename

Tom



