Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B72A60FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:39:30 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so2061256lbh.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yiRUB7FKqFNqB4rYYlsAT41m0H/uT6+7H5VANoQ2A3o=;
	b=gRE0zh0ut6c2jrzJU/8JYgxdH9UUyvmGYtXN0Ouj8gyzLKsbizFibmcjnLa3AyHfgW
	t53mqHGHgfsiSn+CynlPilmdKqYK1tF6xRAipPREdrHUo6QnGv4oANod2vsSv1X/tCMb
	Umn+3wLIZiAou5xXqZIPM5b/xQW/78Rqdl9t8ejk+SZuoRt4piGTKlKBlsQT+4R4KaFA
	yQDR+IPj1BtVxLfZjbF+r8CysvsM2KFae6I+LcdapQ06ZjR7Uxrd+D4JnEU+VJpg4ugG
	tgiX0Dg4ooMuhQHOg7vn9qPrG1A6haBApkwruyIAPNqqi1bZi10R8jl4cA7IiRS+EcQc
	fRNg==
MIME-Version: 1.0
X-Received: by 10.112.126.37 with SMTP id mv5mr11972334lbb.20.1379079571090;
	Fri, 13 Sep 2013 06:39:31 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 13 Sep 2013 06:39:31 -0700 (PDT)
In-Reply-To: <cover.1379054099.git.liezhi.yang@windriver.com>
References: <cover.1379054099.git.liezhi.yang@windriver.com>
Date: Fri, 13 Sep 2013 09:39:31 -0400
Message-ID: <CADkTA4MKncRXjf84RPrSkPzvbJYKiaJyhik27A8GAjQxKRfavQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-libc-headers: do_install: fix "Argument list too long" error
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
X-List-Received-Date: Fri, 13 Sep 2013 13:39:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 4:23 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Hi Saul and Bruce,

You need to cc me directly on patches like this. I nearly missed this
in the storm
of morning email.

>
> This patch is only for linux-libc-headers, the linux-yocto also has the
> file Makefile.headersinst, but we don't use it when build linux-yocto,
> so it works well, I'm not sure whether we should apply this to
> linux-yocto.

No, we don't need to apply it to linux-yocto, this is a very specific
case, that we've
been trying to get sorted out upstream .. with no luck yet. But since we don't
install headers from the kernel tree itself at the moment, and even if
we do, it isn't
from such a deep directory path, there's no need to carry a change.

That being said, I have issues with the patch, I'll follow up on that
email directly.

Bruce

>
> // Robert
>
> The following changes since commit c6dc3cb329428e92cb035be504e044c1c3c0e939:
>
>   icu-native: do_install: Segmentation fault (2013-09-12 05:29:07 -0400)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib robert/linux_headers
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/linux_headers
>
> Robert Yang (1):
>   linux-libc-headers: do_install: fix "Argument list too long" error
>
>  ...cripts-Makefile.headersinst-args-too-long.patch |   36 ++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_3.10.bb  |    1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-args-too-long.patch
>
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

