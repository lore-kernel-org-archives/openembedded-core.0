Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B85DD71B5A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 16:00:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 04 Nov 2016 09:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,443,1473145200"; d="scan'208";a="27833217"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga004.jf.intel.com with ESMTP; 04 Nov 2016 09:00:07 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <44145dc1-a9cf-7191-3c74-ce23b9aa2aaf@linux.intel.com>
Date: Fri, 4 Nov 2016 10:04:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 0/2] Time zone update to 2016i
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
X-List-Received-Date: Fri, 04 Nov 2016 16:00:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Armin, I am trying to patch your series but I get this error:

git pw mbox 3757 -r 1 | git apply --check
error: meta/recipes-extended/tzcode/tzcode-native_2016h.bb: No such file 
or directory
error: meta/recipes-extended/tzdata/tzdata_2016h.bb: No such file or 
directory


BTW, 3757 is the series ID located at patchwork instance.

On 11/03/2016 11:53 PM, Armin Kuster wrote:
> These applied on top of 2016h I sent on 10-23
>
> Armin Kuster (2):
>    tzcode: update to 2016i
>    tzdata: update to 2016i
>
>   .../tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb}     | 8 ++++----
>   meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
>   rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)
>   rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)
>


