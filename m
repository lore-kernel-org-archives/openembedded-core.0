Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B928571B86
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 14:03:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2017 06:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="1090083134"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2017 06:03:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170202132602.774-1-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4vpSwsxno7zKN0UNozYTYTo8wCMjOLNO6JApFcWuCEA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1ea96505-775d-6b1a-9316-97991c7d7b33@linux.intel.com>
Date: Thu, 2 Feb 2017 16:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4vpSwsxno7zKN0UNozYTYTo8wCMjOLNO6JApFcWuCEA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Thu, 02 Feb 2017 14:03:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2017 03:47 PM, Burton, Ross wrote:

>              runCmd('bitbake -c cleanall man xcursor-transparent-theme')
>     -        result = runCmd('bitbake man xcursor-transparent-theme -k',
>     ignore_status=True)
>     +        result = runCmd('bitbake -c unpack -k man
>     xcursor-transparent-theme', ignore_status=True)
>
>
> I also have to ask why it does cleanall.  Why isn't clean sufficient?

I guess because it's testing that fetching for one recipe fails but 
unpacking for another recipe succeeds, and getting those tasks to run 
requires cleanall?

Alex


