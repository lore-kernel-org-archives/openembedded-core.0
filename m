Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF1B860107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:51:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2016 01:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="994900256"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2016 01:51:16 -0700
Date: Fri, 10 Jun 2016 06:58:23 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20160610035823.GB26373@mbabyjoh-desk.ger.corp.intel.com>
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
	<940de7d5-ba9f-cdd1-476c-9b1235b8e4b2@linux.intel.com>
	<20160609063541.GA26373@mbabyjoh-desk.ger.corp.intel.com>
	<519239dddcce45428cd4d82b0667efe6@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <519239dddcce45428cd4d82b0667efe6@XBOX02.axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Fri, 10 Jun 2016 08:51:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jun 09, 2016 at 11:27:50PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Maxin B. John
> > Sent: den 9 juni 2016 08:36
> > To: Alexander Kanavin
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] libjpeg-turbo: update to 1.5.0
<snip> 

> > +1 for that. Now looking for a better way to get rid of this "version-
> > going-backwards" problem:
> > 
> > QA Issue: Package version for package jpeg-tools went backwards which
> > would break package feeds from (0:8d+1.4.2-r0 to 0:1.5.0-r0) [version-
> > going-backwards]
> > 
> > > Alex
> > >
> > Best Regards,
> > Maxin
> 
> That should only be a matter of setting the epoch of the recipe:
> 
> PE = "1"

Thanks Peter. Sent the v2 now.

> //Peter

Best Regards,
Maxin

