Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40C1460069
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 17:10:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l10-v6so5404861qtj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F3/9BMhYFtOqCbcZu2zgSohUgstlWOYQRUJ5vrKlRso=;
	b=aAA8ii2/0IsufgLMdD3b8G84h0pE7Rk3yr4ic0C48GSFEuUdBsQarFGdGXGD2Y4quK
	fdIvJietQU7ZwG8q7Bl+jAa3hQNwVMVcGVGbsP3FZ3iNPteAI01C3+xTKgxhVhT+R+3V
	RL7VI7ohmkIPFjeVaRdHbRj5uOhRlPw5UvbFmYC70i2omFGXXpUXhYCTVLqoU2HX2d0a
	Ix9cGGr7yPGVypkqmlUnvmBdc/PVKZ3z7V6XeqARTvAlbrhsVZnTG3NYJjAPHwSClrVH
	4/vBzWRKaMPKvXJFMP9+TiH3l0y7zrqSaV4YacuwQCAabnTJ9ZuJuEqzGMqlEXFFmZGd
	Bd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F3/9BMhYFtOqCbcZu2zgSohUgstlWOYQRUJ5vrKlRso=;
	b=Cl5YPrpKwrqTR1tBe4DdO2uvXmDpdOpSbPdQBSbK7kCzCo+PQqgHi5CeZ3VlkqB3VV
	1SB2EaQZ6T8rHouUpyHgaCGlUzCQ9m2EmQy8c8Hfoq/moYHiWpBLx7T74V9XtKozk8+z
	TwAgye4+dk0fSmV9XVQjcteV3vJzrwjcgj+cg70VrVMl59njPTikHyOe+SxjAMoS5AGM
	BhUZvGXk77O5KPF1/2GwBvL/jGKPd6vC958TbvlkeE2cvosP6ZCaSEe8RwLdtmBozsVf
	tNqP9U1xNbZ6fZSvVAxIjEKdoKDEYpBVQHkl0u/b8z7pOupHuJ/qBLIcCbE/7DoxnpsE
	HvZw==
X-Gm-Message-State: APt69E04jgKul/wEsxmvKByApF6m9RngiU2fiAVxv3c433nX5wOEFP6l
	+/eo2z675PnipHu30vp/29cUBoqTFw7aZslovr0=
X-Google-Smtp-Source: ADUXVKLzM4ZVw7DFKt8f3GCnYFhSBom3VtV/GyJ6bEEAYQqpNBrkiwp+Pqepbcd3I6JNBbfjJCHgW71G3dao1fP16rE=
X-Received: by 2002:aed:23e7:: with SMTP id
	k36-v6mr2684994qtc.20.1528391457063; 
	Thu, 07 Jun 2018 10:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 10:10:26 -0700 (PDT)
In-Reply-To: <3afd66f7ab09914a3717995d51de83e88f376d20.1528357628.git.Qi.Chen@windriver.com>
References: <cover.1528357628.git.Qi.Chen@windriver.com>
	<3afd66f7ab09914a3717995d51de83e88f376d20.1528357628.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jun 2018 10:10:26 -0700
Message-ID: <CAMKF1srexS4HMdqcR_S8HM=OJo8VYMAYum-UAQrBcYC-Pt=MRQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] runqemu-ifdown: ensure to clean up TAP
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
X-List-Received-Date: Thu, 07 Jun 2018 17:10:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 12:52 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> In runqemu-ifup, ip command is used to add TAP; in runqemu-ifdown,
> we should do the reversed logic, using ip command to delete TAP, to
> make sure TAP is cleaned up by ourselves.
>
> I can see that in runqemu-ifdown script, 'tunctl -d' and 'iptables'
> commands are used to deal with TAP, but these two commands cannot
> make sure that the TAP is cleaned up.
>
> runqemu-ifup uses 'ip' to set up TAP, we really need to do the opposite
> in runqemu-ifdown.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/runqemu-ifdown | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
> index ffbc9de..2486968 100755
> --- a/scripts/runqemu-ifdown
> +++ b/scripts/runqemu-ifdown
> @@ -51,6 +51,16 @@ fi
>
>  $TUNCTL -d $TAP
>
> +IFCONFIG=`which ip 2> /dev/null`
> +if [ "x$IFCONFIG" = "x" ]; then
> +       # better than nothing...
> +       IFCONFIG=/sbin/ip
> +fi
> +if [ -x "$IFCONFIG" ]; then
> +       if `$IFCONFIG link show $TAP > /dev/null 2>&1`; then
> +               $IFCONFIG link del $TAP
> +       fi
> +fi

Ah this fixes my problem, Now I dont have to reboot the build box :)

