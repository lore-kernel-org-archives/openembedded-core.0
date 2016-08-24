Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E24486612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 01:46:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O1kvMC016383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:46:57 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 18:46:56 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1472001956.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57BCFC8F.1060706@windriver.com>
Date: Wed, 24 Aug 2016 09:46:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1472001956.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/2] Toggle bind configure options
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
X-List-Received-Date: Wed, 24 Aug 2016 01:46:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年08月24日 09:27, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit 94646f4828c2aa11a89996763edaa2e9d57106a9:
>
>    oeqa/buildiptables: Switch from netfilter.org to yoctoproject.org mirror (2016-08-23 17:59:43 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/bind
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind
>
> Kai Kang (2):
>    bind: enable threads support and use epoll
>    dhcp: build shared libraries

I didn't see Wangxin's work to upgrade bind. So please comment the 
patches, and I will rebase them when the upgrade patch is merged.

Thanks.

--Kai

>   meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   6 +-
>   meta/recipes-connectivity/dhcp/dhcp.inc            |   6 +-
>   .../dhcp/dhcp/build-shared-libs.patch              | 186 +++++++++++++++++++++
>   meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb       |   1 +
>   4 files changed, 194 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch
>


-- 
Regards,
Neil | Kai Kang


