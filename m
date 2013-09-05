Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B760C6C6B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:00:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2013 08:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="356372304"
Received: from unknown (HELO [10.255.14.80]) ([10.255.14.80])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2013 08:00:23 -0700
Message-ID: <1378393223.14029.74.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 05 Sep 2013 08:00:23 -0700
In-Reply-To: <CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 15:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 10:53 +0100, Burton, Ross wrote:
> On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
> > +# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
> > +# macro that simply assumes the test succeeds. This is required for at least
> > +# the -intel and -mga drivers.
> > +do_configure_prepend () {
> > +       echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
> > +       sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
> > +       mv ${S}/configure.ac.new ${S}/configure.ac
> > +}
> 
> I've been systematically fixing the drivers that use AC_CHECK_FILE so
> now as far as I know we're left with just one (-mga), for which my
> patch has been submitted upstream.

The xf86-video-intel driver also appears to need it (just FYI re your
comment on mga).


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



