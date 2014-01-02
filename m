Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 81F966B872
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 14:16:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2014 06:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,590,1384329600"; d="scan'208";a="452743242"
Received: from unknown (HELO [10.255.12.41]) ([10.255.12.41])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2014 06:16:31 -0800
Message-ID: <1388672192.3048.9.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 02 Jan 2014 08:16:32 -0600
In-Reply-To: <1388469272.3048.8.camel@empanada>
References: <cover.1388424165.git.tom.zanussi@linux.intel.com>
	<52C21E0F.7020400@windriver.com> <1388469272.3048.8.camel@empanada>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1][dora] - Fix for Bug 5403
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
X-List-Received-Date: Thu, 02 Jan 2014 14:16:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

So this has been pulled into master, but I don't see it in dora.

Is there anything else I need to do so I can close the bug out?

Tom

On Mon, 2013-12-30 at 23:54 -0600, Tom Zanussi wrote:
> Hi Robert,
> 
> Yes, I'm still testing the one for master - will post tomorrow.
> 
> Tom
> 
> 
> On Tue, 2013-12-31 at 09:29 +0800, Robert Yang wrote:
> > Hi Tom,
> > 
> > Thanks, do we also need a patch for master ?
> > 
> > // Robert
> > 
> > On 12/31/2013 01:31 AM, Tom Zanussi wrote:
> > > This fixes a problem seen when accessing function params in systemtap
> > > on certain platforms, due to flaky debuginfo.
> > >
> > > Tested on the following machines with various systemtap scripts:
> > >
> > > qemuppc
> > > qemuarm
> > > qemux86
> > > qemux86-64
> > > crownbay
> > > nuc
> > >
> > > The following changes since commit 3cf2d232529c4fd6b58f87ddbf3df9d805e4180f:
> > >
> > >    libsoup-2.4: add intltool-native to DEPENDS (2013-12-20 09:29:05 +0000)
> > >
> > > are available in the git repository at:
> > >
> > >    git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bug-5403-dora
> > >    http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/systemtap-bug-5403-dora
> > >
> > > Tom Zanussi (1):
> > >    systemtap: Add --enable-prologues to configuration
> > >
> > >   meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> 



