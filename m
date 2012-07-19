Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Srtoc-0001Zp-NE
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:43:02 +0200
Received: by yhjj56 with SMTP id j56so2747967yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=X/c/Obj7lugr/C30JAFx4MqiTevAa5oW/5NYuvGAxkQ=;
	b=zcnbPYfS0RWcChgZG67hOu17gj3y/v/P+LStBbss5c1ze1VN30hx7A6N18qanendNu
	ZFoM/qPnpWTg7IYHMXJLQ7WcDYCJlSbYA6FDSb4K2lW8TOwk8FM/N9HR9egM9kTJAZaq
	7+OWA2hu3rfDjqv2fdSA0audyd4KNLhriApMoFyKgpgDgUBigw13wei8SDaSt2wTDlMe
	xxLuGFgAnPh3Zyd4Qf60S6LXu2nbAdB0K2q47sxgFv4rp5b1LuaOkJFFjjZy+OOUOgIs
	evWwaflg3fHVdpCieSTZoVqBTyGrKZjT0oBWwAZRuDuibZLJOU5Ewa22Lo/cAuahl4Km
	R1OA==
MIME-Version: 1.0
Received: by 10.50.161.234 with SMTP id xv10mr19594igb.66.1342715499886; Thu,
	19 Jul 2012 09:31:39 -0700 (PDT)
Received: by 10.231.239.131 with HTTP; Thu, 19 Jul 2012 09:31:39 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207191213190.13512@oneiric>
References: <alpine.DEB.2.02.1207191213190.13512@oneiric>
Date: Thu, 19 Jul 2012 12:31:39 -0400
Message-ID: <CADkTA4P+z4SCiH80WGszFe5ttFHksKbc5Nt6v5F0RHyHDOzjzA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: possible typo in kgit-checkpoint
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
X-List-Received-Date: Thu, 19 Jul 2012 16:43:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 19, 2012 at 12:16 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
> if [ -n "$check_refs" ]; then
>     checkpoint_branch=`echo $check_refs | cut -d- -f2`
>     verify_branch=`git show-ref $checkpoint_branch`
>     checkpoint_tag_name=$check_refs
>     if [ -z "verify_branch" ]; then
>     ... snip ...
>
>   should that last line read
>
>     if [ -z "${verify_branch}" ]; then
>
> instead?

Yep. I can just fix it here, or you can send patch, either works.

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


