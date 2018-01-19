Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 777AB6011B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 01:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0J1qEoh025533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 17:52:14 -0800 (PST)
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 18 Jan 2018 17:52:13 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <478e1c81-4c65-66cc-6cd6-3ed01ff9fcc9@windriver.com>
Date: Fri, 19 Jan 2018 09:52:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/5] fix build when len(TMPDIR) == 410
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
X-List-Received-Date: Fri, 19 Jan 2018 01:52:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 11/30/2017 09:45 AM, Robert Yang wrote:
> The following changes since commit 33418ed064fe9cff5b4803f09135a81d9170c189:
> 
>    runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:36 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/long
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/long
> 
> Robert Yang (5):
>    go-native: fix PATH issue when len(TMPDIR) == 410
>    go-native: fix import error when len(TMPDIR) == 410
>    ninja: fix for llvm build when len(TMPDIR) == 410
>    webkitgtk: fix compile error when len(TMPDIR) == 410
>    sqlite3: use 1024 for MAX_PATHNAM
> 
>   ...01-cmd-dist-unix.c-bprintf-use-larger-buf.patch | 38 ++++++++++++++++++++++
>   .../go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch | 35 ++++++++++++++++++++
>   meta/recipes-devtools/go/go-native.inc             |  5 ++-
>   ...src-util.cc-use-larger-kMaxPathComponents.patch | 33 +++++++++++++++++++
>   meta/recipes-devtools/ninja/ninja_1.7.2.bb         |  5 ++-
>   meta/recipes-sato/webkit/webkitgtk_2.16.6.bb       | 27 +++++++++++++++
>   .../0001-sqlite3.c-use-1024-MAX_PATHNAME.patch     | 37 +++++++++++++++++++++
>   meta/recipes-support/sqlite/sqlite3_3.21.0.bb      |  1 +
>   8 files changed, 179 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch
>   create mode 100644 meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch
>   create mode 100644 meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch
>   create mode 100644 meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch
> 

