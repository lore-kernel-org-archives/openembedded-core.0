Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 55CE47754D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 20:16:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 13:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,293,1470726000"; d="scan'208";a="165123872"
Received: from ddominic-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.151.171])
	by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2016 13:16:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 07 Sep 2016 08:16:12 +1200
Message-ID: <1844223.HiLeg694VU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.2-101.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <lywpipvxhx.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
	<d4044adfd000c8b67ed9b523bfbfc49ca97e8fa7.1473155977.git.paul.eggleton@linux.intel.com>
	<lywpipvxhx.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] lib/oe/patch: handle non-UTF8 encoding when reading patches
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
X-List-Received-Date: Tue, 06 Sep 2016 20:16:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Enrico,

On Tue, 06 Sep 2016 17:50:02 Enrico Scholz wrote:
> Paul Eggleton <paul.eggleton-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> writes:
> > When extracting patches from a git repository with PATCHTOOL = "git" we
> > cannot assume that all patches will be UTF-8 formatted, so as with other
> > places in this module, try latin-1 if utf-8 fails.
> 
> This will probably not work when patch contains a character between 128
> and 159 (which is a blackhole in all locales afaik).

I realise it's by no means perfect - you may even fairly label it a hack, 
since it's only handling two encodings out of many. However I was keen to at 
least restore the ability to handle the majority of patches we have in the 
core, we can always improve it subsequently (even before the release).
 
> I would read the file as a binary ('rb' instead of 'r') and make the
> GitApplyTree.* strings a 'bytes' type.

The code is not just passing the data through, it is actually processing it. 
If we did what you propose wouldn't it make that processing more difficult? 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

