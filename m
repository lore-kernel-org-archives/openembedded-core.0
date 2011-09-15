Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4KEe-00059D-4r for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 00:16:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FMHZhl016187 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:17:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z0lDufi2TP0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:17:35 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FMHU7C016180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:17:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2011 23:11:18 +0100
In-Reply-To: <1316075038-2729-1-git-send-email-Bernhard.Guillon@hale.at>
References: <1316075038-2729-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316124686.25993.29.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] liboil-0.3.17: add upstream Fix-enable-vfp-flag patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 22:16:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 10:23 +0200, Bernhard Guillon wrote:
> Add upstream 1921498bcc06408e8b051a3a9e9ce4182998f748 patch to fix
> compiling with vfp
> 
> Without this patch this error occours on arm with vfp and softfloat:
> 
> | math_vfp_asm.S:273: Error: selected processor does not support `fnegd d12,d4'
> | math_vfp_asm.S:273: Error: selected processor does not support `fstmiad r0!,{d12,d13,d14,d15}'
> | math_vfp_asm.S:273: Error: selected processor does not support `fmxr fpscr,lr'
> | make[3]: *** [math_vfp_asm.lo] Error 1
> 
> Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>

Merged to master, thanks.

Richard



