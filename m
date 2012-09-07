Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T9sug-0003ba-IY
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 09:23:38 +0200
Received: by obblz20 with SMTP id lz20so4326279obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 00:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GI0ZW0ysToPiOz0BB/A7DQF/sFdVgoChI+rCW86sU7E=;
	b=lXcvOssPeqOV6kJ4vkg63ersSeOXeQiRF5kqn/R8qAn2cA7r9PdqKUMBGKIhdEbz3u
	f8N24usPjLVbMUBSIDRXHlQs5o6pZ9mCusaKVLq0yUGO2CWBhgZFblo0QP+s7tbVTsOj
	rFL/IB0eKYrw8bh97tIlcpo/Ut0qy20pWOqlKOCf1dSRb2CoP0lJ0s3IodYuIiAacYRy
	PmU5lytEMFH6B27X6O3VCulfbyDIo+LcJx9kMDqisR8HSdFVZDXvJCiVTy6Z4VM+pIYt
	R3lJuJfTunh/hhpGNGdSrBNtf0FngiBQ02EOHvuGCjRJh3ldsFXuA78CPKPhjSpsZacx
	6wOw==
MIME-Version: 1.0
Received: by 10.182.50.103 with SMTP id b7mr4736443obo.15.1347001872713; Fri,
	07 Sep 2012 00:11:12 -0700 (PDT)
Received: by 10.60.33.201 with HTTP; Fri, 7 Sep 2012 00:11:12 -0700 (PDT)
In-Reply-To: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
References: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
Date: Fri, 7 Sep 2012 09:11:12 +0200
Message-ID: <CAOHjBZvb3Zne1eQbw=2J4fVXdQH3QpynzrXsnE17gRNxowFi0A@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot find -lssp during uclibc package build
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
X-List-Received-Date: Fri, 07 Sep 2012 07:23:38 -0000
Content-Type: multipart/alternative; boundary=f46d04451a092286ac04c917509b

--f46d04451a092286ac04c917509b
Content-Type: text/plain; charset=ISO-8859-1

Any news?

2012/9/3 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi Khem, All
>
> I'm building an uclibc image using gcc 4.6.3 instead of the 4.7 version
> oe-core provides.
> I'm falling in the following linker error during uClibc package build:
>
> "Cannot find -lssp"
>
> Now, ssp support is enabled in the uClibc package and disabled in the
> gcc-cross-initial package, so
> ld should not include that by default. Instead it does and if I switch to
> old OE-Core repository (June 2012)
> I can see all goes right just because the gcc-cross-intermediate package
> was still present and uClibc depends on it
> for building. Now, I know the -intermediate package was moved out and the
> -initial one should include it, but
> that's it.
> I've not tested that with gcc 4.7 version, this is out of my scope.
> Please, can you address me to solve this issue?
>
> Best Regards,
> Giuseppe
>
>

--f46d04451a092286ac04c917509b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Any news?<br><br><div class=3D"gmail_quote">2012/9/3 Giuseppe Condorelli <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=
=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</span><br><blockquote sty=
le=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,2=
04,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quote=
">
<div>Hi Khem, All</div><div>=A0</div><div>I&#39;m building an uclibc=A0imag=
e using gcc 4.6.3 instead of the 4.7 version oe-core provides.</div><div>I&=
#39;m falling in the following linker=A0error during uClibc package build:<=
/div>

<div>=A0</div><div>&quot;Cannot find -lssp&quot;</div><div>=A0</div><div>No=
w, ssp support is enabled in the uClibc package and disabled in the gcc-cro=
ss-initial package, so</div><div>ld should not include that by default. Ins=
tead it does and if I switch to old OE-Core repository (June 2012)</div>

<div>I can see all goes right just because the gcc-cross-intermediate packa=
ge was still present and uClibc depends on it</div><div>for building. Now, =
I know the -intermediate package was moved out and the -initial one should =
include it, but</div>

<div>that&#39;s it.</div><div>I&#39;ve not tested that with gcc 4.7 version=
, this is out of my scope.</div><div>Please, can you address me to solve th=
is issue?</div><div>=A0</div><div>Best Regards,</div><div>Giuseppe</div>
<div>
=A0</div>
</blockquote></div><br>

--f46d04451a092286ac04c917509b--
