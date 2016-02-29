Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 582E477158
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:11:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Feb 2016 06:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="755228088"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 29 Feb 2016 06:11:02 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
	<ee2f85dff95a4baf789aec41cd5407c0df5c836e.1448547850.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LZ1ten9Z6uuCDpPd-mCVn76QgxTMO-U5Qirfsr5tQNo_w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56D45096.1080402@linux.intel.com>
Date: Mon, 29 Feb 2016 16:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ1ten9Z6uuCDpPd-mCVn76QgxTMO-U5Qirfsr5tQNo_w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/29] gobject-introspection: add the recipe
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
X-List-Received-Date: Mon, 29 Feb 2016 14:11:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2016 06:35 PM, Burton, Ross wrote:
>     +# No idea why these sources are installed by upstream and how they
>     are meant to be used
>     +FILES_${PN}-dev_append = "
>     ${datadir}/gobject-introspection-1.0/tests/*.c \
>     +                   ${datadir}/gobject-introspection-1.0/tests/*.h"
>
>
> Presumably some test suite.  We certainly don't want them in the -dev
> package, so until we have ptest for this lets just delete them.

Actually, no, these sources are used by dependent packages (for example, 
pygobject) to build *their* test suites. So this has to go to -dev, and 
I'll fix the comment which I forgot to do.


Alex

