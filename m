Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4203F6F75F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 03:51:11 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id 10so2295200lbg.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 20:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KlqymDz7RYoO+fIa03nbd6WSZ6qK33zg/26O/+GTS6g=;
	b=mTVuFSluWoJUHht8zlAy0tHYSwH9XWUAhUWE0Sg8DocGEjfzLLKqEG81EK8E+C3nR9
	W7ATktwr7cbtd9Eu4Hy3/+B+epfr17eAIZxYUb27TcXrjxxRvFPPHduL+LOpNXu5yVdn
	vtsyMfGvuCH2ymdIhoSMlu63vuzLA4JJ5iwmgUH3n+qFQG1DDudi0UCfozA5BFk0xANs
	OG8kbeGL+97PRsWpWiVtYUoLfus7EHwl+7yOar5RKngDXBng/Z3kbpvx+v5HSXigFbyz
	vCMiAFYGKJhhDhrIg8IwfYadrOmMx/8/lhgv6PVv1CX5zxcC3umByPgTg1LY6wb+aPqv
	4zmQ==
MIME-Version: 1.0
X-Received: by 10.152.234.130 with SMTP id ue2mr8158248lac.0.1394855471416;
	Fri, 14 Mar 2014 20:51:11 -0700 (PDT)
Received: by 10.112.170.166 with HTTP; Fri, 14 Mar 2014 20:51:11 -0700 (PDT)
In-Reply-To: <0b46d38b8e08d22c308a49d3ccb96ae9c8f14121.1394831720.git.dvhart@linux.intel.com>
References: <0b46d38b8e08d22c308a49d3ccb96ae9c8f14121.1394831720.git.dvhart@linux.intel.com>
Date: Fri, 14 Mar 2014 23:51:11 -0400
Message-ID: <CADkTA4NkEu6-4tgea7zj9k2n1rQQMMBDvMCiDDJuRqo-LwocqQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-custom: Use SRCREV_machine
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
X-List-Received-Date: Sat, 15 Mar 2014 03:51:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 14, 2014 at 5:15 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> The Yocto kernel tools look for SRCREV_machine in do_validate_branches,
> if it's empty, it just returns and silently continues. This likely needs
> at least a warning. However, this recipe should be using SRCREV_machine,
> and not just SRCREV.

I can't think of anything that breaks with this .. but my spidey
senses are tingling.

This log should tell us what actually broke in the end ? What failed
to build / work
or otherwise explode ?

Bruce

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Reported-by: Saul Wold <sgw@linux.intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index 4115d2f..42162f3 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -54,7 +54,7 @@ LINUX_VERSION_EXTENSION ?= "-custom"
>  # Override SRCREV to point to a different commit in a bbappend file to
>  # build a different release of the Linux kernel.
>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
> -SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
> +SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>
>  PR = "r1"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

