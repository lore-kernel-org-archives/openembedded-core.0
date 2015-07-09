Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20B7F60557;
	Thu,  9 Jul 2015 10:24:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2015 03:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="758980149"
Received: from lkpandey-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.112])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 03:24:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Thu, 09 Jul 2015 11:24:26 +0100
Message-ID: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.6-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
MIME-Version: 1.0
Subject: RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 10:24:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

A few years ago we made the switch from ffmpeg to libav (a mostly drop-in 
compatible fork), with fairly good justification at the time. However, it looks 
like Debian has just made the switch back to ffmpeg, citing a number of reasons 
- most notably more responsive security issue patching in recent history. 
Here's a page with their full reasoning:

  https://wiki.debian.org/Debate/libav-provider/ffmpeg

Gstreamer (gst-libav, specifically) has also just recently made the switch back 
for its internal copy:

  https://bugzilla.gnome.org/show_bug.cgi?id=751607

What do people think? Should we be looking to make the switch back in OE as 
well?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

