Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2939C71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 20:52:11 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id n4so29189317qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+FfUFV1xvkxHy/JPUWndKnyiktBW39A+MiPoKNB1K3A=;
	b=j0Mtzn6c+DtfM5siNzeWdRzKF7Bu0wr6PW1MupmOjm7OxL1/aN/Q9UhS8CPP3NBP0o
	f19wTvq8tI6mRIwwPwiwQcaQU3xKo6cN0Lo7PdYZ1D8sx1AQm1sQACdveAcUmOpCIqyj
	ezlqzHFnvauZPE+KJHa/243B2bfDTHKOKUUR3rEkW0ZwTAw+QtHPjow8OjR1cijLvDNU
	jEsMN/PlFOm6v3DW/gcGJMp3R1Wj7Cv8FpWxMr2gO3wvxyGrKVXCGNY6TyYFkJWQHqsI
	r0FeaOjbv8LnNL08Nn9lZlkSI//1Uqb85w5v75SWce+lzz/U2sKn4y7sVP1pGUbTQd1Z
	d4ug==
X-Gm-Message-State: ALoCoQmombPK30z78NM3/Pgo24LI09MoX9VUHGyXC8uI5qpycQn2Xl99uqRJ1X8oB5jGKages32W
X-Received: by 10.229.230.2 with SMTP id jk2mr40808985qcb.1.1424811132438;
	Tue, 24 Feb 2015 12:52:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 24 Feb 2015 12:51:51 -0800 (PST)
In-Reply-To: <1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
	<1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Feb 2015 20:51:51 +0000
Message-ID: <CAJTo0LZwHCVZYsEMZX4scP8vLg-XHZ3rmzeYDJeLJqS=_0P_wA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Tue, 24 Feb 2015 20:52:14 -0000
Content-Type: multipart/alternative; boundary=001a1134469e6bdda6050fdbb1a8

--001a1134469e6bdda6050fdbb1a8
Content-Type: text/plain; charset=UTF-8

On 24 February 2015 at 20:48, Khem Raj <raj.khem@gmail.com> wrote:

> I feel we are going out of way here since now on systemd based systemd you
> have to undo this change
> partly via re-introducing service files in some fashion
> how about just building and packaging uuidd and fstrim separately ?
>

Well the question is how popular is uuidd and fstrim?  I can totally see
that installing the service files if systemd is enabled is the obvious
half-way and upstream supporting this would be good but I've no idea if
they'd accept this.

We are *very* close to M3 cut-off and landing the new systemd depends on
something fixing the circular dependency.  I believe this patch is the path
with the least impact that can be fixed post-M3 to install service files
where appropriate without causing a circular build dependency.

Ross

--001a1134469e6bdda6050fdbb1a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2015 at 20:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":329" class=3D"a3s" st=
yle=3D"overflow:hidden">I feel we are going out of way here since now on sy=
stemd based systemd you have to undo this change<br>
partly via re-introducing service files in some fashion<br>
how about just building and packaging uuidd and fstrim separately ?</div></=
blockquote></div><br></div><div class=3D"gmail_extra">Well the question is =
how popular is uuidd and fstrim?=C2=A0 I can totally see that installing th=
e service files if systemd is enabled is the obvious half-way and upstream =
supporting this would be good but I&#39;ve no idea if they&#39;d accept thi=
s.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">We =
are *very* close to M3 cut-off and landing the new systemd depends on somet=
hing fixing the circular dependency.=C2=A0 I believe this patch is the path=
 with the least impact that can be fixed post-M3 to install service files w=
here appropriate without causing a circular build dependency.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1134469e6bdda6050fdbb1a8--
