Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E1CA8773A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:02:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2016 15:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="923289509"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2016 15:02:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
Date: Thu, 25 Feb 2016 12:02:26 +1300
Message-ID: <1797799.y7uMzTcXlY@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <33006C99F5A5194A9B7A7715DFA3E383EB81CFA2@ALA-MBB.corp.ad.wrs.com>
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
	<1629258.jkM8Gdqopn@peggleto-mobl.ger.corp.intel.com>
	<33006C99F5A5194A9B7A7715DFA3E383EB81CFA2@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 23:02:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 24 Feb 2016 22:59:13 Radzykewycz, T wrote:
> ________________________________________
> 
> On Wednesday, February 24, 2016 2:52 PM, Paul Eggleton said:
> > On Wed, 24 Feb 2016 16:33:04 Robert P. J. Day wrote:
> > > Quoting Christopher Larson <clarson@kergoth.com>:
> > > > All appends that apply to a given recipe will be applied to that
> > > > recipe.
> > > > Order is determined solely by layer priority.
> > > > 
> > >    wait ... so *all* bbappend files that match a recipe will be applied?
> > > 
> > > i'm embarrassed that i didn't know that, is that mentioned in the
> > > documentation somewhere?
> > 
> > Surprisingly we don't currently state this explicitly, though it's
> > implied. We should work this into the relevant part of the bitbake manual
> > and the "Using .bbappend Files" section of the dev manual. Scott could
> > you add that to your todo list?
> 
> If there is any way to determine the order that the bbappend files
> are included, that would be helpful.  As well as determining what
> order patches will be applied (which is, I suspect, determined
> in part by what order the bbappend files are included)..

bitbake-layers show-appends will give you the former. Patches get applied 
strictly in the order they appear in SRC_URI, if you have bbappends that 
append or prepend that variable that will of course influence that, but the 
final value and hence the order should be visible through bitbake -e recipename 
| less and then search for ^SRC_URI (along with history of how the value came 
to be).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

