Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TgNO1-0001VL-7z
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 23:24:13 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3457566pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 14:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=565RNH6G7yYVGsA1yzBTt5aLmeEKLow24vfXaRgKICY=;
	b=jO69BKJwgwsxOLQ9QWa71QhquPuQjzPIAihIGmxP5y4BXqtrp1C19Lsx3JlI2YC79e
	o37OGw5TdL7LTMsxNhB7MXdsbqtgYCGxMyBCLvBlDT4kxFVL0OUotiHE/szsitmzp1XO
	Rrqn4y85UEcya0p4IwzEbcOg5HA58CDDwrsfjIy7D13Ru26XF4E5ju9Om1rakJoOcfbu
	bmqB83s07po8CA7g8fwCmBQ+hKCFER2gQgESdIOAjaNf78s8enYSEK+FStezfxI0SZV5
	n/xF4WEn/LiYjnrl5kt8w9XDRmPW2aSjvEn7xdpeEg1XgqV+E6of0F6JdUZ3obENzrV3
	VwaQ==
MIME-Version: 1.0
Received: by 10.66.72.198 with SMTP id f6mr25456092pav.42.1354745387911; Wed,
	05 Dec 2012 14:09:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 5 Dec 2012 14:09:47 -0800 (PST)
In-Reply-To: <1354557964-12145-1-git-send-email-mario@ossystems.com.br>
References: <1354557964-12145-1-git-send-email-mario@ossystems.com.br>
Date: Wed, 5 Dec 2012 20:09:47 -0200
X-Google-Sender-Auth: 6LVcAmhMRp_EipSglkG4je_0xC0
Message-ID: <CAP9ODKr_fW83rJDYZH0=TmoxdtEDwZS1p4-Y_Mgb9PRJEBAtAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: explicitly set --with-database=simple
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
X-List-Received-Date: Wed, 05 Dec 2012 22:24:13 -0000
Content-Type: multipart/alternative; boundary=f46d042dfd359b899304d0223d63

--f46d042dfd359b899304d0223d63
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 3, 2012 at 4:06 PM, Mario Domenech Goulart <
mario@ossystems.com.br> wrote:

> The default value for --with-database is "auto".  So, if some package
> installs a database library and pulseaudio auto detects, that library
> will be added to the dependencies list, causing a dependency error at
> do_rootfs time.  For example, samba installs libtdb, which is one of
> the pulseaudio supported databases.
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>

Ping?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042dfd359b899304d0223d63
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, D=
ec 3, 2012 at 4:06 PM, Mario Domenech Goulart <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mario@ossystems.com.br" target=3D"_blank">mario@ossystems.com.br=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The default value for --with-database is &qu=
ot;auto&quot;. =A0So, if some package<br>
installs a database library and pulseaudio auto detects, that library<br>
will be added to the dependencies list, causing a dependency error at<br>
do_rootfs time. =A0For example, samba installs libtdb, which is one of<br>
the pulseaudio supported databases.<br>
<br>
Signed-off-by: Mario Domenech Goulart &lt;<a href=3D"mailto:mario@ossystems=
.com.br" target=3D"_blank">mario@ossystems.com.br</a>&gt;<br></blockquote><=
div><br></div><div>Ping?=A0</div></div><div><br></div>-- <br>Otavio Salvado=
r=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br=
>

E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: <a href=3D"tel:%2B55%205=
3%209981-7854" value=3D"+555399817854" target=3D"_blank">+55 53 9981-7854</=
a>=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br=
" target=3D"_blank">http://projetos.ossystems.com.br</a><br>

<br>
</div>

--f46d042dfd359b899304d0223d63--
