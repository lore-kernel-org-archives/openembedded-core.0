Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkhZs-0000pk-M4
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:41:48 +0100
Received: by lami14 with SMTP id i14so2098635lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6vc73T8BaT53nSAWlO5RbS3Ftr/kHAF/ObRdvaTMkz8=;
	b=dwszWNn0hyfD4X03z2UqugFpFG/UUdG0kjyHlzWHQhKTKxfIl4UHaVPbmEQo2rjQ9m
	it9Ui/nYtGGUiAF+9IbRAuuyqKP+TVpBe0h5b3zLXhGDpcevE4DT0Hl9HY4O4CkXOduq
	j5vJ2iDFlFJh64ZmFGD28x+5Gs8DvhDfQC8l8=
MIME-Version: 1.0
Received: by 10.112.102.161 with SMTP id fp1mr4534842lbb.71.1326224059580;
	Tue, 10 Jan 2012 11:34:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 11:34:19 -0800 (PST)
In-Reply-To: <cover.1326216024.git.josh@linux.intel.com>
References: <cover.1326216024.git.josh@linux.intel.com>
Date: Tue, 10 Jan 2012 17:34:19 -0200
X-Google-Sender-Auth: BjfJxBQnDEb5ww8nB5dUgt4z-Mc
Message-ID: <CAP9ODKp+uLq9w3vJcp0Bdk8UiNh0A_cjNAkuCGZyVFWxV+YLcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add alsa-state from OE Classic v2
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
X-List-Received-Date: Tue, 10 Jan 2012 19:41:48 -0000
Content-Type: multipart/alternative; boundary=14dae9d67d3cf6c14604b6319915

--14dae9d67d3cf6c14604b6319915
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 15:39, Joshua Lock <josh@linux.intel.com> wrote:

> The small series following introduces the alsa-state recipe from
> oe-classic.
> The reason for doing so is to remove the requirement for recipes like the
> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards
> sound
> device has the volume turned up.
>

If you're on the mood please also prepare a patch for meta-oe to add
support to systemd. It ought to be quite trivial to add and allow for easy
use for people using systemd based images.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--14dae9d67d3cf6c14604b6319915
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 10, 2012 at 15:39, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The small series following introduces the alsa-state recipe from oe-classic=
.<br>
The reason for doing so is to remove the requirement for recipes like the<b=
r>
beagleboard-audio recipe in meta-yocto, which ensures the beagleboards soun=
d<br>
device has the volume turned up.<br></blockquote><div><br></div><div>If you=
&#39;re on the mood please also prepare a patch for meta-oe to add support =
to systemd. It ought to be quite trivial to add and allow for easy use for =
people using systemd based images.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--14dae9d67d3cf6c14604b6319915--
