Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D31D60621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 15:33:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jun 2017 08:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,378,1493708400"; d="scan'208";a="1144214029"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2017 08:33:48 -0700
Message-ID: <1498232580.31575.85.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Date: Fri, 23 Jun 2017 10:43:00 -0500
In-Reply-To: <1498230471.25895.24.camel@andred.net>
References: <20170623145924.21097-1-git@andred.net>
	<1498230923.31575.84.camel@linux.intel.com>
	<1498230471.25895.24.camel@andred.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] selftest/archiver: add tests for recipe type filtering
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
X-List-Received-Date: Fri, 23 Jun 2017 15:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-23 at 16:07 +0100, André Draszik wrote:
> On Fri, 2017-06-23 at 10:15 -0500, Leonardo Sandoval wrote:
> > On Fri, 2017-06-23 at 15:59 +0100, André Draszik wrote:
> > > From: André Draszik <adraszik@tycoint.com>
> > > 
> > > The archiver used to be able to filter based on COPYLEFT_RECIPE_TYPES.
> > > 
> > > Unfortunately, this got broken with the fix for
> > >   https://bugzilla.yoctoproject.org/show_bug.cgi?id=6929
> > > in commit ae9102bda398 ("copyleft_filter.bbclass: Allow to filter on
> > > name")
> > > 
> > > Add two tests to prevent that from happening again.
> > > 
> > > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > > ---
> > >  meta/lib/oeqa/selftest/cases/archiver.py | 78
> > > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 78 insertions(+)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/cases/archiver.py
> > > b/meta/lib/oeqa/selftest/cases/archiver.py
> > > index 70c7282f22..9f686debe6 100644
> > > --- a/meta/lib/oeqa/selftest/cases/archiver.py
> > > +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> > > @@ -39,3 +39,81 @@ class Archiver(OESelftestTestCase):
> > >          # Check that exclude_recipe was excluded
> > >          excluded_present = len(glob.glob(src_path + '/%s-*' %
> > > exclude_recipe))
> > >          self.assertFalse(excluded_present, 'Recipe %s was not
> > > excluded.' % exclude_recipe)
> > > +
> > > +
> > > +    @testcase(2012)
> > 
> > I believe the testcase ID is related to testopia, not sure if you
> > consider this. Usually, the QA team is the one assigning these numbers.
> 
> No, I just picked the next available number :-)

so please send a v2 removing these. archive tests are welcome!

> 
> A.
> 



