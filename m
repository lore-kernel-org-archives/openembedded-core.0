Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 138E278893
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:09:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V99YuX003940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 01:09:34 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 01:09:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <cover.1515744181.git.hongxu.jia@windriver.com>
Message-ID: <189cd8a7-ba01-a472-7f7b-ae72a3a0daac@windriver.com>
Date: Wed, 31 Jan 2018 17:13:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1515744181.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/6] improve reproducibility of 6 recipes
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
X-List-Received-Date: Wed, 31 Jan 2018 09:09:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping

//Hongxu

On 2018年01月12日 16:11, Hongxu Jia wrote:
> Fix build path issue of these recipes to improve reproducibility
>
> Build success on qemux86-64 with multilib enabled.
>
> //Hongxu
>
> The following changes since commit 364f8bcfcbd04e722490f363ad36a15fb7066ba7:
>
>    linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/reproduce
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/reproduce
>
> Hongxu Jia (6):
>    wget: improve reproducibility
>    python-xcbgen: improve reproducibility
>    openssl/nativesdk-openssl: improve reproducibility
>    python3-core: improve reproducibility
>    python-core/python-dev: improve reproducibility
>    kbd-ptest: improve reproducibility
>
>   .../openssl/0001-improve-reproducibility.patch     | 50 ++++++++++++++++++
>   .../recipes-connectivity/openssl/openssl_1.0.2m.bb | 11 ++++
>   meta/recipes-core/kbd/kbd_2.0.4.bb                 |  7 +++
>   meta/recipes-devtools/python/python3_3.5.3.bb      | 13 ++++-
>   meta/recipes-devtools/python/python_2.7.13.bb      |  7 ++-
>   meta/recipes-extended/wget/wget.inc                |  3 ++
>   .../wget/wget/0002-improve-reproducibility.patch   | 61 ++++++++++++++++++++++
>   meta/recipes-extended/wget/wget_1.19.2.bb          |  1 +
>   meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb |  2 +-
>   9 files changed, 152 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch
>   create mode 100644 meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
>


