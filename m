Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdSXa-0001ii-J7
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 21:13:30 +0100
Received: by eeit10 with SMTP id t10so3754569eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=NtijmvjUnElpbC4LIkGLPpnmVplXxiOt7sS8Vhrz7+0=;
	b=TE43++nv9rzHgZdJaqY71gOKEro/Wp2Y5fIKFC3ylftpPWTnNRpNuvupbBP4l3xxZR
	QAsrcp4Bxva9yHRzC1y2A7vefvyozuAwxQfJVa7p92i4+R3nXiZ8rkfTEinGyPOvdBjv
	MrmpX6MJ/vh8P7xKJg/dMWC2PyllF2hktF4Xs=
MIME-Version: 1.0
Received: by 10.205.120.148 with SMTP id fy20mr2132594bkc.125.1324497976159;
	Wed, 21 Dec 2011 12:06:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Wed, 21 Dec 2011 12:06:16 -0800 (PST)
In-Reply-To: <1324496894-29239-1-git-send-email-victor.quicksilver@gmail.com>
References: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
	<1324496894-29239-1-git-send-email-victor.quicksilver@gmail.com>
Date: Wed, 21 Dec 2011 18:06:16 -0200
X-Google-Sender-Auth: j3ie_Sz3CKM2q-2k3bEg2DtKlNc
Message-ID: <CAP9ODKrU5xKwpZc5vLXOJsdz8HDtb4nC8-toq9RdQC9--og9JA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: philb@gnu.org
Subject: Re: [PATCH] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Wed, 21 Dec 2011 20:13:30 -0000
Content-Type: multipart/alternative; boundary=000e0ce040525feead04b49fb73e

--000e0ce040525feead04b49fb73e
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 21, 2011 at 17:48, vquicksilver <victor.quicksilver@gmail.com>wrote:

> This work was made by Victor Enriquez and then modified by
> Denis Carikli who was helped by Mark Hatle comments( who is
> fray on #yocto channel on Freenode ).
>
> The changes are for adding support to armv6-novfp, forbuilding
> binaries for armv6 machines without vfp, for examplethe htcdream.


Some typos on the commit log and missing spaces.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce040525feead04b49fb73e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 21, 2011 at 17:48, vquicksilver <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:victor.quicksilver@gmail.com">victor.qu=
icksilver@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
This work was made by Victor Enriquez and then modified by<br>
Denis Carikli who was helped by Mark Hatle comments( who is<br>
fray on #yocto channel on Freenode ).<br>
<br>
The changes are for adding support to armv6-novfp, forbuilding<br>
binaries for armv6 machines without vfp, for examplethe htcdream.</blockquo=
te><div><br></div><div>Some typos on the commit log and missing spaces.</di=
v><div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--000e0ce040525feead04b49fb73e--
