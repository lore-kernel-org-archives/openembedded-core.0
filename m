Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TWQav-0004ex-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Nov 2012 12:48:25 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so2622859oag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2012 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7HRTyy4ZQs56YkgDHSwXooaoCtgdDEXvlSAOTciTt1k=;
	b=kcZJt1u+L9dBf9L53App5yRB7GjA3JN0H/pL7cvvgql9roq4Jcv+SoMxXfC27BTaDJ
	jahq7b2v2G/t2ILqaIvu2dC/0iAoPUTEl06xyQn9uRLng+iwNOndyxP9eyAJrXHinVi+
	b+T53BfTAVdTrOL+8QWQtcxuiFcqI4f5HBkK0Scwin6zeULzq8wRSpNHtRGmshYKB0Gy
	i9SCGRhHYK5F+ejY4o7ps66L0UsG626M7fBJc5rt8NCALKndN1mYdfC7GiAQOQl0m/LA
	vWuscNUsaI4DSIvtjsZlisK5xdSPjQCb4wVfoJV1PiINdYOLyz/fEgJgYmKfU58VD4V/
	2hxA==
MIME-Version: 1.0
Received: by 10.60.32.135 with SMTP id j7mr4551600oei.132.1352374477581; Thu,
	08 Nov 2012 03:34:37 -0800 (PST)
Received: by 10.60.123.47 with HTTP; Thu, 8 Nov 2012 03:34:37 -0800 (PST)
In-Reply-To: <CAOHjBZsXDK5NfrPwfHrKDSKeNvF8mf-rH9wXd-WKE8KvBTnpxw@mail.gmail.com>
References: <CAOHjBZsXDK5NfrPwfHrKDSKeNvF8mf-rH9wXd-WKE8KvBTnpxw@mail.gmail.com>
Date: Thu, 8 Nov 2012 12:34:37 +0100
Message-ID: <CAOHjBZu6cCTX9fmYqLJfQoPr=YeSxTGC9OxoO4Cqhk7dWRDaMQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Mips32 uclibc build failure
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
X-List-Received-Date: Thu, 08 Nov 2012 11:48:25 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1f82656ee6104cdfa3871

--e89a8fb1f82656ee6104cdfa3871
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

just to inform that the issue was solved. I've erroneously built against
the uclibc-0.9.33 version downloaded from the download page and not
with the bsf one I can download as .tar.bz2 directly from git page.
Sorry for my question, this was due to cloning restriction I have.

Cheers,
Giuseppe

2012/11/7 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> building for mips32, uclibc build failed with
>
> libc/sysdeps/linux/common/getppid.c:14:1: error: expected expression
> before '=' token
>
> Has someone met the same issue?
>
> Please let me know.
> Cheers,
> Giuseppe
>

--e89a8fb1f82656ee6104cdfa3871
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>just to inform that the issue was solv=
ed. I&#39;ve erroneously built against the uclibc-0.9.33 version downloaded=
 from the download page and not</div><div>with the bsf one I can download a=
s .tar.bz2 directly from git page.</div>
<div>Sorry for my question, this was due=A0to cloning restriction I have.</=
div><div>=A0</div><div>Cheers,</div><div>Giuseppe<br><br></div><div class=
=3D"gmail_quote">2012/11/7 Giuseppe Condorelli <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank">giuseppe.condo=
relli@gmail.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div>Hi All,</div><div>=A0</div><div>building for mips32, =
uclibc build failed with</div>
<div>=A0</div><div>libc/sysdeps/linux/common/getppid.c:14:1: error: expecte=
d expression before &#39;=3D&#39; token</div><div>=A0</div><div>Has someone=
 met the same issue?</div>
<div>=A0</div><div>Please let me know.</div><div>Cheers,</div><div>Giuseppe=
</div>
</blockquote></div><br>

--e89a8fb1f82656ee6104cdfa3871--
