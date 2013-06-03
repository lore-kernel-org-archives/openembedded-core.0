Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id C1461621EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 19:06:20 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so1267486oag.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ChEIBfWmzI+ogM0m7RB2UwsoxlxMHKr0QESxu/9BwoU=;
	b=cO6xDH+aBAo6+nPkUGOyWqZj1GSCo/aIipfVy0pWlljtA0xsRyZlfYn3FY3XC6ldBE
	62ehoMg+4dpU0YNFeItoEbiKbdRpUX1Ghm2FKpC0ydwvTMyFy8iGCMUvwce0V8hpY6F3
	HBBfeW0gmSw2fJhfTtJGeurfM3drQR00DQHljujghaBvuvbMG4OwM/5H9VNxx6JJwDmJ
	W3BQ1L+vul4KELYoNegF8lwpjIjDOqu/EVXtD5ceRm/4BcZ4JKXXaMOYXhCcnXUUTvpJ
	P1sGdTB9Fh3HFNGBcXh6Cfz9YRKtZ1DChv6Ic3ELXJ+SfEJgKT75uvrjcDUdcd/P0pHD
	gLxw==
MIME-Version: 1.0
X-Received: by 10.182.240.136 with SMTP id wa8mr10915379obc.2.1370286381656;
	Mon, 03 Jun 2013 12:06:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 3 Jun 2013 12:06:21 -0700 (PDT)
In-Reply-To: <51ACE8AE.7000501@pseudoterminal.org>
References: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
	<51ACD5A7.2060707@pseudoterminal.org>
	<CAP9ODKovJjk=GaaS2ssA32jSbZy4fHqte68MgBvmnS2CXvjryw@mail.gmail.com>
	<51ACE8AE.7000501@pseudoterminal.org>
Date: Mon, 3 Jun 2013 16:06:21 -0300
X-Google-Sender-Auth: zY7nOSKUrXfVdBrknVB_iPhzb7g
Message-ID: <CAP9ODKpDri2LYjeJWKsnVqowxC2NpamESGiGFL8OfLUg6GyxAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>, "Eggleton,
	Paul" <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
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
X-List-Received-Date: Mon, 03 Jun 2013 19:06:20 -0000
Content-Type: multipart/alternative; boundary=089e01634f0e053d7b04de44a918

--089e01634f0e053d7b04de44a918
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 3, 2013 at 4:04 PM, Carlos Rafael Giani
<dv@pseudoterminal.org>wrote:

>  This can be done already. The first patch (search for "[OE-core] [PATCH
> 1/3] gstreamer: fixed -meta package rdepends") can be applied, and does not
> depend on GStreamer 1.0. I bundled it together with the rest since the
> other patches need this one.
>

Awesome.

Paul, please drop my patch from your queue and check Carlos' one. :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01634f0e053d7b04de44a918
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 3, 2013 at 4:04 PM, Carlos Rafael Giani <span dir=3D"lt=
r">&lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudo=
terminal.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div>This can be done already. The first
      patch (search for &quot;[OE-core] [PATCH 1/3] gstreamer: fixed -meta
      package rdepends&quot;) can be applied, and does not depend on
      GStreamer 1.0. I bundled it together with the rest since the other
      patches need this one.<br></div></div></blockquote><div><br></div><di=
v style>Awesome.</div><div style><br></div><div style>Paul, please drop my =
patch from your queue and check Carlos&#39; one. :)</div></div><div><br>
</div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http:=
//projetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.co=
m.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e01634f0e053d7b04de44a918--
