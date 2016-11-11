Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CF56671A72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 18:43:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 11 Nov 2016 10:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,474,1473145200"; 
   d="scan'208";a="2983962"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2016 10:43:14 -0800
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1478863703-12920-1-git-send-email-sona.sarmadi@enea.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <53a10e76-e81a-5851-0c8d-b5725d28836c@linux.intel.com>
Date: Fri, 11 Nov 2016 12:48:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1478863703-12920-1-git-send-email-sona.sarmadi@enea.com>
Cc: sona@enea.se
Subject: Re: [PATCHv4][krogoth] curl: CVE-2016-8625
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
X-List-Received-Date: Fri, 11 Nov 2016 18:43:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sona, can you rebase this patch on top of krogoth and send it again.

I tried patching it with this result

$ git pw mbox 3865 -r 1 | git apply --check
error: patch failed: meta/recipes-support/curl/curl_7.47.1.bb:25
error: meta/recipes-support/curl/curl_7.47.1.bb: patch does not apply



On 11/11/2016 05:28 AM, Sona Sarmadi wrote:
> IDNA 2003 makes curl use wrong host
>
> Affected versions: curl 7.12.0 to and including 7.50.3
> Reference:
> https://curl.haxx.se/docs/adv_20161102K.html
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>


