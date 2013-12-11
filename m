Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34E946A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:18:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBBHIl3g013920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:18:47 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Dec 2013 09:18:47 -0800
Message-ID: <52A89E77.1010606@windriver.com>
Date: Wed, 11 Dec 2013 11:18:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386752561.git.liezhi.yang@windriver.com>	<1386771992.4332.76.camel@ted>
	<1386772701.4332.80.camel@ted>
In-Reply-To: <1386772701.4332.80.camel@ted>
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
X-List-Received-Date: Wed, 11 Dec 2013 17:18:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/13, 8:38 AM, Richard Purdie wrote:
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
> That leaves the following we need to investigate:
>
> + 20c0a87c19cf51bcd849fb4de91421cae0f97ae4 mdadm: Disable the RUN_DIR check
> + cc225f0e74865623714461cd38bec3b6557c6df7 mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
> + d912ce035beb0da28d83719920a2cebfda8b3073 ethtool: Fix ptest compile
> + 1cff575511f32935a69ec1c9ef966311ad409e2f gdb-7.6: fix cygwin check in configure script
> + bfd8feec0a25f61bf1f722dc8719e8194e284f52 libtiff: fix CVE-2013-1960

Above has a slightly different version in master: 
9db7a897d216a8293152c1a3b96c72b699d469c7

Patches submitted were for master and for dora.. so it should be correct.

> + 2615979d05e24c3bf05e33a67bb7aa21eab9f011 nfs-utils: explicitly rdepend on bash
> + 5a13d607954fb2099a82c5f1f4135be6cb6ca4d3 dpkg: Fix a build error for dpkg-native on CentOS 5.8.
> + c37ab9c220b8f1d2045b1aaf9cd03c1f9a899390 dpkg: Fix a link problem for dpkg-native on CentOS 5.8.
>
> We need to know if these are in master, if not why not and if the issue
> is specific to dora.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


