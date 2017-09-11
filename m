Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5EB571996
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:38:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8B1ciFj007146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 18:38:44 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 10 Sep 2017 18:38:43 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1504598502.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5fc330f9-9c0b-40e0-0d69-0fc1725a2f7c@windriver.com>
Date: Mon, 11 Sep 2017 09:43:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1504598502.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 0/2] systemd: fix dependency issue related to serial getty
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
X-List-Received-Date: Mon, 11 Sep 2017 01:38:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/05/2017 04:07 PM, Chen Qi wrote:
> The following changes since commit 15eac6befb6c4d16bc1b814e040bd7bf006a5bee:
>
>    linux-yocto: add linux-yocto 4.12 bbappends (2017-08-31 23:37:10 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-serialgetty
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-serialgetty
>
> Chen Qi (2):
>    systemd: change some RRECOMMENDS to RDEPENDS
>    systemd-serialgetty: remove systemd from RDEPENDS
>
>   meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
>   meta/recipes-core/systemd/systemd_234.bb         | 8 ++++----
>   2 files changed, 4 insertions(+), 6 deletions(-)
>


