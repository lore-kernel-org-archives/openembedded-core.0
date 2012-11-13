Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYJd5-0005mP-4J
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 17:46:27 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so4717451pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=o7o9jUgKmcFJCiG1RH4eFA6eLKoXp7YWHjRA6H/x7TI=;
	b=KoBYqyDT7VV4fYL0REzUeD+tXDmy3HR9mXwaHicRHsqAZC6s5PPSj4qvFYGf/G7pSs
	HkOJz9jX1Rxfq3r0KXmKAZjjVrSdsc2/UQk85OOM4YcoxQL1w8YWpnWs9jrViSCkHg13
	78QZ9tYIsnR5HfxoeF/VLGqSixTfhu7oAk2ATBCiTu9zZ+w/mjBy91KF9/UhCE7w8b6f
	oB/PId2Gdw5Cl/X83VcDg8ItZ4yAxeXU+jD/Me/BmS0tuYvgBx14OMcLL79aQYn2ybYF
	LOHwzZ/TOlA95JnldSxSulCNhTEbv7ddaKRDe+BmfpTcMZLja1RPrjwD86LbobUqwSJB
	O5Ng==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr36781098pbc.136.1352824352071;
	Tue, 13 Nov 2012 08:32:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 13 Nov 2012 08:32:32 -0800 (PST)
In-Reply-To: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
Date: Tue, 13 Nov 2012 14:32:32 -0200
X-Google-Sender-Auth: FmwEk9GsJ8fN6vzpy_P_5C8VdVc
Message-ID: <CAP9ODKr1ZnOx3VvJyL8B-gZvyNhQbVpuOKXL=bRXHqHKQHQqKw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alex DAMIAN <alexandru.damian@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initrdscripts: fix udevd path
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
X-List-Received-Date: Tue, 13 Nov 2012 16:46:27 -0000
Content-Type: multipart/alternative; boundary=047d7b33cf6af2e10d04ce62f6cb

--047d7b33cf6af2e10d04ce62f6cb
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 1, 2012 at 12:32 PM, Alex DAMIAN <alexandru.damian@intel.com>wrote:

> +# wait for the udevd to settle
> +echo "Waiting for udev to settle..."
> +sleep 3
>

This doesn't work for all machines as the time need depends on the machine
performance and the number of devices connected.

You can use the trigger --settle in udevadm.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b33cf6af2e10d04ce62f6cb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 1, 2012 at 12:32 PM, Alex DAMIAN <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexandru.damian@intel.com" target=3D"_blank">alexandru.damian@i=
ntel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

+# wait for the udevd to settle<br>
+echo &quot;Waiting for udev to settle...&quot;<br>
+sleep 3<br></blockquote><div><br></div><div>This doesn&#39;t work for all =
machines as the time need depends on the machine performance and the number=
 of devices connected.</div><div><br></div><div>You can use the trigger --s=
ettle in udevadm.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>

Mobile: <a href=3D"tel:%2B55%2053%209981-7854" value=3D"+555399817854" targ=
et=3D"_blank">+55 53 9981-7854</a>=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"=
http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.ossyste=
ms.com.br</a><br><br>


--047d7b33cf6af2e10d04ce62f6cb--
