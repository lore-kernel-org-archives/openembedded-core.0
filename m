Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEB6766DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:26:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 07:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,746,1432623600"; d="scan'208";a="631903848"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by orsmga003.jf.intel.com with ESMTP; 25 Aug 2015 07:26:39 -0700
Message-ID: <55DC7B62.5050704@linux.intel.com>
Date: Tue, 25 Aug 2015 09:27:46 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<8a6c98b192128c361fe5d5692b0f1d23f1cfcbad.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CABcZANkAWDD5Heo+gd4G+dVuOakL1tf7qt6Qz0-Teq6_FVCDaQ@mail.gmail.com>
In-Reply-To: <CABcZANkAWDD5Heo+gd4G+dVuOakL1tf7qt6Qz0-Teq6_FVCDaQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] insane.bbclass: Check for invalid characters (non UTF8) on recipe metadata
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
X-List-Received-Date: Tue, 25 Aug 2015 14:26:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08/17/2015 05:57 PM, Christopher Larson wrote:
> On Mon, Aug 17, 2015 at 12:10 AM, <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Check if invalid characters are present on recipe's metadata. Fields
>> taken into account are: 'DESCRIPTION', 'SUMMARY', 'LICENSE' and 'SECTION'.
>>
>> Signed-off-by: Leonardo Sandoval <
>> leonardo.sandoval.gonzalez@linux.intel.com>
>>
>
> This commit message doesn't define what "invalid" is.

I will send a v3 to include what invalid means on this context. 
Basically all non-UTF8 characters are considered invalid.


>

