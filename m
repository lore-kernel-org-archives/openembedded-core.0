Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8C477B20
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:34:54 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id w64so15465756wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xd1MgU+99yeS+LXM6eLg+5WW1AGDHdPxeYu8ppZbjMo=;
	b=XYAwf6h7hTvKIQ/FbbH+/fa6+QdH15u6lwQWRFkVkuifIjngmVWnQQTt35gTGhgmfp
	TMqr5ImTeCz2/4amGZ8Jf5iPA6zt+zB2qEg0ma9jSbVMHVHp8KZDw2f7Da0wy4+3YTnv
	c7LEqUgJNBUPDcPbeI049RM0/y9h5YgmGdInJOQqOaGKPEVS3hA0snzSyiBsowWxL6kZ
	vA+IbZtecVkNpMWvQWT+PwUv1RKe+cIioPcS3oWwzHKSK/K+CLuyVj6xVRH073/jo+ca
	3efqmE48P4/nD+KrK8iUp9c4PcOj3yrs5DA8g17h8pclgFztF6Br0K1whKx4C6GKRjSt
	hD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xd1MgU+99yeS+LXM6eLg+5WW1AGDHdPxeYu8ppZbjMo=;
	b=K5ItyCn0vm4LkE7lEYmgCMoG8XaDAIebzSSNYWa5FhXN1JVsTsSD4qy5OCsReUdpxV
	vbr10OcaxVuLxBeHK+d5JNCct/X6AyvuLaVnPrsZfVU+CQ9rGFhZSk8up7MQuPm6LpFE
	JxgpGeigAcxJDaFzDmnt/nP5NCWAQJrEEY60lGH+9xPefpzot4MZp+iS/j9Edv/w3vFg
	gZloKwfdjM7WwNGOiaWiCoMSVb7URw0I2XsKzHrs0Nu7woPKireedbKPEX8pVFLPDYS4
	smk7LsaDAUKxgS3VbrPyW4BpJG7AaG4gnTUZZ0/07Ndx/DhsXwLOoUplvZix7XPDPqGU
	HOTw==
X-Gm-Message-State: AN3rC/5npUdhBoW1mLQBpDld6VZ9W75p8MhjLJz/lC12N6i3TQRn5Xb+
	nK/bhxtB0k0khthWOtRCgTXXz2Ufsg==
X-Received: by 10.80.149.209 with SMTP id x17mr28910976eda.175.1493897695642; 
	Thu, 04 May 2017 04:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Thu, 4 May 2017 04:34:55 -0700 (PDT)
In-Reply-To: <e361d15615e24c2eb9cc5b799bcfe834@XBOX02.axis.com>
References: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
	<b5e9622b-3b01-a793-21ea-b15ea730e8bd@linux.intel.com>
	<e361d15615e24c2eb9cc5b799bcfe834@XBOX02.axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 May 2017 13:34:55 +0200
Message-ID: <CA+chaQdNVsBGQquX-KSUmHB9aOTDSc2awgS4rSMndMQwR+JvhQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regression with RPM4 and unversioned DSOs
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
X-List-Received-Date: Thu, 04 May 2017 11:34:56 -0000
Content-Type: multipart/alternative; boundary=f403045c28a67ac97e054eb12935

--f403045c28a67ac97e054eb12935
Content-Type: text/plain; charset=UTF-8

You might want to check the output of package_do_shlibs function in
meta/classes/package.bbclass
in case it's already missing there.

