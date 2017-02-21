Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id C28BF72F0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:21:15 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id n21so32116640qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+xj/On+/TqZhgyUL00sUMxQHXmqBEam3atzkeveMC2w=;
	b=JR3OiJo0biq0fDHIKr3BNa68P6uL5bA7/+TVl0xVzKoOYOLoq/8aOyE2Q72yU+zQdt
	cIPnO3Nvd9DpboaDh+YsAlnYKz4KvIiOc5PgWs7dFzdKloThTHw3FsPAi1OzFFuNWQwb
	apasoVVZkCK+p3yT7MAeZVlF5rPAaRqHEF+wdC7PefYSjXdW4EqBrp9lCJroN+gmKi3d
	KLNhh6XoEVkdPjUE+RX1bTIzNX7fvsE4rX/BhMZrC3g71rx3/M4EzroRKfNOj9N3N31H
	soNHR7RnXHPYCZ1QT15AFXlE1RWkKskXS2Pw+WQNhlM1Nkvh4R8mvto8oQviGp9O2zTN
	GSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+xj/On+/TqZhgyUL00sUMxQHXmqBEam3atzkeveMC2w=;
	b=ZAzj+iOGMsFnyHAH9r4uf8PpJXFzDoB3B/blE/F7CT2ZMILgiodQCIzdzRRqPqd85g
	STCmiIh6Cs4hyT5j6lXKvfzetYhoFXgTnYosXG+IIbn5Ox8bKmu5fTgK3ZtTg2t9fEse
	4LYdC/swwiuW/UNSL9YF8bW6q5RAnTnMcmzKb5ecU8uE6JX6CAtWfJ2cQvUiyAubhrrb
	624WhZN/GGsBBBlIyT1FdUgSmpYKrr3HAy3aFa6hCEyvMSJTHS2+wFKRUSc3/OrKxHHb
	TIwSOvFJNms3kaXKUzS0q+mAtrgAG19sEDoL/J93hL/vQRZFl9wdQViSXGiMoQUnOH5h
	dvaA==
X-Gm-Message-State: AMke39mnCJ0PygLjlS+fMf8RlhBohzdZjB9rSjG8vyGlPDoynnpCF7gsVX8sLpEHY7F/MbVMg+or3qUNlCJ84w5Q
X-Received: by 10.237.53.9 with SMTP id a9mr147647qte.188.1487636476993; Mon,
	20 Feb 2017 16:21:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 16:20:56 -0800 (PST)
In-Reply-To: <CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 00:20:56 +0000
Message-ID: <CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Tue, 21 Feb 2017 00:21:16 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ec45e9b0548ff5b20

--001a11c0285ec45e9b0548ff5b20
Content-Type: text/plain; charset=UTF-8

On 20 February 2017 at 23:21, Burton, Ross <ross.burton@intel.com> wrote:

> c) fix the function that detects the "broken" use of CC as it should be
> extracting the flags and moving them to CFLAGS.  Clearly this isn't working
> somewhere.
>

So upstream's sed made the assumption that there was only one argument
being passed via CC.

I've a local working fix that basically does this:

- cf_flags=`echo "$CC" | sed -e 's/^.*[ ]\(-[^ ]\)/\1/'`
+ cf_flags=`echo "$CC" | cut -f2- -d' '`

(use cut to remove the first word, assuming everything after the first word
of CC is an option).

Hongxu, would you mind if I squash this into your upgrade so we don't end
up with a revision where ncurses doesn't build?

Ross

--001a11c0285ec45e9b0548ff5b20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2017 at 23:21, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">c) fix the=
 function that detects the &quot;broken&quot; use of CC as it should be ext=
racting the flags and moving them to CFLAGS.=C2=A0 Clearly this isn&#39;t w=
orking somewhere.</div></blockquote><div><br></div><div>So upstream&#39;s s=
ed made the assumption that there was only one argument being passed via CC=
.=C2=A0</div></div><br></div><div class=3D"gmail_extra">I&#39;ve a local wo=
rking fix that basically does this:</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra">-<span class=3D"gm=
ail-Apple-tab-span" style=3D"white-space:pre">	</span>cf_flags=3D`echo &quo=
t;$CC&quot; | sed -e &#39;s/^.*[ <span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>]\(-[^ <span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span>]\)/\1/&#39;`</div><div class=3D"gmail_extr=
a">+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>=
cf_flags=3D`echo &quot;$CC&quot; | cut -f2- -d&#39; &#39;`</div><div><br></=
div><div>(use cut to remove the first word, assuming everything after the f=
irst word of CC is an option).</div><div><br></div><div>Hongxu, would you m=
ind if I squash this into your upgrade so we don&#39;t end up with a revisi=
on where ncurses doesn&#39;t build?</div><div><br></div><div>Ross</div></di=
v></div>

--001a11c0285ec45e9b0548ff5b20--
