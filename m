Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TZVYJ-0002ex-OE
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 00:42:27 +0100
Received: by mail-lb0-f175.google.com with SMTP id j7so2417789lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ctygk/J/eJkrqLEd1D8/qpakz/Lx0jVk3CbGJ0PjfZQ=;
	b=FI0l0P98feMfzqVWVU9hb3GnwiQfYNn3eZCK/oTn6oOppy/+JwrY1wIuNsFBLHzqiC
	382MpDRQmYlUgl7XWZb8x6K17zgxdhm5afhXxovByavIw4/L1fsiAv+VE4QJj6OpWCh2
	p0ty77GQUVBK0oJTbtr3ttKcTTYE9DLc8bc3vYBPLQphfbPFUE7Ntp30HN8SWLXeaxOA
	eKC+BY7PC3BvgOdkxv+ExE08Pt0ayZFlLNMggmgHd2sbNPVMn4iSmw3L7HVOuXrzBa5a
	zkTMjSp3IzyVS3ASZJbEJT60NRYgPtz5ZFbRXXLudsR7wFZ9l0GXJGTdsFoDckpBbZzN
	/ypQ==
Received: by 10.152.108.197 with SMTP id hm5mr5656483lab.45.1353108508892;
	Fri, 16 Nov 2012 15:28:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Fri, 16 Nov 2012 15:28:08 -0800 (PST)
In-Reply-To: <20121116222855.GD3411@jama.jama.net>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 16 Nov 2012 16:28:08 -0700
X-Google-Sender-Auth: FhYmcCRDd3x7aKQRZyxGiavFf-I
Message-ID: <CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 16 Nov 2012 23:42:27 -0000
Content-Type: multipart/alternative; boundary=bcaec54fbd3a03de6904cea5202a

--bcaec54fbd3a03de6904cea5202a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 3:28 PM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Fri, Nov 16, 2012 at 10:48:41PM +0100, Marko Kati=C4=87 wrote:
> > Udevtest and udevinfo are not being built because they no longer exist =
in
> > udev 182 sources.
>
> Ah, so this change is only cosmetic and does not change package output
> (otherwise missing PR bump).
>


Changing udev.inc like this when you're specifically addressing one version
is cause for concern.

Exactly which udev version deprecated the utilities? oe-core might not have
many udev versions around, but other layers still do, for machines running
older kernels.
--=20
Christopher Larson

--bcaec54fbd3a03de6904cea5202a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Nov 1=
6, 2012 at 3:28 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1j6">On Fri, Nov 16, 2012 at 10:=
48:41PM +0100, Marko Kati=C4=87 wrote:<br>
&gt; Udevtest and udevinfo are not being built because they no longer exist=
 in<br>
&gt; udev 182 sources.<br>
<br>
Ah, so this change is only cosmetic and does not change package output<br>
(otherwise missing PR bump).<br></div></blockquote></div><br><br clear=3D"a=
ll"><div>Changing udev.inc like this when you&#39;re specifically addressin=
g one version is cause for concern.</div><div><br></div><div>Exactly which =
udev version deprecated the utilities? oe-core might not have many udev ver=
sions around, but other layers still do, for machines running older kernels=
.</div>

-- <br>Christopher Larson<br>
</div>

--bcaec54fbd3a03de6904cea5202a--
