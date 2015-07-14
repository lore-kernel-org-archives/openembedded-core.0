Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66F1765C98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:59:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 01:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,470,1432623600"; d="scan'208";a="762053195"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2015 01:59:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Jul 2015 09:59:35 +0100
Message-ID: <4096050.GY1XA1Ybd9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJ86T=W4wmk=j1AWwo9zeNtiYXfvqt4SxSXOX4f=gKnybRraMg@mail.gmail.com>
References: <cover.1436536403.git.paul.eggleton@linux.intel.com>
	<CAJ86T=W4wmk=j1AWwo9zeNtiYXfvqt4SxSXOX4f=gKnybRraMg@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Shell message function support (OE-Core side)
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
X-List-Received-Date: Tue, 14 Jul 2015 08:59:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 July 2015 00:10:13 Andre McCurdy wrote:
> Hi Paul,
> 
> On Fri, Jul 10, 2015 at 6:56 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > I'm finally sending out the patches to support the output of bbwarn,
> > bberror etc. actually going to the console. This is the OE-Core side
> > of the changes to implement it (changes are also required to BitBake,
> > the patch for which has been sent to the bitbake-devel list).
> 
> Now when I start a devshell and run "../temp/run.do_compile" warnings
> etc which previously went to the devshell console now end up in file
> "../temp/fido.XXX".
> 
> Would it be possible to fall back to the old behaviour if bitbake
> isn't listening at the other end of the fifo?

Hmm, yes - I hadn't considered this. I'll do that and send it out along with 
fixes for a couple of other minor regressions these changes have caused.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

