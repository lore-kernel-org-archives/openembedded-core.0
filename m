Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lazy.gopher@gmail.com>) id 1SHAlS-0007vb-ML
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 11:19:58 +0200
Received: by wibhm17 with SMTP id hm17so1874047wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MnPEt0j2rOPLN42j925NVjEA8oH+Vz78neCHSWGF3yE=;
	b=Vtt0cNKA1t8DdAnGRodA9P3V0DGqhFscyiGDzFWbrxBDdrzTl2g0C1XO7gzLPMpsYH
	JriT1MoLNwf18FE7+A3H1Af1QXLSWKh1iyX8mfMT0q6ePObWeYX/D8SR/CzMgwTfqiHU
	oEmjrw6yXxfGocfd7sx/IB8sYTwvi3QWNK8aKa9XLzu1RDoFqOw/R4bUy2+bRZt6+Szl
	/QSSYnhspZylzbM8xpHBwrZ5CuIF6Xan5wCH0htRn2dkHyaSmY0rUumiS97ouNF0uMVd
	qxP/J2mFT0+RdZMoTzhEfYZT406Ag6jHYK3jUl96GB7KdgK1K6LnSShMca6dTAtbqaGf
	SjxA==
MIME-Version: 1.0
Received: by 10.180.102.100 with SMTP id fn4mr14410099wib.1.1333962642386;
	Mon, 09 Apr 2012 02:10:42 -0700 (PDT)
Received: by 10.223.88.12 with HTTP; Mon, 9 Apr 2012 02:10:42 -0700 (PDT)
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFF56B@SHSMSX102.ccr.corp.intel.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F042758F7@NAEMMAIL01.na.leapfrog.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFF56B@SHSMSX102.ccr.corp.intel.com>
Date: Mon, 9 Apr 2012 11:10:42 +0200
Message-ID: <CAHQk_ASwQtCjjpUdKrmPHDoqB-yxU42dXO0cRGSSsV4BdRDJ6w@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Mon, 09 Apr 2012 09:19:58 -0000
Content-Type: multipart/alternative; boundary=f46d0444ef4f716fac04bd3b6105

--f46d0444ef4f716fac04bd3b6105
Content-Type: text/plain; charset=UTF-8

Hi Dexuan,

> Any chance the students could cross compile the wifi module using
> > an external toolchain?
> We could try this.
> But even I didn't try this before, so this needs efforts to find it out.
>
>
I wanted to achieve exactly the same, namely, compiling modules with
external toolchain. I spend some time last week to get in running for
beagleboard xm and angstrom. I documented everything with a blog post
Comfortable
kernel workflow on Beagleboard XM with
nfsroot<http://veter-project.blogspot.de/2012/03/comfortable-kernel-workflow-on.html>
.

In the end of exercise, I compiled sample module with external toolchain
and loaded it on beagleboard.

Hope some tips from the post will help.
Regards,
Maksym.

--f46d0444ef4f716fac04bd3b6105
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dexuan,<div><br></div><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">&gt; Any chance the students could cross compile the wifi mod=
ule using<br>

&gt; an external toolchain?<br>
We could try this.<br>
But even I didn&#39;t try this before, so this needs efforts to find it out=
.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>I wanted to achieve exactly the same, namely, compiling modul=
es with external toolchain. I spend some time last week to get in running f=
or beagleboard xm and angstrom. I documented everything with a blog post=C2=
=A0<a href=3D"http://veter-project.blogspot.de/2012/03/comfortable-kernel-w=
orkflow-on.html">Comfortable kernel workflow on Beagleboard XM with nfsroot=
</a>.=C2=A0</div>
<div><br></div><div>In the end of exercise, I compiled sample module with e=
xternal toolchain and loaded it on beagleboard.=C2=A0</div><div><br></div><=
div>Hope some tips from the post will help.</div><div>Regards,</div><div>Ma=
ksym.</div>
</div></div>

--f46d0444ef4f716fac04bd3b6105--
