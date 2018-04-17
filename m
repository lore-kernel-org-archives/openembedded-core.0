Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0D760116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 20:22:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Apr 2018 13:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; d="scan'208";a="192263062"
Received: from soumyash-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.163])
	by orsmga004.jf.intel.com with ESMTP; 17 Apr 2018 13:22:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Date: Wed, 18 Apr 2018 08:22:19 +1200
Message-ID: <20597063.F8YWRiApNN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <655290B7709079438B7932553958E60DA1475DFB@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
	<ae893466-d904-e9e2-005e-a5c750eaf179@xilinx.com>
	<655290B7709079438B7932553958E60DA1475DFB@ESS-EX01.essvote.corp.local>
MIME-Version: 1.0
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Tue, 17 Apr 2018 20:22:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Michael,

On Wednesday, 18 April 2018 8:03:43 AM NZST Davis, Michael wrote:
> Actually just recreated it without all my custom cruft in there to confuse
> things.
> 
> I had oe-init-build-env generate a new build dir:
> "source oe-init-build-env  ~/build/test"
> 
> Added the following to the bottom of the local.conf
> TOOLCHAIN_HOST_TASK += " nativesdk-cmake \
>                          nativesdk-python3"
> 
> Create the sdk:
> " bitbake core-image-minimal -c do_populate_sdk_ext"

I'm afraid this is not the correct way to add items to the eSDK. See:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=10600
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9479

I think at the moment what you need is:

SDK_TARGETS += "cmake-native:do_populate_sysroot \
                           python3-native:do_populate_sysroot"


Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



