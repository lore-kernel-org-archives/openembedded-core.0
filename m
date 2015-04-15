Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DA1EE6AC24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 16:29:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 15 Apr 2015 09:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,582,1422950400"; d="scan'208";a="714149079"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.35]) ([10.218.98.35])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2015 09:29:51 -0700
Message-ID: <1429115384.4407.16.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 13:29:44 -0300
In-Reply-To: <CAJTo0LY5pU6zSG9RcL_jEECBMnMYSL-UH8bXnB7ifmfsLAoCSA@mail.gmail.com>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
	<1427892736.17257.8.camel@bottazzini-ThinkPad-T430>
	<CAJTo0LbHCBbBWoponKB=HEqGGDTY4bb_XtW011--yBO5LXEmjQ@mail.gmail.com>
	<1429112256.4407.8.camel@bottazzini-ThinkPad-T430>
	<CAJTo0LY5pU6zSG9RcL_jEECBMnMYSL-UH8bXnB7ifmfsLAoCSA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd: v219 with stable fixes
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
X-List-Received-Date: Wed, 15 Apr 2015 16:29:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qua, 2015-04-15 at 16:53 +0100, Burton, Ross wrote:
> 
> On 15 April 2015 at 16:37, Bottazzini, Bruno
> <bruno.bottazzini@intel.com> wrote:
>         No problem, I will change the patch to use it the stable
>         branch which I
>         think it will be better.
>         
>         I will send this asap...
>         
> 
> Patches for the stable branch are generally only accepted once they've
> been proven in master, so a patch changing the master systemd to use
> the git branch to verify they don't break something is the first step.

Yes, the master will also add new features and since it is not a
official release may contain bugs. 

So the main proposal is to use the official version of systemd with
backport fixes (stable branch).

In the end we will get the release 219 version with the fixes which is
really good and it'll be more secure.

When the version 220 is released we can change the branch to master with
SRCREV pointing for the release and later we can do the same thing that
I'm trying to do. To add backport fixes for the current version by using
the branch stable or patch files.

> 
> 
> Ross



