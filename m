Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4F6731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 13:45:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 01 Mar 2016 05:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,523,1449561600"; d="scan'208";a="755977546"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.3.164])
	by orsmga003.jf.intel.com with ESMTP; 01 Mar 2016 05:45:44 -0800
Message-ID: <1456839944.3290.3.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 01 Mar 2016 13:45:44 +0000
In-Reply-To: <1456419979.30039.67.camel@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
	<1456419979.30039.67.camel@intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/10] swupdbundle: new class to generate virtual images for swupd-image
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
X-List-Received-Date: Tue, 01 Mar 2016 13:45:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Patrick,

Apologies for the delayed response.

On Thu, 2016-02-25 at 18:06 +0100, Patrick Ohly wrote:
> On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> > 
> > Our initial strategy to generate bundles for consumption by swupd
> > is to generate images which contain the base image (os-core) plus
> > the additional contents of the bundle, then prune out the core
> > contents. By generating images in this manner we hope to accomodate
> > packages which modify the rootfs outside of installing files, i.e.
> > with postinsts.
> > 
> > To that end this class, to be used via BBCLASSEXTEND, will generate
> > virtual image recipes that add extra packages to the extended
> > image.
> Can this be combined with an image recipe which itself uses
> BBCLASSEXTEND to generate virtual image recipes, i.e. create a
> virtual
> recipes based on a virtual recipe?

Currently this doesn't work, but I've just filed a bug to handle this
scenario: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9192

Regards,

Joshua


