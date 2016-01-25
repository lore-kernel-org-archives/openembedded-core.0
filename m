Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B14C777121
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:15:12 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id q21so165933584iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 13:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kWfbyFE7niUUVl48KGUNaz3XSUUg2rEo7b+whnZUrBc=;
	b=x85CNl2WULw3DkUeWLyiwuEqzQUsX/Y2PpyzpeLD/DC9pjOgw/QPZiLfPTRuSUGhgV
	EyF1EBYjZDY8rOQCSVZEpfp9UhEg3KKRdYUfyjbWE6ggBy0Z9x5/07gm5BWgzi6fY+TK
	QhnWILJZfJV+2d9EalXh0qo/imA7sutUos1Y8AsP0ORlCJkKwYVKaWRMYKzyk3J731u3
	5m2PS4wZtiOl4ziv+Ls6m1KX6XewAEHJu1il44lvGrtt84qfumbXxx2sVHKRL0HxfsN3
	UcrMlvJ4HhSV+s/fOdzpatiGAMzuAn98Lvp0f7deOSruGv3GBk/bfifh1/ch0QHO6CjV
	sU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kWfbyFE7niUUVl48KGUNaz3XSUUg2rEo7b+whnZUrBc=;
	b=XROrct7lCMpqe+keBPe+hI/kpLmVxcAAQALKxiaDiByMjM7EW4vcRIZng0pePEXH3z
	7j4wHEkVMoyPTBRw4uMqhWpBMwczgcljEk39IyVtm5CKn3JHqs2G2GXYB+8985y7cYZU
	7JEY521fJNqiOEqra9qOPaMBMBMn9wagJHzZdnrwkgtLqXmI3mIa7OnnqDmNFjBTzvuX
	WLiVWYFR/w/Clsm9Vvhr1wCHXml59e2QN8FyH1TJm4H9kOVlnM65xO7AjUkS62IQSjEM
	eR88NQBg4/pUzGHgPeqaXtpHxmFEYqKYsYMmzdEHcoo+N5RHHlGeemvNqkFEp+f11CpG
	1vdQ==
X-Gm-Message-State: AG10YOQrSg+fGyUDu+i3BL6lAnQRoZJRbcHVwjP7BI0LPVaFE5CTXUPov6qUZ52hYbkrhSM8MlAxynEDj7lb6OIg
X-Received: by 10.107.135.104 with SMTP id j101mr21555779iod.133.1453756513358;
	Mon, 25 Jan 2016 13:15:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 13:14:54 -0800 (PST)
In-Reply-To: <c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
	<c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 21:14:54 +0000
Message-ID: <CAJTo0LZwr6drjDYg=DcPaR8iVhoP8uwuQ6=6v0ftc5xd5kKj1g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Mon, 25 Jan 2016 21:15:15 -0000
Content-Type: multipart/alternative; boundary=001a113ebe9291b158052a2f1083

--001a113ebe9291b158052a2f1083
Content-Type: text/plain; charset=UTF-8

On 25 January 2016 at 18:32, Khem Raj <raj.khem@gmail.com> wrote:

> +EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile',
> '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
>

Why do you need to pass ac_cv_sizeof_off_t?  Surely that's what
AC_CHECK_SIZEOF is for?

Ross

--001a113ebe9291b158052a2f1083
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2016 at 18:32, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":141h" class=3D"a3s" st=
yle=3D"overflow:hidden">+EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;=
DISTRO_FEATURES&#39;, &#39;largefile&#39;, &#39;--enable-largefile ac_cv_si=
zeof_off_t=3D8&#39;, &#39;--disable-largefile&#39;, d)}&quot;<br></div></bl=
ockquote></div><br>Why do you need to pass ac_cv_sizeof_off_t?=C2=A0 Surely=
 that&#39;s what AC_CHECK_SIZEOF is for?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe9291b158052a2f1083--
