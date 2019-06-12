Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62D197E76B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 10:22:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5CALhuK007695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jun 2019 03:21:59 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 12 Jun 2019 03:21:38 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
	<d0b197e49ef118034631fae6f322a745b0e34932.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <5f8e3df5-5687-c6a2-5ee7-c3c468ef6d86@windriver.com>
Date: Wed, 12 Jun 2019 18:21:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d0b197e49ef118034631fae6f322a745b0e34932.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 10:22:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/12/19 5:57 PM, Richard Purdie wrote:
> On Wed, 2019-06-12 at 17:15 +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> This is based on meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb and is for
>> those who want to build lttng-modules with bleeding edge kernel, to avoid
>> regularly backporting patches from upstream.
>>
>> Note that PREFERRED_VERSION needs to be set to select this recipe instead of the
>> tar ball one.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/recipes-kernel/lttng/lttng-modules_git.bb | 34 ++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules_git.bb
> Do we really want/need to duplicate the whole recipe?

Do you like one .inc plus two .bb s? Then I'll send v2 later.

Zhe

>
> Cheers,
>
> Richard
>
>


