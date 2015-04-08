Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4E8736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 09:05:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3895G16005561
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Apr 2015 02:05:17 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 02:05:16 -0700
Message-ID: <5524EF4B.8040405@windriver.com>
Date: Wed, 8 Apr 2015 17:05:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
	<7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
	<1428442765.14020.482.camel@linuxfoundation.org>
	<55249123.6090008@windriver.com>
	<CAHiDW_FjO_0BP9+AoQDbS=Y268oUs1TXBhNh2_Vti_yhdMap-A@mail.gmail.com>
In-Reply-To: <CAHiDW_FjO_0BP9+AoQDbS=Y268oUs1TXBhNh2_Vti_yhdMap-A@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Wed, 08 Apr 2015 09:05:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2015 03:42 PM, Jussi Kukkonen wrote:
> On 8 April 2015 at 05:23, Robert Yang <liezhi.yang@windriver.com> wrote:
>> On 04/08/2015 05:39 AM, Richard Purdie wrote:
>>> This blew up badly on the autobuilder:
>>>
>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=c8da6d7390ad626c03d5b9b431a97adeaeb60a89
>>
>> Sorry, the failures are on CentOS 6.6, please ignore this upgrade atm, I
>> will
>> find a CentOS 6.x to fix the problem.
>
> That's typedef redefinition (C11 feature and supported by gcc for
> quite a while). Why does CentOS specifically choke on that?
>
> Anyway, upstream has decided to roll this back: apparently some gcc
> versions that are still in use do not support the feature.
> GLib commit 4a292721bc should help.

Thank you very much, I will backport it to fix the problem.

// Robert

>
> Jussi
>
>

