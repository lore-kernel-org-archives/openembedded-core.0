Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 303BE6DEED
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 20:47:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2013 12:47:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,852,1378882800"; d="scan'208";a="446642710"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.192])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2013 12:47:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 08 Dec 2013 20:47:09 +0000
Message-ID: <2311385.i7tMp5PycV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKrK7e_TT84ZcW=ruiSCsdbGmgKkbpZum-sevn=mVTqZTA@mail.gmail.com>
References: <1386439921-11748-1-git-send-email-andrei@gherzan.ro>
	<CAP9ODKrK7e_TT84ZcW=ruiSCsdbGmgKkbpZum-sevn=mVTqZTA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] libav: Add v9.10
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
X-List-Received-Date: Sun, 08 Dec 2013 20:47:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 08 December 2013 09:42:19 Otavio Salvador wrote:
> On Sat, Dec 7, 2013 at 4:12 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > This version includes libavresample needed for packages like xbmc.
> > To use this version add:
> > PREFERRED_VERSION_libav = "9.10".
> > Removed git version as being an older version of a 9.X release.
> > 
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> 
> Any reason to keep the old version? why not move to this release?

If nothing else, I think we have to keep 0.8.x around until we remove 
gstreamer 0.10 (or we revert back to gst-ffmpeg's internal ffmpeg copy, but that 
doesn't seem like a good idea).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

