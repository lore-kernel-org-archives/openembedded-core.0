Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 136EB75D22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 21:21:30 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g73so103677806ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dEhPSyQpLpTLmJewROQR7dC7DbOaMZJaQ0xLFHOrwls=;
	b=kfRtWXGrNcNdAWQ8KTHfZvrG53CQCNL96fRkfz1zMP2oKcpADzIMxuo05BP7ZJqyWe
	9JtEscDMZmoVlP4U1bQafoq/+j0NhQbQuA3xiBEMNgsRmFeDtFyXVRKsxLz7PtM5q+QA
	1b+drXpMW0Yoo7/cUOxtYFk5MO+mfwV1n/G5kW37Wmg9fMIKnhNixc4knMxDYgq9l4A1
	GEk/SlSqLUvt/lykrr16FaJ3Ywz5pNJUYk1VWzySzCGBOFse/zT6i2QHh9lExcCJeQSY
	L8MpkfSFEfbO299vBuKyLv22ttjN/+P++sGD3/vNYxvrnrwTw9VnMPj49HsP/zhIO07u
	tNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dEhPSyQpLpTLmJewROQR7dC7DbOaMZJaQ0xLFHOrwls=;
	b=lxqGjlF9SxNQSy38+QaQqthjPGQfPCAcQZyCO12h1eRPPKHBsCpuQpQkjO1rOOTcbS
	PVlzOP1giipZSC147c55DcRieohJB/g6tmyDvM+FPECvjq8ZvKlzbu0hndbNkwK65Zbk
	m5N+AnKzVWodQbmvExaygUZ1fMSSwgW1eTyDCB+xyc5i5+F0f+GoxoQ9vGkAhP9+ChJi
	/0mOKHe/4E3mQidwVi8/17SbGwlTZnTKOJ/ESuUy8zsPdltIsv3FauTsJnaZz0zIaUNi
	W46VnPrEhrd0zCO+uL56/IWYpqc122uZWR3hhZfn4eXDg47uL5fqpWhnM0U8+D+/jLqU
	vKIg==
X-Gm-Message-State: AG10YOSalW2LSbNT+6dMwFDkEDbXe9ZnwDCOh/J2SnkQzJOdG3uEXvrb8SXgUXjozU+0lqd05B/UOOJe25rHkks+
X-Received: by 10.107.135.104 with SMTP id j101mr13588269iod.133.1454102491243;
	Fri, 29 Jan 2016 13:21:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 29 Jan 2016 13:21:11 -0800 (PST)
In-Reply-To: <CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
References: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Jan 2016 21:21:11 +0000
Message-ID: <CAJTo0Lb3ZpOqC4Hik_cNh7PZqCF7-=EvosN82HWfpw6TKLNuig@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Jacob Champion <jacob.champion@ni.com>,
	Adam Chappell <adam.chappell@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 21:21:33 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92753ae4052a7f9e1c

--001a113ebe92753ae4052a7f9e1c
Content-Type: text/plain; charset=UTF-8

On 29 January 2016 at 17:13, Burton, Ross <ross.burton@intel.com> wrote:

> This should at least hard-code --with-nss or --with-openssl (and the
> relevant build dependency), at the moment you're relying on the sysroot
> containing NSS or openssl.  Luckily something pulls in openssl but that may
> change.
>

And for even more fun the resulting package doesn't actually depend on
libssl, due to the layout confusing the shlibs code in package.bbclass.

*Far* too late to debug that right now!

Ross

--001a113ebe92753ae4052a7f9e1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2016 at 17:13, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">This should at least hard-code --with-nss or --with-openssl (and the rel=
evant build dependency), at the moment you&#39;re relying on the sysroot co=
ntaining NSS or openssl.=C2=A0 Luckily something pulls in openssl but that =
may change.</div></blockquote><div><br></div><div>And for even more fun the=
 resulting package doesn&#39;t actually depend on libssl, due to the layout=
 confusing the shlibs code in package.bbclass.</div><div><br></div><div>*Fa=
r* too late to debug that right now!</div><div><br></div><div>Ross</div></d=
iv><br></div></div>

--001a113ebe92753ae4052a7f9e1c--
