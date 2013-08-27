Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC1D66BA72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:32:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7R7WQRe007402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:32:26 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 27 Aug 2013 00:32:26 -0700
Message-ID: <521C5608.3080508@windriver.com>
Date: Tue, 27 Aug 2013 15:32:24 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1375436283.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1375436283.git.jackie.huang@windriver.com>
Subject: Re: [PATCH 0/1] multilib.bbclass: Expand the WHITELISTs with multilib prefix
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
X-List-Received-Date: Tue, 27 Aug 2013 07:32:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Could anyone look at this? It's been a long time here, but no comments 
and is not merged yet.

Thanks,
Jackie

On 8/2/2013 5:46 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Tested with:
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> INCOMPATIBLE_LICENSE = "GPLv3"
>
> --
> The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:
>
>    texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/d_gplv3_0801_2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_gplv3_0801_2
>
> Jackie Huang (1):
>    multilib.bbclass: Expand the WHITELISTs with multilib prefix
>
>   meta/classes/multilib.bbclass |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

