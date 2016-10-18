Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 81F2C719DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 16:40:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2016 09:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="1046471341"
Received: from jlock-mobl1.ld.intel.com ([10.103.239.41])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2016 09:40:40 -0700
Message-ID: <1476808839.14120.8.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 17:40:39 +0100
In-Reply-To: <edfa40f8-d933-9851-5536-4cd63bcf52ba@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<770d29435af19aed00bd15d8b95504218ad600ec.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1476688143.2604.9.camel@linux.intel.com>
	<edfa40f8-d933-9851-5536-4cd63bcf52ba@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 7/9] selftest: skip runtime-test's test_testimage_install on poky-tiny distro
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
X-List-Received-Date: Tue, 18 Oct 2016 16:40:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-17 at 11:02 -0500, Leonardo Sandoval wrote:
> 
> On 10/17/2016 02:09 AM, Joshua Lock wrote:
> > 
> > On Fri, 2016-10-14 at 11:40 -0500,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > 
> > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.c
> > > om>
> > > 
> > > Distro poky-tiny cannot build the core-image-full-cmdline image,
> > > so
> > > skip the
> > > test if this is the case.
> > > 
> > > [YOCTO #8525]
> > Wouldn't it be better to use a different image, most likely with
> > extra
> > packages installed, and maybe a different list of TEST_SUITES for
> > poky-
> > tiny so that we're still testing this functionality on poky-tiny?
> 
> Yes, that is a good idea. Which image and the accompanied tests do
> you 
> suggest?

I'd be inclined to suggest core-image-minimal with extra packages
installed to enable the same TEST_SUITES, but I can't recall exactly
what's being tested here. Would that combination make sense?

Thanks,

Joshua

> 
> > 
> > Thanks,
> > 
> > Joshua
> > 
> > > 
> > > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linu
> > > x.in
> > > tel.com>
> > > ---
> > >   meta/lib/oeqa/selftest/runtime-test.py | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/runtime-test.py
> > > b/meta/lib/oeqa/selftest/runtime-test.py
> > > index c2d5b45..e17c261 100644
> > > --- a/meta/lib/oeqa/selftest/runtime-test.py
> > > +++ b/meta/lib/oeqa/selftest/runtime-test.py
> > > @@ -94,6 +94,8 @@ class TestImage(oeSelfTest):
> > >           Product: oe-core
> > >           Author: Mariano Lopez <mariano.lopez@intel.com>
> > >           """
> > > +        if self.distro == 'poky-tiny':
> > > +            self.skipTest('core-image-full-cmdline not buildable
> > > for
> > > poky-tiny')
> > >   
> > >           features = 'INHERIT += "testimage"\n'
> > >           features += 'TEST_SUITES = "ping ssh selftest"\n'
> > > -- 
> > > 2.1.4
> > > 
> 

