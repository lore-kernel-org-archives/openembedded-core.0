Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2476E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:37:47 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 1so301357739ion.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5evsXh0TUZWxTVg3NRgoNYC0a6X5Sq0oVE5fpwQqSY8=;
	b=LnAbKY6DVmxlboMXvt2jqe9GZYK1vhfGlXpNAvzDLyWTiOpjJnA+pqeQWGWjLI4QUh
	A6uZ43WvSloG2rJXEF/xRuhPEx+uXav++ocPEBlyew4PZqvSYDWJM2CFnXivhK9qzgRa
	BrvHU4t/o5CifLoEK5FtZdDnLvFWx8ghgUeWBFLWChqyAd+pcxYLgogY9GsS9pyh7rar
	MumNheiwgFdm8apnNES/FWOzsyZlEQREU6RGw5ZPL+9OmbKoLF64r2BXdjS0qFsCOErO
	7Cp9BmEvM8oGJthYKosYwV2IlYpj7iMbGZFBQ3TJRes0j7J6sRMYpRqjMdWHqilZK9cX
	YsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5evsXh0TUZWxTVg3NRgoNYC0a6X5Sq0oVE5fpwQqSY8=;
	b=f79gK6/jC11iPF6h5QqkSuTBS615Vf03kbQQ4dVAFC3Se1zHE5h+bB4zve3kAo0qRc
	xM1cShWQaQts6lf65tlRis2pRxqOBCYDdthTB6PutxlxoIBKB2qsGIFWT4G/cX2ywpXr
	ZNoC7Z4utzH6smzn1wT7s45RSMzUFEJfzQBwHsoSyeMBI5vz/F4uYCYf9NScfxBeo6kY
	6GTgiGEl50v7zeyKMtu1c/Hj7lOtXrA3OK593LdbCTEB96EpvShpOjuMJw0Vib3ORDe1
	56RnPxnHyLIfyqGDT3qFQ46/b8hZWT9TPYygVo2xxy4MyRA6//mnYWfWg0cUiNR5gn7z
	NFng==
X-Gm-Message-State: ALoCoQnoy646FPMJpGz2ydrlDO2nY/hHr04uJj5QYehMh36/cgO03nD8CzPLOIIVt8zK76/WFZ9cMLtaNxvqWrTE898LIuBlHJCjuCFxoXYFZXRperPJ5tc=
X-Received: by 10.107.135.104 with SMTP id j101mr89276682iod.133.1452519468429;
	Mon, 11 Jan 2016 05:37:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 11 Jan 2016 05:37:29 -0800 (PST)
In-Reply-To: <3794662.0pqDkncOgQ@peggleto-mobl.ger.corp.intel.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<3794662.0pqDkncOgQ@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 13:37:29 +0000
Message-ID: <CAJTo0La2C+W0A7RXk-zKPgyWrP7rqsd7=CSiDUL8KUmureQzUA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 13:37:48 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92f2143805290f0a78

--001a113ebe92f2143805290f0a78
Content-Type: text/plain; charset=UTF-8

On 10 January 2016 at 20:26, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > "
> https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"
>
> Can we rely on this never changing? I thought we'd experienced problems
> with
> github's release tarballs being generated on the fly in the past...


I've spoken to github engineers who swear that because github's archives
are generated using git archive they should be identical (it forces
timestamps to match the data in git).  Either way, on the releases page the
links to "Source code" are github's dynamically generated tarballs, the
other files (with sizes) were created by the maintainer and uploaded so
they won't be changing.

Ross

--001a113ebe92f2143805290f0a78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 January 2016 at 20:26, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">&gt; &quot;<a href=3D"https://github.com/vasi/pixz/releases/downl=
oad/v${PV}/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz</a>&quo=
t;<br>
<br>
</span>Can we rely on this never changing? I thought we&#39;d experienced p=
roblems with<br>
github&#39;s release tarballs being generated on the fly in the past...</bl=
ockquote></div><br>I&#39;ve spoken to github engineers who swear that becau=
se github&#39;s archives are generated using git archive they should be ide=
ntical (it forces timestamps to match the data in git).=C2=A0 Either way, o=
n the releases page the links to &quot;Source code&quot; are github&#39;s d=
ynamically generated tarballs, the other files (with sizes) were created by=
 the maintainer and uploaded so they won&#39;t be changing.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe92f2143805290f0a78--
