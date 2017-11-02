Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA544782BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 15:30:48 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 08:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,334,1505804400"; d="scan'208";a="145174524"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 02 Nov 2017 08:30:20 -0700
To: Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
	<CAMKF1soe__AzR_0O4YHMup1hd1U4jdc6Vq8O-Jt4Fc87HwAnHQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5256d5a7-4060-b00a-07db-ca3b993bc853@linux.intel.com>
Date: Thu, 2 Nov 2017 17:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soe__AzR_0O4YHMup1hd1U4jdc6Vq8O-Jt4Fc87HwAnHQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 15:30:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/02/2017 05:28 PM, Khem Raj wrote:

>      >> Can you drop this, and simply rename the recipe to
>     musl_1.1.18.bb <http://musl_1.1.18.bb> please?
>      >
>      > Why? keeping it on _git makes sense to me.
> 
> 
> We always use a given srcrev always this time
> It just happens to match with release

But why the need to pick mid-development commits, rather than stick with 
tagged releases?

Alex

