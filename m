Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCcM-0001lP-4m
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 14:03:54 +0100
Received: by eekd41 with SMTP id d41so1021601eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Nl3wOp50As4qgA7wOPm4DV8bpYxC0NtPLz49S/K1sB0=;
	b=Tw762eH+H8tnm++oN6QXEE6adAaYuwoN6B9QDPrZLl4iAWHWJnWOH8AwaspN+2CCel
	1io1cdrC1ddcNS3Fotj8zaYJz6z8sZl9zxT4KLugiu01jkCC484MkmdkQM4oqeCvGpFv
	e+0K9acrSqKnCGzZHxWG3zMYo7jQfhPOPpSzE=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr3132616eec.56.1328964947271; Sat,
	11 Feb 2012 04:55:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 04:55:47 -0800 (PST)
In-Reply-To: <1328964397-15855-1-git-send-email-andrei@gherzan.ro>
References: <1328964397-15855-1-git-send-email-andrei@gherzan.ro>
Date: Sat, 11 Feb 2012 10:55:47 -0200
X-Google-Sender-Auth: aTMOTj1S-HnFd9DNvXOtzqS5OqM
Message-ID: <CAP9ODKpsKY46PmDF9pOavyX73Zf4xK1eGane7tFZD_SHOE3+_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nspr: Compile nspr with tests 1. Compile package tests suite 2. Add patch for removing rpath from binaries 3. Add tests to -dev rpm as it needs dev libraries
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
X-List-Received-Date: Sat, 11 Feb 2012 13:03:54 -0000
Content-Type: multipart/alternative; boundary=002354477cd099e02004b8afc3ca

--002354477cd099e02004b8afc3ca
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 11, 2012 at 10:46, Andrei Gherzan <andrei@gherzan.ro> wrote:

> +do_compile_append() {
> +    cd pr/tests
> +    make
> +}
>

I'd prefer if you might use:

oe_runmake -C pr/tests

Ought to do the same.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--002354477cd099e02004b8afc3ca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Feb 11, 2012 at 10:46, Andrei Gherzan <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div id=3D":2v">+do_compile_append() {<br>
+ =A0 =A0cd pr/tests<br>
+ =A0 =A0make<br>
+}<br></div></blockquote></div><br>I&#39;d prefer if you might use:<div><br=
></div><div>oe_runmake -C pr/tests</div><div><br></div><div>Ought to do the=
 same.<br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
</div>

--002354477cd099e02004b8afc3ca--
