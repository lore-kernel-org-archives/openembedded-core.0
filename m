Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C5370606D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 07:10:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 05 May 2016 00:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,581,1455004800"; d="scan'208";a="973068970"
Received: from ephua-mobl7.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.192])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2016 00:10:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 05 May 2016 19:10:43 +1200
Message-ID: <7618991.MRiH0pG9k0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CAAPZna0WB0OjbEzo7eh6NctTcrm78O+fAtnFNwb-Ksgscg1x7w@mail.gmail.com>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504170600.GA14676@jupiter.localdomain>
	<CAAPZna0WB0OjbEzo7eh6NctTcrm78O+fAtnFNwb-Ksgscg1x7w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Thu, 05 May 2016 07:10:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Note also that devtool add / recipetool create are capable of creating pretty 
complete recipes for npm packages where licenses are also correctly set per 
package (so you get them in the image manifest). I'd strongly recommend using 
it for this; if you have any issues please let me know.

Cheers,
Paul

On Wed, 04 May 2016 14:21:18 Fabio Berton wrote:
> I think that meta-brendan-nodepkgs link could be on npm.bbclass file as
> documentation and example of use, would be helpfully.
> 
> On Wed, May 4, 2016 at 2:06 PM, Brendan Le Foll <brendan.le.foll@intel.com>
> 
> wrote:
> > On Wed, May 04, 2016 at 02:01:40PM -0300, Fabio Berton wrote:
> > >    Yes, it helps.
> > >    Now I see my error... I need to use
> > >    SRC_URI = "npm://[1]registry.npmjs.org;name=${PN};version=${PV}"
> > >    My recipe it's getting sources from github and not from registry.
> > >    Thanks!
> > 
> > No problem. FYI I have some examples here:
> > https://github.com/arfoll/meta-brendan-nodepkgs
> > 
> > They show usage of shrinkwrap and lockdown etc... It's not
> > particularly useful or used but really it's my test layer so feel free
> > to submit any other modules you think are helpful/useful.
> > 
> > Cheers,
> > Brendan

-- 

Paul Eggleton
Intel Open Source Technology Centre

