Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E58D71A30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 01:47:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0B1ltjN032207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Jan 2017 17:47:55 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 10 Jan 2017 17:47:54 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
	<85bd069e-f17f-fc71-d5e0-28d775df5c2c@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <91ce45c8-3887-70f5-2b6f-b6cc1c1ce43c@windriver.com>
Date: Wed, 11 Jan 2017 09:47:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <85bd069e-f17f-fc71-d5e0-28d775df5c2c@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/6] runqemu: fix for slirp, network device and hostfwd
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
X-List-Received-Date: Wed, 11 Jan 2017 01:47:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 12/21/2016 02:24 PM, Robert Yang wrote:
> Hi Ross,
>
> I rebased in the repo:
>
>  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>
> Robert Yang (6):
>   scripts/runqemu: fix checking for <file>.cpio.gz
>   qemuboot.bbclass: use IMGDEPLOYDIR
>   runqemu-export-rootfs: fix inconsistent var names
>   runqemu: support mutiple qemus running when nfs
>   runqemu: fixes for slirp, network device and hostfwd
>   qemuboot.bbclass: add blank lines in comments
>
>
> // Robert
>
> On 12/06/2016 04:55 PM, Robert Yang wrote:
>> * V2
>>   - Add QB_NETWORK_DEVICE to set network device for both slirp and tap,
>>     the idea is from Randy and Nathan.
>>   - Use different mac sections for slirp and tap to fix conflicts when
>>     running both of them on the same host.
>>
>> * V1
>>   - Initial version
>>
>> The following changes since commit 11063a01d4511b2688ea7ba2d7359e4e07328c66:
>>
>>   ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>>
>>
>> Robert Yang (6):
>>   scripts/runqemu: fix checking for <file>.cpio.gz
>>   qemuboot.bbclass: use IMGDEPLOYDIR
>>   runqemu-export-rootfs: fix inconsistent var names
>>   runqemu: support mutiple qemus running when nfs
>>   runqemu: fixes for slirp, network device and hostfwd
>>   qemuboot.bbclass: add blank lines in comments
>>
>>  meta/classes/qemuboot.bbclass              |  34 ++++++--
>>  meta/conf/machine/include/qemuboot-x86.inc |   1 -
>>  meta/conf/machine/qemuarm64.conf           |   1 -
>>  scripts/runqemu                            | 133 ++++++++++++++++++++++-------
>>  scripts/runqemu-export-rootfs              |  21 ++---
>>  5 files changed, 140 insertions(+), 50 deletions(-)
>>

