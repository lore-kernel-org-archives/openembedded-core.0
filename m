Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48F8C65F90;
	Thu,  8 May 2014 15:07:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2014 08:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="535940007"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2014 08:07:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 08 May 2014 16:07:19 +0100
Message-ID: <4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:07:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 May 2014 15:48:40 Burton, Ross wrote:
> Hi all,
> 
> Sorry for the cross-post but I want this to have a wide audience.
> 
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.
> 
> Everyone in agreement?  Should I expect any hate mail over this?

+1

The next question is does that mean for the "old" libav (which gst-ffmpeg 
depends upon), do we move that as well or drop it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

