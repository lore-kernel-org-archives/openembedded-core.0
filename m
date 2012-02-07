Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RupIm-0003X6-Q3
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:58:00 +0100
Received: by eaal10 with SMTP id l10so1997309eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=74/Di0VOa8eVCuDVPnXnL2dP08uIkdqXIX18OZ7A8Gc=;
	b=Zhsi7hUlByZC0KkjH4Y0ipuiYU777/gytffG5RabjZuYSCpugZr4GnlpARHoiqV5ml
	8br/n4HcQN5MbLSc6kOedo9lVhHRCJsEqR3dnWwYOqvDPinI7XmirtB2WLRmhDTOYKeF
	lWbOGbYPoe5nFEeP8YPgtNttJokJ3UV41Cpn0=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr7272358eec.56.1328636998262; Tue,
	07 Feb 2012 09:49:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 09:49:58 -0800 (PST)
In-Reply-To: <2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
	<04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 15:49:58 -0200
X-Google-Sender-Auth: cV7w6t7-nIkhpMMCIoXdMX8AXhI
Message-ID: <CAP9ODKozBCcoddJ1PKPOKJAy_OWerS+qvxPe9qGmR3SLT=RdqQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/20] gcc-cross-testing: Fix evaluation of user and target name
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
X-List-Received-Date: Tue, 07 Feb 2012 17:58:00 -0000
Content-Type: multipart/alternative; boundary=002354477cd051205804b8636813

--002354477cd051205804b8636813
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 6, 2012 at 04:40, Khem Raj <raj.khem@gmail.com> wrote:

> Dont use -q to grep we pipe to /dev/null anyway all we
> care is the return status of grep
>

There're any reason to not use grep -q and drop the pipe?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--002354477cd051205804b8636813
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Feb 6, 2012 at 04:40, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Dont use -q to grep we pipe to /dev/null anyway all we<br>
care is the return status of grep<br></blockquote><div><br></div><div>There=
&#39;re any reason to not use grep -q and drop the pipe?</div><div>=A0</div=
></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--002354477cd051205804b8636813--
