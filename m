Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Scxtv-0004a1-NU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 14:02:47 +0200
Received: by vbbfr13 with SMTP id fr13so1067269vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w3MwB+oFJMnmnWaB50NKcdkw6WKEHWvQM9vkamqjyVw=;
	b=GhnzfxZ3PowwTb/7YYQXKk0mTedBZ0uofufLHRVla54/6Dy2tSZfqfqUwK0cdQGbbl
	3DYuiy1SQgQ5yVq/ZF+aP1CUJpEh3jk9zBmZKX70zlwHnEqBI2O1c+E2vkfq42ncSpEf
	zgqfdaIKz8Rem9xU+xJp32g15Sjitp6/X5XNYffPYs79X0WWwlC61VoZFecUZzcxL9sB
	l3ziEdrij7IRcr83wQbsrYbP/IYNBvv3sDYFeM3qsrIX1SDLU/WFr79NpXTBTfEKaGb1
	4+AgtNwGeWFFzjVyXDy9skpuNcMfyek0e+AlaBJigbLokNfcAvQLhlPh3jiZos9Dh1lE
	v/lw==
MIME-Version: 1.0
Received: by 10.52.97.41 with SMTP id dx9mr4957491vdb.89.1339156337561; Fri,
	08 Jun 2012 04:52:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.234.132 with HTTP; Fri, 8 Jun 2012 04:52:17 -0700 (PDT)
In-Reply-To: <1339151624.27075.0.camel@ted>
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<1339151624.27075.0.camel@ted>
Date: Fri, 8 Jun 2012 08:52:17 -0300
X-Google-Sender-Auth: JYglGaMzHjYw3rOmLJ_iVbpbNls
Message-ID: <CAP9ODKo415ewPTCpy5_dmziRRZgqesjof6zBKmjgHgDFO_XrcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Fix build failure of openjade using newer host
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
X-List-Received-Date: Fri, 08 Jun 2012 12:02:47 -0000
Content-Type: multipart/alternative; boundary=20cf307f3806cc8e9c04c1f4a173

--20cf307f3806cc8e9c04c1f4a173
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 8, 2012 at 7:33 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Why can't we run autoreconf instead of having the huge patch? This might
> be the right answer but I'd like to understand the problem here a bit
> more...
>

The configure scripts are inside config dir and to proper configure it you
need to call it with some params; too hackish! I ended getting this change
from Debian package to not waste time mangling with options for autoreconf
and like.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--20cf307f3806cc8e9c04c1f4a173
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jun 8, 2012 at 7:33 AM, Richard Purdie <=
span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div class=3D"im">Why can&#39;t we run autoreconf instead of having the hug=
e patch? This might</div>
be the right answer but I&#39;d like to understand the problem here a bit<b=
r>
more...<br></blockquote><div><br></div><div>The configure scripts are insid=
e config dir and to proper configure it you need to call it with some param=
s; too hackish! I ended getting this change from Debian package to not wast=
e time mangling with options for autoreconf and like.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--20cf307f3806cc8e9c04c1f4a173--
