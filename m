Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TSlEw-0006To-8J
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 10:02:34 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so4391110oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 01:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8A5oKwpu42hRje3LUegJGBExJsXHjA+e39JxHibASgY=;
	b=SdbrcCQoRp2fD2YjZ3w/sw27FUThMSf/TTZbJxgBHNntny8Wsn1DyqbRPupt2cU85E
	3sTubq97iN3jixDKoNt9Fa5meOoPQ9lGF661HyK8pc3UviHu3XQlkvE69cakUbPPk8n6
	0WBDXcJanNXbHefrHRorzrl9ScO/XUTJ1449JUKuug3BVL19xYozCFJrKkLuvzqa8T1K
	+vKzsomNwWDJnBi56gQyv0oRwlXMx5XGupx8hzZ6iCze0wCmrmcgG/wO3srocEiEyGIp
	GS1/U9HExX44sLwVd/NIKYf3ka6pLw1vyELy5EZ9qSSfmWSHMcNU0UHHNGM2FkSI8My0
	ASnA==
MIME-Version: 1.0
Received: by 10.60.170.110 with SMTP id al14mr24892342oec.120.1351500539994;
	Mon, 29 Oct 2012 01:48:59 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Mon, 29 Oct 2012 01:48:59 -0700 (PDT)
In-Reply-To: <CAMKF1spobVWMY=F9X45930GmYJZ9fWCCak=zdxKNKab7ZD4x2w@mail.gmail.com>
References: <CAOHjBZsdfnhLumBym4ZO+wxxzAyCq0yONSbRDc4XZS3TH_mJ=Q@mail.gmail.com>
	<CAMKF1spobVWMY=F9X45930GmYJZ9fWCCak=zdxKNKab7ZD4x2w@mail.gmail.com>
Date: Mon, 29 Oct 2012 09:48:59 +0100
Message-ID: <CAOHjBZswZPW6f_4ugCJcJ9w4=y9bt6ADvVd0gjtEnFuiXB-1kw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uclibc sdk issue
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
X-List-Received-Date: Mon, 29 Oct 2012 09:02:34 -0000
Content-Type: multipart/alternative; boundary=bcaec54ee1c099a09804cd2ebd2f

--bcaec54ee1c099a09804cd2ebd2f
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

what I want to build is the meta-toolchain (uclibc) and looking at the
build I can see system tries to build also eglibc packages.
Maybe I'm wrong in something.
Welcome advice.

BR,
Giuseppe

2012/10/26 Khem Raj <raj.khem@gmail.com>

> Why do you want uClibc for narivesdk ? Do you have a build system also
> running uclibc
>
>
> On Friday, October 26, 2012, Giuseppe Condorelli <
> giuseppe.condorelli@gmail.com> wrote:
> > Hi All,
> >
> > I need to build sdk using uclibc.
> > I'm failing on nativesdk-libc-for-gcc dependence because
> > system always finds nativesdk-eglibc as the correct one.
> > I've set TCLIBC to uclibc and in fact (builind with -DDD) I can
> > say the default nativesdk is the uclibc, although the eglibc part
> > will be assigned after checking.
> >
> > Please can you clarify this to me?
> > BR,
> > Giuseppe
>

--bcaec54ee1c099a09804cd2ebd2f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,</div><div>=A0</div><div>what I want to build is the meta-tool=
chain (uclibc) and looking at the</div><div>build I can see system tries to=
 build also eglibc packages.</div><div>Maybe I&#39;m wrong in something.</d=
iv>
<div>Welcome advice.</div><div>=A0</div><div>BR,</div><div>Giuseppe<br><br>=
</div><div class=3D"gmail_quote">2012/10/26 Khem Raj <span dir=3D"ltr">&lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">Why do you want uClibc for narivesdk ? Do you have a build=
 system also running uclibc<div class=3D"HOEnZb">
<div class=3D"h5"><br><br>On Friday, October 26, 2012, Giuseppe Condorelli =
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank">gius=
eppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; Hi All,<br>&gt; =A0<br>&gt; I need to build sdk using uclibc.<br>&gt; =
I&#39;m failing on nativesdk-libc-for-gcc dependence because<br>&gt; system=
 always finds nativesdk-eglibc as the correct one.<br>&gt; I&#39;ve set TCL=
IBC to uclibc and in fact (builind with -DDD) I can<br>

&gt; say the default nativesdk is the uclibc, although the eglibc part<br>&=
gt; will be assigned after checking.<br>&gt; =A0<br>&gt; Please can you cla=
rify this to me?<br>&gt; BR,<br>&gt; Giuseppe
</div></div></blockquote></div><br>

--bcaec54ee1c099a09804cd2ebd2f--
