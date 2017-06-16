Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 38A077854D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:47:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 12:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,348,1493708400"; d="scan'208";a="114138353"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga005.jf.intel.com with ESMTP; 16 Jun 2017 12:47:00 -0700
Message-ID: <1497642962.29576.32.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jun 2017 14:56:02 -0500
In-Reply-To: <CAJTo0LanhF0x4yvucSpffYdGB2CbKN9mQH_ppTbX+rts=P_m9Q@mail.gmail.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<00bb214ae7913ff1b6b95285c2945acb868012dd.1497615866.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LanhF0x4yvucSpffYdGB2CbKN9mQH_ppTbX+rts=P_m9Q@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 27/32] btrfs-tools: upgrade to 4.11
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
X-List-Received-Date: Fri, 16 Jun 2017 19:47:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-16 at 20:26 +0100, Burton, Ross wrote:
> 
> On 16 June 2017 at 13:28, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>         From: Upgrade Helper <auh@auh.yoctoproject.org>
>         
> 
> This and two others need to be re-authored by you (git commit --amend
> --reset-author during a rebase will do it).

patchtest has a test that check author, and this is correct on this
patch, the problem is that the commit message contains the AUH stuff. I
include (patchtest) test for the latter.

Leo

> 
> 
> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



