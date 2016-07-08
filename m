Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A290606D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 01:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u681pmDj005469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2016 18:51:48 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 7 Jul 2016 18:51:47 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1458872261.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <577F0752.3060705@windriver.com>
Date: Fri, 8 Jul 2016 09:52:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1458872261.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.229]
Subject: Re: [PATCH 0/2] Fix aarch64 multilib SDK problems
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
X-List-Received-Date: Fri, 08 Jul 2016 01:51:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 03/25/2016 10:19 AM, Chen Qi wrote:
> The following changes since commit 34e7292fb40635cee1f1237ac3156530f8dfce37:
>
>    parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:53:49 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/aarch64-multilib
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/aarch64-multilib
>
> Chen Qi (1):
>    libgcc: ensure gnueabi suffix is added when necessary
>
> Robert Yang (1):
>    cross-canadian/libgcc: fix aarch64's multilib SDK
>
>   meta/classes/cross-canadian.bbclass         |  3 +++
>   meta/recipes-devtools/gcc/libgcc-common.inc | 35 ++++++++++++++++++++++-------
>   meta/recipes-devtools/gcc/libgcc.inc        |  2 +-
>   3 files changed, 31 insertions(+), 9 deletions(-)
>


