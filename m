Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tg0Pk-0006Yk-1l
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 22:52:28 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2742869pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 13:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=TTfpKrW5p1pl5h4sSG4pICrH7K+PRLZ6X9iQTfnmHVU=;
	b=JU2AAZUlnOJQ6OqI3iuSNk9IX9+CxxZICHwzlsll6kYdRtB3Gsm+I7orpN0xsO8gjL
	hMPKTht/fqPoZcP+A26WwoBQKR8NOKDUISYe/f2NORJAXuRBnC5ot7hdtiv4b8lq6/C2
	Y+fw3Bz5zzXjuUY8T0SFAZsLqKmB4M5bNTl2SexyCURJaXlAMEtUiEStDS2q65sZODqC
	9cfU9JF9PGEfU39mix2GP4SXlbRP7NdSaGhkeq549Nwmp/NskQVsaav0utne68Eod/lD
	OV5BAU7r6ifISZjWRThFPrWW+ubtbiZwuDsReIN3dHo/wvupkZn/XY6zpunuGN+YkemS
	LZSQ==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr42719922pbc.33.1354657084219;
	Tue, 04 Dec 2012 13:38:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 4 Dec 2012 13:38:04 -0800 (PST)
In-Reply-To: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
References: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
Date: Tue, 4 Dec 2012 19:38:04 -0200
X-Google-Sender-Auth: ygtzibbK3Y-fNJMYAAe5RCMIqXA
Message-ID: <CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Tue, 04 Dec 2012 21:52:28 -0000
Content-Type: multipart/alternative; boundary=047d7b10d1854c204b04d00dae4c

--047d7b10d1854c204b04d00dae4c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 4, 2012 at 6:58 PM, Ross Burton <ross.burton@intel.com> wrote:

> The splitting out of X11 plugins wasn't complete, which lead to no X11
> plugins
> being installed.
>
> If the X11 distro feature is present, make gst-meta-base depend on
> gst-meta-x11-base.  Also make -x11-base RDEPEND on xvimagesink for video
> playback performance.
>
> [ YOCTO #3458 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Would be better to use a RRECOMMENDS on xvimagesink? It makes more sense.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d1854c204b04d00dae4c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 4, 2012 at 6:58 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The splitting out of X11 plugins wasn&#39;t =
complete, which lead to no X11 plugins<br>
being installed.<br>
<br>
If the X11 distro feature is present, make gst-meta-base depend on<br>
gst-meta-x11-base. =A0Also make -x11-base RDEPEND on xvimagesink for video<=
br>
playback performance.<br>
<br>
[ YOCTO #3458 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br></blockquote><div><br></div><div>Would be bet=
ter to use a RRECOMMENDS on xvimagesink? It makes more sense.</div><div>
=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--047d7b10d1854c204b04d00dae4c--
