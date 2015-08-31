Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3482E74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 11:15:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 31 Aug 2015 04:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,440,1437462000"; d="scan'208";a="794802687"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2015 04:14:59 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1E3676A4083;
	Mon, 31 Aug 2015 04:14:07 -0700 (PDT)
Date: Mon, 31 Aug 2015 14:14:53 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20150831111453.GA28923@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
	<989b768736c5d92eda4f8beb230e02005811ff18.1440969020.git.ed.bartosh@linux.intel.com>
	<CABcZANkADU6Ttr+6ZWGcH51Ue_Au++5ULxfN1__p4z+zcJYi6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANkADU6Ttr+6ZWGcH51Ue_Au++5ULxfN1__p4z+zcJYi6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] image.py: write bitbake variables to .env file
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
X-List-Received-Date: Mon, 31 Aug 2015 11:15:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2015 at 09:22:50PM -0700, Christopher Larson wrote:
> On Sun, Aug 30, 2015 at 2:14 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> 
> > Write set of bitbake variables used by wic into
> > build/tmp/sysroots/<machine>/imagedata/<image>.env
> >
> > List of variables is defined in WICVARS variable in
> > meta/classes/image_types.bbclass.
> >
> > This is needed for wic to be able to get bitbake variables without
> > running 'bitbake -e'.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >
> 
> The function name (_write_env) sounds generic, as does the commit message,
> and the filename, yet it relies on a variable which is WIC-specific. This
> seems rather inconsistent to me, either this thing is for wic alone, or it
> isn't, and the function name, file name, and variable name should reflect
> that.

Thanks for pointing this out. I'll rename _write_env to _write_wic_env it in the next patchset.

--
Regards,
Ed

