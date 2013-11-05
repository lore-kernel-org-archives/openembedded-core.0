Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 116026D1FB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 08:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA58YYDC020564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2013 00:34:34 -0800 (PST)
Received: from [128.224.162.203] (128.224.162.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 5 Nov 2013 00:34:33 -0800
Message-ID: <5278AD91.70901@windriver.com>
Date: Tue, 5 Nov 2013 16:34:25 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1383554475-20223-1-git-send-email-Chong.Lu@windriver.com>
	<1383565229.6271.108.camel@ted>
In-Reply-To: <1383565229.6271.108.camel@ted>
X-Originating-IP: [128.224.162.203]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: fix return error value when input invalid arguments
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
X-List-Received-Date: Tue, 05 Nov 2013 08:34:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

There is no function to implement "-q" and "--squash" in source 
code(makedevs.c).
I also checked in busybox, but I didn't find the function.
So, may I need to add this function? or remove this options of help 
information.

Best Regards
Chong

On 11/04/2013 07:40 PM, Richard Purdie wrote:
> On Mon, 2013-11-04 at 16:41 +0800, Chong.Lu@windriver.com wrote:
>> From: Lu Chong <Chong.Lu@windriver.com>
>>
>> Remove "-q" and "--squash" options of help information.
> Why are we removing this?
>
> Cheers,
>
> Richard
>
>
>
>


