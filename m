Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZOtR-0003lh-2S
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 17:35:49 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1803050pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GJp3rpcyh0uYVz+zmzg+5irBASxESK0tUEFakVKP6nw=;
	b=a2VEhdq3MZdi8fb7YPr1P1ChtHmcOjMr62Q4TlDKoHeUDawaRfoitu+zRqEBsLXsNw
	lN6S4O9N6uewztnYHcJdp26WnLaM6bjUjzSI8F2qg7bBKM7BPD1vAg15G+hmiGWeHfH8
	s/k2d17TyfqEHGpYDqJf4hagdplnJwG8P58dfBS20NE9EjdEMgDs3sn6NV+MgmRiCAwp
	7FPE96tDn+orOonhnD7YGKKowP/sU3AANZrq96r2PYPaGAe7pkPi60nO2780PiYMm0GM
	rv6yWsfbRABlGvnCgL6WLiub9q8ZVcLhGc6bAogEtPmxyslUqQ06qLvJoNBVQowPCrmp
	S0RQ==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr14122063pax.43.1353082910077; Fri,
	16 Nov 2012 08:21:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 08:21:50 -0800 (PST)
In-Reply-To: <CAJTo0LY8kKnOVuPj5AKYDy1gtFph5QBNd0tiRv416Dog7i=vLQ@mail.gmail.com>
References: <1353079960.3709.93.camel@ted>
	<CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
	<CAJTo0LY8kKnOVuPj5AKYDy1gtFph5QBNd0tiRv416Dog7i=vLQ@mail.gmail.com>
Date: Fri, 16 Nov 2012 14:21:50 -0200
X-Google-Sender-Auth: jA-UypfU-G-UI7rDQBH1v2HXho0
Message-ID: <CAP9ODKpYwY8cjdBAuZxOOXaebP-3JjFe9N-KhCt7P9RfDo4iAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 16:35:49 -0000
Content-Type: multipart/alternative; boundary=f46d042f942e34f18f04ce9f2a64

--f46d042f942e34f18f04ce9f2a64
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 2:09 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 November 2012 15:58, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
> >> Its a start at the logic and errs on the
> >
> > s/errs/errors/
>
> http://www.thefreedictionary.com/errs+on+the+side


Cool!

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f942e34f18f04ce9f2a64
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Nov 16, 2012 at 2:09 PM, Burton,=
 Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<div class=3D"im">On 16 November 2012 15:58, Otavio Salvador &lt;<a href=3D=
"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt; Its a start at the logic and errs on the<br>
&gt;<br>
&gt; s/errs/errors/<br>
<br>
</div><a href=3D"http://www.thefreedictionary.com/errs+on+the+side" target=
=3D"_blank">http://www.thefreedictionary.com/errs+on+the+side</a></blockquo=
te><div><br></div><div>Cool!</div><div>=A0</div></div>-- <br>Otavio Salvado=
r=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br=
>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--f46d042f942e34f18f04ce9f2a64--
