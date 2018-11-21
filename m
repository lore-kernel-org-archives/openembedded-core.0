Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F25106B7CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 10:07:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wALA74Mk003541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 21 Nov 2018 10:07:06 GMT
Message-ID: <a62020398837a76303dfc2b9d880279731d955e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 10:07:04 +0000
In-Reply-To: <1542793159-82086-1-git-send-email-zhe.he@windriver.com>
References: <1542793159-82086-1-git-send-email-zhe.he@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: bruce.ashfield@windriver.com
Subject: Re: [PATCH] scripts: Use fixed temporary file instead of pipe for here-doc
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
X-List-Received-Date: Wed, 21 Nov 2018 10:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-11-21 at 17:39 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> A workaround for possible "*** Compiler lacks asm-goto support..
> Stop."
> linux-libc-headers is built by gcc on build machine, which could not
> contain the
> fix.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...-fixed-temporary-file-instead-of-pipe-for.patch | 60
> ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_4.18.bb  |  4 ++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
> libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-
> for.patch

How old is an "old gcc"?

If this isn't going upstream, I'm not sure we want to take and carry
this either. Unless this is a gcc people would commonly run into I'm
tempted not to take this.

Also, your patch subject is wrong as this does not change our scripts
directory.

Cheers,

Richard




