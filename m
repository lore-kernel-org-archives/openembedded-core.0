Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E8B9C76536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 13:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UDuDkA010527; Sun, 30 Aug 2015 14:57:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R_e6x1iCRAFo; Sun, 30 Aug 2015 14:57:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7UDvEBi010723
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Aug 2015 14:57:25 +0100
Message-ID: <1440943034.32588.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Date: Sun, 30 Aug 2015 14:57:14 +0100
In-Reply-To: <a31e3e1e7be69c7cdfeb2f5ce4913c9dc6256acf.1440642427.git.bruce.ashfield@windriver.com>
References: <cover.1440642427.git.bruce.ashfield@windriver.com>
	<a31e3e1e7be69c7cdfeb2f5ce4913c9dc6256acf.1440642427.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] linux-yocto/3.14: cleanups and gcc5 ARM build fixes
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
X-List-Received-Date: Sun, 30 Aug 2015 13:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-26 at 22:31 -0400, Bruce Ashfield wrote:
> Updating the 3.14 SRCREVs to match the latest kernel meta data updates
> and also to merge four patches Richard Purdie located that fix the
> gcc 5.x ARM build (we still have boot issues, but building is the
> first step).
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> index 0bd94f0c600d..d59f06b81c04 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> @@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
>  
>  require recipes-kernel/linux/linux-yocto.inc
>  
> -SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
> -SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
> -SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
> +SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
> +SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
> +SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
>  

I can't find e4847afbb42583fa05e6a94c8d0c8f8e37ed5622 on the
standard/qemuppc branch? Did you miss a push?

I merged this to master not realising this issue and the autobuilder is
now unhappy so need to get this resolved one way or another ASAP :/.

Cheers,

Richard





