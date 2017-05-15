Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F07171C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:44:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="1147907670"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2017 04:44:18 -0700
To: Yuqing Zhu <carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
	<CAHiDW_GksyO+YLMzejrL+9=tgw4wdAPrRjHf32h321fi=_F2ag@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9678201e-569c-33dc-4844-8f249fa28780@linux.intel.com>
Date: Mon, 15 May 2017 14:42:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GksyO+YLMzejrL+9=tgw4wdAPrRjHf32h321fi=_F2ag@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.10.4
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
X-List-Received-Date: Mon, 15 May 2017 11:44:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2017 02:37 PM, Jussi Kukkonen wrote:

> The patches could be considered for Pyro (not too fond of backported new
> features though -- I don't think oe-core should normally do that).

Yes; you do need to explain why these are useful to oe-core users in 
general.

There's a ton of gstreamer bugfixes that can be backported in a similar 
way, so why these and not the others?


Alex

