Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RupKt-00041C-V7
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:00:12 +0100
Received: by eekd41 with SMTP id d41so2224583eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 09:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=XiKkMbLTiBM5CNClZxyZJROm/NJsGzxzJEHanDsn4Zs=;
	b=fPfA1odDS5WuaY92ZDqiWFpYhw7PvON3ZjoL6bgPZ5IoedOF5+e6yHrg8/Kch9JjCJ
	8u1yDlVHb73b3QxyYe6z+70bAamuka/PheNAEV8yFjrH76bmuD3QlJrtS4RbMEBMMzcM
	y1CWYiTtEsI7cC+qPQ2CEXt8oByskySCb5aKk=
MIME-Version: 1.0
Received: by 10.14.53.74 with SMTP id f50mr7482645eec.5.1328637128097; Tue, 07
	Feb 2012 09:52:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 09:52:08 -0800 (PST)
In-Reply-To: <8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
	<fce0db04f4b95798f3bdf6c925f1707faf14f2ed.1328631790.git.paul.eggleton@linux.intel.com>
	<8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
Date: Tue, 7 Feb 2012 15:52:08 -0200
X-Google-Sender-Auth: d2Ad8YKN6Fth1eFUoaUy0FQ66Qg
Message-ID: <CAP9ODKpTssfD2O9LK3=ntGs4=L7qxr+5UxxvSdBvJqppiQhp1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] classes/buildhistory: sort list fields in package info
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
X-List-Received-Date: Tue, 07 Feb 2012 18:00:12 -0000
Content-Type: multipart/alternative; boundary=90e6ba6150c60e41db04b863703e

--90e6ba6150c60e41db04b863703e
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 15:50, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Sorting PACKAGES is a bad idea, since order does matter in there.


Agreed. Even installed depends might change depending on the installation
order.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--90e6ba6150c60e41db04b863703e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Feb 7, 2012 at 15:50, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Sorting PACKAGES is a bad idea, since order does matter in there.</blockquo=
te><div><br></div><div>Agreed. Even installed depends might change dependin=
g on the installation order.</div><div><br></div></div>-- <br>Otavio Salvad=
or=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<b=
r>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--90e6ba6150c60e41db04b863703e--
