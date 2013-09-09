Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 816CB615F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:25:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r89APvQJ007334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Sep 2013 03:25:57 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 9 Sep 2013 03:25:56 -0700
Message-ID: <522DA232.70900@windriver.com>
Date: Mon, 9 Sep 2013 18:25:54 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>, "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <1378721444-22545-1-git-send-email-jackie.huang@windriver.com>
	<1378722078.6940.124.camel@phil-desktop.brightsign>
In-Reply-To: <1378722078.6940.124.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: avoid gcc ICE by omitting code TEMPORARILY
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
X-List-Received-Date: Mon, 09 Sep 2013 10:25:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/9/2013 6:21 PM, Phil Blundell wrote:
> On Mon, 2013-09-09 at 18:10 +0800, jackie.huang@windriver.com wrote:
>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> It's a FYI patch for anyone who might be having the same problem.
>>
>> pulseaudio-4.0 causes an internal compiler error. Temporarily
>> avoid the build error be omitting the code that makes the
>> compiler fail until the compiler ICE is addressed.
>
> Please mention the GCC bug number for this ice so that it's easy to
> establish when it has indeed been addressed.

Sorry, I don't have the bug number.

Randy,

Do you have one for this?

Thanks,
Jackie

>
> p.
>
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

