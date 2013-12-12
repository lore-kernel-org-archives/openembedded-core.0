Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBCEF6E328
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 06:49:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBC6nPLn009440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Dec 2013 22:49:25 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 11 Dec 2013 22:49:23 -0800
Message-ID: <52A95C72.3030605@windriver.com>
Date: Thu, 12 Dec 2013 14:49:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386752561.git.liezhi.yang@windriver.com>	
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>
In-Reply-To: <1386772701.4332.80.camel@ted>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Thu, 12 Dec 2013 06:49:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2013 10:38 PM, Richard Purdie wrote:
> On Wed, 2013-12-11 at 14:26 +0000, Richard Purdie wrote:
>> Hi Robert,
>>
>> Can you confirm that all these patches have an equivalent change in
>> master already? I can see some which I can't find equivalent changes in
>> master for :(
>
> Running "git cherry master contrib/robert/dora-next master -v | grep ^\+"
> gives a list of commits in dora-next but not in master and these are the
> ones we need to look more closely at:
>
> + d72b558cd968db9bd0fa601ae1365cef06a51369 poky.ent, documentation: Updates for building 1.5.1 release.
> + 854c136d485975e5f697e373aa0cc063fee7faca tools/mega-manual.sed: Changed 1.5 to 1.5.1
> + 1ba659469c678a10e8c3a7f337f62c1e93898ce1 dev-manual: Updates to Toaster section about examing data
> + 803300cc126ab5581454d0dfb153d5c11998f5bc dev-manual: A few tweaks to Ch2 of dev-manual
> + e3e0d40704473e752d93de79cfb04a979c3073bb dev-manual: Small number of tweaks to ch 3, development manual.
> + 5de0010afff5c861da1c84f45fa9791dd5721ec5 dev-manual: Reworded sentence for meta-intel setup
> + 184166fa7a5e1beb51660258b1d19dd4daa85996 dev-manual: Fixed broken structure.
> + fa191d48825d97e324e57e628a0ce2d720c2e06d dev-manual: Rough draft of wic section.
> + b0c4c855a0d5d4d2efcdf4da4b06e943be310887 dev-manual: More work on the new wic section.
> + acd37849336938faad2d62a0c0edf30a8be3fcda dev-manual: Complete first draft of the new wic section.
> + e9d0f1d211940e60bb357a755faeb95f47cf6729 dev-manual: Changed "Tasks" term into "Package Groups" term.
> + 6fc8adf98a5af48001adff3ed6deb3fdb96e0486 dev-manual: Added "Task" term.
>
> All docs so ok.
>
> + 2238d4a63f55721aad4557f862bd6c86a3e2c904 Revert "utils.bbclass: Fix override ordering for FILESPATH"
>
> Also intended for dora, ok.
>
> + 887cdec2b889d1ecb81f0fcc1aa00204fbc7108e pigz: Add pigz to buildtools tarball
>
> Confirmed as in master, patch is against slightly different version so ok.
>

Hi RP,

Please see my comments inline ...


> That leaves the following we need to investigate:
>
> + 20c0a87c19cf51bcd849fb4de91421cae0f97ae4 mdadm: Disable the RUN_DIR check

 From OE-Core master rev: d62882794890eeee8e8d5c9ba4837ec77a58d787

> + cc225f0e74865623714461cd38bec3b6557c6df7 mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64

 From OE-Core master rev: d3caab6eb03264b4f4d744f914598022299011ba

> + d912ce035beb0da28d83719920a2cebfda8b3073 ethtool: Fix ptest compile

 From OE-Core master rev: 5dd8653fdcda5e0e8b4f3c37a46f357bc97ec66c

> + 1cff575511f32935a69ec1c9ef966311ad409e2f gdb-7.6: fix cygwin check in configure script

This one is sent by Steffen, for dora only.

> + bfd8feec0a25f61bf1f722dc8719e8194e284f52 libtiff: fix CVE-2013-1960

There is a similar fix on master, but they are different, it is sent by Mark
for dora.

> + 2615979d05e24c3bf05e33a67bb7aa21eab9f011 nfs-utils: explicitly rdepend on bash

There is a similar fix on master, but they are different, it is sent by Mark
for dora.

> + 5a13d607954fb2099a82c5f1f4135be6cb6ca4d3 dpkg: Fix a build error for dpkg-native on CentOS 5.8.
> + c37ab9c220b8f1d2045b1aaf9cd03c1f9a899390 dpkg: Fix a link problem for dpkg-native on CentOS 5.8.
>

They are sent by Mark for dora only.

// Robert

> We need to know if these are in master, if not why not and if the issue
> is specific to dora.
>
> Cheers,
>
> Richard
>
>
>
>

