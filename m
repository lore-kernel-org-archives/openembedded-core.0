Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E006C772E5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 19:32:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Feb 2016 11:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,482,1449561600"; d="scan'208";a="750521024"
Received: from jngau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.140])
	by orsmga003.jf.intel.com with ESMTP; 21 Feb 2016 11:32:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Feb 2016 08:32:05 +1300
Message-ID: <3343684.31hSHmODfZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <CAMKF1sr8jXY-0SLSGfBOBeScMzpUHeQEK=jQNUKadmfBq__1ww@mail.gmail.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
	<988345efbaa22b1f8f3facef4a15f19b040e4e96.1455874585.git.paul.eggleton@linux.intel.com>
	<CAMKF1sr8jXY-0SLSGfBOBeScMzpUHeQEK=jQNUKadmfBq__1ww@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] devtool: minor fix for error message
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
X-List-Received-Date: Sun, 21 Feb 2016 19:32:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 20 Feb 2016 11:16:32 Khem Raj wrote:
> On Fri, Feb 19, 2016 at 1:38 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > There is no -N/--name option for devtool, that's a recipetool option -
> > with devtool you just specify the name as a positional argument.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/lib/devtool/standard.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index d12cc2e..590dfef 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > 
> > @@ -150,7 +150,7 @@ def add(args, config, basepath, workspace):
> >              stdout, _ = exec_build_env_command(config.init_path,
> >              basepath, 'recipetool --color=%s create -o %s "%s" %s' %
> >              (color, tempdir, source, extracmdopts))>          
> >          except bb.process.ExecutionError as e:
> >              if e.exitcode == 15:
> > -                raise DevtoolError('Unable to auto-determine name from
> > source tree, please specify it with -N/--name') +                raise
> > DevtoolError('Unable to auto-determine recipe name from source tree,
> > please specify it on the command line')
> may be reword it a bit to "Could not auto detect recipe name, please
> specify on commandline"

Right, that would be better wording. I'll send a follow-up patch.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

