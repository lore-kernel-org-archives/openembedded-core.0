Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TfIuK-00087G-A3
	for Openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 00:25:08 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Dec 2012 15:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,202,1355126400"; d="scan'208";a="257981408"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2012 15:10:44 -0800
Message-ID: <1354489844.16206.0.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 02 Dec 2012 17:10:44 -0600
In-Reply-To: <1354198897.1530.0.camel@empanada>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
	<CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
	<1354198897.1530.0.camel@empanada>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com,
	Openembedded-core@lists.openembedded.org
Subject: Re: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Sun, 02 Dec 2012 23:25:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-29 at 08:21 -0600, Tom Zanussi wrote:
> On Thu, 2012-11-29 at 11:27 +0000, Burton, Ross wrote:
> > On 28 November 2012 20:07, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > > So does this conflict with Ross's patch, which seems simpler...
> > 
> > I do prefer my patch as the same breakage will occur for anyone else
> > using oe-core master but also building their own older X server.
> > Whilst the delta is so minimal, I don't see the problem in supporting
> > both in oe-core.
> > 
> 
> I'll second that...
> 

Did anyone test this?  I'm getting:

1558733.206] (WW) Warning, couldn't open module dri
[1558733.206] (II) UnloadModule: "dri"
[1558733.206] (EE) Failed to load module "dri" (module does not exist,
0)
[1558733.206] (II) LoadModule: "dri2"
[1558733.207] (WW) Warning, couldn't open module dri2
[1558733.207] (II) UnloadModule: "dri2"


> Tom
> 
> > Ross
> 




