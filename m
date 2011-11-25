Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTtJm-0000vu-UI
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 11:47:42 +0100
Received: by bkbzs2 with SMTP id zs2so3944574bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=xBOIaIhctbljqRGrjU0fStRF7UkQLt8plPf5F/5UPc4=;
	b=aG4rz1uaQ0mlaN33M0CQZuN4Tl1QKbkQkIspGis3Nh3j/lrCt35zn0Mfqj+CUqXvv8
	davmxIbEL+eQ5ZFcjXqcr3KSIZA1YxD2cK0wBeeSQJsVxUt0K3kufmPJ24b/j2Mp9obU
	D4YjxGT2Ypsbrkewa/eLs9oH58ppFg9La3URg=
MIME-Version: 1.0
Received: by 10.204.148.4 with SMTP id n4mr33467905bkv.42.1322217667496; Fri,
	25 Nov 2011 02:41:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Fri, 25 Nov 2011 02:41:07 -0800 (PST)
In-Reply-To: <1322179246.10928.38.camel@ted>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
	<1322179246.10928.38.camel@ted>
Date: Fri, 25 Nov 2011 08:41:07 -0200
X-Google-Sender-Auth: adWfIkbPqy-klk5Efpamyh6uMGs
Message-ID: <CAP9ODKqjWy5ov3zRoJmMi_NnX0C_nqOy=P8BY7B7SZjBVmrfTQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 10:47:43 -0000
Content-Type: multipart/alternative; boundary=0015174bf02c630a0a04b28cca17

--0015174bf02c630a0a04b28cca17
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 24, 2011 at 22:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> ...
>
Looking at vesa.c, there is quite a chunk of code in there depending on
> DGA.
>

Yes.


> Is there any harm to building DGA apart from an extra package? Its a
> self contained module isn't it?
>

AFAIK no. It seems to be a blob static linked onto the Xorg.


> ...

Of course the ideal solution would be for someone to convert the vesa
> driver to use the xrandr API...
>

Well, yes. But I cannot work on that now.

In meanwhile I sent another patch proposing to disable it for lite flavor
only, as it was before the update to 1.11 Xorg Xserver.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174bf02c630a0a04b28cca17
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Nov 24, 2011 at 22:00, Richard Purdie <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex;">
<div class=3D"im">...=A0</div></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">=
<div class=3D"im">Looking at vesa.c, there is quite a chunk of code in ther=
e depending on</div>

DGA.<br></blockquote><div><br></div><div>Yes.</div><div>=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex;">
Is there any harm to building DGA apart from an extra package? Its a<br>
self contained module isn&#39;t it?<br></blockquote><div><br></div><div>AFA=
IK no. It seems to be a blob static linked onto the Xorg.</div><div>=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex;">
...</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">Of course the ideal solutio=
n would be for someone to convert the vesa<br>
driver to use the xrandr API...<br></blockquote><div><br></div><div>Well, y=
es. But I cannot work on that now.</div><div><br></div><div>In meanwhile I =
sent another patch proposing to disable it for lite flavor only, as it was =
before the update to 1.11 Xorg Xserver.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015174bf02c630a0a04b28cca17--
