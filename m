Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 878516E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:22:06 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 189so9654462ity.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XxrJM4CBN95uavCVhN+GcvfizzjCqAWTIm96sXSxZ3k=;
	b=U8seAi5eRBvLk9y9Bm5XLEhKSMQbW43hGm8j3wXEUkCioxFxggciihG/0fOQyZa9CV
	bO/MOzQGx+kRuVGd9Vsyw+PrDJp2aNXUpU79ZgyuGSHY9ceqm01P5xTrC9pIUSEz+JOB
	ysyOw31lgbQohhcrPpGR0EsobuUCw9VbcxD6xRmUVE7/1kX4loWDAB9eX2p1aCirh5l2
	8hMwbNIlotuC6VcP8ihDpVNX5m/LpL8bQwkHo3Q9TB3wLYvyrZg79k27MrYyqW39Puxy
	NGiIcK+2ckfASrIyIo6rNYQ3UBYcLpVd1NL021jYAHjmQLJFQXYQAFfzW1m9EyZMMwWd
	4PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XxrJM4CBN95uavCVhN+GcvfizzjCqAWTIm96sXSxZ3k=;
	b=GA/tlCh37eaHDBtXCzqoEJzgKyvZUgjvw++B2VnT7vn7hxsfctqnv+RRzOz22If5bP
	Mzon7V+etl3BBs32ipftp8mkvVcBO3lK145aHb2k4nKmR74gmtlBCYQi9bb7ZhqmkNsR
	yXGgQbrXZzOMFqxIlgsqHeDM08ht9xTl5ga7y2eyO3BYBRPH7afBVyCpnkGJy/ZizNXo
	6F3UKk8utXH8XzsFUXnQD9Y9LsQPDpElwcqtopsJsGjo/FVhuugYPEkvQa8zBfI9Cg59
	mgvynPEOJ0dE9j2/tYv7CesKe60QIH5DekK0DSrp50yGa8HhRvJL2tOYgqsEpfUoMjVB
	2K1Q==
X-Gm-Message-State: AA6/9RmdYzw0lTTVcUF814vimE27pIxpSd3iOBD/DuKXq378i+flXjACfhcga7mE/yko18HbZQrz3DrU+GYkC57E
X-Received: by 10.36.144.68 with SMTP id x65mr2933452itd.70.1475572927285;
	Tue, 04 Oct 2016 02:22:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 4 Oct 2016 02:21:46 -0700 (PDT)
In-Reply-To: <20161003171453.9151-1-Martin.Jansa@gmail.com>
References: <20161003171453.9151-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Oct 2016 10:21:46 +0100
Message-ID: <CAJTo0LbiDauWC1Te7+Oj2kupL+pJDx1XFUFQL2t76Gx+Hh3naA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: add dependency on boost
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
X-List-Received-Date: Tue, 04 Oct 2016 09:22:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c07e8062be374053e06986d

--94eb2c07e8062be374053e06986d
Content-Type: text/plain; charset=UTF-8

On 3 October 2016 at 18:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> +DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c boost"
> +DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native
> boost-native"
> +DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3
> nativesdk-gettext nativesdk-boost"
>

So why does systemtap appear to have floating dependencies for ncurses and
json-c?  Should we be expressing this as a single DEPENDS line with
something like different PACKAGECONFIG for target/native?

Ross

--94eb2c07e8062be374053e06986d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2016 at 18:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2bh" class=
=3D"a3s aXjCH m1578b8daffc1c92c">+DEPENDS =3D &quot;elfutils sqlite3 system=
tap-native ncurses json-c boost&quot;<br>
+DEPENDS_class-native =3D &quot;elfutils-native sqlite3-native gettext-nati=
ve boost-native&quot;<br>
+DEPENDS_class-nativesdk =3D &quot;nativesdk-elfutils nativesdk-sqlite3 nat=
ivesdk-gettext nativesdk-boost&quot;<br></div></blockquote></div><br>So why=
 does systemtap appear to have floating dependencies for ncurses and json-c=
?=C2=A0 Should we be expressing this as a single DEPENDS line with somethin=
g like different PACKAGECONFIG for target/native?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c07e8062be374053e06986d--
