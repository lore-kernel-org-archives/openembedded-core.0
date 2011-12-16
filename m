Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RbgmX-00044E-20 for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 00:01:37 +0100
Received: by eaal1 with SMTP id l1so3368609eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1zTVUcZjBo9IzJZE4Z2VOMD1P9ADwIIWhMdYSjbj6QI=;
	b=qyMCm1zwyuJv0IwO2p4QFSzrCmYT65+2rzuBfrhcUbBOMWSSw9p4M2BpjIsmr5juPQ
	npGUVFYcjDpLfxQ1tLWnGeAewnu1sioqBL3trUAu+hifP2YqFi7sNCWTYa96QP0SlQYg
	uVlAxOuJ2QQoh8Rs4sHx8Y7bmOgieyhVQEh28=
MIME-Version: 1.0
Received: by 10.205.81.141 with SMTP id zy13mr3403428bkb.50.1324076077283;
	Fri, 16 Dec 2011 14:54:37 -0800 (PST)
Received: by 10.204.185.76 with HTTP; Fri, 16 Dec 2011 14:54:37 -0800 (PST)
In-Reply-To: <4EEAFDAA.7000100@bluegiga.com>
References: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
	<4EEAFD28.1060609@bluegiga.com> <4EEAFDAA.7000100@bluegiga.com>
Date: Fri, 16 Dec 2011 23:54:37 +0100
Message-ID: <CAMvUbCy5hDTbMjt-zzKueVpJNHyUyZyiBZ8o9rytVofaucgpjA@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: after modifying source code in work/, how to rebuild package?
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
X-List-Received-Date: Fri, 16 Dec 2011 23:01:37 -0000
Content-Type: multipart/alternative; boundary=bcaec554ded83dfb7e04b43d7c37

--bcaec554ded83dfb7e04b43d7c37
Content-Type: text/plain; charset=ISO-8859-1

Lauri en Luo,

On Fri, Dec 16, 2011 at 9:13 AM, Lauri Hintsala <lauri.hintsala@bluegiga.com
> wrote:

> Sorry, this workflow will clean all your changes. How about that:
>
> bitbake projectname -c compile -f
> bitbake projectname
>
>
Thank you. This works.

Regards

Leon.

--bcaec554ded83dfb7e04b43d7c37
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Lauri en Luo,<br><br><div class=3D"gmail_quote">On Fri, Dec 16, 2011 at 9:1=
3 AM, Lauri Hintsala <span dir=3D"ltr">&lt;<a href=3D"mailto:lauri.hintsala=
@bluegiga.com">lauri.hintsala@bluegiga.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
Sorry, this workflow will clean all your changes. How about that:<br>
<br>
bitbake projectname -c compile -f<br>
bitbake projectname<br><font color=3D"#888888">
<br></font></blockquote><div><br></div></div>Thank you. This works.<br><br>=
Regards<br><br>Leon.<br>

--bcaec554ded83dfb7e04b43d7c37--
