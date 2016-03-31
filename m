Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A332C60111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:53:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2VArMXs012812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:53:22 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 31 Mar 2016 03:53:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1459421153.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56FD01A0.3090307@windriver.com>
Date: Thu, 31 Mar 2016 18:53:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1459421153.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] image-live.bbclass: DEPENDS on syslinux
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
X-List-Received-Date: Thu, 31 Mar 2016 10:53:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/31/2016 06:47 PM, Robert Yang wrote:
> The following changes since commit e3fc8ef152494e9b7cff8de110a784150295f17e:
>
>    recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5. (2016-03-30 21:32:11 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib 7d0abc8ee6607ee15f5a7f3c05ff0cd468906fe5

It seems that something is wrong with scripts/create-pull-request, it should be:

git://git.openembedded.org/openembedded-core-contrib rbt/live

// Robert

>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=7d0abc8ee6607ee15f5a7f3c05ff0cd468906fe5
>
> Robert Yang (1):
>    image-live.bbclass: DEPENDS on syslinux
>
>   meta/classes/bootimg.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>

