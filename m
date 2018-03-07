Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4E7F71B50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 15:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w27F6FNu028189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Mar 2018 07:06:15 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 7 Mar 2018 07:05:40 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8a99e9f3-22c8-8c6f-294d-302f79d8c2ed@windriver.com>
Date: Wed, 7 Mar 2018 10:06:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 07 Mar 2018 15:06:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/07/2018 03:38 AM, Burton, Ross wrote:
> On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>     <http://linux-yocto-tiny_4.14.bb>
>     b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>     <http://linux-yocto-tiny_4.14.bb>
>     index ae9e7691367d..1ccbf6283e43 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>     <http://linux-yocto-tiny_4.14.bb>
>     +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
>     <http://linux-yocto-tiny_4.14.bb>
>     @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.24"
>       KMETA = "kernel-meta"
>       KCONF_BSP_AUDIT_LEVEL = "2"
> 
>     -SRCREV_machine ?= "fccf7693fe5dd00d7b6d391b7405b5d58eb959f2"
>     -SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
>     +SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
>     +SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
> 
> 
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0 
> do_fetch: Fetcher failure: Unable to find revision 
> 09828ddd8d8c91b2d68afdcd8eb99a48e0253582 in branch 
> v4.14/standard/tiny/common-pc even from upstream
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0 
> do_fetch: Fetcher failure for URL: 
> 'git://git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine 
> <http://git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine>'. 
> Unable to fetch URL from any source.
> ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0 
> do_fetch: Function failed: base_do_fetch

Odd. My merge of standard/tiny/base -> tiny* didn't go automatically.
Could have been the new branch naming. Either way, that SRCREV is
now valid for 4.14, and there's no patch to resend.

Bruce

------

[/home/bruc...-yocto.git]> kgit-merge v4.14/standard/tiny/base 
:v4.14/standard/tiny
Already up-to-date.
Already up-to-date!
Merge made by the 'recursive' strategy.
Already up-to-date!
Merge made by the 'recursive' strategy.
Switched to branch 'v4.14/standard/tiny/base'
[/home/bruc...-yocto.git]> git branch --contains 
09828ddd8d8c91b2d68afdcd8eb99a48e0253582
* v4.14/standard/tiny/base
   v4.14/standard/tiny/common-pc
   v4.14/standard/tiny/intel
[/home/bruc...-yocto.git]> git push origin
Counting objects: 2, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 336 bytes | 0 bytes/s, done.
Total 2 (delta 1), reused 0 (delta 0)
To ssh://git@git.yoctoproject.org/linux-yocto.git
    69908a02e1e9..59628e3129a3  v4.14/standard/tiny/common-pc -> 
v4.14/standard/tiny/common-pc
    23d712fdbb9b..6a5e7b08591d  v4.14/standard/tiny/intel -> 
v4.14/standard/tiny/intel


> 
> Ross


