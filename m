Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 907376AF56
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:31:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2013 08:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1020,1363158000"; d="scan'208";a="328252844"
Received: from unknown (HELO helios.localnet) ([10.252.122.28])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2013 08:31:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2013 16:31:33 +0100
Message-ID: <9037458.Ckpan3sGJ4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <20130708105739.GA12906@lpalcu-linux>
References: <cover.1373275874.git.paul.eggleton@linux.intel.com>
	<20130708105739.GA12906@lpalcu-linux>
MIME-Version: 1.0
Subject: Re: [dylan][PATCH 00/44] Backports from master (cover letter only)
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
X-List-Received-Date: Mon, 08 Jul 2013 15:31:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 08 July 2013 13:57:40 Laurentiu Palcu wrote:
> On Mon, Jul 08, 2013 at 10:32:18AM +0100, Paul Eggleton wrote:
> > Laurentiu Palcu (2):
> >   populate_sdk_base, adt_installer: abort install if path contains
> >   
> >     spaces
> 
> The previous patch introduces a bashism which is fixed by this patch
> (not merged yet in master):
> http://patches.openembedded.org/patch/52979/
> 
> So, both patches should go in dylan or, if this is not possible, leave
> this one out for now.

OK, I've pushed the branch again with this patch dropped for the moment.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

