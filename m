Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rq0UJ-0002Od-Mg
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 11:54:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2012 02:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110563478"
Received: from unknown (HELO helios.localnet) ([10.252.122.219])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2012 02:20:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 10:20:24 +0000
Message-ID: <6813503.3IHFcKk1Mm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <CAMKF1spYemYppOw6u1AOUZa5jceFygYPnoEUFo6fM=UZmhZs9Q@mail.gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
	<4F1F55F6.3080608@linux.intel.com>
	<CAMKF1spYemYppOw6u1AOUZa5jceFygYPnoEUFo6fM=UZmhZs9Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] task-core-tools: Divide it into 3 recipes
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
X-List-Received-Date: Wed, 25 Jan 2012 10:54:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 January 2012 17:26:42 Khem Raj wrote:
> On Tue, Jan 24, 2012 at 5:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 01/24/2012 09:42 AM, Khem Raj wrote:
> >> task-core-tools-debug, task-core-tools-profile, task-core-tools-testapps
> >> otherwise if we choose one through PACKAGE_GROUPS all packages
> >> are built since they are in same recipe.
> >> 
> >> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >> ---
> >>  .../conf/distro/include/distro_tracking_fields.inc |   26 +++++--
> >>  meta/conf/multilib.conf                            |    4 +-
> >>  meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 ++++++
> >>  ...sk-core-tools.bb =>  task-core-tools-profile.bb} |   81
> >> ++++++--------------
> >>  .../recipes-core/tasks/task-core-tools-testapps.bb |   46 +++++++++++
> >>  5 files changed, 119 insertions(+), 64 deletions(-)
> >>  create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
> >>  rename meta/recipes-core/tasks/{task-core-tools.bb =>
> >>  task-core-tools-profile.bb} (48%)
> > 
> > This breaks meta-yocto which has a task-core-tools.bbappend
> 
> that bbappend is redundant. You should just delete it anyway from meta-yocto

Amusingly I was thinking "who the heck put that in there?" and, wouldn't you 
know it, it turned out to be me... I think at the time I was concerned only 
with moving pieces out of OE-Core that were hardware-specific without making 
any judgements about whether they were worthwhile or not.

I'd have to defer to someone who knows more about these tools, but if the 
concern is that systemtap and lttng-ust might not be suitable for all 
machines, we could simply use RRECOMMENDS in OE-Core and then set 
COMPATIBLE_MACHINE for them in BSPs.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


