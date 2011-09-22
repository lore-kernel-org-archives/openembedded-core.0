Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6pZW-0000kb-BD for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:08:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK9KCm029257 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:09:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V4La6abaTmpt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:09:20 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK9DIr029251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:09:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 21:02:56 +0100
In-Reply-To: <1316707046-24981-1-git-send-email-raj.khem@gmail.com>
References: <1316707046-24981-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316721783.28323.4.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] eglibc-2.12: Fix build on powerpc/603e
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
X-List-Received-Date: Thu, 22 Sep 2011 20:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 08:57 -0700, Khem Raj wrote:
> We pass --with-cpu to eglibc now. Which breaks
> the configure for cpus that it does not support
> We add support for ppc603e which gets 2.12
> building for qemuppc.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |   26 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
>  2 files changed, 28 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> new file mode 100644
> index 0000000..5c90e5b
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> @@ -0,0 +1,26 @@
> +We now pass --with-cpu option to eglibc this ends up with configure errors if we do
> +not pass a cpu which eglibc has support for in sysdeps
> +
> +| checking sysdep dirs... configure: error: The 603e subspecies of powerpc is not supported.
> +| + bbfatal 'oe_runconf failed'
> +| + echo 'ERROR: oe_runconf failed'
> +
> +We fix this by adding the 603e sub directories with Implies to generic
> +powerpc to overcome this error
> +
> +Upstream-Status: Inappropriate [OE config related]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Merged to master, thanks.

Richard



