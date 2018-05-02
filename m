Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F55A747CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 15:38:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w42FbKjt025957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 May 2018 08:37:56 -0700
Received: from [128.224.56.223] (128.224.56.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 2 May 2018 08:37:46 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20180430141455.2248-1-raj.khem@gmail.com>
	<20180430141455.2248-3-raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <67de73a3-7a06-a4aa-7d53-714c52c4a356@windriver.com>
Date: Wed, 2 May 2018 11:37:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180430141455.2248-3-raj.khem@gmail.com>
X-Originating-IP: [128.224.56.223]
Subject: Re: [PATCH V2 10/25] ruby: Upgrade to 2.5.1
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
X-List-Received-Date: Wed, 02 May 2018 15:38:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-04-30 10:14 AM, Khem Raj wrote:
> License Update: https://github.com/ruby/ruby/commit/322d0d93adfe42fc89c574f67bcb9acb9b82f251#diff-c53151ffd180a17416e8f09b1ca4bfc3
> 
Could you summarize the license changes in the long log:

License changes due to:
   * Update redirected and upstream url.
   * Added the Wayback Machine url for missing link.


so people don't have to switch out of a terminal for example.
Also, will github ever really go away, who knows! :)

../Randy

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/ruby/ruby.inc                   | 11 +++++------
>   .../ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}             |  4 ++--
>   2 files changed, 7 insertions(+), 8 deletions(-)
>   rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> index fd3911ba75..a366e93f66 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \
>   HOMEPAGE = "http://www.ruby-lang.org/"
>   SECTION = "devel/ruby"
>   LICENSE = "Ruby | BSD | GPLv2"
> -LIC_FILES_CHKSUM = "\
> -    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
> -    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
> -    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> -    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
> -"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
> +                    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5 \
> +                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
> +                    "
>   
>   DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
>   DEPENDS_class-native = "openssl-native libyaml-native"
> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.0.bb b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/ruby/ruby_2.5.0.bb
> rename to meta/recipes-devtools/ruby/ruby_2.5.1.bb
> index 1ac7f2aa5a..91048284c1 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
> @@ -5,8 +5,8 @@ SRC_URI += " \
>              file://ruby-CVE-2017-9228.patch \
>              "
>   
> -SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
> -SRC_URI[sha256sum] = "46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab"
> +SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
> +SRC_URI[sha256sum] = "dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1"
>   
>   # it's unknown to configure script, but then passed to extconf.rb
>   # maybe it's not really needed as we're hardcoding the result with
> 


-- 
# Randy MacLeod
# Wind River Linux

