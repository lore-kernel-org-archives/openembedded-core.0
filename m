Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D9EC16AF35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 10:53:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 May 2014 03:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,940,1392192000"; d="scan'208";a="547232172"
Received: from acdivito-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.223])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2014 03:53:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Chong, Hui Qing" <hui.qing.chong@intel.com>
Date: Fri, 30 May 2014 11:53:30 +0100
Message-ID: <11490945.qXYNrDcr0g@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <4D2B74E594FF4C4A97424079247E473A17DC8288@PGSMSX104.gar.corp.intel.com>
References: <4D2B74E594FF4C4A97424079247E473A17DC8288@PGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Repo Issue] x264: Unable to find revision
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
X-List-Received-Date: Fri, 30 May 2014 10:53:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hui Qing,

On Friday 30 May 2014 09:44:31 Chong, Hui Qing wrote:
> Hi, I am working on Yocto Project 1.6, Daisy branch. Previously I am able to
> build the image successfully, but now I have errors as follow:
> 
> ERROR: Fetcher failure: Unable to find revision
> 585324fee380109acd9986388f857f413a60b896 in branch master even from
> upstream ERROR: Function failed: Fetcher failure for URL:
> 'git://git.videolan.org/x264.git'. Unable to fetch URL from any source.
> 
> In the x264_git.bb file, the SRC_URI and SRCREV are:
> 
> SRC_URI = "git://git.videolan.org/x264.git \
> 	        file://don-t-default-to-cortex-a9-with-neon.patch \
> 	        "
> SRCREV = "585324fee380109acd9986388f857f413a60b896"
> 
> Does anyone notice this and is there any solution for this error? Thank you.

Yes, there is a patch here:

http://patchwork.openembedded.org/patch/72933/

It should be merged fairly soon I would think, but in the mean time you can 
apply it locally.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

