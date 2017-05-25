Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0749977FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 08:08:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 01:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,390,1491289200"; d="scan'208";a="1174124491"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2017 01:08:06 -0700
To: Jose Lamego <jose.a.lamego@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
	<237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
	<1494851042.1179.246.camel@intel.com>
	<CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
	<3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <128b693d-588c-e1be-0720-6c6954b4651c@linux.intel.com>
Date: Thu, 25 May 2017 11:06:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Thu, 25 May 2017 08:08:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2017 11:54 PM, Jose Lamego wrote:
> Sorry is miss this message.
>
> The command line is missing the squared brackets (the following should
> do the work since I may have permissions):
>
> [Patchwork-Status: Rejected]
>
> Guys: Do you believe we should drop the brackets requirement?

You can support both brackets and no-brackets.

The problem is that this feature is not documented, nobody knows about 
it, and we lack established practices around it. Who should be using it? 
I'd say only the author of the patch or people with commit rights to 
master (RP, Ross).

Alex


