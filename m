Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id D32357F6AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 20:00:38 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y23so573981vso.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 12:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wgIwzVvMxR+6PZqs+XfrmkCphvhKodQKv6uD44q9Myk=;
	b=tfNOYWfx+g3Grzoo9ujqn4sRM7lYGgOe88p/0RFE9mxXCa6AGkXMZAcOeA7gQxGn3D
	zFdu4ebf7Kc5RNDBHnBla7qzvWVUVa9vvToYd0Yb7DbkJspJk6AsU0rLSyZbtI3XYsg6
	8/v7101kqBWHRaqS51zquLkqyGlF3+DK3Jx0o8T3imXLrDudsUb2d4BM+XX2+iRd/Z9t
	S8Xrr4AMXZW3LPL1XMPm43hZKw2I9HxyhoiVf6cU44E3MNI+3mY2tn8JsIftWLe+CTEH
	b9l8KW0uprdbEl40kpO5ykJ6wwhIMTElfX1NZA5PmXS20YG94pvmONixv1D0GyXCUnPi
	R3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wgIwzVvMxR+6PZqs+XfrmkCphvhKodQKv6uD44q9Myk=;
	b=r93l0s5ZdecbjmBu9rBi2r8dwGvQW0sJXBkTsPVRPC7YURKaPsdgfwHyLQma10Fh/0
	ezCBwYTnRfEBCqWLNYZo7KNKYDAuzBDINHn4Ha72koYm+7Okr2ks7UmtjY7uZq78DeKW
	BbROPVeJp7L9S7H3wRoA4HXvhu/prMhzjv1cRbv9bEitgnPDqDte+tGScL4r/KQGHB5A
	bKjPs2B44jnH4F9/UWcLXReIJThKCQDMGVmGG7eEehh++CS68WQoAeGxbZ1H9BIBRl67
	/TlKznaK2pXmPMD9KaAMBafD8J0PRdfgr5LDaht9np2a+8cpWvfe0dUhLqt0ZXMMJcrk
	yT/A==
X-Gm-Message-State: APjAAAV7dEpIfLc6Xx0XpgFOh0J0bakrRVvHh08AYCTzAdUibYAKHf4p
	DmkCn3mrs6Z8OFQWeM0HYqfymdunUkc3UBUmEhClygJy
X-Google-Smtp-Source: APXvYqwylT/+6kG9hHaKArEA8j3hZCuAqlFwIA2Be3ULffQnGfsCkNczrMfpvAKS/MJuHzz2QgCtH9CS//+pEjkZKGU=
X-Received: by 2002:a67:e343:: with SMTP id s3mr3031209vsm.83.1574280039927;
	Wed, 20 Nov 2019 12:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
In-Reply-To: <20191120194927.GA28030@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 21:00:28 +0100
Message-ID: <CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 20:00:40 -0000
Content-Type: multipart/alternative; boundary="0000000000008e92a20597cca295"

--0000000000008e92a20597cca295
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 20:49, Adrian Bunk <bunk@stusta.de> wrote:

> > Using serial lines for console work may have its uses,
> > but for transferring files please set up proper networking.
> >...
>
> I've had several recent embedded experiences where this was impossible,
> and lrzsz was extremely useful.
>

Do you want to maintain it? Protocols are not changing, but the software
that lrzsz depends on is changing.

Your first task would be making it build with the latest version of
gettext, the branch containing that is here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alex

--0000000000008e92a20597cca295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 20:49, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&gt; Using serial lines for console work may have its uses,<br>
&gt; but for transferring files please set up proper networking.<br>
&gt;...<br>
<br>
I&#39;ve had several recent embedded experiences where this was impossible,=
 <br>
and lrzsz was extremely useful.<br></blockquote><div><br></div><div>Do you =
want to maintain it? Protocols are not changing, but the software that lrzs=
z depends on is changing.<br></div><div><br></div><div>Your first task woul=
d be making it build with the latest version of gettext, the branch contain=
ing that is here:</div><div></div><div><br></div><div><a href=3D"http://git=
.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package-vers=
ion-updates">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=
=3Dakanavin/package-version-updates</a></div><div><br></div><div>Alex<br> <=
/div></div></div>

--0000000000008e92a20597cca295--
