Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvAX1-0002Td-J4
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 17:38:07 +0100
Received: by eaal10 with SMTP id l10so196041eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=077IyhTRSfuOaKxpHo3UTu5vIPzLILjiZin0bOUyu94=;
	b=FL4KSJZtkZqafs/a2N+Th81W9R97DOqva14tti1BFN8NMhlK/Gb9k5JJEWtkryi3Fj
	VXGoXfPUwwF7lTaDThI5HU3yCnVj06s5XeJVwaZQBnJvMe02k8BOHSLM+XVroV3F1xfZ
	Tx8jXUz6+nLvoMUKM0U3HFVDJaBvbhTN/trPs=
MIME-Version: 1.0
Received: by 10.213.10.145 with SMTP id p17mr2861750ebp.12.1328718604206; Wed,
	08 Feb 2012 08:30:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 08:30:04 -0800 (PST)
In-Reply-To: <1328717410.14363.46.camel@phil-desktop>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
Date: Wed, 8 Feb 2012 14:30:04 -0200
X-Google-Sender-Auth: 0dfiGwUGHNkQ7E8bKEx5NnXn77U
Message-ID: <CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 16:38:07 -0000
Content-Type: multipart/alternative; boundary=0015174c170469024304b8766831

--0015174c170469024304b8766831
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 14:10, Phil Blundell <philb@gnu.org> wrote:

> This isn't just a straightforward update, you seem to be moving dhclient
> from ${base_sbindir} to ${sbindir}.  If that's a good thing (which
> doesn't seem totally obvious to me) then it ought at least to be
> mentioned in the commit message.
>

He is doing that because it links against libcrypt that is at ${libdir}.
But it clearly needs to be in another commit or, at least, explicit in the
changlog.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174c170469024304b8766831
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 8, 2012 at 14:10, Phil Blundell <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div id=3D":1ev">This isn&#39;t just a straightforward update, you seem to =
be moving dhclient<br>
from ${base_sbindir} to ${sbindir}. =A0If that&#39;s a good thing (which<br=
>
doesn&#39;t seem totally obvious to me) then it ought at least to be<br>
mentioned in the commit message.<div class=3D"yj6qo ajU"><div id=3D":1sa" c=
lass=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>He is =
doing that because it links against libcrypt that is at ${libdir}. But it c=
learly needs to be in another commit or, at least, explicit in the changlog=
.<br clear=3D"all">
<div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015174c170469024304b8766831--
