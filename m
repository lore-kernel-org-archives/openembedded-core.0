Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 103A06FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:28:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 30 May 2016 14:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,392,1459839600"; d="scan'208";a="711236573"
Received: from klsmgloan09.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.237])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2016 14:28:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 09:27:58 +1200
Message-ID: <2360776.DLHOAct9Ez@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1464607590.941.22.camel@linux.intel.com>
References: <1464330370-6856-1-git-send-email-markus.lehtonen@linux.intel.com>
	<20160527100752.GA2570@jama>
	<1464607590.941.22.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] license.bbclass: do not process LICENSE_pn variables
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
X-List-Received-Date: Mon, 30 May 2016 21:28:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 30 May 2016 14:26:30 Markus Lehtonen wrote:
> Hi Martin,
> 
> On Fri, 2016-05-27 at 12:07 +0200, Martin Jansa wrote:
> > On Fri, May 27, 2016 at 09:26:10AM +0300, Markus Lehtonen wrote:
> > > The loop iterating over LICENSE_pn variables has never worked. In
> > > addition, the LICENSE variable is supposed to contain all licenses
> > > defined in LICENSE_pn variables.
> > 
> > Is this really true?
> 
> That's what I've been told: LICENSE is supposed to contain all licenses
> and LICENSE_pn can be used to refine on per-package basis. But, that
> said, I don't know if that has actually been documented anywhere except
> perhaps in the bitbake manual which states that LICENSE is "The list of
> source licenses for the recipe".

AIUI, LICENSE is indeed supposed to contain all of the licenses; 
LICENSE_<package> then specifies it on a per package basis, but you're not 
supposed to specify anything in the latter that isn't also specified in the 
former.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

