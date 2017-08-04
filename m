Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85FD471CB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 01:34:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v741YLjp029927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 3 Aug 2017 18:34:22 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 3 Aug 2017 18:34:21 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
	<CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
	<CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
	<CAJTo0La48UP4m0NRFM+TwrrpmTm1jR222yRaBfD=Nq7fNehg6Q@mail.gmail.com>
	<CAJTo0LYbn44Eva+zF1k8KxXMr5atREEzXr_r6odbpiF7g8uf+w@mail.gmail.com>
	<CAMKF1sp9gvOFaU9CB4SGvoNtsso5iBD6wXuakfDkXX+bW3YPng@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <8db9a9a9-17a9-4964-48ec-cdac0ecff0f0@windriver.com>
Date: Fri, 4 Aug 2017 09:33:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp9gvOFaU9CB4SGvoNtsso5iBD6wXuakfDkXX+bW3YPng@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Fri, 04 Aug 2017 01:34:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

OK!


On 2017年08月04日 00:48, Khem Raj wrote:
> On Thu, Aug 3, 2017 at 9:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 24 July 2017 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:
>>> I've filed a bug upstream about the failure on Debian 8:
>>> https://github.com/libexpat/libexpat/issues/97
>>
>> And this bug is now resolved.  expat in git can read /dev/urandom directly
>> if it doesn't find the syscalls it wants.
> Sounds good. Denke, when you refresh patch please include this patch along
>
> http://git.openembedded.org/openembedded-core-contrib/tree/meta/recipes-core/expat/expat/libtool-tag.patch?h=kraj/master&id=01929853a8346ba0fc27090150ebc506d1c5cd1e
>
> which was not there in your v1.
>
>> Ross


