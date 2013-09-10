Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 081416BF83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 00:44:47 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so6857048pde.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 17:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=D/C5Y9rMAW/hMxzSDSrD+3yPoV/bcPN2kwX3kXbjaxo=;
	b=zpG0x2Q6bgQjjo5LwT7KRT+VJeOOUXDHMAoqCCy3vPeaS8TPjch0Hr2+lccZCkm13d
	GTCtqivG4UT8jJyUIKdY/FFtcxYlxDeWo+ev0BBDDbtMBdOf1Di5mWLq7cmlSDT1UkrB
	H8XfCMxjrokqfxuwVlJrEZ+aIuEKs7rj2fi9iIxKx2gwGg7v7xmELS8dfFSLicBB/OaA
	Jh4G60XARfXglerjcWpGMr3xr7u3/hn+r32HgIzi925cSTBTeGj+eqn5EX8M+yUUECa+
	TGhUdKVqIjWCFqqvpzqcKyGs5ix6VxcQkkssilYKHA5KHhjVCd6c22XIjau1bTY8herD
	H0KQ==
MIME-Version: 1.0
X-Received: by 10.68.134.98 with SMTP id pj2mr22093058pbb.110.1378773888720;
	Mon, 09 Sep 2013 17:44:48 -0700 (PDT)
Received: by 10.70.35.235 with HTTP; Mon, 9 Sep 2013 17:44:48 -0700 (PDT)
In-Reply-To: <9546fb89b434a43ee317e5c26065ef4578778019.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<9546fb89b434a43ee317e5c26065ef4578778019.1377792006.git.Martin.Jansa@gmail.com>
Date: Tue, 10 Sep 2013 10:44:48 +1000
Message-ID: <CANwerB0bBe+ZS5UDjTxP2mmOYXnLpNLb2KpSc7qq75XM07qxjQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 18/20] subversion: Add dependency on file for libmagic
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
X-List-Received-Date: Tue, 10 Sep 2013 00:44:47 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2013 02:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.7.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> index f77656b..4acd70b 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "The Subversion (svn) client"
>  SECTION = "console/network"
> -DEPENDS = "apr-util neon sqlite3"
> +DEPENDS = "apr-util neon sqlite3 file"
>  RDEPENDS_${PN} = "neon"
>  LICENSE = "Apache-2"
>  HOMEPAGE = "http://subversion.tigris.org"
> --
> 1.8.3.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Signed-off-by: Jonathan Liu <net147@gmail.com>

This fixes a subversion build error I was having a couple of weeks ago.

Regards,
Jonathan

