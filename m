Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0D06AE2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 18:09:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 11:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,996,1363158000"; d="scan'208";a="365379744"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 11:09:38 -0700
Date: Thu, 4 Jul 2013 21:09:38 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20130704180937.GA26963@lpalcu-linux>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
	<CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
	<51D5971D.3020103@intel.com> <51D59B3D.8070303@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <51D59B3D.8070303@r-finger.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/5] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Thu, 04 Jul 2013 18:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 04, 2013 at 04:56:45PM +0100, Tomas Frydrych wrote:
> On 04/07/13 16:39, Laurentiu Palcu wrote:
> > On 07/04/2013 05:58 PM, Burton, Ross wrote:
> >> On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > Even though the change you're proposing is OK, involves changing the
> > desktop file to add the @SBIN@ pattern and move the sed line to
> > do_install(). Compared to having one single line added in the
> > postinstall... I would choose the latter, unless you elaborate on what
> > do you actually mean by "nasty".
> 
> Post install scripts should be avoided whenever possible and used only
> for things that cannot be done at build or install time. This clearly
> can be done at install time, so it should.
I agree. However, in this particular case I'm just being consistent with
what was already there. I would have personally moved the entire
postinstall to do_install, but the previous sed cannot be moved. So,
since we're stuck with that sed there, this one is just a harmless
addition. This is what I mean!

Laurentiu

> 
> Tomas
> 
> -- 
> http://sleepfive.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

