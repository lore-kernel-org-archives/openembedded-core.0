Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 984CF737EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 10:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t38ADae4000650; Wed, 8 Apr 2015 11:13:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cSIJnzlfjLRN; Wed,  8 Apr 2015 11:13:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t38ADe0E000667
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Apr 2015 11:13:52 +0100
Message-ID: <1428488020.19008.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 08 Apr 2015 11:13:40 +0100
In-Reply-To: <1427387018-6923-1-git-send-email-anibal.limon@linux.intel.com>
References: <1427387018-6923-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: Add support for build with x32 ABI in x86_64
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
X-List-Received-Date: Wed, 08 Apr 2015 10:13:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-03-26 at 16:23 +0000, Aníbal Limón wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> Add autoconf test for detect when build is x32 ABI this enables to
> test into purgatory Makefile to avoid use -mcmodel=large flag in CC.
> 
> Add ELFCLASS read and syscall number into kexec, see patch.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>

I think this patch triggered the exec-tools failures on:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=9d913272ccf821fbf6f8a5f176005135d48ae33a

although I have to admit I don't understand how. Removing the patch
allowed clean builds.

Cheers,

Richard


