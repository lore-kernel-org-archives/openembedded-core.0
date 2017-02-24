Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 829C5774F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 09:50:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1O9oW8w023015
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 01:50:32 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 01:50:32 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9a8cfb09-2633-54b9-46b5-8f8d203563e8@windriver.com>
Date: Fri, 24 Feb 2017 17:50:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1487727826.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/5] Packages upgrade
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
X-List-Received-Date: Fri, 24 Feb 2017 09:50:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Mike Crowe has done the upgrade for ccache, so I removed it from the PULL:

The following changes since commit 65cfc8aca3ff7e39453977a0215a350d13cb85ef:

   libva: Find the correct wayland-scanner (2017-02-23 12:29:21 -0800)

are available in the git repository at:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (4):
   strace: 4.15 -> 4.16
   guile: 2.0.13 -> 2.0.14
   slang: 2.3.1 -> 2.3.1a
   file: 5.29 -> 5.30


// Robert

On 02/22/2017 09:44 AM, Robert Yang wrote:
> The following changes since commit def3800c7e58d9d1b54ea1df27b190a0f6d1d544:
>
>   layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:38:59 -0800)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/PU
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU
>
> Robert Yang (5):
>   strace: 4.15 -> 4.16
>   guile: 2.0.13 -> 2.0.14
>   slang: 2.3.1 -> 2.3.1a
>   ccache: 3.3.3 -> 3.3.4
>   file: 5.29 -> 5.30
>
>  .../ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb}    |  6 +--
>  .../file/{file_5.29.bb => file_5.30.bb}            |  2 +-
>  .../guile/{guile_2.0.13.bb => guile_2.0.14.bb}     |  4 +-
>  .../strace/strace/Makefile-ptest.patch             | 13 +++---
>  .../strace/strace/disable-git-version-gen.patch    | 18 ++++----
>  .../strace/strace/use-asm-sgidefs.h.patch          | 51 ----------------------
>  .../strace/{strace_4.15.bb => strace_4.16.bb}      |  7 ++-
>  .../slang/{slang_2.3.1.bb => slang_2.3.1a.bb}      |  4 +-
>  8 files changed, 27 insertions(+), 78 deletions(-)
>  rename meta/recipes-devtools/ccache/{ccache_3.3.3.bb => ccache_3.3.4.bb} (48%)
>  rename meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} (96%)
>  rename meta/recipes-devtools/guile/{guile_2.0.13.bb => guile_2.0.14.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
>  rename meta/recipes-devtools/strace/{strace_4.15.bb => strace_4.16.bb} (84%)
>  rename meta/recipes-extended/slang/{slang_2.3.1.bb => slang_2.3.1a.bb} (93%)
>

