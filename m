Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 06B7D7680A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 22:52:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 14:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="910609871"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2016 14:52:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 11:52:35 +1300
Message-ID: <1629258.jkM8Gdqopn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <20160224163304.55482wad36phjtmo@astoria.ccjclearline.com>
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
	<CABcZAN=RefHwBnF+8oEu6uDmxe-LCMoVs94XK=MOEsr7VmJ6xw@mail.gmail.com>
	<20160224163304.55482wad36phjtmo@astoria.ccjclearline.com>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 22:52:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 24 Feb 2016 16:33:04 Robert P. J. Day wrote:
> Quoting Christopher Larson <clarson@kergoth.com>:
> > All appends that apply to a given recipe will be applied to that recipe.
> > Order is determined solely by layer priority.
> 
>    wait ... so *all* bbappend files that match a recipe will be applied?
> i'm embarrassed that i didn't know that, is that mentioned in the
> documentation somewhere?

Surprisingly we don't currently state this explicitly, though it's implied. We 
should work this into the relevant part of the bitbake manual and the "Using 
.bbappend Files" section of the dev manual. Scott could you add that to your 
todo list?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

