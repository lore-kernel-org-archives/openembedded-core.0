Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNVQE-0001N4-2o
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 21:04:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 11:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71956050"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2011 11:57:43 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4EB83144.70600@linux.intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
	<4EB83144.70600@linux.intel.com>
Date: Mon, 07 Nov 2011 13:58:19 -0600
Message-ID: <1320695899.2605.24.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add some intel-specific tune files, and related fixes
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
X-List-Received-Date: Mon, 07 Nov 2011 20:04:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 11:28 -0800, Saul Wold wrote:
> On 11/07/2011 07:53 AM, tom.zanussi@intel.com wrote:
> > From: Tom Zanussi<tom.zanussi@intel.com>
> >
> > This patchset adds some new tune files for corei7, ivb, and atom.
> >
> Tom,
> 
> Where is the repo containing this patch set?  Are you using the 
> create_pull_request script, which generates the formatted message which 
> includes the repo from which to pull this patchset?
> 

I didn't push this patchset to a contrib repo, just posted them as
patches.  Not ok?

Tom  

> Thanks
> 	Sau!
> 
> > The corei7 and atom were build- and boot-tested on sugarbay (with
> > corei7-avx), jasperforest (corei7), crownbay, fri2, fishriver (atom).
> > The ivb is one I'll be using for new Ivy Bridge development and
> > hasn't been tested yet, but will be needed for that.
> >
> > This patchset also contains a few patches for packages that had build
> > problems with the corei7-avx tuning.  The python and gmp packages had
> > problems because they tried to execute target code on the host and caused
> > illegal instruction errors.  The libzypp failed compilation because of
> > the hyphens in the tune name (corei7-avx).
> >
> > Tom Zanussi (6):
> >    tune-corei7: Add tune file for Intel Core i7 machines
> >    tune-ivb: Add tune file for Intel Ivy Bridge machines
> >    machine/include/tune-atom.inc: add atom-specific settings
> >    gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
> >    libzypp: fix mishandling of hyphenated arches
> >    python: skip setup.py
> >
> >   meta/conf/machine/include/tune-atom.inc            |   26 +++++++++++++++++-
> >   meta/conf/machine/include/tune-corei7.inc          |   17 ++++++++++++
> >   meta/conf/machine/include/tune-ivb.inc             |   11 ++++++++
> >   .../python/setup_py_skip_cross_import_check.patch  |   27 ++++++++++++++++++++
> >   meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++++-
> >   meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +++---
> >   meta/recipes-support/gmp/gmp_5.0.2.bb              |    3 +-
> >   7 files changed, 91 insertions(+), 8 deletions(-)
> >   create mode 100644 meta/conf/machine/include/tune-corei7.inc
> >   create mode 100644 meta/conf/machine/include/tune-ivb.inc
> >   create mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >




