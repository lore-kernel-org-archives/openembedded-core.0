Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6D2A60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:21:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 07 Dec 2015 06:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,395,1444719600"; 
   d="scan'208";a="8901429"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2015 06:21:17 -0800
To: Tom Hochstein <Tom.Hochstein@freescale.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
	<BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
	<CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56659548.8090509@linux.intel.com>
Date: Mon, 7 Dec 2015 16:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Mon, 07 Dec 2015 14:21:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2015 04:13 PM, Otavio Salvador wrote:
>> We're wondering how best to fix this.
>>
>> The Weston website seems to give the answer for a run-time solution, which is basically 'if $DISPLAY is set use weston, otherwise use weston-launch'.
>>
>> http://wayland.freedesktop.org/building.html
>>
>> Is that the right approach? Another possibility is to make it a build-time solution where the bsp layer sets a variable controlling the selection.
>
> Runtime is always better, when possible.

I guess you need to dig deeper into what weston-launch actually does, 
and which are the scenarios when it should be used; the documentation 
isn't particularly helpful here, so maybe you need to ask the upstream 
developers.

Also, whatever fix you come up with, it should also be provided for the 
situation when a native systemd unit file is used instead of the init 
script (a patch for that has been posted here, and should show up in 
master shortly).

Alex


