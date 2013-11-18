Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD1F6D125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:53:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2013 07:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="437190569"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2013 07:53:47 -0800
Message-ID: <528A380B.4020009@linux.intel.com>
Date: Mon, 18 Nov 2013 07:53:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1384776180.6460.218.camel@ted>	<CAJTo0LZZg3tsdVCSFQBzb_J2bSmCcJY9PwuXRuiGW3ZX2y6q_w@mail.gmail.com>	<1384778925.6460.229.camel@ted>
	<CAJTo0LYapCtQOmaMYtft_wEBsZFZ9NATE1w5cUZrVon_cdzVSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYapCtQOmaMYtft_wEBsZFZ9NATE1w5cUZrVon_cdzVSQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 15:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2013 06:21 AM, Burton, Ross wrote:
> On 18 November 2013 12:48, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2013-11-18 at 12:33 +0000, Burton, Ross wrote:
>>> On 18 November 2013 12:03, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> recipes-sato/puzzles/puzzles_r9765.bb:SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
>>>
>>> Seems like a pretty good reason to ditch puzzles, IMHO.
>>
>> Somehow I knew you'd say that. I still maintain those make a great
>> demo/test app. I'm sure we could just point at a tarball by default for
>> this ;-).
>
> Isn't puzzles the upstream that re-generates tarballs so the checksums
> suddenly change?
>
Yup, that's the one, and they don't keep the older tarballs around 
either, a real pain!

Sau!

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

