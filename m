Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86DA66BA22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 03:26:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAU3QcxV004374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:26:48 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 19:26:27 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1543548740.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b17989f6-4ff0-af98-cc99-f22f61a7aaa1@windriver.com>
Date: Fri, 30 Nov 2018 11:31:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1543548740.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] cooker: simplify BB_DANGLINGAPPENDS_WARNONLY
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
X-List-Received-Date: Fri, 30 Nov 2018 03:26:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, wrong post, it should go to bitbake mailing list.

// Robert

On 11/30/18 11:39 AM, Robert Yang wrote:
> Hi RP,
> 
> I'd like to change the fatal message to be an event, the benefits are:
> - Things like report-error.bbclass can catch the error
> - It's easier to get bbappends list from an event message than from console log.
> 
> What's your opinion, please ?
> 
> // Robert
> 
> The following changes since commit 41d89552620bfbc94031d314e6b3d0324f7a330e:
> 
>    bitbake: fetch2: Avoid warning about incorrect character escaping in regex (2018-11-27 22:15:34 +0000)
> 
> are available in the git repository at:
> 
>    git://git.pokylinux.org/poky-contrib rbt/append
>    http://git.pokylinux.org/cgit.cgi//log/?h=rbt/append
> 
> Robert Yang (1):
>    cooker: simplify BB_DANGLINGAPPENDS_WARNONLY
> 
>   bitbake/lib/bb/cooker.py | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 

