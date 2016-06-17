Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8E16673178
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:53:23 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id z189so159163466itg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jZ2b/2/6QycbY9N4Q4xg9nRiHdoivqJtxLC2QOo7NYM=;
	b=FqLmzBTG0lrDmRu8EiW9EESa1/1YOB3ngoS3qmF2LxDmkFZplrPHUA/3g8Eed5iCi9
	MUST5RFUWEiYDn9+3jW8IwH5S/xFeDnyPYsPXxzcCmlBxnAycNaME6PAytTC1WTWna2q
	qiM9niVg3FwHFoA8jOfNfYtE6+2Q4Z4vk92NOYvX7G7v3rg6a14xBj6X5XE7do5Zk9PJ
	8EhBkT00JMX2RfXUeJSl9ZSlGb30mk0O+902bkUntJKCixul+0iQ12R8+fvIBUpb207c
	JqVslUQbxmP1ZHLPweB624kvQIZeV1v1Jg+7ath3ywDQDBE89My8W+QoAC+sRHGgfkkB
	gPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jZ2b/2/6QycbY9N4Q4xg9nRiHdoivqJtxLC2QOo7NYM=;
	b=DA/AhBHg2MLFXFNoyLGLDU1/8nmbpnYt1RmTzyQNCkOBuDFU7D+kFd67Zuk1Ad7Acy
	DLRAm8F/2vreN685uLrGnCNaFnU7eppjzQOSBLx1FC3UQTc2rU0iq426Vv3XtCQaIImV
	GBZzk4UldtbZWxqC9G9cS+OolJ2Rr44+C0ZMpnsvMll4cmpeGdBlMzO9v+QCBaLTETis
	vj0uJ9p51ZjoUOqorHcib+8SI2Kmal/XAqXvArl62ywjen8tTP9JdycAWacVlIUp8K3O
	1I/6yO39ySgtnUVXdLjoLVBKEBpKR32h2Z5lf2ZbKvOMTeELqtKsAXYWsi9mGM3CYd2v
	81eQ==
X-Gm-Message-State: ALyK8tIXFXNfxTjuY00fbaQEWxt3OXL0W2+HjfxNrWF6D8jPZ0aWVg9jpzl5oh6ZvwbkabuefDdmaIbTVt1er8O+
X-Received: by 10.36.57.211 with SMTP id l202mr2182101ita.22.1466160803776;
	Fri, 17 Jun 2016 03:53:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 17 Jun 2016 03:53:03 -0700 (PDT)
In-Reply-To: <CABcZAN=PJ7m0jKUY1TnxiqBpC15Ahfr_f2=9fD+T24zGvLXJgQ@mail.gmail.com>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-2-git-send-email-dv@pseudoterminal.org>
	<CAJ86T=W1ZwM7j-OJUfBBj6eqMz08346xpvu2VKqeD1JWtob=jA@mail.gmail.com>
	<CABcZAN=PJ7m0jKUY1TnxiqBpC15Ahfr_f2=9fD+T24zGvLXJgQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jun 2016 11:53:03 +0100
Message-ID: <CAJTo0La=WfdS1vpfOhyOF5qB-79CWX_GokFH3_O1MON1PToG3g@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] gstreamer1.0: upgrade to version 1.8.1
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
X-List-Received-Date: Fri, 17 Jun 2016 10:53:23 -0000
Content-Type: multipart/alternative; boundary=001a114ab3cae49ef6053577290d

--001a114ab3cae49ef6053577290d
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 03:58, Christopher Larson <clarson@kergoth.com> wrote:

> gstreamer1.0-plugins-bad's upgrade was delayed due to the pending gtk3
> switch for sato, which has recently happened, so I'd expect that upgrade to
> come at some point in the near future. See
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664.
>

Khem just sent an upgrade, which I've queued locally.

Ross

--001a114ab3cae49ef6053577290d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 June 2016 at 03:58, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">gstreamer1.0-plugins-<span class=3D"il">bad</span>&#39;s upgrade was del=
ayed due to the pending gtk3 switch for sato, which has recently happened, =
so I&#39;d expect that upgrade to come at some point in the near future. Se=
e=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9664"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9664=
</a>.<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></div=
></blockquote></div><br>Khem just sent an upgrade, which I&#39;ve queued lo=
cally.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a114ab3cae49ef6053577290d--
