Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBAC877EAC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:18:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 06:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="270343878"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2017 06:18:05 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
	<CAJTo0LZkZ3Z4vKxjBrbiS8y8NYQ4qYLTGDPmJq5BUZrg8y_sLA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <130f29b1-3a75-4d55-90dd-e6fbfe50a21f@linux.intel.com>
Date: Mon, 5 Jun 2017 16:15:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZkZ3Z4vKxjBrbiS8y8NYQ4qYLTGDPmJq5BUZrg8y_sLA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 13:18:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2017 04:01 PM, Burton, Ross wrote:
>
> On 5 June 2017 at 13:14, Alexander Kanavin
> <alexander.kanavin@linux.intel.com
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
>
>     The patches as they are now require that the C compiler on the host
>     is recent; specifically that it defaults to C11 mode. I'm not sure
>     when GCC made the switch, but it works that way with GCC 6.3.0.
>
>
> Isn't that just a compiler flag away from being fixed?

Not if the compiler is 4.8 or earlier; it has to support _Atomic (a C11 
feature), which only appeared in 4.9.


Alex


