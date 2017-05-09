Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4FD71A54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 08:05:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 09 May 2017 01:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="84461929"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2017 01:05:33 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
Date: Tue, 9 May 2017 11:05:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 May 2017 08:05:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 01:15 AM, Paul Eggleton wrote:
>> LXDE in particular is Gtk2 based, it's no longer being developed, and
>> has been superseded by LXQt. So it's a non-starter (and so is LXQt,
>> which should be clear from its name :).
>
> FWIW I think this is a little short-sighted. Why are we ruling out Qt exactly?

We would first have to agree that Qt5 belongs in oe-core with 
appropriate level of maintenance and QA, and that it's okay to add half 
an hour or more to the building time of a standard GUI image.

 From the screenshots of LxQT, it looks like yet another Win95 clone 
meant strictly for desktop use that would certainly scale poorly to 
small resolution screens. Who would be the target audience for it in the 
embedded space? For the purposes of 'engineering UI', Sato is fine, and 
we don't need something else.

Alex

