Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8052D73286
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:21:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 08 Feb 2016 02:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,415,1449561600"; d="scan'208";a="879382316"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2016 02:21:45 -0800
To: openembedded-core@lists.openembedded.org
References: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
	<CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56B86B81.7030000@linux.intel.com>
Date: Mon, 8 Feb 2016 12:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
Subject: Re: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Mon, 08 Feb 2016 10:21:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2016 04:26 PM, Burton, Ross wrote:

> This impacts master too, so I've merged this into ross/mut and endorse
> it for Jethro.
>
> I've also a filed a bug against QA so we notice this breaking on the
> autobuilder...

Yes please; we have all the needed infrastructure to notice these 
regressions via automated testing before they make their way into master.

Alex


