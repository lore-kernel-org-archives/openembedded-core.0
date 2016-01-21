Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A5031600B3;
	Thu, 21 Jan 2016 17:55:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2016 09:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="895531902"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2016 09:55:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 22 Jan 2016 06:55:04 +1300
Message-ID: <2161898.1hvMfJMvNz@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <CAJTo0LYvEUgd0xNdu-HoVR1dW_eXYpZjy-BjzxOm0KKt0vcWcA@mail.gmail.com>
References: <56A0F5D4.5090701@linux.intel.com>
	<CAJTo0LYvEUgd0xNdu-HoVR1dW_eXYpZjy-BjzxOm0KKt0vcWcA@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] proposal: let's move oe-core to ffmpeg (from libav)
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
X-List-Received-Date: Thu, 21 Jan 2016 17:55:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 21 Jan 2016 15:40:10 Burton, Ross wrote:
> [CC'ing oe-devel]
> 
> On 21 January 2016 at 15:14, Alexander Kanavin <
> 
> alexander.kanavin@linux.intel.com> wrote:
> > let's replace libav with ffmpeg in oe-core. The reasons are:
> > 
> > - all of the major distributions are using ffmpeg now (the last holdout
> > was Debian, and they switched to ffmpeg in summer 2015 after a long
> > discussion and deliberation [1][2])
> > - ffmpeg is much more responsive to security issues
> > - ffmpeg does regular releases, while libav hasn't had one since spring
> > 2015
> > - other reasons listed in [2]
> > 
> > [1] https://lwn.net/Articles/650816/
> > [2] https://wiki.debian.org/Debate/libav-provider/ffmpeg
> > 
> > Objections, thoughts?

FWIW I did effectively make this same proposal last July, I think people were broadly in favour:

http://lists.openembedded.org/pipermail/openembedded-core/2015-July/107091.html

> Sounds sensible to me.  However we're a week away from M2 deadline so I'm
> not sure we'll be able to have a consensus and get patches before that
> unless someone is incredibly motivated.

Right, yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

