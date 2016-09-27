Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E7F6060235
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 11:41:27 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 92so11698339iol.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+NldBSIOa+IaSwmOZG+9w+4c0mDcJ64K+RYzE1mYeIo=;
	b=QJ7D+hDhi5TY8tHZXhR2hrFb20g3sjr4L99t9RmY4a3KDIYdGvvyrEDBbNwVnxGHrS
	DHQ348sE2BF42/hy/coNaO/GzN3LePa/0syd54C2lbesu68jyQt+pLJ18RRCJa6C1QVj
	8nMZV672ngtqOuHo1juHFhdC2fmEW+aYSTbfH2VVRuKv5OvhSjDH8x6Vy5kECtXHNnBi
	8eh99djiDXMPkmFFp+HH3JbTsnrpQlS88YuyeT43bJCqpirE+zYADXhSj9AMljqTOYGP
	/aAARZ9z+L/W3RDe9bMUwPbqqy7T9Bz8211M94yUUOq5VFc0ly4HjNdAXTLcAF/pRNi8
	73WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+NldBSIOa+IaSwmOZG+9w+4c0mDcJ64K+RYzE1mYeIo=;
	b=Bg2Paogi6uay4uAaVBbNVu7aq9gQqkQ+4Vg4TnV0hwpLaUF3EXcqgucqTPluu0a0PR
	usgzI7u13IyghX+KC/xkH2bR23ILMjR1RC26RbeKQviWml2OuiCYy83e3bj/JFjK8jQ2
	AHwLtDs6uIMoSbNvRlj9ZUFgl3/McfD82jlQHFh22LLOcjBDqSB+vQ7ZTABHwNvLEOQA
	tAaYXBMxxkCr1GphSm+WJwFer3SjC6h7ad6UoMfLvBV6/xkvTumOsVNgvuD6kqFfHxW7
	GPZOslJ5SSNRh2joiFuoPAn70TNw67A2R0hJiulGEv9qaZOLzBR58ZMeQ1HBjRG5Xp7h
	gEpw==
X-Gm-Message-State: AA6/9RkXLLq/XsYs6ITQ9bwRTdr/GUWth9pvWj77+Ltex8PE3xt8NKMHKiyYhHwOml01Zi3u9ME1gjmvEkk++UXx
X-Received: by 10.107.47.151 with SMTP id v23mr2581320iov.172.1474976488722;
	Tue, 27 Sep 2016 04:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 27 Sep 2016 04:41:08 -0700 (PDT)
In-Reply-To: <1474581198-14398-1-git-send-email-nathan_lynch@mentor.com>
References: <1474581198-14398-1-git-send-email-nathan_lynch@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Sep 2016 12:41:08 +0100
Message-ID: <CAJTo0Lb=ynjGK-d7fe0boA8z1Y1Ep561CF5E2hHx9o3QRQMm-w@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: fix ptest
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
X-List-Received-Date: Tue, 27 Sep 2016 11:41:28 -0000
Content-Type: multipart/alternative; boundary=001a11c1557ca9acca053d7bb99b

--001a11c1557ca9acca053d7bb99b
Content-Type: text/plain; charset=UTF-8

On 22 September 2016 at 22:53, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> -RDEPENDS_${PN}-ptest += "make perl bash"
> +RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
> +# babelstats.pl wants getopt-long
> +RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
> +# getopt itself needs overload
> +RDEPENDS_${PN}-ptest += "perl-module-overload"
> +# overload, in turn, needs overload_ing_
> +RDEPENDS_${PN}-ptest += "perl-module-overloading"
>

Why are those perl dependencies here and not in the perl modules themselves?

Ross

--001a11c1557ca9acca053d7bb99b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2016 at 22:53, Nathan Lynch <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":m7" =
class=3D"a3s aXjCH m15753e3e4c2fb1f6">-RDEPENDS_${PN}-ptest +=3D &quot;make=
 perl bash&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make perl bash gawk ${PN} babeltrace procp=
s&quot;<br>
+# <a href=3D"http://babelstats.pl" rel=3D"noreferrer" target=3D"_blank">ba=
belstats.pl</a> wants getopt-long<br>
+RDEPENDS_${PN}-ptest +=3D &quot;perl-module-getopt-long&quot;<br>
+# getopt itself needs overload<br>
+RDEPENDS_${PN}-ptest +=3D &quot;perl-module-overload&quot;<br>
+# overload, in turn, needs overload_ing_<br>
+RDEPENDS_${PN}-ptest +=3D &quot;perl-module-overloading&quot;</div></block=
quote></div><br>Why are those perl dependencies here and not in the perl mo=
dules themselves?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a11c1557ca9acca053d7bb99b--
