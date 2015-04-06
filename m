Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 448D672D74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 14:15:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 06 Apr 2015 07:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,531,1422950400"; d="scan'208";a="704066796"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2015 07:15:45 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F17516A408F;
	Mon,  6 Apr 2015 07:15:22 -0700 (PDT)
Date: Mon, 6 Apr 2015 17:15:39 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150406141539.GA14205@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<552189F9.6040405@balister.org>
	<CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Mon, 06 Apr 2015 14:15:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2015 at 09:00:50AM -0300, Otavio Salvador wrote:
> On Sun, Apr 5, 2015 at 4:16 PM, Philip Balister <philip@balister.org> wrote:
> > On 04/04/2015 10:20 AM, Ed Bartosh wrote:
> >> wic requires tools that are not always possible to find in $PATH.
> >> This causes wic to fail with confusing errors like this:
> >>  External command 'parted' not found, exiting.
> >>    (Please install 'parted' on your host system)
> >>
> >> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
> >> /sbin and /bin to the list of paths makes find_binary_path to
> >> produce more reliable results.
> >
> > I'm with Otavio. Given wic is intimately dependent on internal build
> > artifacts, it should use utilities from the sysroot and not depend on
> > tools from the path. Let's make wic 100% before creating a tool to build
> > images from packages.
> 
> If we want to have it as a 'standalone' tool we will need to somehow
> package the tool set for it to use, otherwise we have a maintenance
> nightmare (does patch X has been applied to Parted?).
> 
Can you elaborate a bit on how tool set can be packaged?

Back to the original topic. wic never used native parted as it's not useable(there is no executable in systoor).
Anybody knows the reason?

Documentation also suggests to install parted on the host: http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#wic-requirements

--
Regards,
Ed

