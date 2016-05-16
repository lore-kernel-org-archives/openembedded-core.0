Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BC13F70016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 11:53:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2016 04:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="104606635"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 16 May 2016 04:53:43 -0700
Date: Mon, 16 May 2016 14:54:16 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160516115415.GA21937@mbabyjoh-desk.ger.corp.intel.com>
References: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
	<1463207000.9746.138.camel@linuxfoundation.org>
	<5739B320.6010907@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5739B320.6010907@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] ofono: update to 1.18
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
X-List-Received-Date: Mon, 16 May 2016 11:53:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, May 16, 2016 at 02:46:40PM +0300, Alexander Kanavin wrote:
> On 05/14/2016 09:23 AM, Richard Purdie wrote:
> >On Thu, 2016-05-12 at 16:16 +0300, Maxin B. John wrote:
> >>1.17 -> 1.18
> >>
> >>Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >
> >This results in:
> >
> >http://errors.yoctoproject.org/Errors/Details/62886/
> >
> >which Alexander would probably be quite pleased about but isn't good
> >for the autobuilder.
> 
> Maxin can cherry-pick one of my patches, or just postpone the version update
> until the py3 patchset is merged:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/deprecate-python2&id=6f7eac37a25f1ab55a28cac7b15674dcd6962404

I have tried this patch before sending the upgrades and had to abandon the
attempt because of the newly introduced dependency on python3-pygobject. 

Guess the best way forward will be to wait till py3 patchset is merged :)

> Alex

Thanks and Regards,
Maxin

