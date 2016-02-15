Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12CF860249
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:20:02 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 9so160947204iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Rjs+ZVK360AI2p0IKtoI2IG6iHL6BqimRW+qVREEhus=;
	b=OlYv3A+JRd1+Qa6vclUrDhhXMAhLPo1zMKLnf96291puC1neAwWFpFydT97IkOUnQY
	Eima10xuGiLBhO6OetzN4ES55PufA+dTB+ghg1KptttwIylX98I8/b6pUM9ybsNNqI1J
	HhMRo/ybWqyFBgtfK9e+AA+CEvRyn/NtO4/bFrlVy3CNV6djjc/u/jTRZ/lChMIt99y7
	UxsASrd9Mp7OPoSYYY7W899EPEjprYwU6zRrcUCbM1Weufz76ceDYGYJdBLc5zhWhVo0
	u/wsGCjOChTZCAoQKM8eLo2naz6ZDTsNHKU8D345su4kAJC2g+lCJyToZCX5PuU+ZaJY
	9L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rjs+ZVK360AI2p0IKtoI2IG6iHL6BqimRW+qVREEhus=;
	b=P/WSwC2yoa7Ot0uevjKB8DHeAAlyykpfvpXihRygBcUAm24e2/1eS6wiPXtsGVsXQ+
	GueijTkBUeyYUNnNmbwFB2sB0fBF7CSYoMdPJ+ANI/m0GxzjFAKsXlt9MrC/Oozn1a8W
	bS5y2pE6JOE3PyI+x2I++ByVIxM/XKWxfuAh1t5AnKh+qUiywejwXAcewD+LhNo4KE5p
	AnLug3IT+4xsx/ziLmoP93Hw56OP+x75PgSJUTGI/LRT/QnvrD+LZQuWlFesSJRGl/Tt
	MRG9T6pzRd3XFKttwUu8PTwHuP1DM0XgOqHQpn+IpVdxGOZ+t6HPwXRiZzChfndkQYlO
	drEg==
X-Gm-Message-State: AG10YOTVwggIrFn4r3EMXbXXeXB+14DbocN4pXiLjw+292XSg6rTjEnqjC/4qNRIsaEPkp9O7AiDlTLcR8hzDQIN
X-Received: by 10.107.137.92 with SMTP id l89mr19161603iod.133.1455546003112; 
	Mon, 15 Feb 2016 06:20:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 06:19:43 -0800 (PST)
In-Reply-To: <1455544180-29872-1-git-send-email-adrian.ratiu@ni.com>
References: <1455544180-29872-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 14:19:43 +0000
Message-ID: <CAJTo0Lb0_2aArdo6BQ+ouGKzcsqqa+foaPHZsNDED1X3OUUcCA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ruby: break out ri-docs and rdoc into separate packages
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
X-List-Received-Date: Mon, 15 Feb 2016 14:20:03 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4785e88052bcfb6c1

--001a113ebdb4785e88052bcfb6c1
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 13:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> +SUMMARY_${PN}-rdoc = "RDoc documentation generator from Ruby source"
> +RDEPENDS_${PN}-rdoc = "${PN}"
> +FILES_${PN}-rdoc += "${libdir}/ruby/rdoc"
>

Did you mean $libdir/ruby/*/rdoc/?  This package doesn't get created.

Ross

--001a113ebdb4785e88052bcfb6c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 13:49, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":nb" class=
=3D"a3s" style=3D"overflow:hidden">+SUMMARY_${PN}-rdoc =3D &quot;RDoc docum=
entation generator from <span class=3D"il">Ruby</span> source&quot;<br>
+RDEPENDS_${PN}-rdoc =3D &quot;${PN}&quot;<br>
+FILES_${PN}-rdoc +=3D &quot;${libdir}/<span class=3D"il">ruby</span>/rdoc&=
quot;</div></blockquote></div><br>Did you mean $libdir/ruby/*/rdoc/?=C2=A0 =
This package doesn&#39;t get created.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebdb4785e88052bcfb6c1--
