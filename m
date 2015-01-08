Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6B7609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 08:55:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t088tc03025543
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Jan 2015 00:55:38 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 00:55:38 -0800
Message-ID: <54AE45FE.6040400@windriver.com>
Date: Thu, 8 Jan 2015 16:55:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<Martin.Jansa@gmail.com>
References: <cover.1414748681.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1414748681.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH V2 0/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Thu, 08 Jan 2015 08:55:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping

//Hongxu

On 10/31/2014 05:46 PM, Hongxu Jia wrote:
> Changed in V2:
> - Remove debug commented out line;
> - Tweak the way of function invoking;
>
> vim local.conf
> ...
> IMAGE_INSTALL_append " python3"
> ...
>
> bitbake core-image-minimal
>
> //Hongxu
>
> The following changes since commit dacc4ce59e48129a1a1e5316e10780f7358e29ef:
>
>    nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:46 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-rootfs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-rootfs
>
> Hongxu Jia (1):
>    package_manager.py: fix rpm based do_rootfs failed while
>      IMAGE_INSTALL_append = " python3"
>
>   meta/lib/oe/package_manager.py | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>


