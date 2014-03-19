Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35269620B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:52:12 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id b6so8446438yha.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FhGSJL8Bauophh8Zb/39b5oBY/gTg1BrqNxDYRcEQbw=;
	b=BZTurvqJiUZsiD2ffApSA1vA0rI+qNRqgUJ4WejVqBIVKrsqOKhxtwN0pE3xkcX3fw
	QDOhHB8HQ+msBeTzVGLo64xzm7LcLxOAK0NSMWxt66DkbZCjK3cqApUli2tbyPYCjSwn
	TcA9OwuXKXh8Hsjsa5SoXvwEacPW4WEBH2zS+boI0BZ/3iqcEhO5/jE0ztFe5RUkY1qE
	2vZLExiP2Lsqu1Vab4gnFl7DyDU/0+F6JPrcO/stD6yRnBX5dalOa61xAYe0EmasoBGB
	WsqGuklk2oXB5WouymodmIG7yN5DV4hMt67jLlZv+H7ewCLcAxdH8Bbq7CVyLYqdV3D0
	DA/Q==
MIME-Version: 1.0
X-Received: by 10.236.134.140 with SMTP id s12mr1731020yhi.138.1395233532474; 
	Wed, 19 Mar 2014 05:52:12 -0700 (PDT)
Received: by 10.170.140.138 with HTTP; Wed, 19 Mar 2014 05:52:12 -0700 (PDT)
In-Reply-To: <CAP9ODKpKYfqvO=bYWQS-rd8JmzC1roH-wZS0QACyNoWTbTMb=g@mail.gmail.com>
References: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKpKYfqvO=bYWQS-rd8JmzC1roH-wZS0QACyNoWTbTMb=g@mail.gmail.com>
Date: Wed, 19 Mar 2014 09:52:12 -0300
Message-ID: <CANFVK7-3UsVeftWTRDGiGgrj0XnkebHfpqmA55-vNN9eZQyZWw@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Add SD/MMC-Cards support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 12:52:16 -0000
Content-Type: multipart/alternative; boundary=20cf303a36dd1517f504f4f51f15

--20cf303a36dd1517f504f4f51f15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio


On Tue, Mar 18, 2014 at 1:35 PM, Otavio Salvador <otavio@ossystems.com.br>w=
rote:

> > I am not sure if is not necessary to fix others places. Until now it's
> the single point.
>
> I think this is a sub-optimal solution; we ought to add support for
> UUID as this is ensure to be stable across boot iterations;


You mean filesystem UUID or GUID ?

I think the root=3D kernel param accept a valid GUID
(<kernel>/init/do_mounts.c) not fs UUID.

wic has some code to support gpt partitions. So GUID will be passed to
kernel root param (if the .wks was enable to it). I have never used but I
am going to try.

The patch fixes the mbr partitions (which is the default of wic).

Thanks.

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--20cf303a36dd1517f504f4f51f15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Otavio<br><div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Tue, Mar 18, 2014 at 1:35 PM, Otavio Salvador <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_bla=
nk">otavio@ossystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"">&gt; I am=
 not sure if is not necessary to fix others places. Until now it&#39;s the =
single point.<br>

<br>
</div>I think this is a sub-optimal solution; we ought to add support for<b=
r>
UUID as this is ensure to be stable across boot iterations;</blockquote><di=
v><br></div><div>You mean filesystem UUID or GUID ?<br><br></div><div>I thi=
nk the root=3D kernel param accept a valid GUID (&lt;kernel&gt;/init/do_mou=
nts.c) not fs UUID.<br>
<br></div><div>wic has some code to support gpt partitions. So GUID will be=
 passed to kernel root param (if the .wks was enable to it). I have never u=
sed but I am going to try.<br><br></div><div>The patch fixes the mbr partit=
ions (which is the default of wic).<br>
<br></div></div>Thanks.<br clear=3D"all"></div><div class=3D"gmail_extra"><=
br>-- <br><div dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=
=3D"http://joaohf_at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><b=
r>Campinas-SP-Brasil</div>

</div></div></div>

--20cf303a36dd1517f504f4f51f15--
