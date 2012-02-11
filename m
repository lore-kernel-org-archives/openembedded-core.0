Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCjC-0001uG-FR
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 14:10:58 +0100
Received: by eekd41 with SMTP id d41so1022875eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=LTmL4lYLHsjbKCzixrQ8KhZXYQeT9/8lPIGjoiikuAw=;
	b=WnOzN/tIdK8CUB73HWmd0unTt/o8w9fd/AHzEf4BPz/nzS06dxbJGqgTMB4mdqFP+v
	FelkHhyG4zwXCPj26stASnQg4xGRH1nvswFQ38ml2hbzhe2MrsvEInbzaLRp7/ZD+ywB
	rqTyf8wfQtpSdHPqxm4u4if5FZXvas7Y/VATg=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr3225876eeb.39.1328965370543; Sat,
	11 Feb 2012 05:02:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:02:50 -0800 (PST)
In-Reply-To: <dfc93718c100209c9897317d2399da7691a41070.1328920045.git.josh@linux.intel.com>
References: <cover.1328920045.git.josh@linux.intel.com>
	<dfc93718c100209c9897317d2399da7691a41070.1328920045.git.josh@linux.intel.com>
Date: Sat, 11 Feb 2012 11:02:50 -0200
X-Google-Sender-Auth: Bkb-YvQmsKjB0Le-wM9UbJ-1zYs
Message-ID: <CAP9ODKoSuGOiYeV9OEE2V3yX5mp3tpUk-YiFG0heMHGmQ3FwtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base.bbclass: look in layers for SRC_URI with MACHINE overrides too
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
X-List-Received-Date: Sat, 11 Feb 2012 13:10:58 -0000
Content-Type: multipart/alternative; boundary=90e6ba6153a8d47dab04b8afdcd6

--90e6ba6153a8d47dab04b8afdcd6
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 10, 2012 at 22:30, Joshua Lock <josh@linux.intel.com> wrote:

> The logic which looks for MACHINE overrides in SRC_URI and updates
> PACKAGE_ARCH
> accordingly doesn't account for SRC_URI overrides in layers.
>

It seems to address the issue but I think we need to support bbappend with
overrides. If the layer doesn't use a machine override, then:

 * it is not machine depdendant, or
 * is a bug in the layer

People agree with this point of view?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--90e6ba6153a8d47dab04b8afdcd6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 10, 2012 at 22:30, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The logic which looks for MACHINE overrides in SRC_URI and updates PACKAGE_=
ARCH<br>
accordingly doesn&#39;t account for SRC_URI overrides in layers.<br></block=
quote><div><br></div><div>It seems to address the issue but I think we need=
 to support bbappend with overrides. If the layer doesn&#39;t use a machine=
 override, then:</div>
<div><br></div><div>=A0* it is not machine depdendant, or</div><div>=A0* is=
 a bug in the layer</div><div><br></div><div>People agree with this point o=
f view?</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--90e6ba6153a8d47dab04b8afdcd6--
