Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93B63709B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:42:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2014 07:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,812,1400050800"; d="scan'208";a="584230829"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.26])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2014 07:42:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 06 Aug 2014 15:42:38 +0100
Message-ID: <2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140806143734.GK14848@jama>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
	<20140806143734.GK14848@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 06 Aug 2014 14:42:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 06 August 2014 16:37:34 Martin Jansa wrote:
> On Wed, Aug 06, 2014 at 01:41:58PM +0100, Paul Eggleton wrote:
> > On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
> > > * building with libav-9 fails with:
> > >   | checking for POSTPROC... configure: error: Package requirements
> > >   | (libpostproc libavcodec libavutil) were not met:
> > >   | 
> > >   | No package 'libpostproc' found
> > 
> > Does gst-ffmpeg actually work with libav > 0.8?
> 
> No, not yet (see world status e-mails), but at least this is step
> in right direction IMHO and doesn't harm libav-0.8 users.

I'm just not sure gst-ffmpeg should be allowed to get past this at all if it's 
not currently expected to work. The known working configuration is either 
gst-ffmpeg + libav 0.8.x, or gstreamer1.0-libav + libav > 0.8.x.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

