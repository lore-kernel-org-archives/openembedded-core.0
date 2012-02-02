Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rt1aN-0003wF-U4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:40:44 +0100
Received: by lbol12 with SMTP id l12so421944lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=mgFmrJrCRKLL681szKMuJ0D0qo1L19LWhE422vWt5T0=;
	b=mFGWwRiBIlmvJXnjZ9yDcUEmv3DqvFFyxpuiEGG/lDQL8kK8Ac/A+swb1GpSf93rds
	PXxdqbnkdnEhCN9NfEE8KMBYfiRVwaLLWi5hWYFeraHgfzQ3uw8d6UddZ4zFcgbFjwPc
	F/mcs1dl3YQQRfFHBKZVTz6Ym5FHXycUX0ZRo=
MIME-Version: 1.0
Received: by 10.112.23.104 with SMTP id l8mr1025533lbf.50.1328207567326; Thu,
	02 Feb 2012 10:32:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Thu, 2 Feb 2012 10:32:47 -0800 (PST)
In-Reply-To: <1328199617-1195-1-git-send-email-andrei@gherzan.ro>
References: <1328199617-1195-1-git-send-email-andrei@gherzan.ro>
Date: Thu, 2 Feb 2012 16:32:47 -0200
X-Google-Sender-Auth: blJlscguc6zQfFH_qHAzr66QWFA
Message-ID: <CAP9ODKoNUJz4ZJc=uCz35Cynua-XhkwVmGvSNnjkX5hu_VhQGg@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Feb 2012 18:40:44 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe30dc3d0dad04b7ff6c57

--e0cb4efe30dc3d0dad04b7ff6c57
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 2, 2012 at 14:20, Andrei Gherzan <andrei@gherzan.ro> wrote:

> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> 1. Update to 4.2.3-P2
> 2. From 4.2.0 final release, -lcrypto check was removed and we compile
> static libraries
> from bind that are linked to libcrypto. This is why i added a patch in
> order to add
> -lcrypto to LIBS.
>

The patch I sent yestarday will cause a conflict in this one. You might
want to rebase it against my tree at: https://github.com/OSSystems/oe-core

If you want, you can cherry-pick mine and send it together with your one so
we avoid a conflict for Richard or Saul to deal with.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe30dc3d0dad04b7ff6c57
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Feb 2, 2012 at 14:20, Andrei Gherzan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
From: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@windriver.com">an=
drei.gherzan@windriver.com</a>&gt;<br>
<br>
1. Update to 4.2.3-P2<br>
2. From 4.2.0 final release, -lcrypto check was removed and we compile stat=
ic libraries<br>
from bind that are linked to libcrypto. This is why i added a patch in orde=
r to add<br>
-lcrypto to LIBS.<br></blockquote><div><br></div><div>The patch I sent yest=
arday will cause a conflict in this one. You might want to rebase it agains=
t my tree at:=A0<a href=3D"https://github.com/OSSystems/oe-core">https://gi=
thub.com/OSSystems/oe-core</a></div>
<div><br></div><div>If you want, you can cherry-pick mine and send it toget=
her with your one so we avoid a conflict for Richard or Saul to deal with.<=
/div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e0cb4efe30dc3d0dad04b7ff6c57--
