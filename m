Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89FE1783D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 11:19:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 04:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,372,1498546800"; d="scan'208";a="889734270"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2017 04:19:20 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1502465021.git.markus.lehtonen@linux.intel.com>
	<04a99644f879ebd4539f3819d4c641ac1c51ba89.1502465021.git.markus.lehtonen@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fd3f230d-e551-a44d-0a8c-b66750f5023c@linux.intel.com>
Date: Mon, 14 Aug 2017 14:16:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <04a99644f879ebd4539f3819d4c641ac1c51ba89.1502465021.git.markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH v2 7/7] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Mon, 14 Aug 2017 11:19:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/11/2017 06:35 PM, Markus Lehtonen wrote:
>   
>           import re
> -        output_makecache = self.dnf('makecache')
> +        output_makecache = self.dnf('-y makecache')

Why add '-y'? Can you add a comment (just prior to this line) explaining 
what question dnf is asking?

> +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
>           self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
>   
>           output_repoinfo = self.dnf('repoinfo')

Do 'makecache' or 'repoinfo' print any indication that repo signing is 
in use and working correctly? Can you check for presence of that in the 
commands' output?

Alex

