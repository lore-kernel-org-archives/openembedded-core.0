Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RqYZF-0007VZ-MF
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 00:17:21 +0100
Received: by lahc1 with SMTP id c1so585549lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=vKKS8/JErmfYqL6YuH4rnbqsgnluVNeieFKY5lJrJ80=;
	b=fUtw1++yufZU9S+6l2QeOWm8HIaXQfShetWEhbYhT7ZPP83LeDar94+4EmY3ecqiqk
	lJeKqVlHolSkaodtiq/lXqn+FLttCJLV8E5IU0wvlljdhBjUm1/0xKgeO4LpV6HPx/JP
	smsofW0o18Yfae/K/iRFGP/Ml9oo0ysTCUT1M=
MIME-Version: 1.0
Received: by 10.152.110.102 with SMTP id hz6mr2515062lab.21.1327619371670;
	Thu, 26 Jan 2012 15:09:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.87.101 with HTTP; Thu, 26 Jan 2012 15:09:31 -0800 (PST)
In-Reply-To: <4F1F3B95.4070105@linux.intel.com>
References: <cover.1326481387.git.josh@linux.intel.com>
	<09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
	<4F1F3B95.4070105@linux.intel.com>
Date: Thu, 26 Jan 2012 21:09:31 -0200
X-Google-Sender-Auth: P87PdOCsJn04rfSA7NbChuEB04E
Message-ID: <CAP9ODKqEgTQ1aRLUU=Db9vc3PfR1L=hWsBnTcKKMuWUazrPSjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Thu, 26 Jan 2012 23:17:21 -0000
Content-Type: multipart/alternative; boundary=bcaec54eee6a0b9e1304b776793c

--bcaec54eee6a0b9e1304b776793c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 24, 2012 at 21:15, Joshua Lock <josh@linux.intel.com> wrote:

> I can't see any initscript, so I think switching to what's provided by
> alsa-utils would mean losing state saving for non-systemd folk but systemd
> users can probably just set VIRTUAL-RUNTIME_alsa-state =
> "alsa-utils-alsactl".
>

You still needs the state. So I think we'd need to have a specific -systemd
version of it when the configs and the units.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec54eee6a0b9e1304b776793c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 24, 2012 at 21:15, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div id=3D":2s">I can&#39;t see any initscript, so I think switching to wha=
t&#39;s provided by alsa-utils would mean losing state saving for non-syste=
md folk but systemd users can probably just set VIRTUAL-RUNTIME_alsa-state =
=3D &quot;alsa-utils-alsactl&quot;.<br>
</div></blockquote></div><br>You still needs the state. So I think we&#39;d=
 need to have a specific -systemd version of it when the configs and the un=
its.<br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--bcaec54eee6a0b9e1304b776793c--
