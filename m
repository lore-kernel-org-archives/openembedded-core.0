Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 77A8573505
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 15:37:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2015 08:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,582,1422950400"; d="scan'208";a="695710958"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.35]) ([10.218.98.35])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2015 08:37:43 -0700
Message-ID: <1429112256.4407.8.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 12:37:36 -0300
In-Reply-To: <CAJTo0LbHCBbBWoponKB=HEqGGDTY4bb_XtW011--yBO5LXEmjQ@mail.gmail.com>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
	<1427892736.17257.8.camel@bottazzini-ThinkPad-T430>
	<CAJTo0LbHCBbBWoponKB=HEqGGDTY4bb_XtW011--yBO5LXEmjQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Apr 2015 15:37:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Ross,

No problem, I will change the patch to use it the stable branch which I
think it will be better.

I will send this asap...

Thanks a lot for the reply! 

Best Regards,

On Qua, 2015-04-15 at 16:01 +0100, Burton, Ross wrote:
> Hi,
> 
> On 1 April 2015 at 13:52, Bottazzini, Bruno
> <bruno.bottazzini@intel.com> wrote:
>         The previous patch was done in the way you said but, Khem Raj
>         suggested
>         that we should use it as patches.
>         
>         Copying and Pasting what he said:
>         "Thats good, although we have to be open on stable branch to
>         do SRCREV
>          updates which we hardly do. We only backport fixed via master
>          so I see this as pointless from that angle."
>         
> 
> At the time - when master was frozen - that was true.  But
> unfortunately this didn't get applied in time for Fido, as a
> non-trivial patch that doesn't fix existing bugs there's a large
> barrier to pass.  Now that master is open the systemd recipe can in
> fact track the stable git branch instead, and insert the git hash into
> the PV so it's obvious that it's taken from git.
> 
> 
> Assuming that patch gets merged and doesn't cause problems, then it
> would be up to the Fido maintainer (that's Joshua Lock) to decide
> whether to merge a backport, which could well end up being this patch.
> 
> 
> Sorry about this, the final stage of the release was quite busy and
> this slipped straight through my fingers.
> 
> 
> Ross



