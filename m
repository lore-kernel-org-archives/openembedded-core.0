Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 616FE6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 03:25:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I3PCrO011554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:25:12 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 20:25:11 -0700
Message-ID: <55823A18.1000507@windriver.com>
Date: Thu, 18 Jun 2015 11:25:12 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1434596999.git.kai.kang@windriver.com>
In-Reply-To: <cover.1434596999.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Upgrade openssl from 1.0.2a to 1.0.2c
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
X-List-Received-Date: Thu, 18 Jun 2015 03:25:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年06月18日 11:14, Kai Kang wrote:
> Build for qemux86 and qemumips. And it is fine to run openssl basic sub-commands.

Withdraw it that Rongqing Li has sent patch already.

--Kai

>
> The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:
>
>    bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/openssl
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/openssl
>
> Kai Kang (1):
>    openssl: upgrade from 1.0.2a to 1.0.2c
>
>   ...lcl.h-fix-MIPS-specific-gcc-version-check.patch | 30 ----------------------
>   .../openssl/openssl/debian/c_rehash-compat.patch   |  8 +++---
>   .../{openssl_1.0.2a.bb => openssl_1.0.2c.bb}       |  5 ++--
>   3 files changed, 6 insertions(+), 37 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2a.bb => openssl_1.0.2c.bb} (89%)
>


-- 
Regards,
Neil | Kai Kang


