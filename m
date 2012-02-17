Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyU9P-00016q-Sm
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:11:28 +0100
Received: by vcqp1 with SMTP id p1so554044vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 12:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=S6jl/ugjwc8qubiLSLuuLe5fjTfmktgnaC2N9SrqUkY=;
	b=yG2oJdMU5NVNyhs+ZdaK9zmqggUpvLUWLsHDfkvxOp3bWTn/ckEd12+xCGww5C7VTj
	cUrgZE2BmJq7x7jLf3n35W15NvKZoj5sYPYYh2AxrZFnTlEfa0+we69QxnOuKpLjUK7B
	TGMEA7zhTsXVbJZGl41honL5vIc7amVHpmgMY=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr1995564vcq.44.1329508992707; Fri,
	17 Feb 2012 12:03:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 12:03:12 -0800 (PST)
In-Reply-To: <1329508773.2591.116.camel@x121e.pbcl.net>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
	<1329506739.2591.114.camel@x121e.pbcl.net>
	<CAP9ODKq5jiun+bcQZeR2d9Dx2gJM3v=eu2N2WiCuwTb7sb4A-A@mail.gmail.com>
	<1329508773.2591.116.camel@x121e.pbcl.net>
Date: Fri, 17 Feb 2012 18:03:12 -0200
X-Google-Sender-Auth: uwrsd_BYXC_mHSx-flGswXodFfE
Message-ID: <CAP9ODKq7u3Vg+YU8GDMQH3vBw_GPH-Wuq9C7fa=DnEuUo0mr1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 20:11:28 -0000
Content-Type: multipart/alternative; boundary=f46d04388dfd3c6d0604b92e6fc3

--f46d04388dfd3c6d0604b92e6fc3
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 17:59, Phil Blundell <philb@gnu.org> wrote:

> Well, right, but that's not the run-postinsts package.  You mentioned
> that opkg-cl wasn't installed so its own postinst is probably irrelevant
> here.


That's why I added this.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04388dfd3c6d0604b92e6fc3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 17, 2012 at 17:59, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">Well, right, but that&#39;s not the run-postinsts package=
. =A0You mentioned</div>
that opkg-cl wasn&#39;t installed so its own postinst is probably irrelevan=
t<br>
here.</blockquote><div><br></div><div>That&#39;s why I added this.</div><di=
v>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d04388dfd3c6d0604b92e6fc3--
