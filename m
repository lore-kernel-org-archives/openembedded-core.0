Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4661471957
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 20:39:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 09 May 2017 13:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,316,1491289200"; d="scan'208";a="97735520"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 09 May 2017 13:39:51 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
	<CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
Date: Tue, 9 May 2017 23:39:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 09 May 2017 20:39:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 11:19 PM, Khem Raj wrote:
> I think we should always intend to align the reference stack with
> whats commonly used in
> userbases we target to address with project, we will not be serving
> the project goals and its username if we
> trim down to packages which are just used for reference, if majority of the
> community we intend to address uses QT or any other stack for that matter
> then we should align our requirements accordingly which will be mutually
> beneficial IMO

I strongly disagree. Oe-core is not a Greatest Embedded Hits collection 
or any kind of 'reference stack', and decisions on what goes into it 
should not be based on how popular it is. If you do this, you risk 
overextending the layer, and ending up not doing a particularly good job 
on any of the things it tries to do. It's best to allow other layers to 
flourish, let the domain specialists do their job and decide for 
themselves how they want to do things, and have a curated list of layers 
that are known to be high quality and approved by Yocto Project.

If you want qt5, use meta-qt5 and meta-b2qt, both made by people who 
actually develop the Qt stack itself. End of story.

Alex


