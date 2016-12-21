Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2EB6612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:20:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6KsuZ025670
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Dec 2016 22:20:54 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:20:54 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
	<CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <289c6330-43b8-1855-e3de-984bd56c10a8@windriver.com>
Date: Wed, 21 Dec 2016 14:20:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] Fixes for eSDK and testsdkext
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
X-List-Received-Date: Wed, 21 Dec 2016 06:20:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

I rebased and tested again it in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/eSDK
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK

Robert Yang (8):
   populate_sdk_ext.bbclass: break the long lines
   populate_sdk_ext.bbclass: install multilib SDKs
   oeqa/sdkext/devtool.py: remove sources before run test cases
   oe-publish-sdk: make cmd easier to read
   oe-publish-sdk: add pyshtables.py to .gitignore
   oeqa/oetest.py: add hasLockedSig()
   oeqa/sdkext/devtool.py: skip a testcase when no libxml2
   oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN

// Robert

On 12/20/2016 11:41 PM, Burton, Ross wrote:
> This doesn't apply to master since Josh's getVar() changes landed, can you
> please rebase?
>
> Ross
>
> On 14 December 2016 at 07:24, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * V2
>       1) Fix Paul's comments:
>          - Drop "don't reset when the test is failed"
>          - Update bug id for "oe-publish-sdk: add pyshtables.py to .gitignore"
>          - Split "install multilib targets as populate_sdk does" into 2 commits:
>            "break the long lines"
>            "install multilib SDKs"
>       2) Use shorter subject lines
>
>     * V1
>       Initial version
>
>     // Robert
>
>     The following changes since commit 4e412234c37efec42b3962c11d44903c0c58c92e:
>
>       libpcap: Disable exposed bits of WinPCAP remote capture support
>     (2016-12-13 22:47:35 +0000)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> rbt/eSDK
>
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK
>     <http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK>
>
>     Robert Yang (8):
>       populate_sdk_ext.bbclass: break the long lines
>       populate_sdk_ext.bbclass: install multilib SDKs
>       oeqa/sdkext/devtool.py: remove sources before run test cases
>       oe-publish-sdk: make cmd easier to read
>       oe-publish-sdk: add pyshtables.py to .gitignore
>       oeqa/oetest.py: add hasLockedSig()
>       oeqa/sdkext/devtool.py: skip a testcase when no libxml2
>       oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
>
>      meta/classes/populate_sdk_ext.bbclass | 63 ++++++++++++++++++++++++-----------
>      meta/lib/oe/copy_buildsystem.py       | 18 ++++++++++
>      meta/lib/oeqa/oetest.py               | 13 ++++++++
>      meta/lib/oeqa/sdkext/devtool.py       |  8 ++++-
>      scripts/oe-publish-sdk                | 19 +++++++++--
>      5 files changed, 98 insertions(+), 23 deletions(-)
>
>     --
>     2.10.2
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>

