Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv6uP-0001G4-ET
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 13:46:01 +0100
Received: by eekd41 with SMTP id d41so140033eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=hFH66W01HRyvJOSAgLJikZGeXu2dI8mw2q221jTzuHM=;
	b=fxD2pG/hgV6OrTIWITdawQIDTO404nxWM7YFFXJ7kbxqLYMkf2RP4UCVlK1yDI8ASb
	RRqMDU8s6Nt3po3WgXL//p6Z/tihS1aYA5TP883CzscMxADsrEq0PwPXewjeZ+3vmxhv
	pUmMUHxTnpydL28Ok9r9KSzDlvOrDHR6Ih34s=
MIME-Version: 1.0
Received: by 10.14.206.133 with SMTP id l5mr8375829eeo.22.1328704678276; Wed,
	08 Feb 2012 04:37:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 04:37:58 -0800 (PST)
In-Reply-To: <CAFZPMoZ=F_Adon-nQpRELPL2F3WBJi1Pt3T9sK3t1L-k--R0Cw@mail.gmail.com>
References: <CAFZPMoZ=F_Adon-nQpRELPL2F3WBJi1Pt3T9sK3t1L-k--R0Cw@mail.gmail.com>
Date: Wed, 8 Feb 2012 10:37:58 -0200
X-Google-Sender-Auth: X7O1d0Zqs8qfYGjIqE5soVQybeM
Message-ID: <CAP9ODKo3gEH6bBoxpGMs8AyaeZ+RokAtuL_gxic0rm_PK1WwRA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd.bbclass problems
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
X-List-Received-Date: Wed, 08 Feb 2012 12:46:01 -0000
Content-Type: multipart/alternative; boundary=047d7b3441445c2f3f04b8732a8c

--047d7b3441445c2f3f04b8732a8c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 10:11, Sergey Lapin <slapinid@gmail.com> wrote:

> If I fail postinst start during image build, everything works properly.
>

Yes.

Current systemd-systemctl-native doesn't not support multiple scripts.
Please take a look on this script as it is where the bug needs to be
squashed ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b3441445c2f3f04b8732a8c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 8, 2012 at 10:11, Sergey Lapin <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:slapinid@gmail.com">slapinid@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
If I fail postinst start during image build, everything works properly.<br>=
</blockquote><div><br></div><div>Yes.</div><div><br></div><div>Current syst=
emd-systemctl-native doesn&#39;t not support multiple scripts. Please take =
a look on this script as it is where the bug needs to be squashed ;-)</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b3441445c2f3f04b8732a8c--
