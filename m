Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DFF8B71B39
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:00:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 09:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="12246976"
Received: from unknown (HELO mlopezva-mobl2.zpn.intel.com) ([10.219.25.91])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2016 09:00:35 -0800
From: Mariano Lopez <mariano.lopez@linux.intel.com>
To: benjamin.esquivel@linux.intel.com
Date: Thu, 01 Dec 2016 11:00:41 -0600
Message-ID: <5685041.Q7lPjqZr2f@mlopezva-mobl2>
User-Agent: KMail/4.14.10 (Linux/4.4.26-gentoo; KDE/4.14.24; x86_64; ; )
In-Reply-To: <1480611160.13546.2.camel@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
	<53d2af537516d9f542729f80a1ec12c3484a4b3f.1480525452.git.mariano.lopez@linux.intel.com>
	<1480611160.13546.2.camel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 3/3] oe-selftest: Add option to submit test result to a git repository.
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
X-List-Received-Date: Thu, 01 Dec 2016 17:00:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 01, 2016 10:52:40 AM Benjamin Esquivel wrote:
> Hi Mariano
> 
> On Thu, 2016-12-01 at 09:37 -0600, mariano.lopez@linux.intel.com wrote:
> > From: Mariano Lopez <mariano.lopez@linux.intel.com>
> > 
> > This new option allows to commit the result to a git repository,
> > along with the results it will add a metadata file for information
> > of the current selftest run, such as: hostname, machine, distro,
> > distro version, host version, and layers.
> > 
> > This implementation will have a branch per different hostname,
> > testing branch, and machine.
> > 
> > To use this feature use:
> > 
> > oe-selftest <options> --repository <repository_link>
> > 
> > [YOCTO #9954]

> I think this version is okay :) have you tested it in an Autobuilder
> task? 

Indeed, that is why it took me a bit longer to submit the patch. I
know this won't blow up current master.  But Ihaven't used the
option yet, we would need a remote repo and a new autobuilder
buildset.

