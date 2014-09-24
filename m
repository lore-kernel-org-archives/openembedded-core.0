Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC246A9D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 10:46:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8OAk9pB010798
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 03:46:09 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 03:46:08 -0700
Message-ID: <5422A0E8.1010506@windriver.com>
Date: Wed, 24 Sep 2014 18:46:00 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<b5499b7e326e64e196dd73e7229ad9c483b72ff8.1411473883.git.hongxu.jia@windriver.com>
	<CAJTo0LZcTFqhyWKTcYiWDHUCP-zKsYucnjPx9J1yjA3Zi66rvg@mail.gmail.com>
In-Reply-To: <CAJTo0LZcTFqhyWKTcYiWDHUCP-zKsYucnjPx9J1yjA3Zi66rvg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: enable CONFIG_BZIP2/CONFIG_XZ/CONFIG_UNXZ by default
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
X-List-Received-Date: Wed, 24 Sep 2014 10:46:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2014 10:47 PM, Burton, Ross wrote:
> On 23 September 2014 15:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> It was required by info/man command to compress/decompress
>> doc pages with xz/bz2 compression.
> When changing busybox configuration, it's helpful to list the size change.
>
> So for anyone else curious, buildhistory reports the package size (not
> the binary size) as:
>
> -PKGSIZE = 573632
> +PKGSIZE = 585144

Since we care about the size, and affect of the fix is global.

How about conditionally add 'xz/bz2/gzip' to info/man's
RDEPENDS according DOC_COMPRESS value.

V2 incoming

//Hongxu


> Ross


