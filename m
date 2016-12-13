Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1941D71A31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 04:48:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 12 Dec 2016 20:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="911555611"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.7])
	by orsmga003.jf.intel.com with ESMTP; 12 Dec 2016 20:48:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 17:48:25 +1300
Message-ID: <4153349.TypEQkvbtP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <5cea51d1030f17c4c8fecfb4da3b04bd63a2b6c2.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<5cea51d1030f17c4c8fecfb4da3b04bd63a2b6c2.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] oeqa/sdkext/devtool.py: don't reset when the test is failed
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
X-List-Received-Date: Tue, 13 Dec 2016 04:48:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 16 Nov 2016 22:19:34 Robert Yang wrote:
> The contents are helpful to debug when the error happens.

In this case removing this is OK because we're operating on an eSDK that the 
tests install. However, this wouldn't be appropriate for the devtool oe-
selftest tests since they are operating on the user's build system itself - 
not that you probably have any intention of changing those, I just wanted to 
note that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

