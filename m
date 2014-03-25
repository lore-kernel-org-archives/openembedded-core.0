Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 640526D899
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 09:09:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2P99GeI014661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Mar 2014 02:09:16 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 02:09:16 -0700
Message-ID: <533147BA.706@windriver.com>
Date: Tue, 25 Mar 2014 17:09:14 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Jussi Laako <jussi@sonarnerd.net>, Paul Eggleton
	<paul.eggleton@linux.intel.com>,
	"Purdie, Richard" <richard.purdie@intel.com>
References: <531ECDCE.3020805@sonarnerd.net> <531ED455.50702@windriver.com>
	<2472430.vmDQzt5qix@peggleto-mobl5.ger.corp.intel.com>
	<531EE822.7070201@windriver.com> <532173C2.2000606@sonarnerd.net>
In-Reply-To: <532173C2.2000606@sonarnerd.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora]Re: Failure in license.bbclass
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
X-List-Received-Date: Tue, 25 Mar 2014 09:09:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2014 05:00 PM, Jussi Laako wrote:
> Hi,
>
> On 03/11/2014 12:40 PM, Robert Yang wrote:
>> It is used for fixing this bug:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5572
>>
>> Enalbe COPY_LIC_MANIFEST and COPY_LIC_DIRS: No kernel license is
>> installed in image
>>
>> But it used the "oe-pkgdata-util lookup-recipe" which is only on master
>> branch,
>> I think that we'd better:
>>
>> 1) Revert this commit, then it works with minor problems.
>>
>> Or
>>
>> 2) Fix the "oe-pkgdata-util lookup-recipe" on dora.
>
> With core-image-minimal spiced up with couple of packages, there were quite many
> license directories left empty, so it requires fair amount of manual work to
> rectify the situation. So it is far more than just the kernel.
>
> For example any libraries coming from util-linux, plus any of the gcc runtimes
> (libgcc, etc). There are many packages where source name doesn't match with the
> produced packages.
>
> Since BSPs tend to lag behind release schedule, option (2) could possibly help
> quite many...
>

Thanks, I've talked Hongxu, he will fix it on dora without backport
the 7 commits, and we need revert this one on dora:

commit e58a1499accd74d3e6fe4f899711d4c680ebc18f
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Wed Nov 20 18:35:39 2013 +0800

     license.bbclass: fix copying license directories failed


Paul and RP, what's your opinion, please ?

// Robert


>
> Best regards,
>
>      - Jussi
>
>

