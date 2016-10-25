Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B23BD71A60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 02:18:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 24 Oct 2016 19:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,544,1473145200"; d="scan'208";a="23247223"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.176])
	by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2016 19:18:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 25 Oct 2016 15:18:27 +1300
Message-ID: <17591012.2y05genbPg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <alpine.LFD.2.20.1610240549440.28159@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
	<alpine.LFD.2.20.1610240549440.28159@ca624034.mitel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Tue, 25 Oct 2016 02:18:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 24 Oct 2016 05:51:16 Robert P. J. Day wrote:
> On Sat, 22 Oct 2016, Khem Raj wrote:
> > I would recommend to try using eSDK, which can be generated using
> > -cpopulate_sdk_ext see
> > 
> > https://wiki.yoctoproject.org/wiki/Application_Development_with_Extensible
> > _SDK
>   just reading up on eSDKs now, am i correct in assuming that if i
> have the time and space to build an eSDK, there is no downside
> compared to building a standard SDK? as in, i don't lose anything from
> the standard SDK, i just get a richer feature set, etc.

Mostly correct, especially for master/morty where we sorted out the lack of
gdb and a few scripts required to support the Eclipse plugin. There are
differences though - please see the introduction of the latest SDK manual [1]
for a comparison chart.

Cheers,
Paul

[1] http://www.yoctoproject.org/docs/latest/sdk-manual/sdk-manual.html#sdk-manual-intro

-- 

Paul Eggleton
Intel Open Source Technology Centre

