Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 23DEA60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 13:24:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2014 05:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="415984308"
Received: from sergeypo-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.55])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2014 05:15:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>,
	Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Thu, 13 Nov 2014 13:24:24 +0000
Message-ID: <88495937.4YM9ibA2Sn@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.2-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5463B216.6090401@linux.intel.com>
References: <1415818205-9349-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<5463B216.6090401@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfs-utils: Upgrade to 1.3.1
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
X-List-Received-Date: Thu, 13 Nov 2014 13:24:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 November 2014 11:16:38 Saul Wold wrote:
> On 11/12/2014 10:50 AM, Alejandro Hernandez wrote:
> > Removed: fix-a-Gcc-undefined-behavior.patch - Upstream
> > 
> > Removed: 0001-statd-fixed-the-with-statdpath-flag.patch - Upstream
> > 
> > Removed: fix-the-start-statd.patch - Different solution on upstream
> > 
> > Removed: nfs-utils-1.0.6-uclibc.patch - Different solution on upstream
> > 
> > Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> > ---
> > 
> >   .../files/fix-a-Gcc-undefined-behavior.patch       |  38 -------
> >   .../0001-statd-fixed-the-with-statdpath-flag.patch |  41 --------
> >   .../nfs-utils/nfs-utils/fix-the-start-statd.patch  |  30 ------
> >   .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |  27 -----
> >   .../nfs-utils/nfs-utils_1.3.0.bb                   | 115
> >   --------------------- .../nfs-utils/nfs-utils_1.3.1.bb                 
> >    | 111 ++++++++++++++++++++
>
> Did you use git mv?  or pass the -M to send-email since that correctly
> do renames.

It would be -M when using send-email (or format-patch). git mv doesn't 
actually do anything different than a separate git add followed by git rm.

FWIW, the scripts/create-pull-request & send-pull-request script already 
specify -M (among other things), so although a pull request isn't all that 
useful with a single patch, I tend to use it anyway.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

