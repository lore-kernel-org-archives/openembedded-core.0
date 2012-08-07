Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyiYv-0002fj-Lh for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 14:07:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BtHGA010386
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 12:55:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09651-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 12:55:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BtAVO010380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 12:55:10 +0100
Message-ID: <1344340512.9756.224.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 12:55:12 +0100
In-Reply-To: <1344306717-6352-2-git-send-email-sen.zhang@windriver.com>
References: <1344306717-6352-1-git-send-email-sen.zhang@windriver.com>
	<1344306717-6352-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] image-mklibs: pass correct libdir to mklibs
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
X-List-Received-Date: Tue, 07 Aug 2012 12:07:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 10:31 +0800, Jesse Zhang wrote:
> libdir should be specified, or else mklibs won't work for 64bit targets.
> It wouldn't be able to find the libs.
> 
>     Traceback (most recent call last):
>       File "<build>/bitbake_build/tmp/sysroots/i686-linux/usr/bin/x86_64-wrs-linux/mklibs", line 553, in <module>
>         header = elf_header(find_lib(libraries.copy().pop()))
>       File "<build>/bitbake_build/tmp/sysroots/i686-linux/usr/bin/x86_64-wrs-linux/mklibs", line 89, in elf_header
>         raise Exception("Cannot find lib: " + obj)
>     Exception: Cannot find lib:
> 
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
>  meta/classes/image-mklibs.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



