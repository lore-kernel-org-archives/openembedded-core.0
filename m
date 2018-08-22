Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C27917918B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M3UWN4023649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 20:30:32 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 21 Aug 2018 20:30:31 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180802025039.15748-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <d04a0435-5946-5b68-03e9-d9a553432214@windriver.com>
Date: Wed, 22 Aug 2018 11:33:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180802025039.15748-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [PATCH v4 0/3] udev-extraconf/mount.sh: add support to systemd
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
X-List-Received-Date: Wed, 22 Aug 2018 03:30:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

--Hongzhi


On 2018年08月02日 10:50, Hongzhi.Song wrote:
> v4:
>      Fix the recursively dependency for the systemd-mount
> v3:
>      perfect syntax
>
> Hongzhi.Song (3):
>    udev-extraconf/mount.sh: add support to systemd
>    udev-extraconf/mount.sh: Fix the recursively dependency for the
>      systemd-mount
>    udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the
>      systemd-mount
>
>   meta/recipes-core/udev/udev-extraconf/mount.sh | 84 ++++++++++++++++++++++----
>   1 file changed, 71 insertions(+), 13 deletions(-)
>


