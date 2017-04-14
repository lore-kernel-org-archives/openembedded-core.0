Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F208719A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:46:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3E9kWHA023084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 14 Apr 2017 10:46:34 +0100
Message-ID: <1492163192.19076.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 10:46:32 +0100
In-Reply-To: <8dda2297e14acc1d586c4e5f1195846f14eb4a52.1492077359.git.liezhi.yang@windriver.com>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
	<8dda2297e14acc1d586c4e5f1195846f14eb4a52.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 14 Apr 2017 10:46:34 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] autogen: update libopts.m4's patch
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
X-List-Received-Date: Fri, 14 Apr 2017 09:46:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-13 at 02:57 -0700, Robert Yang wrote:
> Use 'test -n "$POSIX_SHELL"' rather than 'test -x "$POSIX_SHELL"' so
> that 'POSIX_SHELL = "/usr/bin/env sh"' can work.

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../0001-config-libopts.m4-regenerate-it-from-config-
> libopts..patch     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-
> libopts.m4-regenerate-it-from-config-libopts..patch b/meta/recipes-
> devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-
> config-libopts..patch
> index a14018e..e247594 100644
> --- a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-
> regenerate-it-from-config-libopts..patch
> +++ b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-
> regenerate-it-from-config-libopts..patch
> @@ -30,7 +30,7 @@ index c7ba4f3..51e6a39 100644
>     AC_PROG_SED
>     [while :
>     do
> -+      test -x "$POSIX_SHELL" && break
> ++      test -n "$POSIX_SHELL" && break
>         POSIX_SHELL=`which bash`
>         test -x "$POSIX_SHELL" && break
>         POSIX_SHELL=`which dash`


The patch title makes this sound it it was some kind of regenerated
file. You're then patching this for a rather subtle bug. I worry that
this change is going to get lost in the future when someone regenerates
this.

I'm wondering if we can find a better, more future proof solution?

Cheers,

Richard

