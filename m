Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TVtIB-00030D-Bb
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 01:15:12 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so707318pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2012 16:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=g6TzD+XcZm94GB2dfkwOlMt9TYOzegnUvD3+8Y9wM1M=;
	b=tAbtV3BzSOOhdXlHgoz/BQWFqnPBgU6vD5MpEsaeR8xnewicphmETaALSRRtue7UDw
	OeFQ8h/COYqLs4vQgIbLCKLH6Pvxb6/5cNcwd4n++mUA8xmlrCFkD3FllYYxteBFYPb/
	GiZYR4k+uIGv1I1tZp3ZAxbpC0YufkQOB7ydLVE+NeMxwBp1Tf04euql2kVHmfB2C11Q
	PyQv2cu+c5FcL1Ro+d5c3BvLCUuZFzhMs2HUk1jZsukg1JdakZL03U0qmmALQm8MdGv6
	4zZ9ehHqAC3RlxaSLyPGBr/BL9bwc6CQuJ68R01v6Hzab9/WHA3/P5YwJiZ0O16ZkhWu
	V2yQ==
MIME-Version: 1.0
Received: by 10.66.85.69 with SMTP id f5mr7167081paz.50.1352246465261; Tue, 06
	Nov 2012 16:01:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 6 Nov 2012 16:01:05 -0800 (PST)
In-Reply-To: <CAJ2CSBuAx4AuUFCKVHsCjDvFuhGkQyOi-jAkuhCD9e4mgMm47w@mail.gmail.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
	<1351798319.6502.19.camel@ted>
	<CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
	<CAJ2CSBvFvXXk93A8or4M6vmGo==h0F+VOR8-FVAFP9jYs8FS1w@mail.gmail.com>
	<CAJ2CSBuAx4AuUFCKVHsCjDvFuhGkQyOi-jAkuhCD9e4mgMm47w@mail.gmail.com>
Date: Tue, 6 Nov 2012 22:01:05 -0200
X-Google-Sender-Auth: 5cijmgh_fHHBm_s6tAah_ifuLAw
Message-ID: <CAP9ODKrtmGBg2gHx2=SqjRBVH3AwQtBkGFe-jsuTLQb+RmT=4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 07 Nov 2012 00:15:12 -0000
Content-Type: multipart/alternative; boundary=f46d042ef56335efe204cddc6a36

--f46d042ef56335efe204cddc6a36
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 5, 2012 at 8:15 AM, Damian, Alexandru <
alexandru.damian@intel.com> wrote:

> Hello guys,
>
> Sorry about the previously confusing message.
>
> To clear things up, I've submitted two patches about the udev 182 not
> starting properly in the live image. First submission was in fact
> incorrect, having sent an intermediary patch file.
>
> The second submission is the correct patch, that fixes the udev problems,
> and adds a couple of features to the initrd file - allows you to use as
> root a partition instead of the rootfs.img for recovering an old install,
> and fails safe when no rootfs is found, dropping the user to a shell if
> something goes wrong.
>
> Please review the second patch and disregard the first one.


Please split the patch in two: one fixing udevd and another with new
features; please tag it properly  as v3 so it is easy to spoit it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042ef56335efe204cddc6a36
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 5, 2012 at 8:15 AM, Damian, =
Alexandru <span dir=3D"ltr">&lt;<a href=3D"mailto:alexandru.damian@intel.co=
m" target=3D"_blank">alexandru.damian@intel.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
Hello guys,<br><br>Sorry about the previously confusing message. <br><br>To=
 clear things up, I&#39;ve submitted two patches about the udev 182 not sta=
rting properly in the live image. First submission was in fact incorrect, h=
aving sent an intermediary patch file.<br>

<br>The second submission is the correct patch, that fixes the udev problem=
s, <br>and adds a couple of features to the initrd file - allows you to use=
 as root a partition instead of the rootfs.img for recovering an old instal=
l, and fails safe when no rootfs is found, dropping the user to a shell if =
something goes wrong.<br>

<br>Please review the second patch and disregard the first one.</blockquote=
><div><br></div><div>Please split the patch in two: one fixing udevd and an=
other with new features; please tag it properly =A0as v3 so it is easy to s=
poit it.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042ef56335efe204cddc6a36--
