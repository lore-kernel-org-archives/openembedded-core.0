Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E3DF27200F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 22:56:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 14:56:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,322,1413270000"; d="scan'208";a="617844989"
Received: from unknown (HELO [10.255.13.89]) ([10.255.13.89])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2014 14:52:33 -0800
Message-ID: <545AAA30.40604@linux.intel.com>
Date: Wed, 05 Nov 2014 14:52:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKqZU0SpC_T_jYLExYKYLXQkLyv_7Vy7GW-9uA=_wBjLhQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqZU0SpC_T_jYLExYKYLXQkLyv_7Vy7GW-9uA=_wBjLhQ@mail.gmail.com>
Subject: Re: [for-daisy] Pseudo backport breaks build in some hosts
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
X-List-Received-Date: Wed, 05 Nov 2014 22:56:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2014 12:34 PM, Otavio Salvador wrote:
> Hello,
>
> In clean hosts the pseudo build is broken. It seems to be lacking the
> attr dependency which has been added during the Dizzy development
> cycle but not included when doing the backport for Daisy; I suspect it
> has not been detected in Yocto Project AB because it should have attr
> headers available.
>
We actually just completed a full pass QA cycle on what was to be 
1.6.2rc1, we found a couple of issues that are being address (like we 
forgot to bump the actual Poky DISTRO_VERSION and the build-appliance 
rev). Along with a couple more CVE patches that have come in.  As you 
point out it did go through a full AB, which has different Linux OS 
setups.  The fact that this was missed, I am not sure.

> We seem to need a better way to test backports as this is the second
> time backports has included regressions. I think we ought to have a
> daisy-next (and likely dizzy-next) branches with intended fixes for
> easy testing outside of Yocto Project AB and get wider exposure for
> different host setups.
>
So I have been pushing my changes to daisy-next prior to them being 
merged into daisy itself.  You are welcome to pull from it, test it and 
report back, just beware that it can be rebased.

Sau!


> Best Regards,
>

