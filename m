Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D55A66612C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 16:32:21 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id o189so42696071ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EjlqBUsz1Y54toUZnNd+CgWTNBY8n1vwgOdWBKe2bys=;
	b=Df8kca7VvArGrwsC203BQ02+ZZff09todOS8nWySFHL58YmhuYABhSRoGcnHp0GYUr
	oYEdeXKDPKVx4HeqDyhI+xRKNgjydQaFrqLBPDGkVU5AR64HqJNZoU0vaBddZ96dJ2ER
	kstXtN/k4dJPXiw2zeuoNb4+eMcBh0F58wZpxhTnhNH6OIXCNAHq+iq1FmDtwWIR1LNl
	ATPRckP6y9uA2qEzTMLjlZa9bqUNVM6YOnWQYbXEsOmnSvOzIbaAH+DWbhb2XOgJ4Xyt
	cc1HO+P0SAFRCkgNbylzDExAMjUf6o6ZDkHFQn9XOo9VTLCqHTBSjnK4XNoWPYjIyLYO
	pzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EjlqBUsz1Y54toUZnNd+CgWTNBY8n1vwgOdWBKe2bys=;
	b=UwA+cmEx7SzUEvi3anF1JaoTtHik+/KmNBnRpyN0R7F+lnuuwFRGmxwgjuCGRPkkYJ
	TWfifqdgHmAj3YJ1BoDjTDAshjhQNPQemLz1a8oB+jpwprdesbRKnxPk4XKSPMkEIpT0
	9JDf58WCnhiaEpE8pgTbnQ/QweBzKarXsXypZrWlVLfIjaXijVKKo2U0Y0bB9VxaNCDk
	6bDGGHl/OoBhFPQnUlWNyooqaLKAR2XHxQuTTDyBJMNtCGfPJ39joN5BC/FTnduKCDL/
	m6CXRW1Y8MVAGNXLEetSpPCig3jjs9eLxW2nh23pVGkuvImKQwlpRhGaOuPysmWjN4T9
	SGSQ==
X-Gm-Message-State: ALyK8tL5bJJyfr0RIyib/vE/YIiAIPulHp9/DZBom2de2nnEjsdtJ5WUzLF0ats8ZrLr/FfZUjSwtrgL1tNuqH0W
X-Received: by 10.107.179.9 with SMTP id c9mr17938947iof.99.1465489941863;
	Thu, 09 Jun 2016 09:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 09:32:02 -0700 (PDT)
In-Reply-To: <CAJ86T=U4JCAcbAN4rwvhNT-KO8jHK2OncF=6zQo093g-BmARSg@mail.gmail.com>
References: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
	<1445376809-25202-5-git-send-email-ross.burton@intel.com>
	<CAJ86T=U4JCAcbAN4rwvhNT-KO8jHK2OncF=6zQo093g-BmARSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 17:32:02 +0100
Message-ID: <CAJTo0Lb+-Lrpi-uvQC9CCuujf8gZaKb3BcuRNVBJby+awRDCAg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V3 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Thu, 09 Jun 2016 16:32:24 -0000
Content-Type: multipart/alternative; boundary=001a1148576268304a0534daf742

--001a1148576268304a0534daf742
Content-Type: text/plain; charset=UTF-8

On 8 June 2016 at 21:35, Andre McCurdy <armccurdy@gmail.com> wrote:

> To make this work, isn't something like:
>
>   EXTRANATIVEPATH_append_class-native = " file-native"
>

God I wish I wrote better commit messages sometimes.

subversion and rpm don't use the file binary but link to libmagic, so
EXTRANATIVEPATH isn't needed (as only the file binary is affected by that).

Ross

--001a1148576268304a0534daf742
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2016 at 21:35, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4kw" class=3D"a3s a=
XjCH m15531ba59c8f2419">To make this work, isn&#39;t something like:<br>
<br>
=C2=A0 EXTRANATIVEPATH_append_class-native =3D &quot; file-native&quot;<br>=
</div></blockquote></div><br>God I wish I wrote better commit messages some=
times.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>subversion and rpm don&#39;t use the file binary but link to libmagic, so =
EXTRANATIVEPATH isn&#39;t needed (as only the file binary is affected by th=
at).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1148576268304a0534daf742--
