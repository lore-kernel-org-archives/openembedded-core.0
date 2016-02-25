Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8269E772F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:58:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2016 05:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="920980739"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2016 05:58:15 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
	<56BCDC10.8050901@gmail.com> <56C33375.4040200@linux.intel.com>
	<56C3465B.7020702@gmail.com> <56CD9A1F.2060101@linux.intel.com>
	<56CDE61F.7020808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CF07D4.3030206@linux.intel.com>
Date: Thu, 25 Feb 2016 15:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56CDE61F.7020808@gmail.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Thu, 25 Feb 2016 13:58:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2016 07:19 PM, akuster808 wrote:

> Many vulnerability notifications will make the same statements.
>
> Updating a package that other packages depend on can cause a cascading
> set of failures. Now you have a bigger set of problems to contend with.

I don't think the possibility of failures is a bigger problem than the 
certainty of having to backport a huge number of CVE fixes within a 
codebase that you don't understand.

Many of those are not a matter of cherry-picking the right patch; they 
require actual webkit expertise, because the code has changed too much 
in the meantime. Also, each webkit build takes hours, which slows things 
down even more. Do you have the resources for all of that?

>  From the commercial side you just can't move your install base to the
> latest package versions for every security issue. The Yocto maintenance
> policy operates very close to this too.

I think you need to make an exception for webkit, and explain this to 
your customers.

Alex


