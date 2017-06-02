Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F121E606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 21:33:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 14:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="94962046"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 02 Jun 2017 14:33:10 -0700
Message-ID: <1496439709.26945.105.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 02 Jun 2017 16:41:49 -0500
In-Reply-To: <f71622c0-5f67-999f-da93-b441d1e3445a@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496335920.26945.80.camel@linux.intel.com>
	<b191e2fc-65c7-350f-1a7e-da684ca6b2b5@windriver.com>
	<f71622c0-5f67-999f-da93-b441d1e3445a@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Fri, 02 Jun 2017 21:33:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Alex,

I get this when bitbake core-image-minimal

http://errors.yoctoproject.org/Errors/Build/38347/


HEAD is at

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/parallel-rpm


On Thu, 2017-06-01 at 20:37 +0300, Alexander Kanavin wrote:
> On 06/01/2017 08:13 PM, Mark Hatle wrote:
> >>> perl
> >>> before: 1m19s 63M
> >>> after: 55s 42M
> >>>
> >>> python3
> >>> before: 40s 38M
> >>> after: 28s 24M
> >>
> >> it is interesting to see that perl and python does not benefit 'much'.
> >> buildstats should give us a better picture per recipe.
> >
> > This may be due to how we process rpmdeps within OpenEmbedded.. but I'm not
> > sure.  I'd have expected a bigger time difference with large packages (lots of
> > sub packages) like perl and python3.
> 
> The numbers include the overhead of starting bitbake (some 10 seconds). 
> Subtract that (from both 'before' and 'after') and then it's more 
> impressive :) I tested via
> 
> time bitbake -f -c do_package_write_rpm perl
> 
> Alex
> 



