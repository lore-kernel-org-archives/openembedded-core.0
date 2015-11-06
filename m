Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A719475EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:17:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Nov 2015 02:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,251,1444719600"; d="scan'208";a="844038254"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 02:17:57 -0800
Date: Fri, 6 Nov 2015 12:18:02 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Message-ID: <20151106101801.GA26827@mbabyjoh-mobl.fi.intel.com>
References: <1446738498-19155-1-git-send-email-maxin.john@intel.com>
	<3230301C09DEF9499B442BBE162C5E4825A85206@SESTOEX04.enea.se>
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E4825A85206@SESTOEX04.enea.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] bbclass: fix spelling mistakes
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
X-List-Received-Date: Fri, 06 Nov 2015 10:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sona,

On Fri, Nov 06, 2015 at 09:33:06AM +0000, Sona Sarmadi wrote:
> Hi Maxin,
> 
> I think the warning below " bb.warn" is incorrect, it should be " dirname" instead of " patch",  see below:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/spdx.bbclass (master)
> 
> def get_ver_code(dirname):
>     chksums = []
>     for f_dir, f in list_files(dirname):
>         hash = hash_file(os.path.join(dirname, f_dir, f))
>         if not hash is None:
>             chksums.append(hash)
>         else:
>             bb.warn("SPDX: Could not hash file: " + patch) <<< dirname
> 
> Could you please have a look at this as well?

Sure, Thanks for spotting it :)

> Regrads
> //Sona

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> >  # We need special processing for vardeps because it can not work on -#
> > modified flag values.  So we agregate the flags into a new variable
> > +# modified flag values.  So we aggregate the flags into a new variable
> >  # and include that vairable in the set.
> >  UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME
> > ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
> >
<snip>

Best Regards,
Maxin

