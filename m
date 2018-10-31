Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1F360017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 15:50:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f1-v6so14067790edi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=26KpT3NmZC8sv3iCf3CzGJEQDcnliMPttEZKgbSL7IA=;
	b=nTklGRaGA1868O/nbp8v5zhjuonV2s/kezSk13EtXGxYTKGsRpRwSVppLNxiglIBVL
	Eb0wbKLknaiQtsE/BTq1RixPmGg1U0t22Qoqa9/QqtObU1XHSbWA2fT8t0vTdsJZQV/R
	K9aFleygMc+Nz1kuTpXr2h+ii8ibMrOtkG1gG4F+x3pfLY527TiC/Z1QTDKJO9aTPx9o
	b7/bgoJOUuJGQk8w1o58JS/ZqtAQ2TyuTc6+tUmYjBvVvJJ+BIyHBNq6IwbJ0uWI2pyI
	kDZiDj2fDMXeW8zdBeIggz66o4q/ggPtv8Fpe2WEOuXP8eYikbXMHBTy2aL1rO91PJtH
	gjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=26KpT3NmZC8sv3iCf3CzGJEQDcnliMPttEZKgbSL7IA=;
	b=hpHTHrJ2+E8l457mefmUPayzo+hVLM+ifloFynOTZ8oxw2GhRlihSZK19Ixu1YXq0b
	JxIQQMkTZEDYcYftwnMeNh6/tK7F9r+AyJWnGiLJm4j7GGrBeL9w8WoON3eg9DdVKZnY
	d2qs9knm/V+hAFRDJyC9B5rPxyY67OnEB5PE7Y37GOjLExb3Em3WrulOXem3Yn52pl6L
	6yGrtzkTZtd7A1k/2QwAGCJj/leooxSW3lrqoAWz2LY3Idg/ixGU7ZtEnHlllfbl7SOO
	NUEMh3PRcDHPWtKmpcc8FQUbDBCIb3r9Pc5p95GWnwxV4arzhwTLSK5Ajvuf7vntE6EV
	ZKIA==
X-Gm-Message-State: AGRZ1gInvgkyx7Xxy4oeyDFNQ1vO0SMRiwQHU+ZWhamXCSucI2tKhAD+
	mc8bK6K0ivc0k1Vib3f3OJbhbvmMC1LheGjJ5PU=
X-Google-Smtp-Source: AJdET5dELbifeFpsdlLoAoBn5XNgigNWZI+s7fRIwHYOH6CH5XV1U8od00PVEEW1K6NkRtW/yR6Rb1+NYXRJ0u0eP5A=
X-Received: by 2002:a50:985c:: with SMTP id
	h28-v6mr2447663edb.36.1541001057145; 
	Wed, 31 Oct 2018 08:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
	<25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
In-Reply-To: <25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 31 Oct 2018 08:50:45 -0700
Message-ID: <CAFNP8Otrxa9Zaxb=hMdZrFe-OvUcbf1noC-bMLhmzEj-CUa7CQ@mail.gmail.com>
To: yocto.user.mailinglist@gmail.com
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [yocto] 2.6 migration guide
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
X-List-Received-Date: Wed, 31 Oct 2018 15:50:56 -0000
Content-Type: multipart/alternative; boundary="0000000000009c19e705798844ed"

--0000000000009c19e705798844ed
Content-Type: text/plain; charset="UTF-8"

Can you tell me why "123456" is also not removed?  That string contains
instances of "123" and "456"

Thanks,
Scott

On Wed, Oct 31, 2018 at 12:15 AM Robert Berger <
yocto.user.mailinglist@gmail.com> wrote:

> Hi Scott,
>
> On 31.10.18 00:06, Scott Rifenbark wrote:
> >
> > I have an initial section at
> >
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release,
>
> > which is based on Richard's input.  I am sure there are more items.
>
> You might want to add a link to the bitbake manual or some example from
> there for the new functionality of _remove operator:
>
>
> http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=c0a23dd9155c50a6b7df796980bc7b612cac7994#n334
>
> FOO = "123 456 789 123456 123 456 123 456"
> FOO_remove = "123"
> FOO_remove = "456"
>
> FOO is now: "  789 123456    " instead of "789 123456"
>
> >
> > Thanks,
> > Scott
>
> Regards,
>
> Robert
>
>

--0000000000009c19e705798844ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you tell me why &quot;123456&quot; is also not re=
moved?=C2=A0 That string contains instances of &quot;123&quot; and &quot;45=
6&quot;</div><div><br></div><div>Thanks, <br></div><div>Scott<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 31, 2018 at 1=
2:15 AM Robert Berger &lt;<a href=3D"mailto:yocto.user.mailinglist@gmail.co=
m">yocto.user.mailinglist@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hi Scott,<br>
<br>
On 31.10.18 00:06, Scott Rifenbark wrote:<br>
&gt; <br>
&gt; I have an initial section at <br>
&gt; <a href=3D"https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.htm=
l#moving-to-the-yocto-project-2.6-release" rel=3D"noreferrer" target=3D"_bl=
ank">https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to=
-the-yocto-project-2.6-release</a>, <br>
&gt; which is based on Richard&#39;s input.=C2=A0 I am sure there are more =
items.<br>
<br>
You might want to add a link to the bitbake manual or some example from <br=
>
there for the new functionality of _remove operator:<br>
<br>
<a href=3D"http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual=
/bitbake-user-manual-metadata.xml?id=3Dc0a23dd9155c50a6b7df796980bc7b612cac=
7994#n334" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=
=3Dc0a23dd9155c50a6b7df796980bc7b612cac7994#n334</a><br>
<br>
FOO =3D &quot;123 456 789 123456 123 456 123 456&quot;<br>
FOO_remove =3D &quot;123&quot;<br>
FOO_remove =3D &quot;456&quot;<br>
<br>
FOO is now: &quot;=C2=A0 789 123456=C2=A0 =C2=A0 &quot; instead of &quot;78=
9 123456&quot;<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Scott<br>
<br>
Regards,<br>
<br>
Robert<br>
<br>
</blockquote></div>

--0000000000009c19e705798844ed--
