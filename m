Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28C196059A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 11:23:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2014 04:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,836,1400050800"; d="scan'208";a="556487381"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.124])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2014 04:23:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tim Orling <ticotimo@gmail.com>
Date: Sun, 10 Aug 2014 12:23:17 +0100
Message-ID: <1439365.uUYT6hVjKR@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <230F811E-E907-4EE1-9C37-817A87E96862@gmail.com>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
	<230F811E-E907-4EE1-9C37-817A87E96862@gmail.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Sun, 10 Aug 2014 11:23:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 August 2014 20:00:30 Tim Orling wrote:
> > On Aug 6, 2014, at 7:42 AM, Paul Eggleton <paul.eggleton@linux.intel.com> 
wrote:
> >> On Wednesday 06 August 2014 16:37:34 Martin Jansa wrote:
> >>> On Wed, Aug 06, 2014 at 01:41:58PM +0100, Paul Eggleton wrote:
> >>>> On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
> >>>> 
> >>>> * building with libav-9 fails with:
> >>>>  | checking for POSTPROC... configure: error: Package requirements
> >>>>  | (libpostproc libavcodec libavutil) were not met:
> >>>>  | 
> >>>>  | No package 'libpostproc' found
> >>> 
> >>> Does gst-ffmpeg actually work with libav > 0.8?
> >> 
> >> No, not yet (see world status e-mails), but at least this is step
> >> in right direction IMHO and doesn't harm libav-0.8 users.
> > 
> > I'm just not sure gst-ffmpeg should be allowed to get past this at all if
> > it's not currently expected to work. The known working configuration is
> > either gst-ffmpeg + libav 0.8.x, or gstreamer1.0-libav + libav > 0.8.x.
> 
> I commented some time ago that 0.8/gst-ffmpeg should just go away... (Along
> with X but that's another subject). It just doesn't fit in the trend of
> multimedia FOSS anymore... Not that xbmc or vlc are ready for ffmpeg to go
> away... Sigh. Libpostproc is also an orphan in libav world, no activity
> since 2012. Schisms suck. But we seem to be committed to the libav bus, so
> keep calm and ride on.

Unfortunately I don't think we can really get rid of this until we can get rid 
of gstreamer 0.10, and that has to stay because not everyone has moved over to 
gstreamer 1.0.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

