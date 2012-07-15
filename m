Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqRUG-0005lk-Hh
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 18:16:00 +0200
Received: by qabg1 with SMTP id g1so1182132qab.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=N0bNvDNo1NqYpFqmIZy7cstGKw6p/iOjVa/Nnp0SUKU=;
	b=UoULdaWd1YZzUrdh4UdsCAGV62sqw/O5EJUdQhp/SMs3ovee2OAqnchXFRS8va8kBg
	9yqG6zm4oWlWWbHxiks2FTwqh5SpMIp1HCeNVGf9hyoOgWURvvMjU992SOh53bXXa/Yr
	Yv0ovig90B2qxc2vpIHro0RkCVddYjqKSTW3hpN/WAqtgLnTUAlaDa4fuxIfKR9Qx80r
	Na2qJQeXwjHmm4DreiM8SPJJxAPUGryzHHg8e3OQMFJBmnSr2PPeJUzHLH+VaFS8Dad/
	neGgjuu17ouBP0YSw0ZXYJ5OpiO3muBOOj/uNCTAAVdDQQLxFjvxfzTucxFrQ64HYVgN
	aI4Q==
MIME-Version: 1.0
Received: by 10.224.204.131 with SMTP id fm3mr15807066qab.75.1342368283004;
	Sun, 15 Jul 2012 09:04:43 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sun, 15 Jul 2012 09:04:42 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207150506210.31191@oneiric>
References: <alpine.DEB.2.02.1207150506210.31191@oneiric>
Date: Sun, 15 Jul 2012 12:04:42 -0400
Message-ID: <CADkTA4NO70zH0g3je-WXNHRMUnY4+zQ0dVVTrG19=hpXyx3udA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto.bbclass: Fix some obvious typoes in comments.
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
X-List-Received-Date: Sun, 15 Jul 2012 16:16:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 15, 2012 at 5:07 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>

As I mentioned in the other threads, you need to cc them maintainer on patches
to a particular recipe.

I've queued and rebased this onto my stack (those comments are different in
my local) tree.

Thanks for the update.

Bruce

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 48c8974..ca2e837 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -147,10 +147,10 @@ do_kernel_checkout() {
>                 fi
>         done
>
> -       # Create a working tree copy of the kernel by checkout out a branch
> +       # Create a working tree copy of the kernel by checking out a branch
>         git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
>         if [ $? -eq 0 ]; then
> -               # checkout and clobber and unimportant files
> +               # checkout and clobber any unimportant files
>                 git checkout -f ${KBRANCH}
>         else
>                 echo "Not checking out ${KBRANCH}, it will be created later"
> @@ -200,7 +200,7 @@ python do_kernel_configcheck() {
>  }
>
>
> -# Ensure that the branches (BSP and meta) are on the locatios specified by
> +# Ensure that the branches (BSP and meta) are on the locations specified by
>  # their SRCREV values. If they are NOT on the right commits, the branches
>  # are reset to the correct commit.
>  do_validate_branches() {
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


