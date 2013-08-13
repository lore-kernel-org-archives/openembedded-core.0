Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28E2C6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:40:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2013 10:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="386494298"
Received: from jfdmzpr06.jf.intel.com (HELO [10.7.201.52]) ([10.7.210.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2013 10:40:08 -0700
Message-ID: <1376415604.12272.107.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 13 Aug 2013 10:40:04 -0700
In-Reply-To: <520A6C5C.3050308@windriver.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<520A6C5C.3050308@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.4 (3.8.4-1.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 12:26 -0500, Mark Hatle wrote:
> On 8/13/13 12:11 PM, Saul Wold wrote:
> > This shows an example of the config fragment support that
> > both the linux-yocto and busybox recipes use. This example
> > is specific to busybox.
> >
> > By adding busybox CONFIG options into a .cfg file and then
> > adding that .cfg file to SRC_URI the merge_config.sh script will
> > correctly handle these CONFIG options during the do_configure task.
> >
> > v2: fixed FILESEXTRAPATHS
> >
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
> >   meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
> >   2 files changed, 6 insertions(+)
> >   create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> >   create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> >
> > diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> > new file mode 100644
> > index 0000000..42c6730
> > --- /dev/null
> > +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> > @@ -0,0 +1 @@
> > +CONFIG_RFKILL=n
> 
> Should be "# CONFIG_RFKILL is not set", I believe the =n will work, but it 
> doesn't following the kconfig conventions.

Seconded. Or Thirded since I responded to V1 similarly. :-)

> 
> --Mark
> 
> > diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> > new file mode 100644
> > index 0000000..641f04a4
> > --- /dev/null
> > +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> > @@ -0,0 +1,5 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +SRC_URI += " \
> > +	    file://no_rfkill.cfg \
> > +           "
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



