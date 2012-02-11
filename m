Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCe0-0001op-5J
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 14:05:36 +0100
Received: by eekd41 with SMTP id d41so1021866eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=oDIaFhbXQMtwtEZCYhwyH+tS2lJ1P06nkjKKLUu9BWU=;
	b=mFze8PCeJGfgBO7QN+eWl2hzbPbPsGQzkoF1rimygKlx6INNEyXgkCEn+DdSZ6mMNK
	YNssMPfRlkCgSs6y+ecXuVUC+2UaLSaI+48URQzIT2Du+5bbXIAQDXTSDUo42xCkNUDm
	Qgo+HQNbxIV0PH41Va8UTE9d3kde8yjCY9aNk=
MIME-Version: 1.0
Received: by 10.14.53.74 with SMTP id f50mr3235534eec.5.1328965048672; Sat, 11
	Feb 2012 04:57:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 04:57:28 -0800 (PST)
In-Reply-To: <20120211020527.GD2095@sakrah.homelinux.org>
References: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
	<20120211020527.GD2095@sakrah.homelinux.org>
Date: Sat, 11 Feb 2012 10:57:28 -0200
X-Google-Sender-Auth: A9inDaPIhGUfMdzAq660Aqwnaow
Message-ID: <CAP9ODKqLQ-NZ4mADUcqw1ro-YUD1gA8K_hBH4YiHUGhKG5wEmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] zlib: export LDCONFIG = true to disable runnig host's ldconfig
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
X-List-Received-Date: Sat, 11 Feb 2012 13:05:36 -0000
Content-Type: multipart/alternative; boundary=90e6ba6150c6a5236e04b8afc995

--90e6ba6150c6a5236e04b8afc995
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 11, 2012 at 00:05, Khem Raj <raj.khem@gmail.com> wrote:

> On (10/02/12 16:41), Martin Jansa wrote:
> > * it's called from install-libs target and when /etc/ld.so.cache is
> writeable by user running bitbake
> >   then it creates invalid cache (in my case libstdc++.so cannot be found
> after building zlib(-native)
> >   and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it
>
> hmm does it happen only with native or with both ?
>
> i think we need to fix zlib install in this case.


I agree; setting LDCONFIG to true workarounds this instead of fixing it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--90e6ba6150c6a5236e04b8afc995
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Feb 11, 2012 at 00:05, Khem Raj <span di=
r=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On (10/02/12 16:41), Martin Jansa wrote:<br>
&gt; * it&#39;s called from install-libs target and when /etc/ld.so.cache i=
s writeable by user running bitbake<br>
&gt; =A0 then it creates invalid cache (in my case libstdc++.so cannot be f=
ound after building zlib(-native)<br>
&gt; =A0 and I have to call touch */libstdc++.so &amp;&amp; /sbin/ldconfig =
to fix it<br>
<br>
</div>hmm does it happen only with native or with both ?<br>
<br>
i think we need to fix zlib install in this case.</blockquote><div><br></di=
v><div>I agree; setting LDCONFIG to true workarounds this instead of fixing=
 it.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--90e6ba6150c6a5236e04b8afc995--
