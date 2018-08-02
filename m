Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 55E2978AD2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:32:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 18:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,434,1526367600"; d="scan'208";a="221049870"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.171])
	([10.221.21.171])
	by orsmga004.jf.intel.com with ESMTP; 01 Aug 2018 18:32:33 -0700
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
	<MWHPR02MB27684D092677AC56F96464DAAF2C0@MWHPR02MB2768.namprd02.prod.outlook.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <c376a5fc-807d-6475-9be7-0203ac703b35@intel.com>
Date: Thu, 2 Aug 2018 09:32:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <MWHPR02MB27684D092677AC56F96464DAAF2C0@MWHPR02MB2768.namprd02.prod.outlook.com>
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 01:32:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/02/2018 08:27 AM, Jaewon Lee wrote:
> Hi Anuj,
> 
> Thanks for the reply
> That is a good point, will send a v2 that also deals with patches.
> Regarding other scc files,  according to the kernel dev manual, 
> "It is only necessary to specify the .scc files on the SRC_URI."
> 
> So from my understanding all scc files will be in SRC_URI which means they get parsed by this fix, 
> Is this not the case?
If a scc file, foo.scc, includes any other scc file say bar.scc, then it
isn't mandatory to specify bar.scc as part of SRC_URI I think.

You can give it a try by creating empty sccs and including a malformed
patch in a nested scc to see if you get an error while patching.

Thanks,

Anuj

