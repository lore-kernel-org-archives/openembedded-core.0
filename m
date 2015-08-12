Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 756A0734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:43:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Aug 2015 09:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,662,1432623600"; d="scan'208";a="747268531"
Received: from sgwillia-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.17.140])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2015 09:42:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 17:42:53 +0100
Message-ID: <3479404.DlVCyBLpXs@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <cover.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/8] Extensible SDK fixes
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
X-List-Received-Date: Wed, 12 Aug 2015 16:43:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 August 2015 11:17:58 Chen Qi wrote:
> The following changes since commit 288c76a41aebaf54c7fca3782160830df462b9e4:
> 
>   builder: Fix multilib compile failure (2015-08-03 07:15:47 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib ChenQi/sdktool
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=Chen
> Qi/sdktool
> 
> Chen Qi (8):
>   populate_sdk_ext: install the latest buildtools-tarball
>   copy_buildsystem: make sure bitbake directory is copied
>   populate_sdk_ext: consider custom configuration in local.conf
>   populate_sdk_ext: don't remove the native qemu dependencies
>   Extensible SDK: allow for installation without preparing build system
>   oe-publish-sdk: add script
>   populate_sdk_ext: record SDK_TARGETS in devtool.conf
>   devtool: add sdk.py plugin

FWIW I'm happy with patches 1-5; the rest need minor work, however 1-5 can 
probably go in ahead without them.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

