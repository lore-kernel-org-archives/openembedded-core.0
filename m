Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 104CD6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:31:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T8VuYI003906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jun 2015 01:31:56 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 01:31:55 -0700
Message-ID: <55910279.7030901@windriver.com>
Date: Mon, 29 Jun 2015 16:31:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1435135356.git.liezhi.yang@windriver.com>	
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
	<1435566069.7287.22.camel@linuxfoundation.org>
In-Reply-To: <1435566069.7287.22.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Mon, 29 Jun 2015 08:32:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2015 04:21 PM, Richard Purdie wrote:
> On Wed, 2015-06-24 at 01:55 -0700, Robert Yang wrote:
>> Updated 0001-Add-P-prompt-into-Usage-info.patch.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../file/0001-Add-P-prompt-into-Usage-info.patch   |    6 +++---
>>   .../file/{file_5.22.bb => file_5.23.bb}            |    6 +++---
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>   rename meta/recipes-devtools/file/{file_5.22.bb => file_5.23.bb} (81%)
>
> I've noticed an additional problem with the file recipe, specifically
> that it tries to run the file it just built (in the -native case) and
> this links against libmagic.so. When it runs, it can use
> the /usr/lib/libmagic instead of the one in WORKDIR. If you have file
> 2.22 on your system (e.g. Ubuntu 15.04), you can get an error.
>
> The fix I found was to add an LD_LIBRBARY_PATH to the Makefile:
>
> 	LD_LIBRARY_PATH=$(top_builddir)/src/.libs $(FILE_COMPILE) -C -m magic
>
> which is ugly but appeared to fix the error I was seeing. There was a
> bug a while back I was unable to reproduce and this is likely the cause
> of that too, it all depends which version of libmagic you have on your
> system.

Thanks, I will fix it when upgrade to 5.24.

// Robert

>
> Cheers,
>
> Richard
>
>
>
>
>

