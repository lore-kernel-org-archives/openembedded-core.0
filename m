Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 307BF6D2F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 10:29:52 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Oct 2013 03:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="378755840"
Received: from unknown (HELO [10.255.12.19]) ([10.255.12.19])
	by azsmga001.ch.intel.com with ESMTP; 23 Oct 2013 03:29:52 -0700
Message-ID: <5267A51F.6050906@linux.intel.com>
Date: Wed, 23 Oct 2013 03:29:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Kai Kang <kai.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1382512567.git.kai.kang@windriver.com>
In-Reply-To: <cover.1382512567.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Migrate lua from meta-oe
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
X-List-Received-Date: Wed, 23 Oct 2013 10:29:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2013 12:18 AM, Kai Kang wrote:
> The following changes since commit ffb440c37c3491fa5d9a1408341f7c15eacdc9ce:
>
>    midori: exclude from self-hosted for mips64 (2013-10-23 07:18:54 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/lua
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lua
>
> Kai Kang (1):
>    lua: add lua recipe
>
Why?

You talk about the migration, but git no indication of why this should 
be moved into OE-Core, this was discussed recently (Late July, Early 
August) when Randy MacLeod proposed it and it was rejected then.

Sau!

>   meta/recipes-devtools/lua/lua/lua.pc               | 11 +++++
>   meta/recipes-devtools/lua/lua/uclibc-pthread.patch | 13 ++++++
>   meta/recipes-devtools/lua/lua_5.2.2.bb             | 49 ++++++++++++++++++++++
>   3 files changed, 73 insertions(+)
>   create mode 100644 meta/recipes-devtools/lua/lua/lua.pc
>   create mode 100644 meta/recipes-devtools/lua/lua/uclibc-pthread.patch
>   create mode 100644 meta/recipes-devtools/lua/lua_5.2.2.bb
>

