Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBKh9-0002Rl-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 09:15:39 +0200
Received: by eaad12 with SMTP id d12so61654eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:mime-version
	:in-reply-to:references:date:delivered-to:message-id:subject:from:to
	:content-type; bh=6SzBfXk/nfMZ+z5Lw4Sq1Meu1KCOxalROljj8Oy3rKc=;
	b=WtxQK9Yw4fvC7aPPSUq0bwozMQ9KeHz3fBQfn1OeWppM3ScfP6WQHXtpd7BFYaCrAf
	6j/ZvU6DwxigUurlR5X3ygVRw7Qwd7aeRY8l6QnySLkSBax4lg5IFS+2YPRV9LdIZ5A5
	fiK8XNybMYauGIBQDfJohBoMhZvI00L5zY6KCRvsyjzqRA7TGh1LwoLCZP6x3Jhx5m8z
	8fL0ZpEQOGcYVd+BZ/X1YVrixgvwZSeDhOtMYi1ddFg43y6+FpTHpzMpJCjk4wPeygbJ
	P7HR7fX+U9oxAKmsIGhlL25r8BzN2XV7dnqYiuZ+vwW0oIK+VVPvcUMzN5mk0IuEQ00W
	mpiA==
Received: by 10.204.154.73 with SMTP id n9mr4343604bkw.113.1347346988702;
	Tue, 11 Sep 2012 00:03:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm8430292bkq.12.2012.09.11.00.03.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 00:03:08 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Tue, 11 Sep 2012 09:03:08 +0200
Resent-Message-ID: <20120911070308.GB3465@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.58.12.71 with HTTP; Mon, 10 Sep 2012 23:59:05 -0700 (PDT)
In-Reply-To: <cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
Date: Tue, 11 Sep 2012 08:59:05 +0200
Message-ID: <CA+chaQeP7GESLdd7zKEbSZ78xRn4ketJUDzzn5ChmcO84XzQQQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 07:15:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 10, 2012 at 8:11 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating to 3.4.10 which has been soaking for a bit now, as well
> as picking up the following meta commits from Tom Z:
>
>   a82db2f meta: have systemtap use kprobes and uprobes feature
>   d5d5b80 meta: add kprobes support to ktypes/standard
>   b32d373 meta: add kprobes feature
>   d40ed99 meta: have uprobe feature use uprobe.cfg
>   a69d1db meta: add uprobe.cfg
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> index b2620ea..3b36378 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
>  KBRANCH = "standard/preempt-rt/base"
>  KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>
> -LINUX_VERSION ?= "3.4.9"
> +LINUX_VERSION ?= "3.4.10"
>  LINUX_KERNEL_TYPE = "preempt-rt"
>
>  KMETA = "meta"
>
> -SRCREV_machine ?= "9032b1e9daf5b4396f939981c3be95f67802d18c"
> -SRCREV_machine_qemuppc ?= "08ce190232f89303772b6591ca7daaf2820eb74e"
> -SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
> +SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
> +SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
> +SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>
>  PR = "${INC_PR}.0"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 06bcb9a..7258cba 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
>  KBRANCH_DEFAULT = "standard/base"
>  KBRANCH = "${KBRANCH_DEFAULT}"
>
> -SRCREV_machine_qemuarm ?= "84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d"
> -SRCREV_machine_qemumips  ?= "ba0e336d4527080233c3c410989d4f351529ee4e"
> -SRCREV_machine_qemuppc ?= "e82b8a111430e3820b11f507863c4b8e8734ed8e"
> -SRCREV_machine_qemux86 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_machine_qemux86-64 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_machine ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
> +SRCREV_machine_qemuarm ?= "b15e7b1e9b58b9863bd87778775f86cd8d8880ea"
> +SRCREV_machine_qemumips  ?= "8d5b98f263b5119af2dc30223f311be17173bab9"
> +SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
> +SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"

Doesn't different SRCREV_machine for each MACHINE cause LOCALCOUNT in
SRCPV incrementing on each MACHINE switch?

They are stored under same key:
sqlite> select * from BB_URI_LOCALCOUNT where key like '%linux-yocto-3.4%';
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto_rev|84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/base-linux-yocto_count|16
git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_rev|463299bc2e533e1bd38b0053ae7b210980f269c3
git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto_count|9
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/base-linux-yocto_rev|19f7e43b54aef08d58135ed2a897d77b624b320a
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/common-pc-64/base-linux-yocto_count|7
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-linux-yocto-rt_rev|9032b1e9daf5b4396f939981c3be95f67802d18c
git:git.yoctoproject.org.linux-yocto-3.4.gitstandard/preempt-rt/base-linux-yocto-rt_count|10
git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_rev|463299bc2e533e1bd38b0053ae7b210980f269c3
git:git.yoctoproject.org.linux-yocto-3.4.gitmeta-linux-yocto-rt_count|8

So I guess if you build linux-yocto-3.4 for qemuarm, qemux86-64, then
switch back to qemuarm you'll see linux-yocto built again, same
source, but different SRCPV (LOCALCOUNT).

Cheers,


