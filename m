Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4786A529
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:59:45 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2013 12:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,772,1363158000"; d="scan'208";a="310232324"
Received: from unknown (HELO helios.localnet) ([10.252.121.172])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2013 12:59:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 20:59:44 +0100
Message-ID: <3311603.tBhLUzvcSX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
MIME-Version: 1.0
Subject: RFC: libav, ffmpeg, and OE-Core
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
X-List-Received-Date: Thu, 30 May 2013 19:59:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

Video decoding is an important function for a lot of devices. We currently
have gst-ffmpeg, which includes the ffmpeg sources, in OE-Core but we don't have
ffmpeg or libav itself that is a bit more re-usable outside of GStreamer. This
brings up a few questions:

1) Which is the preferred option for OE; ffmpeg or its "fork" libav? libav
seems to be better suited to use as a library but on the other hand ffmpeg
isn't exactly dead. Some background:

http://aballier.wordpress.com/2013/01/18/ffmpeg-vs-libav-a-distribution-maintainer-point-of-view-almost-two-years-after-the-split/

http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html

2) Following on from that, should we pull the preferred library into OE-Core
and avoid the need for the current bbappend in meta-oe for gst-ffmpeg? (One of
my personal motivations for sorting this out). This would of course be
protected by LICENSE_FLAGS as we currently do with gst-ffmpeg.

Thoughts?

Cheers,
Paul



-- 

Paul Eggleton
Intel Open Source Technology Centre

