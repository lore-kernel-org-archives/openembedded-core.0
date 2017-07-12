Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1437177DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6C8dPTe020358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:39:25 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 01:39:24 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1499822461.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
Date: Wed, 12 Jul 2017 16:40:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <cover.1499822461.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Wed, 12 Jul 2017 08:39:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月12日 09:25, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:
>
>    yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/bind
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind

Oops. Duplicate dot in commit subject. Updated in poky-contrib.

--Kai

>
> Kai Kang (1):
>    bind: 9.10..3-P3 -> 9.10.5-P3
>
>   ...0001-build-use-pkg-config-to-find-libxml2.patch |   10 +-
>   .../bind/bind/CVE-2016-1285.patch                  |  154 ---
>   .../bind/bind/CVE-2016-1286_1.patch                |   79 --
>   .../bind/bind/CVE-2016-1286_2.patch                |  317 ------
>   .../bind/bind/CVE-2016-2088.patch                  |  247 -----
>   .../bind/bind/CVE-2016-2775.patch                  |   90 --
>   .../bind/bind/CVE-2016-2776.patch                  |  123 ---
>   .../bind/bind/CVE-2016-6170.patch                  | 1090 --------------------
>   .../bind/bind/CVE-2016-8864.patch                  |  219 ----
>   .../bind/bind/bind-confgen-build-unix.o-once.patch |   10 +-
>   .../bind/bind/mips1-not-support-opcode.diff        |  104 --
>   .../use-python3-and-fix-install-lib-path.patch     |   36 +
>   .../bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb}  |   25 +-
>   13 files changed, 61 insertions(+), 2443 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
>   create mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>   rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb} (85%)
>

-- 
Regards,
Neil | Kai Kang


