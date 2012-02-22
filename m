Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ka6sox@gmail.com>) id 1S0Luy-0004ef-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:48:16 +0100
Received: by iaby12 with SMTP id y12so801680iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 15:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of ka6sox@gmail.com designates
	10.50.184.168 as permitted sender) client-ip=10.50.184.168; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ka6sox@gmail.com
	designates 10.50.184.168 as permitted sender)
	smtp.mail=ka6sox@gmail.com; dkim=pass header.i=ka6sox@gmail.com
Received: from mr.google.com ([10.50.184.168])
	by 10.50.184.168 with SMTP id ev8mr521968igc.29.1329953995272 (num_hops
	= 1); Wed, 22 Feb 2012 15:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OTAppf7dE0//EyVx8ERIjDQD+qMl/hULpy5UstvRDCQ=;
	b=SH8CCQ9kF4217vbYzMIeRCGX5I4AgSGkieP4SYzCtAOgws6rfR4wY80eiMN4AaJG5Y
	Pp/qk+bbwPkENn1kRJ7nfR5Ce5htkjBgw4/DNS+KVvDmQhOKrbKlSgLc007QrIRectGO
	e06MVOKW36DVhBP0scxydk5xJrBCmmEtSkSjQ=
MIME-Version: 1.0
Received: by 10.50.184.168 with SMTP id ev8mr447004igc.29.1329953995214; Wed,
	22 Feb 2012 15:39:55 -0800 (PST)
Received: by 10.50.42.9 with HTTP; Wed, 22 Feb 2012 15:39:55 -0800 (PST)
In-Reply-To: <4F457B4B.4000507@palm.com>
References: <4F457B4B.4000507@palm.com>
Date: Wed, 22 Feb 2012 13:39:55 -1000
Message-ID: <CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Wed, 22 Feb 2012 23:48:16 -0000
Content-Type: multipart/alternative; boundary=14dae934044973cf7104b9960bb0

--14dae934044973cf7104b9960bb0
Content-Type: text/plain; charset=ISO-8859-1

I have a single downloads directory with symlinks for every target build I
have to that directory.  As long as I have the source already in there I
don't fetch  it again

Tom

On Wed, Feb 22, 2012 at 1:33 PM, Rich Pixley <rich.pixley@palm.com> wrote:

>  Is it reasonable to expect to share DL_DIR between multiple builds?
>
> That is, are downloads properly locked so that multiple concurrent
> downloads of the same file won't collide?  And if so, are they NFS safe
> locks?
>
> Or must each build download it's own copies of every component?
>
> I ask because our, (Palm), branch has been, but it's a bit of a nuisance
> to pick a suitable locking mechanism that is both functional and performant.
>
>    - Flock/lockf aren't reliably supported in heterogeneous environments.
>    - The old lockfiles don't work over NFS. Lock directories apparently
>    do, but trying to clean these up after interruptions or failures is a
>    losing battle so if we do use these, we end up with orphan locks
>    periodically.
>    - With NFS as a possibility, we can't assume any kernel local IPC
>    mechanism, so sysV ipc is out.
>    - It seems like a pretty huge overhead to try to create any sort of
>    zeroconf overhead.
>
> Our solution so far has been to use NFS lock directories for multiple
> machine builds and flock/lockf for single machine builds.  This mostly
> works, though it's not ideal, and it's significantly faster than
> downloading/copying all of the component source multiple times even over
> local mirrors.
>  --rich
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--14dae934044973cf7104b9960bb0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have a single downloads directory with symlinks for every target build I =
have to that directory. =A0As long as I have the source already in there I =
don&#39;t fetch =A0it again<div><br></div><div>Tom<br><br><div class=3D"gma=
il_quote">
On Wed, Feb 22, 2012 at 1:33 PM, Rich Pixley <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rich.pixley@palm.com">rich.pixley@palm.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">

 =20

   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Is it reasonable to expect to share DL_DIR between multiple builds?<br>
    <br>
    That is, are downloads properly locked so that multiple concurrent
    downloads of the same file won&#39;t collide?=A0 And if so, are they NF=
S
    safe locks?<br>
    <br>
    Or must each build download it&#39;s own copies of every component?<br>
    <br>
    I ask because our, (Palm), branch has been, but it&#39;s a bit of a
    nuisance to pick a suitable locking mechanism that is both
    functional and performant.<br>
    <ul>
      <li>Flock/lockf aren&#39;t reliably supported in heterogeneous
        environments.</li>
      <li>The old lockfiles don&#39;t work over NFS. Lock directories
        apparently do, but trying to clean these up after interruptions
        or failures is a losing battle so if we do use these, we end up
        with orphan locks periodically.</li>
      <li>With NFS as a possibility, we can&#39;t assume any kernel local
        IPC mechanism, so sysV ipc is out.</li>
      <li>It seems like a pretty huge overhead to try to create any sort
        of zeroconf overhead.</li>
    </ul>
    <p>Our solution so far has been to use NFS lock directories for
      multiple machine builds and flock/lockf for single machine
      builds.=A0 This mostly works, though it&#39;s not ideal, and it&#39;s
      significantly faster than downloading/copying all of the component
      source multiple times even over local mirrors.<span class=3D"HOEnZb">=
<font color=3D"#888888"><br>
    </font></span></p><span class=3D"HOEnZb"><font color=3D"#888888">
    --rich<br>
  </font></span></div>

<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br></div>

--14dae934044973cf7104b9960bb0--
