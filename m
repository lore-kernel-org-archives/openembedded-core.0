Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 36DDB6AC20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC5gpr004906; Wed, 20 May 2015 13:05:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LIWPWarITK8H; Wed, 20 May 2015 13:05:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC5VLY004880
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 May 2015 13:05:42 +0100
Message-ID: <1432123531.28910.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Wed, 20 May 2015 13:05:31 +0100
In-Reply-To: <555C2326.90207@windriver.com>
References: <1431595911.30971.189.camel@linuxfoundation.org>
	<555C2326.90207@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel/rm_work: Improve interaction
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
X-List-Received-Date: Wed, 20 May 2015 12:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-20 at 14:01 +0800, ChenQi wrote:
> I've observed a side effect of this patch.
> The problem is sstate reuse.
> 
> Steps to reproduce:
> 1) bitbake core-image-minimal
> 2) Change TMPDIR in local.conf
>       TMPDIR = "${TOPDIR}/tmp-test"
> 3) bitbake core-image-minimal
> 
> In theory, sstate objects are all reused in step 3. But currently the 
> do_populate_sysroot sstate object of the kernel is not reused. In 
> addition, other kernel tasks like do_fetch, do_patch, do_compile, etc, 
> are rerun.

Well spotted, I've sent a patch out for this.

Cheers,

Richard


