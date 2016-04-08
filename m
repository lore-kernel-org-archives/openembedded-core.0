Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D32CA60125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 10:11:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u38ABtYn022412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2016 03:11:55 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 03:11:55 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1460099653.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570783E9.2080806@windriver.com>
Date: Fri, 8 Apr 2016 18:11:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1460099653.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4] image_types.bbclass: fix btrfs, ubifs and elf
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
X-List-Received-Date: Fri, 08 Apr 2016 10:11:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Removed patch 2/4 and updated in the repo:

git://git.openembedded.org/openembedded-core-contrib rbt/img


Robert Yang (3):
   image_types.bbclass: set nodesize for btrfs
   image_types.bbclass: fix elf
   image-vm.bbclass/image_types.bbclass: IMAGE_NAME -> IMAGE_LINK_NAME

So there are only 3 patches in the repo.

// Robert

On 04/08/2016 03:15 PM, Robert Yang wrote:
> The following changes since commit 5ebea1114d54120d5ff5d8a6cd148110d0fda23f:
>
>    build-appliance-image: Update to master head revision (2016-04-06 23:54:57 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/img
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/img
>
> Robert Yang (4):
>    image_types.bbclass: set nodesize for btrfs
>    image_types.bbclass: fix ubi ubifs and multiubi
>    image_types.bbclass: fix elf
>    image-vm.bbclass/image_types.bbclass: IMAGE_NAME -> IMAGE_LINK_NAME
>
>   meta/classes/image-vm.bbclass    |  2 +-
>   meta/classes/image_types.bbclass | 10 +++++++---
>   2 files changed, 8 insertions(+), 4 deletions(-)
>