On Thu, May 4, 2017 at 1:30 PM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> > Sent: den 4 maj 2017 11:54
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: OE Core (openembedded-core@lists.openembedded.org) <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: Regression with RPM4 and unversioned DSOs
> >
> > On 05/04/2017 11:46 AM, Peter Kjellerstedt wrote:
> > > Since I would very much like to avoid having to add explicit runtime
> > > dependencies for all those dependencies that were previously
> > automatically
> > > detected, which would be a nightmare, I am now looking for any help
> > as to
> > > where to find the code that adds the dependencies on the packages
> > providing
> > > DSOs and to see if it is possible to change it to also detect
> > dependencies
> > > on unversioned DSOs.
> >
> > I'm not sure such implicit dependency detection at rpm generation point
> > is guaranteed to work in the first place. Don't we have a package_qa
> > check for this that should be failing? Can you publish a minimal layer
> > so I can reproduce locally?
> >
> > If you want to poke in rpm4 source, I think grepping for
> > use_internal_dependency_generator is a good starting point.
>
> I was more thinking of the code in OE-core that generates the list of
> Requires that goes into the spec file. The matching sections from the
> spec files for the apta-utility package that I used as example in my
> first mail are (for Pyro):
>
> Requires: libc6 >= 2.25
>
> and (for Morty):
>
> Requires: ld.so.1
> Requires: ld.so.1(GLIBC_2.4)
> Requires: libapta.so
> Requires: libc.so.6
> Requires: libc.so.6(GLIBC_2.0)
> Requires: libc.so.6(GLIBC_2.2)
> Requires: libc.so.6(GLIBC_2.3)
> Requires: libc.so.6(GLIBC_2.3.4)
> Requires: libc.so.6(GLIBC_2.4)
> Requires: libc.so.6(GLIBC_2.7)
> Requires: libc6 >= 2.24
> Requires: libubihelper.so
> Provides: elf(buildid) = 097a4862c4d6275838e8eb5759501630b7913485
>
> So I think it is quite obvious that something has changed in OE-core in
> how these lists are generated... It is also apparent that the problem
> with lack of dependencies on packages with unversioned DSOs was already
> present in Morty. However, since it was hidden by the direct dependencies
> on the DSOs it was not apparent before.
>
> Does RPM4 support dependencies on DSOs, or was that an RPM5 feature?
> If RPM4 supports it, why was it removed when dnf was introduced?
>
> > Alex
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c28a67ac97e054eb12935
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(0,0,0)">You might want to check the output of package_do_shlibs functi=
on in=C2=A0</span></span><span style=3D"font-family:monospace"><span style=
=3D"color:rgb(0,0,0)">meta/classes/package.bbclass in case it&#39;s already=
 missing there.</span><br></span></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Thu, May 4, 2017 at 1:30 PM, Peter Kjellerstedt <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=
=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: Alexander Kanavin [mailto:<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@<wbr>linux.intel.com</a>]<br>
&gt; Sent: den 4 maj 2017 11:54<br>
&gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Cc: OE Core (<a href=3D"mailto:openembedded-core@lists.openembedded.or=
g">openembedded-core@lists.<wbr>openembedded.org</a>) &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org">core@lists.openembedded=
.org</a>&gt;<br>
&gt; Subject: Re: Regression with RPM4 and unversioned DSOs<br>
&gt;<br>
&gt; On 05/04/2017 11:46 AM, Peter Kjellerstedt wrote:<br>
&gt; &gt; Since I would very much like to avoid having to add explicit runt=
ime<br>
&gt; &gt; dependencies for all those dependencies that were previously<br>
&gt; automatically<br>
&gt; &gt; detected, which would be a nightmare, I am now looking for any he=
lp<br>
&gt; as to<br>
&gt; &gt; where to find the code that adds the dependencies on the packages=
<br>
&gt; providing<br>
&gt; &gt; DSOs and to see if it is possible to change it to also detect<br>
&gt; dependencies<br>
&gt; &gt; on unversioned DSOs.<br>
&gt;<br>
&gt; I&#39;m not sure such implicit dependency detection at rpm generation =
point<br>
&gt; is guaranteed to work in the first place. Don&#39;t we have a package_=
qa<br>
&gt; check for this that should be failing? Can you publish a minimal layer=
<br>
&gt; so I can reproduce locally?<br>
&gt;<br>
&gt; If you want to poke in rpm4 source, I think grepping for<br>
&gt; use_internal_dependency_<wbr>generator is a good starting point.<br>
<br>
I was more thinking of the code in OE-core that generates the list of<br>
Requires that goes into the spec file. The matching sections from the<br>
spec files for the apta-utility package that I used as example in my<br>
first mail are (for Pyro):<br>
<br>
Requires: libc6 &gt;=3D 2.25<br>
<br>
and (for Morty):<br>
<br>
Requires: ld.so.1<br>
Requires: ld.so.1(GLIBC_2.4)<br>
Requires: libapta.so<br>
Requires: libc.so.6<br>
Requires: libc.so.6(GLIBC_2.0)<br>
Requires: libc.so.6(GLIBC_2.2)<br>
Requires: libc.so.6(GLIBC_2.3)<br>
Requires: libc.so.6(GLIBC_2.3.4)<br>
Requires: libc.so.6(GLIBC_2.4)<br>
Requires: libc.so.6(GLIBC_2.7)<br>
Requires: libc6 &gt;=3D 2.24<br>
Requires: libubihelper.so<br>
Provides: elf(buildid) =3D 097a4862c4d6275838e8eb57595016<wbr>30b7913485<br=
>
<br>
So I think it is quite obvious that something has changed in OE-core in<br>
how these lists are generated... It is also apparent that the problem<br>
with lack of dependencies on packages with unversioned DSOs was already<br>
present in Morty. However, since it was hidden by the direct dependencies<b=
r>
on the DSOs it was not apparent before.<br>
<br>
Does RPM4 support dependencies on DSOs, or was that an RPM5 feature?<br>
If RPM4 supports it, why was it removed when dnf was introduced?<br>
<br>
&gt; Alex<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
//Peter<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045c28a67ac97e054eb12935--
