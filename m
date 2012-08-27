Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T5wEB-0005nR-LR
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 12:07:27 +0200
Received: by wibhq4 with SMTP id hq4so2734200wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fulBX5aSqY3ZPEj6KbTgbRLI0RDp7lOH969DFEUHS2I=;
	b=PwiWJzpCG1uXk53bJVKGz+sPUyq42sZXXhigpdAdRm66nfltidMs6mA/e6DluaBYqR
	ZD1dNRYUnYhk4smh64oS5sCj2fW3LgeNmQnWz/6KSRIzDGwLCTNx+WGuMwZ9Ia7vZTez
	ktNrBvK44+UjGOKIs450ya0z8BvVX7EyW6cML/b23GVt5IjJDOrtML1Lw6HIoesM0kGQ
	POgLlrIBxtzRH6NUvjbmW2QGO2WAhDRBQziOdwhjxmPfedMzPNZFj4o6pBpDFsvGH1Bh
	7YoBo7bKu8MdYMKcw7J1cTKQe5c6Fkbbk2v1OzY7GolK/0CYTNQf2iUIYqud7hDh8khe
	3Ztg==
MIME-Version: 1.0
Received: by 10.180.106.97 with SMTP id gt1mr24403613wib.5.1346061316425; Mon,
	27 Aug 2012 02:55:16 -0700 (PDT)
Received: by 10.216.133.32 with HTTP; Mon, 27 Aug 2012 02:55:16 -0700 (PDT)
In-Reply-To: <1365367.9tL33RJjyz@helios>
References: <CAOHjBZtdvx616YgP-HeXE6xFgrP0y42BJEfPh5r6uTRmoCYQnw@mail.gmail.com>
	<1365367.9tL33RJjyz@helios>
Date: Mon, 27 Aug 2012 11:55:16 +0200
Message-ID: <CAOHjBZvhma=hbA0t6cdEM19QdfpNxDC0uAg-aT5xOiRLEPCk_g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How can I append .inc files?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 10:07:27 -0000
Content-Type: multipart/alternative; boundary=f46d044280669c871604c83c52f9

--f46d044280669c871604c83c52f9
Content-Type: text/plain; charset=ISO-8859-1

Many thanks Paul for the clarification.

Cheers,
Giuseppe

2012/8/27 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Monday 27 August 2012 10:05:15 Giuseppe Condorelli wrote:
> > Is there a way to append (in private layer) the .inc files other than the
> > .bb (bbappend)?
>
> You can't - you can only supply your own version of the inc file (provided
> that
> you can ensure your version is found first via BBPATH), or bbappend every
> recipe that includes them - the latter is preferred.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--f46d044280669c871604c83c52f9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Many thanks Paul for the clarification.</div><div>=A0</div><div>Cheers=
,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">2012/8/27 Paul=
 Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel=
.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Monday 27 August 2012 10:05:15 Giusep=
pe Condorelli wrote:<br>

&gt; Is there a way to append (in private layer) the .inc files other than =
the<br>
&gt; .bb (bbappend)?<br>
<br>
</div>You can&#39;t - you can only supply your own version of the inc file =
(provided that<br>
you can ensure your version is found first via BBPATH), or bbappend every<b=
r>
recipe that includes them - the latter is preferred.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br>

--f46d044280669c871604c83c52f9--
