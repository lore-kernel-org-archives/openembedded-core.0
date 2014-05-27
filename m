Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A62A60196
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 12:28:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2014 05:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,918,1392192000"; d="scan'208";a="545469974"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.121])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2014 05:28:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tim Orling <ticotimo@gmail.com>
Date: Tue, 27 May 2014 13:28:15 +0100
Message-ID: <6373193.eVtsr7fQSg@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CANx9H-AGGrh-3zVOoaq9GZ60gtknNGAyZ7BGJD5s2w-GYH3e7A@mail.gmail.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140524084213.GC2715@jama>
	<CANx9H-AGGrh-3zVOoaq9GZ60gtknNGAyZ7BGJD5s2w-GYH3e7A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 27 May 2014 12:28:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Tim,

On Sunday 25 May 2014 22:29:14 Tim Orling wrote:
> On Sat, May 24, 2014 at 1:42 AM, Martin Jansa <martin.jansa@gmail.com>wrote:
> > On Fri, May 23, 2014 at 07:36:42PM -0700, Khem Raj wrote:
> > > On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton
> > > 
> > > <paul.eggleton@linux.intel.com> wrote:
> > > >> Use PREFERRED_VERSION_libav in your distro definition instead.
> > > > 
> > > > Why? PREFERRED_VERSION_libav will override this in any case...
> > > 
> > > I would rather ask why not ? we are pinning to older version is there
> > > a reason for that ?
> > 
> > Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplayer2
> > fails with old libav-8, we need someone to work on making them
> > compatible with the same version of libav (preferably newer one - 9 or
> > 10) and then we should switch.
> > 
> > The problem--at least for gst-ffmpeg and xbmc--is that libav-9 drops
> 
> libpostproc.
> http://git.libav.org/?p=libav.git;a=commit;h=b315042c8ce984bec431c5965120853
> a843cbfa5
> 
> I'll see if I can get http://git.videolan.org/?p=libpostproc.git to play
> nice.

Maybe you already saw it, but we do have a libpostproc recipe in meta-oe...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

