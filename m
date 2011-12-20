Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd66l-0007LQ-PV
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 21:16:19 +0100
Received: by eaal1 with SMTP id l1so6128496eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 12:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=39DpKxPqL08OvyolH2ufidLu9ZIfY2J2cJCLD70tzoo=;
	b=WgpZrddukiO3wzK28LNsRivW+yMyOzu6MB0QF9iJlH/gmMdppJNOnfPAnAo21YzfQI
	53sVT8Q/I+F24W2RIbUnEje5KpQmzbXuQya4LwYivqEJXmtK0PjoJ/Dh0ubFG5h7o4oK
	OaCcCfTbe1S6F6Gszf7YmOThTwHAw3XQGL1iE=
MIME-Version: 1.0
Received: by 10.205.131.13 with SMTP id ho13mr1414667bkc.41.1324411754408;
	Tue, 20 Dec 2011 12:09:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Tue, 20 Dec 2011 12:09:14 -0800 (PST)
In-Reply-To: <4EF0EA03.7010600@linux.intel.com>
References: <cover.1324407759.git.otavio@ossystems.com.br>
	<444cb0c0c2b99cac90d3b9964d44021c08b1a774.1324407759.git.otavio@ossystems.com.br>
	<4EF0EA03.7010600@linux.intel.com>
Date: Tue, 20 Dec 2011 18:09:14 -0200
X-Google-Sender-Auth: LYz-LbuXKUnpjdT9Ucng-LAJCNA
Message-ID: <CAP9ODKrCo0quUWgsYxeEkH8poPcU0pHDMGRNE0GZpTnAZtD2nA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] udev: split utilities onto udev-utils
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
X-List-Received-Date: Tue, 20 Dec 2011 20:16:19 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd6462869ec04b48ba4c4

--000e0cdfd6462869ec04b48ba4c4
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 20, 2011 at 18:03, Joshua Lock <josh@linux.intel.com> wrote:

> The sysvinit scripts for udev itself, and the live-install image call
> the udevadm binary. Is RRECOMMENDS adequate to ensure it's available?
>

For opkg it works fine.

I can imagine if someone is doing  a quite specific image then it could be
removed; but obviously initscript would be broken on this case but if
he/she adds it for BAD_RECOMMENDATIONS then he/she knows what he/she is
doing.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd6462869ec04b48ba4c4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Dec 20, 2011 at 18:03, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">The sysvinit scripts for udev itself, and the live-instal=
l image call</div>
the udevadm binary. Is RRECOMMENDS adequate to ensure it&#39;s available?<b=
r></blockquote><div><br></div><div>For opkg it works fine.</div><div><br></=
div><div>I can imagine if someone is doing =A0a quite specific image then i=
t could be removed; but obviously initscript would be broken on this case b=
ut if he/she adds it for BAD_RECOMMENDATIONS then he/she knows what he/she =
is doing.</div>
</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd6462869ec04b48ba4c4--
