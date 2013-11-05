Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2B996D160
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 13:01:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 04:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="430055629"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 05 Nov 2013 05:01:19 -0800
Date: Tue, 5 Nov 2013 15:01:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131105130118.GE27969@lpalcu-linux>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
	<7b7e2f1f2c529a2867a48e0ddfe78faf2b702c2f.1383643350.git.laurentiu.palcu@intel.com>
	<CAJTo0LbP5517bBCnBH2tFoF0C6KKShwSrfw355XcZuK0c-iiiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbP5517bBCnBH2tFoF0C6KKShwSrfw355XcZuK0c-iiiQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] diffstat: upgrade to 1.58
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
X-List-Received-Date: Tue, 05 Nov 2013 13:01:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2013 at 12:16:55PM +0000, Burton, Ross wrote:
> On 5 November 2013 09:25, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > -diff --git a/aclocal.m4 b/aclocal.m4
> 
> How does this work, considering do_configure should be replacing this file?
For diffstat, in particular, aclocal.m4 is explicitly renamed to
acinclude.m4 in do_configure ().

Laurentiu
> 
> Ross

