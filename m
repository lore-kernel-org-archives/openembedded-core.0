Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A493731B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:49:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u49CnM6g029796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 05:49:22 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 May 2016 05:49:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57308750.3090604@windriver.com>
Date: Mon, 9 May 2016 20:49:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/6] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 09 May 2016 12:49:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping.

On 04/25/2016 09:10 AM, Robert Yang wrote:
> The following changes since commit 28032d8c3122b75ceb3f4a664a2b478c9a9a6a2c:
>
>    tzcode: update to 2016c (2016-04-11 22:03:01 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next
>
> Armin Kuster (2):
>    tzcode: update to 2016d
>    tzdata: update to 2016d
>
> Bjørn Forsman (1):
>    license.bbclass: fix warnings when run in unprivileged "container" env
>
> Robert Yang (1):
>    boot-directdisk.bbclass: remove HDDIMG before create
>
> Sona Sarmadi (1):
>    bind: CVE-2016-1285 CVE-2016-1286
>
> Stefan Agner (1):
>    opkg: backport fix for double remove of packges
>
>   meta/classes/boot-directdisk.bbclass               |   2 +
>   meta/classes/license.bbclass                       |   8 +-
>   .../bind/bind/CVE-2016-1285.patch                  | 138 +++++++++
>   .../bind/bind/CVE-2016-1286_1.patch                |  79 +++++
>   .../bind/bind/CVE-2016-1286_2.patch                | 318 +++++++++++++++++++++
>   meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   3 +
>   ...vider_replacees-do-not-add-installed-pkg-.patch | 112 ++++++++
>   meta/recipes-devtools/opkg/opkg_0.3.0.bb           |   1 +
>   ...code-native_2016c.bb => tzcode-native_2016d.bb} |   8 +-
>   .../tzdata/{tzdata_2016c.bb => tzdata_2016d.bb}    |   4 +-
>   10 files changed, 664 insertions(+), 9 deletions(-)
>   create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
>   create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
>   create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0001-pkg_get_provider_replacees-do-not-add-installed-pkg-.patch
>   rename meta/recipes-extended/tzcode/{tzcode-native_2016c.bb => tzcode-native_2016d.bb} (68%)
>   rename meta/recipes-extended/tzdata/{tzdata_2016c.bb => tzdata_2016d.bb} (98%)
>

