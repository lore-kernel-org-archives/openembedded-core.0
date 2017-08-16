Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 740957866B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:51:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 01:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="124138361"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2017 01:51:31 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7384ca55-19b7-15c3-162c-f7d568b15ad7@linux.intel.com>
Date: Wed, 16 Aug 2017 11:48:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
Cc: peter.kjellerstedt@axis.com
Subject: Re: [PATCH 0/6] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Wed, 16 Aug 2017 08:51:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/16/2017 12:19 AM, Mark Hatle wrote:
>  From the comments to the original patch, the only not addressed was adding
> an OE self-test for this behavior.  I tried to do this, but I don't see any
> existing tests that build a recipe and inspect the results of the built
> package.  I'm not sure of any other way to identify if things are working or
> not.

You can add a recipe to the meta-selftest layer that builds successfully 
only when this behaviour is working properly, and then build it in the 
selftest.


Alex

