Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1E0972491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 13:24:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 30 Apr 2015 06:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,677,1422950400"; d="scan'208";a="564277239"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Apr 2015 06:24:29 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4A96B6A408F;
	Thu, 30 Apr 2015 06:24:02 -0700 (PDT)
Date: Thu, 30 Apr 2015 16:24:23 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Message-ID: <20150430132423.GA6936@linux.intel.com>
References: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com>
	<87egn12286.fsf@email.parenteses.org>
MIME-Version: 1.0
In-Reply-To: <87egn12286.fsf@email.parenteses.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/utils: Allow ~ in bblayers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Apr 2015 13:24:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2015 at 01:08:09PM +0000, Mario Domenech Goulart wrote:
> Hi Ed,
> 
> On Thu, 30 Apr 2015 14:04:50 +0300 Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> 
> > Bitbake can parse ~ in bblayer's paths.
> > Added this functionality to oeqa code.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/lib/oeqa/utils/commands.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
> > index e8a467f..bc1dbb1 100644
> > --- a/meta/lib/oeqa/utils/commands.py
> > +++ b/meta/lib/oeqa/utils/commands.py
> > @@ -155,6 +155,8 @@ def get_test_layer():
> >      layers = get_bb_var("BBLAYERS").split()
> >      testlayer = None
> >      for l in layers:
> > +        if '~' in l:
> > +            l = os.path.expanduser(l)
> 
> Is the "if '~' in l" test necessary?
> 

I did this to show why expanduser is called at all. This makes code self-explanatory and easier to understand.
I was suggested to do it here: http://lists.openembedded.org/pipermail/bitbake-devel/2015-April/005661.html

--
Regards,
Ed

