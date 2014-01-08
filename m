Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5E96C963
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 06:06:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s08662oN019940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jan 2014 22:06:02 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 7 Jan 2014 22:06:01 -0800
Message-ID: <52CCEAC5.1090905@windriver.com>
Date: Wed, 8 Jan 2014 14:05:57 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1389082433-19396-1-git-send-email-ming.liu@windriver.com>
	<1389082433-19396-2-git-send-email-ming.liu@windriver.com>
	<1389103082.6899.27.camel@ted>
In-Reply-To: <1389103082.6899.27.camel@ted>
X-Originating-IP: [128.224.162.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] sstate: remove binutils-crosssdk from safe dependent list
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
X-List-Received-Date: Wed, 08 Jan 2014 06:06:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2014 09:58 PM, Richard Purdie wrote:
> On Tue, 2014-01-07 at 16:13 +0800, Ming Liu wrote:
>> binutils-crosssdk is being depended by other packages like
>> gcc-crosssdk-initial, so it's not safe to be skipped when checking the
>> setscene dependencies in setscene_depvalid().
> Can you explain this change a bit more please?
>
> Personally, I think the code is right as it is, if the sstate object
> exists, it was already compiled and we don't ever need bintuils* so its
> a 'safe' dep and can be skipped?
Actually I am not very clear about why the binutils-crosssdk should be a 
build time dependency, because based on my test, it's seems to being 
required by gcc-crosssdk-initial at runtime, the steps:
bitbake nativesdk-eglibc-initial -c cleansstate
bitbake gcc-crosssdk-initial binutils-crosssdk -c clean
bitbake gcc-crosssdk-initial
bitbake nativesdk-eglibc-initial

the above will fail due to lacking binutils-crosssdk stuff in sysroot.

//Ming Liu
>
> Cheers,
>
> Richard
>
>
>


