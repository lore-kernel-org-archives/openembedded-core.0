Return-Path: <todd.e.brandt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 590D96B876
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:05:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Sep 2014 17:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,558,1406617200"; d="scan'208";a="602469897"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO linux.intel.com)
	([10.255.13.38])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2014 17:05:07 -0700
Date: Fri, 19 Sep 2014 17:05:07 -0700
From: Todd E Brandt <todd.e.brandt@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140920000507.GA27494@linux.intel.com>
References: <20140919224401.GA24684@linux.intel.com>
	<CAJTo0La4Etb61dwdMdikLJpByAhFE6OM1-bAHAZPyk12Nok9uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La4Etb61dwdMdikLJpByAhFE6OM1-bAHAZPyk12Nok9uw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Phoronix Test Suite package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: todd.e.brandt@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Sep 2014 00:05:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 20, 2014 at 12:03:43AM +0100, Burton, Ross wrote:
> On 19 September 2014 23:44, Todd E Brandt <todd.e.brandt@linux.intel.com> wrote:
> > This is the package recipe for the phoronix test suite v5.2.1. The
> > tool is for benchmarking and testing of the system.
> 
> +RDEPENDS_${PN} = "php-cli"
> 
> Surely phoronix has more dependencies than just php...  Or is this
> just the runner and it talks to slave?  Honestly have no idea how the
> phoronix test suite is structured.

it's designed to be a minimal install with only php as the dependency. It uses
the network to download test definitions and to upload test results.

> 
> +SRC_URI = "http://www.phoronix-test-suite.com/releases/phoronix-test-suite-5.2.1.tar.gz"
> 
> ${BP} expands to PN-PV, so you can replace that with .../releases/${BP}.tar.gz.
> 
> +S = "${WORKDIR}/phoronix-test-suite"
> 
> That's the default value, so you can delete this line.
> 
> +do_install() {
> +       DESTDIR=${D} ./install-sh /usr
> +}
> 
> Use ${exec_prefix} instead of /usr.
> 
> Finally, this is a patch to meta-oe, so it should go to
> openembedded-devel@, not openembedded-core@.

ok, I'll resubmit on the proper list, sorry for the mistake and thanks for the feedback.

> 
> Ross

