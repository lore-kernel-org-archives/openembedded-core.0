Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 993557BB8F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 15:10:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA8F9MCn005514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Nov 2018 07:09:48 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 8 Nov 2018 07:09:36 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181107175922.6631-1-Randy.MacLeod@windriver.com>
	<CAJTo0LaNF-q9Lj6-VZgnGbX154hO_XOx7KaKzxcAzys1WBBnPg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <93b145d4-20f8-8f60-38dc-e94f0d3db32f@windriver.com>
Date: Thu, 8 Nov 2018 10:09:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaNF-q9Lj6-VZgnGbX154hO_XOx7KaKzxcAzys1WBBnPg@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: drop mips n32 support
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
X-List-Received-Date: Thu, 08 Nov 2018 15:10:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/8/18 9:14 AM, Burton, Ross wrote:
> On Wed, 7 Nov 2018 at 18:00, Randy MacLeod <Randy.MacLeod@windriver.com> wrote:
>> valgrind for qemumips64 multilib builds fails to configure
>> for libn32 with the error:
>>     configure:6190: checking for 32 bit build support
>>     ...
>>     fatal error: bits/long-double-32.h: No such file or directory
>> It seems that the toolchain is producing:
>>     tmp-glibc/sysroots-components/mips64-n32/libn32-glibc/usr/include/bits/long-double-n32.h
>>
>> Until the toolchain problem is resolved, skip valgrind for libn32.
> 
> Is there a bug filed for this?

Of course there's a bug:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12989

(now).

> 
> Ross
> 


-- 
# Randy MacLeod
# Wind River Linux

