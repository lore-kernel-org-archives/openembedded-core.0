Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SrZ8t-0006Y4-WC
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:38:36 +0200
Received: by qabg1 with SMTP id g1so3435676qab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aY9yEbOYWlmoNJxLEyaMTXeflFZpC7diqnpjVCQqPa8=;
	b=skorV3DpAVSY7k8IQK1CczTSoJ+KZFcXQMdFjH4iyDrG4sfvD1uW6R7LwNMpPmvpMA
	W1E2UCbD96W9K02Zqt+KSrHoSIqAPb42l/HOrNzoCtJFP89d/UqYhnF/F0odVmrLKhr1
	Dt5M5FnsS25Ara2yDYfZwgA/x1m4ZAWbvCH6Huz1aE4DWtnSS79EwDYFYJKgNw8NCd0z
	T28qtpO+kvwTrOKEzslKMHTr/kN40jalAIh31ku/IrfSZbPnUqwiKmgJdBFzySLlU8AH
	O9HxuvMMDTNN9s9DRbFrFuQ56XSCA+FWAkhc1ukx+SWUjHZk2q+f6VsdvkSJ/+9nu6FF
	330A==
MIME-Version: 1.0
Received: by 10.229.147.193 with SMTP id m1mr2009069qcv.128.1342636034522;
	Wed, 18 Jul 2012 11:27:14 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Wed, 18 Jul 2012 11:27:14 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207181358290.23450@oneiric>
References: <alpine.DEB.2.02.1207181358290.23450@oneiric>
Date: Wed, 18 Jul 2012 14:27:14 -0400
Message-ID: <CADkTA4OdgOFcrMyRKgwGgU9DsMWNMU673Zp-DFV_H+GeFpup1w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: any easy way to run kern-tools verbosely?
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
X-List-Received-Date: Wed, 18 Jul 2012 18:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 2:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   if there's a way to do this, i'm going to be so embarrassed.
> perusing kernel do_patch() routine, which eventually calls:
>
>         if [ -n "${KMETA}" ]; then
>                 createme_flags="--disable-meta-gen"
>         fi
>         createme ${createme_flags} ${ARCH} ${kbranch}
>
>   but checking out "createme" in the sysroots/ directory shows:
>
> usage()
> {
> cat << EOF
>
>     createme [-v] [--disable-meta-gen] --meta=<branch name> <arch> <branch> [defconfig]
>
>       --disable-meta-gen: do not automatically create meta data
>                           if not already present in the source tree.
>       --meta: the branch name for meta data. default is 'meta'
>       -v: verbose processing
>       ... snip ...
>
> so "createme" accepts "-v" for verbose, but i see no trivially easy
> way to pass that option given the hardcoding of the call in
> do_patch().  are you just expected to manually edit createme to do
> that?

They are only useful for debugging at the moment, which is me :) So honestly,
there's never been a reason to complicate the reciepes any more by dragging
these options out to that level.

Remember, the yocto recipes are only one binding to the tools, not the only
one.

Cheers,

Bruce

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


