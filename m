Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7CA6102E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 00:39:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2013 17:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,906,1371106800"; d="scan'208";a="395807913"
Received: from unknown (HELO [10.255.15.78]) ([10.255.15.78])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2013 17:39:08 -0700
Message-ID: <523501AC.4010208@linux.intel.com>
Date: Sat, 14 Sep 2013 17:39:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	"Burton, Ross" <ross.burton@intel.com>, Joe Slater <jslater@windriver.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
In-Reply-To: <CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Sun, 15 Sep 2013 00:39:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2013 12:10 PM, Burton, Ross wrote:
> On 14 September 2013 05:35, Khem Raj <raj.khem@gmail.com> wrote:
>> It does not come with out a price. Have you measured how much performance
>> degradation it brings in ?
>> We need that to assess the trade off and also describe the machine
>> configuration where this option is helping
>
> Agreed - there's a bug which is tracking this from Kai.  As far as I'm
> aware the failure cases are 32-bit hosts (3GB limit per process) or
> 64-bit hosts with limited memory.  I suggested that we benchmark with
> and without this - if the performance hit is measured in seconds then
> we can probably enable it for this recipe out of the box.
>
Joe / Kai:

Please test as Khem and Ross suggest and report back with the results, 
also please include the [YOCTO #5160].

Ross, I am going to assign this to Joe.

Sau!

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

