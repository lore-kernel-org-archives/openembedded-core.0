Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE38260762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 12:20:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 May 2016 05:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="980401738"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2016 05:20:31 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1463557068.git.liezhi.yang@windriver.com>
	<c2290591b4980081070a524be2daeb1de8f79e44.1463557068.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <573DAFC5.5030100@linux.intel.com>
Date: Thu, 19 May 2016 15:21:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <c2290591b4980081070a524be2daeb1de8f79e44.1463557068.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 5/7] buildtools-tarball: remove nativesdk-python-pexpect
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
X-List-Received-Date: Thu, 19 May 2016 12:20:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2016 10:43 AM, Robert Yang wrote:
> It was added for testing, and not needed any more after:

>   meta/recipes-core/meta/buildtools-tarball.bb | 1 -
>   1 file changed, 1 deletion(-)

Same thing: if the pexpect recipe is not needed by anything, then remove it.

Alex


