Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31C3173779
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 06:39:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q6dTU1003901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 23:39:29 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 23:39:28 -0700
Message-ID: <558CF39F.80401@windriver.com>
Date: Fri, 26 Jun 2015 14:39:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: cdong <chuang.dong@windriver.com>,
	<Openembedded-core@lists.openembedded.org>
References: <556EB568.30901@windriver.com>
In-Reply-To: <556EB568.30901@windriver.com>
Subject: Re: ltp: vma03 fix the alginment of page size
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
X-List-Received-Date: Fri, 26 Jun 2015 06:39:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Dong,

Please don't send the patch as attachment, you can use git send-email
to send the patch. And please add the "Upstream-Status: Submitted"
inside the patch 0001-ltp-vma03-fix-the-alginment-of-page-size.patch,
right before the Signed-off-by line.

// Robert

On 06/03/2015 04:06 PM, cdong wrote:
> Hi,
>      This patch fix a vma03 bug,the info below detail it:
>
>      the offset which is parameter of mmap2() function doesn't align the
>      page size,but,this parameter is allowed multiple of the page size
>      as returned by sysconf(_SC_PAGE_SIZE),meanwhile offset * 4096 must be
>      a multiple of the system page size,so modify the input parameter
>      pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
>
>      Regards
>      Chuang
>
>

