Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91DB260119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:39:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 06 Jul 2016 18:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="990437751"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2016 18:39:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Jul 2016 13:39:32 +1200
Message-ID: <2740868.VrTjpvQuVY@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1sp1hg6u2HpdMDy+-6Ek1-rWm7_6HWeHtdrQ+L=_83zFYg@mail.gmail.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<353972ade9bce1a35f889dd8a9496ea104a1470e.1467849364.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp1hg6u2HpdMDy+-6Ek1-rWm7_6HWeHtdrQ+L=_83zFYg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Thu, 07 Jul 2016 01:39:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Khem,

devtool itself already understands not to try to deal with these recipes - it 
will print out a reasonable error for the user. The exception list is just for 
the devtool-stress script so that it produces clean output.

Cheers,
Paul

On Wed, 06 Jul 2016 17:42:22 Khem Raj wrote:
> On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > These recipes can't be used with devtool because they can't be unpacked
> > in the normal way.
> 
> May be we should have a devtoop blacklist variable that can be added
> to the recipe
> 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/contrib/devtool-stress.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/contrib/devtool-stress.py
> > b/scripts/contrib/devtool-stress.py index ab77a2d..5f396aa 100755
> > --- a/scripts/contrib/devtool-stress.py
> > +++ b/scripts/contrib/devtool-stress.py
> > 
> > @@ -210,7 +210,7 @@ def main():
> >      parser.add_argument('-d', '--debug', help='Enable debug output',
> >      action='store_true') parser.add_argument('-r', '--resume-from',
> >      help='Resume from specified recipe', metavar='PN')
> >      parser.add_argument('-o', '--only', help='Only test specified
> >      recipes (comma-separated without spaces, wildcards allowed)',
> >      metavar='PNLIST')> 
> > -    parser.add_argument('-s', '--skip', help='Skip specified recipes
> > (comma-separated without spaces, wildcards allowed)', metavar='PNLIST') +
> >    parser.add_argument('-s', '--skip', help='Skip specified recipes
> > (comma-separated without spaces, wildcards allowed)', metavar='PNLIST',
> > default='gcc-source-*,kernel-devsrc,package-index,perf,meta-world-pkgdata
> > ,glibc-locale,glibc-mtrace,glibc-scripts,os-release')> 
> >      parser.add_argument('-c', '--skip-classes', help='Skip recipes
> >      inheriting specified classes (comma-separated) - default
> >      %(default)s', metavar='CLASSLIST',
> >      default='native,nativesdk,cross,cross-canadian,image,populate_sdk,me
> >      ta,packagegroup') subparsers =
> >      parser.add_subparsers(title='subcommands', metavar='<subcommand>')
> >      subparsers.required = True
> > 
> > --
> > 2.5.5
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 

Paul Eggleton
Intel Open Source Technology Centre

