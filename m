Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8EE6A5CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:11:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HFHTrD001184; Mon, 17 Jun 2013 16:17:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NHuqfMQwDKBe; Mon, 17 Jun 2013 16:17:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HFHM3K001173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 17 Jun 2013 16:17:24 +0100
Message-ID: <1371481874.20823.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Mon, 17 Jun 2013 16:11:14 +0100
In-Reply-To: <30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
	<30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] strace: update depends
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
X-List-Received-Date: Mon, 17 Jun 2013 15:11:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-06-16 at 22:16 +0800, Kai Kang wrote:
> Build strace with libaio and acl to support more features. Because no
> native libaio package, just add dependencies for target.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/strace/strace_4.7.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Shouldn't this be implemented like the other packages as PACKAGECONFIG
options? That is how acl is handled elsewhere at least...

Cheers,

Richard

> diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
> index e360e63..bcc7bd9 100644
> --- a/meta/recipes-devtools/strace/strace_4.7.bb
> +++ b/meta/recipes-devtools/strace/strace_4.7.bb
> @@ -5,6 +5,8 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
>  PR = "r4"
>  
> +DEPENDS_class-target += "libaio acl"
> +
>  SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>             file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
>             file://0014-x32-update-syscall-table.patch \



