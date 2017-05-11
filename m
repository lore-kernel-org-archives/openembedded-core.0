Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD5D60269
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 07:53:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 May 2017 00:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,323,1491289200"; d="scan'208";a="1128911079"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2017 00:53:41 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <63467164-76aa-2aa7-efab-ec82251b7aaf@linux.intel.com>
Date: Thu, 11 May 2017 10:53:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 11 May 2017 07:53:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 12:24 PM, Burton, Ross wrote:
> The development of Wayland does make the long-term prospect of Sato
> interesting: do we port Sato to Wayland too, or keep the Wayland images
> using the standard Weston demo shell?

There is a third option: find a functional, pretty, lightweight wayland 
shell, and provide that. I think the prime candidate for that at the 
moment is Maynard, but it has its own issues, mainly that upstream isn't 
really developing it anymore. Jussi is OOO this week, maybe he can add 
his 2c a bit later.

https://github.com/raspberrypi/maynard/wiki


Alex

