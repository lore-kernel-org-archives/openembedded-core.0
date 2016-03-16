Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 16304606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 21:30:53 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id ig19so218080igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bYmXr5UcsIJhWOHcqt0T62ahYQBh3cuaFjnQDAsP6d4=;
	b=r5jfl0vJ++xVkFjBhiK+Iar/pJZmHKC+f4Ff6ACL0q6M52lwoHvlekUQlHNhkN7Nlk
	wWvqJlTh31kkfZLvAsjG3jpTwDKjYu16OGBsigRm8qZ1M0oZz6YbLncSDdXxs8QZ8Nqe
	vnozBThNcJNaa4Bx8GhSqsLIuoEGRMHT890zz4DFfkelB0UL/lt6eVU2PlIe+FeiAVBg
	5TxqYXdQxUPLL2hvZiJQQgYKQEUwp9hIyYgGupAYqcvahN8OgGhLJ0F+C3j2B4BJl56P
	P9KaBRF8MdJdPkBXPms/D4kjhibZsoHarjKc2D48W/jPzqRC5yYzTA2xTz6sIW769w7X
	dftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bYmXr5UcsIJhWOHcqt0T62ahYQBh3cuaFjnQDAsP6d4=;
	b=eDnksH3SaIE4z2EEFN64Q+ED0m73jeWt8UH3Rkk37xCG7CHTq/KaaXVUSNAFEVjiZv
	cehaJSacGJQR0VEH8Rfk7pnZCm7vGaPU0EhIPl1tpaQAyHy/0vo96U7Q+72KKzp62JBu
	Mou0kn2vWivwN6Q6Igcp0Hd+KX0QmKbePnrsJe3mqQYhWm89vaMOKJFjMj5M3rnDp3Zq
	Qy0F6ibqQu6dtm6USo0dNlEE+IsIlDxJ0ZL3VcFS5EAQUbaYm2/szCzOjnsaxKSfbCsV
	JBUa7JapOC0VxGKGeWRQ+hdSylgpkFOwklAV7NzSSKfoDj1RJkUj3BiCTGRcW0TfTijb
	bl3g==
X-Gm-Message-State: AD7BkJL1O14ijla8gm3a08hdd6J3GDajjEVmzPzpyf964+FhtszNYtLeD9jIE8xJR+00BcICcyP4c9hhFIh6wvtu
X-Received: by 10.50.97.71 with SMTP id dy7mr8254924igb.78.1458163854518; Wed,
	16 Mar 2016 14:30:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 16 Mar 2016 14:30:35 -0700 (PDT)
In-Reply-To: <7f65eb60b218d156262f426460a2873ecdb32a14.1458096408.git.dengke.du@windriver.com>
References: <cover.1458096408.git.dengke.du@windriver.com>
	<7f65eb60b218d156262f426460a2873ecdb32a14.1458096408.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 21:30:35 +0000
Message-ID: <CAJTo0LaGJyuoNL7V=y1+tCWWZQV1DuNAEeQSfoTgkieGrNRkLA@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nativesdk-coreutils: a lot of warnings fixed
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
X-List-Received-Date: Wed, 16 Mar 2016 21:30:54 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc192f4ac052e313ad2

--047d7b10cfc192f4ac052e313ad2
Content-Type: text/plain; charset=UTF-8

On 16 March 2016 at 02:49, Dengke Du <dengke.du@windriver.com> wrote:

> When we create nativesdk-coreutils, a lot of warnings appear,it
> show many files can't find.
>

I don't think anywhere where nativesdk packages are used actually runs the
postinst scripts to create the alternative links, so maybe we should be
stopping update-alternatives do anything in nativesdk (just like it doesn't
do anything for native)?

Ross

--047d7b10cfc192f4ac052e313ad2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2016 at 02:49, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":49p" class=3D=
"a3s" style=3D"overflow:hidden">When we create nativesdk-coreutils, a lot o=
f warnings appear,it<br>
show many files can&#39;t find.</div></blockquote></div><br>I don&#39;t thi=
nk anywhere where nativesdk packages are used actually runs the postinst sc=
ripts to create the alternative links, so maybe we should be stopping updat=
e-alternatives do anything in nativesdk (just like it doesn&#39;t do anythi=
ng for native)?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--047d7b10cfc192f4ac052e313ad2--
