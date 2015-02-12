Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 17E88606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 17:32:27 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1CHWR6b012300; Thu, 12 Feb 2015 11:32:27 -0600
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021211322722-1091867 ;
	Thu, 12 Feb 2015 11:32:27 -0600 
Date: Thu, 12 Feb 2015 11:32:21 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150212173221.GB7233@bshelton-desktop>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
	<CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
	<CAJTo0LbLPSVjKi-m085=HnkVTTkKaUozVTpJBc2qzOJ-wqSL0Q@mail.gmail.com>
	<20150212160337.GA7233@bshelton-desktop>
	<CAJTo0LZ7raGC-eXL6OCzvrHX01a4H721vTiqK+akF2Oy+M0z4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ7raGC-eXL6OCzvrHX01a4H721vTiqK+akF2Oy+M0z4A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/12/2015 11:32:27 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/12/2015 11:32:27 AM,
	Serialize complete at 02/12/2015 11:32:27 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-12_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Thu, 12 Feb 2015 17:32:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> A revised patch would be awesome.  If both kernel-shark and trace-cmd
> disable Python, why does trace-cmd.inc inherit python-dir and pythonnative?
> 
> Ross

I see where trace-cmd inherits pythonnative, but I don't see where it
inherits python-dir.  It still builds OK for me if I don't inherit
pythonnative, so I'm not sure if/why that's needed.

Quick question on this: What do I need to do in my build setup to enable
Python in a similar way to what's done on the autobuilder so I can
reproduce the failure and verify it's fixed?

Thanks,
Ben

