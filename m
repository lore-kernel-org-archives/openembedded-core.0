Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A63776104
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:37:10 +0000 (UTC)
Received: by iodv82 with SMTP id v82so207402556iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=371GQmZ0vIz7S6AFcAki9hxZb4ii4+gZP5ZERRWOynA=;
	b=CPjVj76BgiNQoBxDUM8UYDjmPzv4P/d64FP9u0OQzPgMGG/pGaeBa3hlzgsgSrz/wp
	sP5bvLVOn4XqsvXPCyoxq+dGug2NGqIqTNkFdk1UOwGa/bL8FBIba1sIFJ1C/S9/CdPc
	tRMmX0wlRUfK2A1/GteLF2/YDAaT7jWmaLOH3VdRNIOw5Ukh1SG3gwrnLB5kaM/EbaJR
	SotIFMef3FqwGBNcRgDcqSgJm0gEEXfpbKJuiFcmnuzp+DFTtAoFfavy3LY/jviI7f5J
	cUiAKOrcxvCIhqNC93zT7zfOxyNja1gTcxhZaXCQF04bIq8NH7Pj2PTfY75JpkbH5g78
	p5kA==
MIME-Version: 1.0
X-Received: by 10.107.34.193 with SMTP id i184mr32509113ioi.92.1445283430392; 
	Mon, 19 Oct 2015 12:37:10 -0700 (PDT)
Received: by 10.107.141.18 with HTTP; Mon, 19 Oct 2015 12:37:10 -0700 (PDT)
Received: by 10.107.141.18 with HTTP; Mon, 19 Oct 2015 12:37:10 -0700 (PDT)
In-Reply-To: <1445281177-3309-5-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
	<1445281177-3309-5-git-send-email-armccurdy@gmail.com>
Date: Mon, 19 Oct 2015 12:37:10 -0700
Message-ID: <CAMKF1sovTRrm3=_hnKbV3nKy4b+vk-xjV-CuNQOU21xMsMMfjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
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
X-List-Received-Date: Mon, 19 Oct 2015 19:37:14 -0000
Content-Type: multipart/alternative; boundary=001a1140e78677ec4f05227a4567

--001a1140e78677ec4f05227a4567
Content-Type: text/plain; charset=UTF-8

What do we get with this change
On Oct 19, 2015 12:00 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:

> Use 'atom' as an alias for the first generation Intel Atom CPUs.
> ---
>  meta/conf/machine/include/tune-atom.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-atom.inc
> b/meta/conf/machine/include/tune-atom.inc
> index 5e1bb74..24cd676 100644
> --- a/meta/conf/machine/include/tune-atom.inc
> +++ b/meta/conf/machine/include/tune-atom.inc
> @@ -1,2 +1,2 @@
> -# Atom tunings are the same as core2 for now...
> -require conf/machine/include/tune-core2.inc
> +# Alias for the first generation of Intel Atom CPUs.
> +require conf/machine/include/tune-bonnell.inc
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140e78677ec4f05227a4567
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">What do we get with this change</p>
<div class=3D"gmail_quote">On Oct 19, 2015 12:00 PM, &quot;Andre McCurdy&qu=
ot; &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; =
wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Use &#39;atom=
&#39; as an alias for the first generation Intel Atom CPUs.<br>
---<br>
=C2=A0meta/conf/machine/include/tune-atom.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/in=
clude/tune-atom.inc<br>
index 5e1bb74..24cd676 100644<br>
--- a/meta/conf/machine/include/tune-atom.inc<br>
+++ b/meta/conf/machine/include/tune-atom.inc<br>
@@ -1,2 +1,2 @@<br>
-# Atom tunings are the same as core2 for now...<br>
-require conf/machine/include/tune-core2.inc<br>
+# Alias for the first generation of Intel Atom CPUs.<br>
+require conf/machine/include/tune-bonnell.inc<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1140e78677ec4f05227a4567--
