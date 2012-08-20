Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T3PUg-0000cd-42
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:46:02 +0200
Received: by iaky10 with SMTP id y10so2648323iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 03:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=tz4T8I61lGzO9JzPjDH9ByFrxCRUR2vgqUEuEabYIEk=;
	b=NEC2TFtecQ4nbquuuP8sb/K5/YMuJNJmztOlW+tWoZ8Dml7oTXOhVlgk5rWR2BTKi7
	A36E0prPbZSYSLd/mZuR9IDQL4VwshjgTvUWbRq0vwaqjufgRSXLXMCl+wvQo9WC2dBH
	0/DUV2FiIhzmAkSka9uCPRBWlM5daoc21mBZjJcvjVme7jFHUZ6/NA0CKUwECwoR6h+z
	oDuvBAVQJTgXGdf/SNMX3tSRqYcgOF88PgG6nHLqX1idRo7GcEsfPCLxmJirT55K2Dhv
	OIyGlebbak56tfsa8k/r0SUyd3jCDFI9FfTt+G1W1jzePSj2e/0/Vnrq/d0FfwV2z2fn
	sXZg==
Received: by 10.50.41.195 with SMTP id h3mr9216553igl.34.1345458839310; Mon,
	20 Aug 2012 03:33:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Mon, 20 Aug 2012 03:33:39 -0700 (PDT)
X-Originating-IP: [79.115.110.29]
In-Reply-To: <50320C3E.8030009@nedap.com>
References: <50320C3E.8030009@nedap.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 20 Aug 2012 13:33:39 +0300
Message-ID: <CAK18fxGe5GDn+dZZ+mh-nLcH8w8dz9GxbdHaKfVFgccgrqGjUQ@mail.gmail.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
X-Gm-Message-State: ALoCoQlCcGvt60XeNz+WE3rf7y0AuzzBS3/Vcs3tm5hiV0CyVKd+JPbkn01F7vbxaBjPrhlQBKw2
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: can't login??
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
X-List-Received-Date: Mon, 20 Aug 2012 10:46:02 -0000
Content-Type: multipart/alternative; boundary=14dae934051d2d52c704c7b00cc7

--14dae934051d2d52c704c7b00cc7
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 20, 2012 at 1:06 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:

>  Totaly stupid...
> Can't login as root.
> Have build an image with this:
>
> require recipes-core/images/core-image-minimal.bb
>
> # Use busybox as login manager
> IMAGE_LOGIN_MANAGER = "busybox"
>
> # Include minimum init and init scripts
> IMAGE_DEV_MANAGER = "udev"
> IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
> IMAGE_INITSCRIPTS = ""
>
>
> Any hint is appreciated...
>

What IMAGE_FEATURES do you have?

cat /etc/passwd | grep root ?

ag

--14dae934051d2d52c704c7b00cc7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Aug 20, 2012 at 1:06 PM, Jaap de Jong <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:jaap.dejong@nedap.com" target=3D"_bla=
nk">jaap.dejong@nedap.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">


 =20

   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    Totaly stupid...<br>
    Can&#39;t login as root.<br>
    Have build an image with this:<br>
    <br>
    <blockquote>require recipes-core/images/<a href=3D"http://core-image-mi=
nimal.bb" target=3D"_blank">core-image-minimal.bb</a><br>
      <br>
      # Use busybox as login manager<br>
      IMAGE_LOGIN_MANAGER =3D &quot;busybox&quot;<br>
      <br>
      # Include minimum init and init scripts<br>
      IMAGE_DEV_MANAGER =3D &quot;udev&quot;<br>
      IMAGE_INIT_MANAGER =3D &quot;sysvinit sysvinit-pidof&quot;<br>
      IMAGE_INITSCRIPTS =3D &quot;&quot;<br>
    </blockquote>
    <br>
    Any hint is appreciated...<br>
  </div>

</blockquote></div><br><div>What=A0IMAGE_FEATURES do you have?=A0</div><div=
><br></div><div>cat /etc/passwd | grep root ?</div><div><br></div><div>ag</=
div>

--14dae934051d2d52c704c7b00cc7--
