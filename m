Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFBC873D37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3R9J2sR027106; Mon, 27 Apr 2015 10:19:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jo_vMWtLDiac; Mon, 27 Apr 2015 10:19:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3R9ImxE027101
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2015 10:19:00 +0100
Message-ID: <1430126328.13022.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 27 Apr 2015 10:18:48 +0100
In-Reply-To: <5d547cf241f2c8bdc7438362729aaec27b0aa494.1429891826.git.bruce.ashfield@windriver.com>
References: <cover.1429891826.git.bruce.ashfield@windriver.com>
	<5d547cf241f2c8bdc7438362729aaec27b0aa494.1429891826.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kern-tools: unify meta directory detection
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
X-List-Received-Date: Mon, 27 Apr 2015 09:19:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-24 at 12:13 -0400, Bruce Ashfield wrote:
> It is possible that recipe specific tasks, or build processes drop
> files into the kernel source directory. These files can cause problems
> with the meta data detection in the kern-tools.
> 
> With this change, we have a single unified meta data detection routine,
> that logs the result in a new file ".metadir", which subsequent scripts
> can find, and use, thereby avoid repeating the same check many times.
> 
> We also enhance the check to look for a sentinel file in a proper meta
> directory, to avoid false positives when an unexpected kernel process
> leaves an uncommitted directory in the kernel dir.
> 
> [YOCTO: #7441]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index a1ec198fde7f..e83f195a5393 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
>  
>  DEPENDS = "git-native"
>  
> -SRCREV = "83e5493ea46067152609008ade131971eaebbb27"
> +SRCREV = "79bc82453c26d426d3d8fd05d5da37cf5fc4068c"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"

There is no such revision in the repo? The test builds all failed...

Cheers,

Richard




