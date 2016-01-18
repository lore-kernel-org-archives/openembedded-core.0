Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B67A731F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 01:49:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0I1nkLp030968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 17 Jan 2016 17:49:46 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jan 2016 17:49:45 -0800
Message-ID: <569C4481.60008@windriver.com>
Date: Mon, 18 Jan 2016 09:48:49 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>
References: <cover.1452673538.git.hongxu.jia@windriver.com>	
	<05d17c12cd03aa3b60ac1f864383e89623d9521e.1452673538.git.hongxu.jia@windriver.com>
	<1453052640.27999.23.camel@linuxfoundation.org>
In-Reply-To: <1453052640.27999.23.camel@linuxfoundation.org>
Subject: Re: [PATCH V2 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Mon, 18 Jan 2016 01:49:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2016 01:44 AM, Richard Purdie wrote:
> On Wed, 2016-01-13 at 03:30 -0500, Hongxu Jia wrote:
>> Backport patches to fix build failure caused by
>> '--without-jbig2dec' and '--without-jbig2dec'.
>> ...
>>> make[1]: *** No rule to make target `obj/sjbig2_.dev',
>> needed by `obj/sjbig2.dev'.  Stop.
>> ...
>>
>> http://bugs.ghostscript.com/show_bug.cgi?id=696497
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> This upgrade seems to have some issues on arm:

OK, I am working on it

//Hongxu

>
> http://errors.yoctoproject.org/Errors/Details/27534/
> http://errors.yoctoproject.org/Errors/Details/27528/
> http://errors.yoctoproject.org/Errors/Details/27527/
>
> Cheers,
>
> Richard


