Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2808D6CE84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 02:31:00 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gx14so2911214lab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Yl0Ez7e3pPGl/eMbOcdhqJ7jsHSRM9ivUtqjiOZ58nY=;
	b=N5vj44vxpN8uJJHRNPYcfZ0GEWaNze05QLQ1P15YejX/xVg0QuQtbXCqrhqtNJeuTF
	WrfwoUbjL6R5Jmwf+rdY2n3zyKScwVgsBNY3sFqfLs6paQwn4C8PvfFveBd1oGpmAEft
	GRWYOZRe7OHMsIReHlIzKPJ7OS8igK6u+k9rIJCNSPxX+6bz/t3slWzB1joUvLvser2Z
	ZO+oxbpXSZVDkCrMYw813nKPI8C8J3PfC7jY3YksZaqDCAs/Sfiv7mXEePy/NPHoXoOp
	iO7YNzhhYZ6sE/aJdAniagRkOrSRx/WCjkPv1I045EBaDFxFSnnnIiRE2jW804PrmwCD
	2IEQ==
MIME-Version: 1.0
X-Received: by 10.152.6.41 with SMTP id x9mr87374lax.31.1381458661892; Thu, 10
	Oct 2013 19:31:01 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 10 Oct 2013 19:31:01 -0700 (PDT)
In-Reply-To: <355273a51c66495b635703627d588940a9c9c7d4.1381395083.git.pkj@axis.com>
References: <cover.1381395083.git.pkj@axis.com>
	<355273a51c66495b635703627d588940a9c9c7d4.1381395083.git.pkj@axis.com>
Date: Thu, 10 Oct 2013 22:31:01 -0400
Message-ID: <CADkTA4OZPo2pGyH_3rLPx82AiY29p0HKeHxb17VLmUbwMzKUjA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel-yocto: Add a missing '['
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
X-List-Received-Date: Fri, 11 Oct 2013 02:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 10, 2013 at 4:52 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Ouch. And the worst part is that I've since changed this line in some pre 1.6
work and didn't notice the fat finger slip.

I'd merge this myself, but I'm out of the office, so I'll ack it here,
and RP/Saul
can hopefully pick it up directly.

Bruce

> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 97a5fa7..8f79932 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -298,7 +298,7 @@ do_validate_branches() {
>         set +e
>         # if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
>         # check and we can exit early
> -       if [ "${SRCREV_machine}" = "AUTOINC" ] || "${SRCREV_machine}" = "INVALID" ] ||
> +       if [ "${SRCREV_machine}" = "AUTOINC" ] || [ "${SRCREV_machine}" = "INVALID" ] ||
>            [ "${SRCREV_machine}" = "" ]; then
>                 return
>         fi
> --
> 1.8.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

