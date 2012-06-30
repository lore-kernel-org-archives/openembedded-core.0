Received: from mail-yw0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Skyw9-0001d6-Th
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 16:46:14 +0200
Received: by yhr47 with SMTP id 47so4847265yhr.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=GyccwerVHqaA0v6gqeGrfaWszVeJK6hqAwWvLphNkXs=;
	b=Jtnq8irIKK/vvthoc5JWWjPQfJenlSnrwZDbOnKzBXn+/UZI29MhDvO8yquZRWsmgR
	xUDsJilINoMFePv6gOuvPCirssSIV90jrF1ZS0Z4fbr2cVBMrnztkg6JFFtfw4VRHYRU
	0/9FFvrx3XywjBfctSiW6uvgvwkaBoBIoAgwQopef1NixKmMfczMJziQWMj4YtwK/ZHk
	merhbwvvfQfQ6z0SXzyfJqgF4d1/87JYkx/s4t3fPd5NxUFznX5+DOuwVWMb53Lw9/DI
	riBozTPidC/LPzpuvh6ZEUtIgHUl3pvWALatXpGJxqLsh4MIaag0zdk1AHHRO9eoAEwU
	IPSQ==
Received: by 10.50.100.137 with SMTP id ey9mr1580836igb.61.1341066916021; Sat,
	30 Jun 2012 07:35:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.69.170 with HTTP; Sat, 30 Jun 2012 07:34:55 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <alpine.DEB.2.02.1206300923060.17865@oneiric>
References: <alpine.DEB.2.02.1206300923060.17865@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 30 Jun 2012 17:34:55 +0300
Message-ID: <CAK18fxF8a1qkFpGMgZFyLURATy4JxNP5u=8F9b9hDnHZf8VAww@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkRss7s3XIiXDpcuy7CO+g5T5zW1z/4XK9R9muimy7ypLkzd3fhiw2fpFjVwgmCQ0rds9D7
Subject: Re: is it best practice to use ${sysconfdir} rather than hard-coding "/etc"?
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
X-List-Received-Date: Sat, 30 Jun 2012 14:46:14 -0000
Content-Type: multipart/alternative; boundary=e89a8f23532b26473504c3b179a8

--e89a8f23532b26473504c3b179a8
Content-Type: text/plain; charset=ISO-8859-1

As a general rule is it better to use any "path variable" instead of a
hard-coded one.

@g

On Sat, Jun 30, 2012 at 4:25 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>  i suspect i know the answer to this, but in the recipe file
> usbinit.bb, we have:
>
> do_install() {
>    install -d ${D}/etc
>    install -d ${D}/etc/init.d
>    install usb-gether ${D}/etc/init.d
> }
>
>  i'm guessing that would more properly be coded:
>
> do_install() {
>    install -d ${D}${sysconfdir}
>    install -d ${D}${sysconfdir}/init.d
>    install usb-gether ${D}${sysconfdir}/init.d
> }
>
>  the end result is functionally identical, of course, it's all just a
> matter of style.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f23532b26473504c3b179a8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

As a general rule is it better to use any &quot;path variable&quot; instead=
 of a hard-coded one.<br><br>
@g<br><br><div class=3D"gmail_quote">On Sat, Jun 30, 2012 at 4:25 PM, Rober=
t P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" =
target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">

<br>
 =A0i suspect i know the answer to this, but in the recipe file<br>
<a href=3D"http://usbinit.bb" target=3D"_blank">usbinit.bb</a>, we have:<br=
>
<br>
do_install() {<br>
 =A0 =A0install -d ${D}/etc<br>
 =A0 =A0install -d ${D}/etc/init.d<br>
 =A0 =A0install usb-gether ${D}/etc/init.d<br>
}<br>
<br>
 =A0i&#39;m guessing that would more properly be coded:<br>
<br>
do_install() {<br>
 =A0 =A0install -d ${D}${sysconfdir}<br>
 =A0 =A0install -d ${D}${sysconfdir}/init.d<br>
 =A0 =A0install usb-gether ${D}${sysconfdir}/init.d<br>
}<br>
<br>
 =A0the end result is functionally identical, of course, it&#39;s all just =
a<br>
matter of style.<br>
<br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://crashcour=
se.ca" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">http://=
twitter.com/rpjday</a><br>
LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a hr=
ef=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.linkedi=
n.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--e89a8f23532b26473504c3b179a8--
