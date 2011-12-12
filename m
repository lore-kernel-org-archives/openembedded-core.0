Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ra4Lg-0001Kk-RA
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 12:47:12 +0100
Received: by bkbzt4 with SMTP id zt4so5108229bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Sbgd0xacx1elzYT6HA9wxK0Nz/8xbXc4aMotqeQ/kKI=;
	b=ph1jManxmWKA52SdMXhqp4idOJ5wjSpkNIbOY6A9RXNAaefN8+k4DUOgUjynZT2g/S
	qK04gkHxLo0D4e5cVV2bUYPGad9k/M7NzqUTnWgF1ZmdkjRJGJy1TnVZxOCXWcG03+p0
	ODYuxcx+3qW32CiMYsK2QkdJdylkn92beZ35Q=
MIME-Version: 1.0
Received: by 10.205.125.10 with SMTP id gq10mr4457540bkc.11.1323690016027;
	Mon, 12 Dec 2011 03:40:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Mon, 12 Dec 2011 03:40:15 -0800 (PST)
In-Reply-To: <fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
	<fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
Date: Mon, 12 Dec 2011 09:40:15 -0200
X-Google-Sender-Auth: UDasd0I36lyO2Gbl20LQFrLhHLw
Message-ID: <CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] core-image-gtk-directfb.bb: add an image for gtk over directfb
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
X-List-Received-Date: Mon, 12 Dec 2011 11:47:13 -0000
Content-Type: multipart/alternative; boundary=000e0ce0b5b432b64304b3e3997d

--000e0ce0b5b432b64304b3e3997d
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 12, 2011 at 09:28, Xiaofeng Yan <xiaofeng.yan@windriver.com>wrote:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> This file can make an image to run gtk over directfb.
>

I think this ought to be done on core-image-gtk not a specific one for
directfb as it depends on a distro feature and you can't just generate an
image with this, if the distro has no directfb feature enabled.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0b5b432b64304b3e3997d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Dec 12, 2011 at 09:28, Xiaofeng Yan <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:xiaofeng.yan@windriver.com">xiaofeng.ya=
n@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
From: Xiaofeng Yan &lt;<a href=3D"mailto:xiaofeng.yan@windriver.com">xiaofe=
ng.yan@windriver.com</a>&gt;<br>
<br>
This file can make an image to run gtk over directfb.<br></blockquote><div>=
<br></div><div>I think this ought to be done on core-image-gtk not a specif=
ic one for directfb as it depends on a distro feature and you can&#39;t jus=
t generate an image with this, if the distro has no directfb feature enable=
d.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce0b5b432b64304b3e3997d--
