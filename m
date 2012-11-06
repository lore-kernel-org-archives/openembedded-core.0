Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TVtFX-0002vl-CV
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 01:12:07 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so651515pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2012 15:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZjJonG3QtWoWdOTfDl5N+rLBPK9wBeiPCH7cwaKIDbc=;
	b=Fq38wDEmEdRmliXombXu2M9HB0JZihXc83XELHCi5yhQtDDLUAGJT7wt/1EMYtjRM3
	BQzOJ2INleNgUAqo+wFch3NaoojsPbTwJSCdx/AXqlGfdSiWgby7eBTnBcf4NSFh9Sx+
	QfTa/fNcrsIfvjzM3EBb8m9DL5jXVsSQ1PyHIQS5k30v+sY10VyYgtSwLhoNam0STNjt
	Z+gxxrOliJ57TikyFdgkooV9k9ckJPasyJEJHH0ouKlxI6KcZENmEpsYei5DHE0RUMqc
	fsMcQ/sUF0WNsM3/k6FUDDRea20lEhNBr4JASbQLG1bALVWWreQ9A8TGJv/b0ZjLbxlr
	iuaA==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr8015486pbc.130.1352246301210; Tue,
	06 Nov 2012 15:58:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 6 Nov 2012 15:58:21 -0800 (PST)
In-Reply-To: <CAMkzfpZ-VBmrE2s8D9c329VmnmfvmwZGPVK=sD1VCH8_WJ1W6A@mail.gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
	<CABnTX73jsT2yd74jkBzob4S8U_LdP_ju4VuLK+UiE-yvEOrP4g@mail.gmail.com>
	<CAMkzfpZ-VBmrE2s8D9c329VmnmfvmwZGPVK=sD1VCH8_WJ1W6A@mail.gmail.com>
Date: Tue, 6 Nov 2012 21:58:21 -0200
X-Google-Sender-Auth: WjVxgVApBO0yatA_ygsDJnSk4ps
Message-ID: <CAP9ODKo1mQFcR6+HM3A4cE6-vB5RpjyXe1eNiq+-RCKzS71DNw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sebastian Krzyszkowiak <dos@dosowisko.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PING v3] [PATCH 0/2] Support additional user-defined package metadata
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
X-List-Received-Date: Wed, 07 Nov 2012 00:12:07 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85c6eb71404cddc604e

--e89a8ff1c85c6eb71404cddc604e
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 3, 2012 at 9:01 PM, Sebastian Krzyszkowiak <dos@dosowisko.net>wrote:

> Has it got rejected, applied, forgotten or what?
>
> I think it would make sense to support it. There was just one answer
> asking if RDEPENDS won't be enough and Ive had good point in my
> opinion. It's a shame that patch, even after few pings, goes without
> proper reply...


I think this is the right time to resend this patch rebased against current
master so a new review can be done.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c85c6eb71404cddc604e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sat, Nov 3, 2012 at 9:01 PM, Sebastia=
n Krzyszkowiak <span dir=3D"ltr">&lt;<a href=3D"mailto:dos@dosowisko.net" t=
arget=3D"_blank">dos@dosowisko.net</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
Has it got rejected, applied, forgotten or what?<br>
<br>
I think it would make sense to support it. There was just one answer<br>
asking if RDEPENDS won&#39;t be enough and Ive had good point in my<br>
opinion. It&#39;s a shame that patch, even after few pings, goes without<br=
>
proper reply...</blockquote><div><br></div><div>I think this is the right t=
ime to resend this patch rebased against current master so a new review can=
 be done.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e89a8ff1c85c6eb71404cddc604e--
