Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id E8CAB71F92
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:18:37 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id x3so10975818qcv.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 07:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dbIRGdFr1HfuM3lUH7h+4qhVXfKnevO30ZezuB6/nEY=;
	b=LxXnP/cvup4PRgv8r1SVIsuXD7949Tn/B1ktAITdfbdHpUlwOcSAk1Uwk7J7Lyq+jn
	fkcQ46x6VDR84uG9JGoyQfb4us7SP0l68bHgHhxVZH6ecC7AhEHmZhkZsr50WYetISfI
	hpJRzAszGeNFQi/bN+9NhQMotN/ZERh+3kBfCntmjIy8QhZMl1fdtEzfO+yMcdt2x1fw
	hkSZ3nqEZHhNvxUpIpdlVEAGtY/qh73sqqsBvs9cNIIsldtbx+xusjS5M6cIdcIDoKwU
	AZBlX4ykoghZot/SE2h8mXDWo9lHWyLgDGzstEvjEXB6Zo1CKYgz34hPWkXfJAuoWjYq
	uqAA==
X-Gm-Message-State: ALoCoQlhFn/gYSx+YLT0bH6fO47Ag2tm7aRNIv0OQ/+ozB62fRPBXCZNQhtTC8gHb5vL73S+LDEY
X-Received: by 10.140.28.70 with SMTP id 64mr23293567qgy.15.1415114317321;
	Tue, 04 Nov 2014 07:18:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 4 Nov 2014 07:18:17 -0800 (PST)
In-Reply-To: <2164a52936a6fc4b51ed8b8253c851c02a0f75c7.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
	<2164a52936a6fc4b51ed8b8253c851c02a0f75c7.1409947480.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Nov 2014 15:18:17 +0000
Message-ID: <CAJTo0LZVWeGiKnqMGEjWKPfwagED3y=Vu-bKfDqm=h+kX5N7-g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libcap: Upgrade to 2.24
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
X-List-Received-Date: Tue, 04 Nov 2014 15:18:42 -0000
Content-Type: multipart/alternative; boundary=001a113a970a33a04a050709fac0

--001a113a970a33a04a050709fac0
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 21:06, Saul Wold <sgw@linux.intel.com> wrote:

> +               mv ${D}${libdir}/security ${D}${base_libdir}
>

If 'pam' isn't in DISTRO_FEATURES, this directory doesn't exist so the mv
fails.  Clearly we both have set this locally as it built for me too, but
didn't work on every non-LSB autobuilder target.

I went to add a conditional but started ratholling on the libdir vs
base_libdir hackery which now there's a pkgconfig file means the library is
in /lib but libcap.pc claims its in /usr/lib... and SBINDIR in the makefile
doesn't do anything as it isn't inherited to the submakes, and and argh why
can't people just use autotools!

Ross

--001a113a970a33a04a050709fac0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 5=
 September 2014 21:06, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sg=
w@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":49o" class=3D"a3s" style=
=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mv ${D}${libdir}/security ${D}${base_libdir}<br></div></blockquote></div=
><br>If &#39;pam&#39; isn&#39;t in DISTRO_FEATURES, this directory doesn&#3=
9;t exist so the mv fails.=C2=A0 Clearly we both have set this locally as i=
t built for me too, but didn&#39;t work on every non-LSB autobuilder target=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I we=
nt to add a conditional but started ratholling on the libdir vs base_libdir=
 hackery which now there&#39;s a pkgconfig file means the library is in /li=
b but libcap.pc claims its in /usr/lib... and SBINDIR in the makefile doesn=
&#39;t do anything as it isn&#39;t inherited to the submakes, and and argh =
why can&#39;t people just use autotools!</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a970a33a04a050709fac0--
