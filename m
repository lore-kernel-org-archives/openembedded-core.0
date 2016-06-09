Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 839C662134
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 11:29:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2016 04:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,444,1459839600"; d="scan'208";a="994230883"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 04:28:36 -0700
Date: Thu, 9 Jun 2016 09:35:41 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160609063541.GA26373@mbabyjoh-desk.ger.corp.intel.com>
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
	<940de7d5-ba9f-cdd1-476c-9b1235b8e4b2@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <940de7d5-ba9f-cdd1-476c-9b1235b8e4b2@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 09 Jun 2016 11:29:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Thu, Jun 09, 2016 at 12:37:00PM +0300, Alexander Kanavin wrote:
> On 06/08/2016 03:48 PM, Maxin B. John wrote:
> >1. LIC_FILES_CHKSUM updates only involves changes in Copyright holders.
> >   LICENSE remains the same.
> >
> >2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
> >   Provide a work around for that.
> >
> >[YOCTO #9606]
> >
> >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >---
> > ...{libjpeg-turbo_8d+1.4.2.bb => libjpeg-turbo_8d+1.5.0.bb} | 13 ++++++++-----
> > 1 file changed, 8 insertions(+), 5 deletions(-)
> > rename meta/recipes-graphics/jpeg/{libjpeg-turbo_8d+1.4.2.bb => libjpeg-turbo_8d+1.5.0.bb} (71%)
> 
> Adding a '8d+' prefix to the version means that upstream check cannot be
> automatically performed. Can we get rid of it somehow?
>

+1 for that. Now looking for a better way to get rid of this "version-going-backwards" problem:

QA Issue: Package version for package jpeg-tools went backwards which would break package feeds from (0:8d+1.4.2-r0 to 0:1.5.0-r0) [version-going-backwards]

> Alex
>
Best Regards,
Maxin

