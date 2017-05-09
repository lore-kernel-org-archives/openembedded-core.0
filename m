Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8946A71A39
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 08:10:48 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 May 2017 01:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="85235131"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 May 2017 01:10:48 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<CAJTo0LY67aoeeHiNXDSA+FYmEYMQdw3tq1_N7+N=a9xq9nyPiw@mail.gmail.com>
	<CAMKF1spO7Crq+rqse5BMrShom1tSGBuoY5zm1yL1eS2K2zfN-g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9779c7ca-6b12-a4d8-9fe4-c23c950ccfa3@linux.intel.com>
Date: Tue, 9 May 2017 11:10:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spO7Crq+rqse5BMrShom1tSGBuoY5zm1yL1eS2K2zfN-g@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 08:10:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 01:50 AM, Khem Raj wrote:
> A general usecase is that someone takes the reference and tweaks it to
> meet the needs of a product quickly. For such usecases, it would be good to
> consider the most widely used UI framework in embedded space. I
> personally don't know how much sato is deployed but QT based systems
> are quite widely deployed as far as I know. I think users can drive maximum
> out of the testing and stabilization we do if they were using the reference
> software as much as possible.

Qt itself does not provide a UI, so we would need to find an appropriate 
qt-based replacement for Sato that has the same characteristics and is 
suitable as an 'engineering UI'. What is your suggestion for that?

I personally think meta-qt5 works fine; it's only missing a reference UI 
environment. Why not add LxQt to that layer?


Alex

