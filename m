Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C01066E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:28:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2017 05:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,505,1500966000"; d="scan'208";a="137052558"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 Oct 2017 05:28:54 -0700
To: =?UTF-8?Q?=c3=98ystein_Walle?= <oystwa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171010120012.20163-1-oystwa@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <33c05071-504f-897e-48d7-c3e6ddaefaaa@linux.intel.com>
Date: Tue, 10 Oct 2017 15:25:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171010120012.20163-1-oystwa@gmail.com>
Cc: =?UTF-8?Q?=c3=98ystein_Walle?= <ow@datarespons.no>
Subject: Re: [PATCH] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:28:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/10/2017 03:00 PM, Øystein Walle wrote:

> -set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
> +set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )

Where is the typo and what is it, exactly?

Alex

