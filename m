Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1B40A6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:14:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2016 02:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,354,1455004800"; d="scan'208";a="940037474"
Received: from ctan16-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2016 02:14:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Fri, 18 Mar 2016 22:14:10 +1300
Message-ID: <4573637.F6aTTcOVC3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.4-301.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <0C3D50DF-A6F1-4192-B5A8-ACCDE93006F9@linux.intel.com>
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
	<9f1eb07236d23ea550e34f5c8791817d71245bff.1457988127.git.paul.eggleton@linux.intel.com>
	<0C3D50DF-A6F1-4192-B5A8-ACCDE93006F9@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro][PATCH 1/2] devtool: extract: copy kernel config to srctree
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
X-List-Received-Date: Fri, 18 Mar 2016 09:14:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 18 Mar 2016 10:23:22 Markus Lehtonen wrote:
> Hi,
> 
> On 14/03/16 22:43, "Paul Eggleton" <openembedded-core-
bounces@lists.openembedded.org on behalf of paul.eggleton@linux.intel.com> 
wrote:
> >From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> >
> >This makes the correct kernel config to be used when building kernel
> >from srctree (extrernalsrc). If no kernel config is present in the
> >builddir 'do_configure' task copies .config from the srctree.
> >
> >(From OE-Core master rev: 3b516332e038a587685f6e0c14a7f04990bdd6cc)
> >
> >Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> >Signed-off-by: Ross Burton <ross.burton@intel.com>
> >Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >---
> >
> > scripts/lib/devtool/standard.py | 11 ++++++-----
> > 1 file changed, 6 insertions(+), 5 deletions(-)
> >
> >diff --git a/scripts/lib/devtool/standard.py
> >b/scripts/lib/devtool/standard.py index 5464d7b..c1fbfe3 100644
> >--- a/scripts/lib/devtool/standard.py
> >+++ b/scripts/lib/devtool/standard.py
> >
> >@@ -430,11 +430,12 @@ def _extract_source(srctree, keep_temp, devbranch, 
d):
> >             if haspatches:
> >                 bb.process.run('git checkout patches', cwd=srcsubdir)
> >
> >-        # Move oe-local-files directory to srctree
> >-        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
> >-            logger.info('Adding local source files to srctree...')
> >-            shutil.move(os.path.join(tempdir, 'oe-local-files'),
> >srcsubdir) -
> 
> Why are you "disabling" oe-local-files here? That's unrelated to the kernel
> config. A mistake in patch conflict resolving, perhaps(?)

Oops! Yes indeed. I've fixed this on the branch so that doesn't get removed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

