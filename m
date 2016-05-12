Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99D7A6FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 18:08:57 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id c3so160244igl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=lxuuvO0YF7z0qYFNN6SnSqvjMzYQ4sa9tlE6fO02GQ4=;
	b=U3UP66Rvu6sRmHM6T/S0MwJTWEtfiIdH8a1yJwwjwSp/7XCjcljOuAILhByhbqYh+f
	R4qibmQxbUfmnoGBgC84F0KqwW8jmhqRoJzUeRuHSnpCkOIvPC/h3tEzTXBZATV4D/lS
	A1k2YJ6zmuTn5IAOQSdwaJBVPWSKE7LVOOXW6nTIiZ9hO8DRzfsqS9smF45ZXmmh4/i6
	RUSFjFtyOgoLgHpUYrTJcUQWrAxReiBvqD1iK9u9A/Nlb+PkP6FL8xpz0hgIzlH6RUBH
	wTOX2J6hg1bK7Wc2Mpde3ataJ2LE8omEAaxwOhYIM43MtK+132TFBYPcFXfDhXej2BzM
	mWMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=lxuuvO0YF7z0qYFNN6SnSqvjMzYQ4sa9tlE6fO02GQ4=;
	b=z2pnDSGCJz2DiCLanqLio9Kpqjyzp2ywg5mNXmtrXkq+8BQjYtAxb67zzTEAtertO3
	ygkznDigrvz6VreYU96KyygUork7T23KJ163YqDNniFhvrvoDUHPMqhPVsLvNIT3JARL
	LSSsllGZNJ0ghJ5mcUE9dlEOubJKb+Ol/aSbVWBmDRor7XOcUMrv+4oB/u3O61kwckMt
	aStS5vvepddm3SaBGKSAVwfigLIxShMvY9yYrrQ/aqiBHpk4kJ0d34LU/9l+mcypbkg3
	/iVd32AvAcwNupM/l+eXjwp2+/fE2lX4Dvg+fmeJaboAa4XHFnX5GkpJeaWrMt7J+Yzj
	GSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=lxuuvO0YF7z0qYFNN6SnSqvjMzYQ4sa9tlE6fO02GQ4=;
	b=J6gOUCqmM86ooMMirMvm7sKJxVq4YFhf7qqm+ZewrXTHyAuu8Iep7Tbdcmyksfgd78
	LCTf3D/fcFyb2cKtu6/EfJv//70OITspfwrZQVGTdKE9w7fqP/aBsST9oKzENwX7IuBi
	QozJ1xbPgvhhUa3Z5sLQWr0t9tJrvTfrpZbq52V3KVuUEcaa3ljgMHUi6xJXXP5SPa57
	FN4izGj9tyPAR8Z0FMnuWACH5cwKUFO9BIEyotfDeQo7gQpko+KDXELxTJ/Skn7p2vU/
	gp25/f1Ms7TfsEAv1WbFOv1mVl9DFe9VitQHb1frSNEHyzn2CbW6ZAyDgbSPgBWoSMdi
	qUsA==
X-Gm-Message-State: AOPr4FX1RYLkrpsduXf7/JMzrRANF9TJrm1TBSt1dv9EQzTCDiE+B5uDnOfv8lNwtiRTFimBC0ZSgMdJvVHP5Q==
X-Received: by 10.36.41.11 with SMTP id p11mr8182225itp.66.1463076538427; Thu,
	12 May 2016 11:08:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 12 May 2016 11:08:39 -0700 (PDT)
In-Reply-To: <cover.1462476586.git.chris_larson@mentor.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 12 May 2016 11:08:39 -0700
X-Google-Sender-Auth: x_i_0Af78-N0JkHTd98xWfz-Meg
Message-ID: <CABcZANmwRS+fEvTYQ1gFdKe3FJPsW2xCQmV46O2f1QHTYcTOpg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [master][PATCH 0/3] Fix a few recipes to obey LDFLAGS
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
X-List-Received-Date: Thu, 12 May 2016 18:08:57 -0000
Content-Type: multipart/alternative; boundary=001a1143fd705a2fd10532a90da2

--001a1143fd705a2fd10532a90da2
Content-Type: text/plain; charset=UTF-8

On Thu, May 5, 2016 at 12:30 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> The following changes since commit
> 1a0e56630c5c27d8899dd0979ae0b86bbe227881:
>
>   utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:58
> +0100)
>
> are available in the git repository at:
>
>   git://github.com/kergoth/openembedded-core more-ldflags-fixes
>   https://github.com/kergoth/openembedded-core/tree/more-ldflags-fixes
>
> Christopher Larson (3):
>   ruby: obey LDFLAGS for the link of libruby
>   mkelfimage: obey LDFLAGS, sort out HOST_ flags
>   pong-clock: obey CFLAGS, LDFLAGS
>

Just a ping to check status on this, as the autobuilder hit at least 2 of
these 3 issues testing the ldflags "poison" patch.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd705a2fd10532a90da2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 5, 2016 at 12:30 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":gc" class=
=3D"a3s aXjCH">From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@=
mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
The following changes since commit 1a0e56630c5c27d8899dd0979ae0b86bbe227881=
:<br>
<br>
=C2=A0 utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:5=
8 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/kergoth/openembedded-core" rel=3D=
"noreferrer" target=3D"_blank">github.com/kergoth/openembedded-core</a> mor=
e-ldflags-fixes<br>
=C2=A0 <a href=3D"https://github.com/kergoth/openembedded-core/tree/more-ld=
flags-fixes" rel=3D"noreferrer" target=3D"_blank">https://github.com/kergot=
h/openembedded-core/tree/more-ldflags-fixes</a><br>
<br>
Christopher Larson (3):<br>
=C2=A0 ruby: obey LDFLAGS for the link of libruby<br>
=C2=A0 mkelfimage: obey LDFLAGS, sort out HOST_ flags<br>
=C2=A0 pong-clock: obey CFLAGS, LDFLAGS</div></blockquote></div><br>Just a =
ping to check status on this, as the autobuilder hit at least 2 of these 3 =
issues testing the ldflags &quot;poison&quot; patch.<br>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmai=
l dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Ts=
lib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1143fd705a2fd10532a90da2--
