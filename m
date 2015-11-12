Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7C92577211
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:17:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 12 Nov 2015 03:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,281,1444719600"; d="scan'208";a="683753845"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 12 Nov 2015 03:16:58 -0800
Message-ID: <5644756C.2060607@linux.intel.com>
Date: Thu, 12 Nov 2015 13:18:04 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>		<5641FF6D.7000508@linux.intel.com>		<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>		<564207E6.9090409@linux.intel.com>		<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>		<56420AE4.1090500@linux.intel.com>	
	<CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>	
	<56420F4A.9030507@linux.intel.com>
	<1447262253.3559.249.camel@linuxfoundation.org>
In-Reply-To: <1447262253.3559.249.camel@linuxfoundation.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Thu, 12 Nov 2015 11:17:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2015 07:17 PM, Richard Purdie wrote:
>>
>> If this class is moved to meta-vala, how do you make packages in oe-core
>> inherit it, or otherwise do what it does?
>
> Much as I dislike this, you could do something like:
>
> inherit ${@base_contains('PACKAGECONFIG', 'vala', 'vala', '')}

Ugh, yes. It's an optional circular dependency and an opaque side effect 
rolled in one.

I'd rather go with bbappends in meta-vala (even though having them means 
that oe-core has failed to serve the needs of meta-vala users), or just 
keep vala in oe-core - it's not big and doesn't have special needs.

Alex


