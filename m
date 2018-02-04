Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 669FE6093E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 18:17:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w14IHjqn007922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Feb 2018 10:17:46 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 10:17:43 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>,
	<alexander.kanavin@linux.intel.com>
References: <72c0e55a-f317-aa60-0681-9be5ea41a549@windriver.com>
	<1517466042-177651-1-git-send-email-hongxu.jia@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2751c717-f4a1-5a37-b014-60db7af39a01@windriver.com>
Date: Sun, 4 Feb 2018 13:17:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517466042-177651-1-git-send-email-hongxu.jia@windriver.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH V3] pigz: 2.3.4 -> 2.4
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
X-List-Received-Date: Sun, 04 Feb 2018 18:17:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-01 01:20 AM, Hongxu Jia wrote:
> License-checksum-change: license is no change, only version bump up.
> 
> https://github.com/madler/pigz/commit/fe822cb435622c43f491013da77b127e9fe851a9

There as a trivial space removed so say so in the comment.

commit 5d5d268c26d5b82b7346df4707026d8ac2dbb5c2
Author: Mark Adler <zlib@madler.net>
Date:   Sun Dec 24 22:27:38 2017 -0800

     Pointless formatting changes.

     Use // comments througout, improve comments style, move opening
     braces to function definition lines.

diff --git a/pigz.c b/pigz.c
index e3a16a0..9003779 100644
--- a/pigz.c
+++ b/pigz.c
@@ -5,7 +5,7 @@

  /*
    This software is provided 'as-is', without any express or implied
-  warranty.  In no event will the author be held liable for any damages
+  warranty. In no event will the author be held liable for any damages
...


$ git tag --contains 5d5d268c
v2.4



../Randy


> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-extended/pigz/{pigz_2.3.4.bb => pigz_2.4.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-extended/pigz/{pigz_2.3.4.bb => pigz_2.4.bb} (86%)
> 
> diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
> similarity index 86%
> rename from meta/recipes-extended/pigz/pigz_2.3.4.bb
> rename to meta/recipes-extended/pigz/pigz_2.4.bb
> index 431d9bd..cb41154 100644
> --- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
> +++ b/meta/recipes-extended/pigz/pigz_2.4.bb
> @@ -6,13 +6,13 @@ Adler, and uses the zlib and pthread libraries."
>   HOMEPAGE = "http://zlib.net/pigz/"
>   SECTION = "console/utils"
>   LICENSE = "Zlib & Apache-2.0"
> -LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
> +LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
>   
>   PROVIDES_class-native += "gzip-native"
>   
>   SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
> -SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
> -SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
> +SRC_URI[md5sum] = "3c8a601db141d3013ef9fe5f2daaf73f"
> +SRC_URI[sha256sum] = "e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52"
>   
>   UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
>   UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

