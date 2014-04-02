Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 315F96F558
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 02:53:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s322rtgX010826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 19:53:55 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 19:53:54 -0700
Message-ID: <533B7BBF.9050504@windriver.com>
Date: Wed, 2 Apr 2014 10:53:51 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
	<eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
	<CAMKF1sozZEVsJ=oaBW-mqex27LvOTfOGW90+g_9gkPg27OJEhA@mail.gmail.com>
	<533A6D67.9060608@windriver.com>
	<CAMKF1sps5Bu26iN7ak76t-QZQnhrm1wTvhAcHWs94xnz035BvQ@mail.gmail.com>
In-Reply-To: <CAMKF1sps5Bu26iN7ak76t-QZQnhrm1wTvhAcHWs94xnz035BvQ@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libarchive: fix CVE-2013-0211
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
X-List-Received-Date: Wed, 02 Apr 2014 02:53:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 10:57 PM, Khem Raj wrote:
>> How about test the size of size_t and assigned the related MAX value:
>> >
>> >const size_t max_write = (sizeof(size_t) >=
>> >sizeof(int))?INT_MAX:(sizeof(size_t) == sizeof(short))?SHRT_MAX:CHAR_MAX;
>> >
> you could use something like (size_t)-1 to denote SIZE_MAX
>

Sounds good, I will do that in V2.

//Hongxu

