Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 796ED60E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:40:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5HCe8Dp015265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 05:40:08 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 17 Jun 2013 05:40:06 -0700
Message-ID: <51BF042A.9080104@windriver.com>
Date: Mon, 17 Jun 2013 20:42:18 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1371472283.git.sen.zhang@windriver.com>
	<2019586.mcCT5j76os@helios>
In-Reply-To: <2019586.mcCT5j76os@helios>
X-Originating-IP: [128.224.162.230]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] two patches for alsa-lib
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
X-List-Received-Date: Mon, 17 Jun 2013 12:40:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sure. I've updated my branch in poky-contrib.

jesse

On 06/17/2013 08:35 PM, Paul Eggleton wrote:
> Hi Jesse,
> 
> On Monday 17 June 2013 20:33:24 Jesse Zhang wrote:
>> The following changes since commit c18249353697f8b3741ae2024308d195671d3598:
>>
>>   rt-tests: fix error check in hackbench (2013-06-17 13:53:42 +0800)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib szhang/alsa
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/alsa
>>
>> Jesse Zhang (2):
>>   alsa-lib: Change function type to "static __inline__"
>>   alsa-lib: check if wordexp is supported in libc
>>
>>  .../Check-if-wordexp-function-is-supported.patch   | 48 +++++++++++++++++
>>  .../fix-O0-Optimize-unable-inline-function.patch   | 61
>> ++++++++++++++++++++++ meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb    |
>>  2 +
>>  3 files changed, 111 insertions(+)
>>  create mode 100644
>> meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supporte
>> d.patch create mode 100644
>> meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-functio
>> n.patch
> 
> Could you please add Upstream-Status to the inner patches?
> 
> Thanks,
> Paul
> 

