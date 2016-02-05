Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id BA749772E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 15:27:21 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 9so132364942iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N6590r7sMJnltEVqI1SB7Ra0Mqn6rDtp+tqr041kddc=;
	b=BcbY8r/YZtDnSHRMHOwJkEOtd/UbKNYkmL/r74mf68E3qPO+zgkZj0OugICfUkugVl
	jS+lQMOMieUYv/phGzij5A1U2VI5TRgWIhTcrzgvEoMslGzPebsmYVyoGeJPj+UTSq6I
	R7Sxsx9vfjKESYMDxgantqKpO8mEtn5+Pbjx/KCXwVBV1Ldv4/x8b1XkRQinAqq66dh/
	hIVTbc7XlJEiNswhvwqeYB3fdrDFo7tCsvWmhtHOEFtLzRl935njKpU+mfJd1zLaBuxj
	iSCtprqthHEoCOM5dL6jSi3rGSC5OWDh473Yh8iN22W6Y9mgWgcIEo5+Rcqf1RxC2BBr
	lA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N6590r7sMJnltEVqI1SB7Ra0Mqn6rDtp+tqr041kddc=;
	b=lsEUUyfmpgEmhKHS6+xc2d54+6kTKnzLhZMQMff37T5kbSB+IMEQ8S8a0NEKYuFgjt
	13JdqofJm62ooluUyNEqwam9Z58sJQ6l3rSK0B+1H1CmNBDvaxAnkQPBu7nhafb5Ds+I
	e9VEntPihfm016kWJD0PvZHoRwo6nNrkOaDTKRTJdaK33M8JIeBysGWDZavy2EkAyWF4
	lCo7oikrS0RGKyHH3xXvGJ7WH1BUTqg3Mz+3vH8pIVNwRPUP3vHA5I2mtWtJBz/aSQIR
	3e3cCcrQogmMZD9MCzWpWoF18MpCcQdJr4ZmA87/00wMEYtXloUr1W3eRuvlTJqUXlFu
	Cz8g==
X-Gm-Message-State: AG10YOTxCQ/sgqsfWaj4y9Z1BSTCixqOPxmUCGdTXLVkrKynaFwbuJqRPJDPvInehKyNNjLzDEgEfqkmOkWJZ/jl
X-Received: by 10.107.3.220 with SMTP id e89mr14532936ioi.99.1454686042673;
	Fri, 05 Feb 2016 07:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 07:27:03 -0800 (PST)
In-Reply-To: <CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
	<CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 15:27:03 +0000
Message-ID: <CAJTo0LYu_uQSVgpVSobMP3MwM+vdfaX=xecBLX93T_WRNGjtzA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Fri, 05 Feb 2016 15:27:23 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cd56c25052b077c9c

--001a113f0e7cd56c25052b077c9c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 February 2016 at 12:02, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Will give the backport a test and hope I'll get i18n back for GTK (and
> most likely others).
>

FWIW I've tested and queued this for oe-core master too.

Ross

--001a113f0e7cd56c25052b077c9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 12:02, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":9ow" class=3D"a3s" style=3D"overflow:hidden">Will give the backpor=
t a test and hope I&#39;ll get i18n back for GTK (and<br>
most likely others).</div></blockquote><div><br></div><div>FWIW I&#39;ve te=
sted and queued this for oe-core master too.</div><div><br></div><div>Ross<=
/div></div></div></div>

--001a113f0e7cd56c25052b077c9c--
