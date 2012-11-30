Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TeRGY-00049h-4L
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 15:08:30 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so440854lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=JF/DpZg8uXeN+VcCC6iuiFh1z7PMKCU/JUwbtnpaoNI=;
	b=JCP5KcGCP83E4WubQ2rQJvI+ALl8Kq0HBuHs+7/Qr06gcdcUxVRnOMt9nHqsZu9wCR
	oOakVkrFWFUWe0SmfYPW917DWiDXoAO1r+rLCaXLGbQLReymfI3CH2tuIYHb9851t7mU
	mhUlAheLYNpIiDJ0yFH3f8L1IUDDoMd6UDxQJYB/54Y9hrfuUl+Kll6T8O5GvaKOYujY
	GrtHQloegWZGgUd2L7wSPR1gjqO4znyKcgue5QhsYHB6cPHqklGqqtS2BAUno8KFsuHi
	CndvqeWLywPpxBl2vflkcYqlB7GjZQ2vKMqMcgpY/OIjrgUqGWj2+5Hy6tbG08p4wmTf
	9ZNg==
Received: by 10.152.113.225 with SMTP id jb1mr1338635lab.23.1354283652670;
	Fri, 30 Nov 2012 05:54:12 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.42.162 with HTTP; Fri, 30 Nov 2012 05:53:52 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1211300802160.22736@oneiric>
References: <alpine.DEB.2.02.1211300802160.22736@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Nov 2012 06:53:52 -0700
X-Google-Sender-Auth: rmfVgDDqRpW0g5QeLirBEGVQNOM
Message-ID: <CABcZANkyWNGTucmeb4Rft0Ko4nT1+-NNUXrahaj+MG_UPp6VxA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Q about terminology: bitbake "fetch" vs "fetchall"
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
X-List-Received-Date: Fri, 30 Nov 2012 14:08:45 -0000
Content-Type: multipart/alternative; boundary=f46d0408d91b0ae50c04cfb6bc22

--f46d0408d91b0ae50c04cfb6bc22
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 30, 2012 at 6:06 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   need some advice about terminology -- for the sake of describing
> this accurately, what is a good way to describe the packages
> downloaded by:
>
>   $ bitbake -c fetch
>   $ bitbake -c fetchall
>
>   for a simple "fetch", i get only this in my downloads/ directory:
>
> autoconf-2.69.tar.gz
> automake-1.12.5.tar.gz
> gnu-config-20120814.tar.bz2
> libtool-2.4.2.tar.gz
> m4-1.4.16.tar.gz
> pkg-config-0.25.tar.gz
> pseudo-1.4.1.tar.bz2
> quilt-0.60.tar.gz
> sqlite-autoconf-3071401.tar.gz
>
> while a "fetchall", of course, should fetch everything needed for the
> build of my selected recipe/image.
>
>   so what word/phrase can i use to describe what is downloaded by a
> simple "fetch"?  for the sake of docs/tutorial, of course.
>


Fetch runs just against the target you request it run against, whereas
fetchall runs against that and all of its dependencies. The reason
additional sources end up in downloads when using fetch is due to the up
front build of pseudo-native which is needed to do subsequent builds.
-- 
Christopher Larson

--f46d0408d91b0ae50c04cfb6bc22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra">On Fri, Nov 30, 2012 at 6:06 AM, Robert P. J. Da=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"=
_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><div class=3D"gmail_=
quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":2i9">=C2=A0 need some advice abo=
ut terminology -- for the sake of describing<br>
this accurately, what is a good way to describe the packages<br>
downloaded by:<br>
<br>
=C2=A0 $ bitbake -c fetch<br>
=C2=A0 $ bitbake -c fetchall<br>
<br>
=C2=A0 for a simple &quot;fetch&quot;, i get only this in my downloads/ dir=
ectory:<br>
<br>
autoconf-2.69.tar.gz<br>
automake-1.12.5.tar.gz<br>
gnu-config-20120814.tar.bz2<br>
libtool-2.4.2.tar.gz<br>
m4-1.4.16.tar.gz<br>
pkg-config-0.25.tar.gz<br>
pseudo-1.4.1.tar.bz2<br>
quilt-0.60.tar.gz<br>
sqlite-autoconf-3071401.tar.gz<br>
<br>
while a &quot;fetchall&quot;, of course, should fetch everything needed for=
 the<br>
build of my selected recipe/image.<br>
<br>
=C2=A0 so what word/phrase can i use to describe what is downloaded by a<br=
>
simple &quot;fetch&quot;? =C2=A0for the sake of docs/tutorial, of course.</=
div></blockquote></div><br><br clear=3D"all"><div>Fetch runs just against t=
he target you request it run against, whereas fetchall runs against that an=
d all of its dependencies. The reason additional sources end up in download=
s when using fetch is due to the up front build of pseudo-native which is n=
eeded to do subsequent builds.</div>

-- <br>Christopher Larson<br>
</div>

--f46d0408d91b0ae50c04cfb6bc22--
