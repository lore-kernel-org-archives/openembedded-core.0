Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RshIN-00069P-HN
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 22:00:47 +0100
Received: by lahc1 with SMTP id c1so893859lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=R0EB1QdQZyNIjWgAwJBanLfL5+cOYAkHruE9BVrdyrU=;
	b=NHvUH6oBbVm8Pe5yilkeJtAlRadzehmRI3i6brSPsGBZebLgiQLtcuQ5Ax4jyYTG2t
	DPJDSJZTyVFkkv3wqihy3+mlrFDP2nPM0OUvmOG9fLMCvkBuZdF7drjJNCiVermeU359
	FpoL8w9feI4yDqyJ7eGR8qnttatCXiJEftLjY=
MIME-Version: 1.0
Received: by 10.152.122.38 with SMTP id lp6mr91926lab.13.1328129572050; Wed,
	01 Feb 2012 12:52:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 12:52:51 -0800 (PST)
In-Reply-To: <34ff170a1283803aae432bf8eb179225aa41c898.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<34ff170a1283803aae432bf8eb179225aa41c898.1328127940.git.otavio@ossystems.com.br>
Date: Wed, 1 Feb 2012 18:52:51 -0200
X-Google-Sender-Auth: _YcOzcgGuTu56g2QtEddxbn6ZCM
Message-ID: <CAP9ODKqQ6MtugdzTZMhxEFZ_6Qe9qYmk9PYwtqswwA7x0OWoOQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 01 Feb 2012 21:00:47 -0000
Content-Type: multipart/alternative; boundary=f46d042f92b05b972504b7ed43b2

--f46d042f92b05b972504b7ed43b2
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 18:27, Otavio Salvador <otavio@ossystems.com.br>wrote:

>  * allow udev-cache to be disabled at runtime (using
>   /etc/default/udev-cache);
>
>  * make cache invalidated if kernel, bootparams or device list
>   changes;
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

I forgot a PR bump in udev_164.bb. I did it in the branch.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f92b05b972504b7ed43b2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 18:27, Otavio Salvador <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">=A0* allow udev-cache to be disabled at runtime (using<br=
>
 =A0 /etc/default/udev-cache);<br>
<br>
=A0* make cache invalidated if kernel, bootparams or device list<br>
 =A0 changes;<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br></div></blockquote><div><br></div><di=
v>I forgot a PR bump in <a href=3D"http://udev_164.bb">udev_164.bb</a>. I d=
id it in the branch.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042f92b05b972504b7ed43b2--
