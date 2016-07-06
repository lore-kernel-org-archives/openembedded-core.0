Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 920C06013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 09:16:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u669GDRE028166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jul 2016 02:16:13 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jul 2016 02:16:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1467792379.git.yi.zhao@windriver.com>
	<6125589935ee01e7b5dec39659932f3ef3f47374.1467792379.git.yi.zhao@windriver.com>
	<CAJTo0LZ_gOmi8QffB+TChddE+ps0z348DJ0tRUwWM+1dMLDOmA@mail.gmail.com>
	<1467795297.8590.208.camel@linuxfoundation.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <577CCC58.4000402@windriver.com>
Date: Wed, 6 Jul 2016 17:16:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467795297.8590.208.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.178]
Cc: Yue Tao <yue.tao@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] randrproto: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 06 Jul 2016 09:16:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross & Richard,

So that's a wrong usage for adding this package to an image.
Thank you for the explanation.

Yi


在 2016年07月06日 16:54, Richard Purdie 写道:
> On Wed, 2016-07-06 at 09:41 +0100, Burton, Ross wrote:
>> On 6 July 2016 at 09:09, Yi Zhao <yi.zhao@windriver.com> wrote:
>>> When adding package randrproto to an image with
>>> IMAGE_INSTALL_append = " randrproto", an error occurs:
>>>
>>> $ bitbake core-image-sato
>>> [snip]
>>> ERROR: randrproto not found in the base feeds (qemux86 i586 x86
>>> noarch any all).
>>> [snip]
>>>
>> No.
>>
>> $ oe-pkgdata-util list-pkgs -rp randrproto
>> randrproto-dbg
>> randrproto-dev
>> randrproto-doc
>>
>> The answer here is to not add randrproto to an image, as the package
>> doesn't exist.  Especially when this is whack-a-mole:
>>
>> $ oe-pkgdata-util list-pkgs -rp renderproto
>> renderproto-dev
>> renderproto-dbg
>> renderproto-doc
>>
>> (repeat for every recipe in x11-proto)
> Agreed. We've seen patches like this before, we rejected them last time
> and we will do again.
>
> Cheers,
>
> Richard
>


