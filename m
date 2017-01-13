Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6F865C90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:54:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 13 Jan 2017 05:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1082573103"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.83])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2017 05:54:05 -0800
Message-ID: <1484315644.3828.3.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 13:54:04 +0000
In-Reply-To: <1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
	<1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Fri, 13 Jan 2017 13:54:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

> On Fri, 2017-01-13 at 15:00 +0200, Alexander Kanavin wrote:
> On 01/09/2017 02:56 PM, Alexander Kanavin wrote:
> > On 01/05/2017 06:34 PM, Joshua Lock wrote:
> > > Upstream have removed the file from zlib.net as a new version has
> > > been released, switch to fetching from the official sourceforge
> > > mirror.
> > > 
> > > [YOCTO #10879]
> > 
> > If a new version has been released, you should also update to that
> > version. Also, does upstream version check (-c checkpkg) still work
> > with
> > the new SRC_URI?
> 
> Actually it doesn't, accordingly we have no way of knowing if zlib
> has a 
> new version upstream. Please do check these things when you update
> SRC_URI.

Noted, thanks. Do we maintain a list of things we'd like people to
check, and how to do it, when making updates to recipes?

checkpkg isn't available by default (had to add distrodata to INHERITS)
and it took me a while to realise the results are written to a file I
have to check. If we expect people to run these checks before
submitting updates we'd best make it as easy as possible to know what
the checks are and how to run them.

The only reference I can find to checkpkg on the OE and YP wikis is
here:

https://wiki.yoctoproject.org/wiki/How_do_I#Q:_How_do_I_ensure_that_I_a
m_using_the_latest_upstream_version_of_the_package.3F

Joshua

