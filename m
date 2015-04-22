Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47E186E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 02:27:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3M2RGwl027638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Apr 2015 19:27:16 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 19:27:15 -0700
Message-ID: <55370702.8030101@windriver.com>
Date: Wed, 22 Apr 2015 10:27:14 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1429669271.git.liezhi.yang@windriver.com>
	<d43affadb4b82b309b05f78efaecb7cb056e3502.1429669271.git.liezhi.yang@windriver.com>
	<0B9D4FD8-56E6-44B4-96E8-E283B6F12E98@gmail.com>
In-Reply-To: <0B9D4FD8-56E6-44B4-96E8-E283B6F12E98@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: don't use gold for mips
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
X-List-Received-Date: Wed, 22 Apr 2015 02:27:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/22/2015 10:24 AM, Khem Raj wrote:
>
>> On Apr 21, 2015, at 7:22 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> +# gold doesn't work for mips
>> +LDFLAGS_mips_append = ""
>> +LDFLAGS_mips64_append = ""
>> +LDFLAGS_mips64n32_append = ""
>>
>
> how about little-endian variants ?

Maybe we'd better set _86 _ppc and _arm one by one, please ?

// Robert

>
>

