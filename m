Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4688D73689
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:04:08 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j5so2872968qga.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5762GxWG4LQlHjm52R+Ld1vMzPG9KZAjnyYgoltRQt4=;
	b=SA7VZ4iJsDWD+3xfQ87VCdXBDaU+FisfINu0Z22VPP/sGpPSb6fcwKjr6ciEWGXAVy
	1k5lkuGRKZNog03KkHKOTMsdmFQqIO72/JpmS3egaK8jutX7RCo3eAKeIEqo/kDRrnlY
	yFXw9DnhS1lguwi5j2+WTW/PgDu1eOFex7lJ9mRNLDCxew4JhSDSZqy8Q/PuAHfh4ZeQ
	dC5mbKSlYaEV3CdqzEaoBb7fBYZ75C2FRKy3YVq6fJjhe4lbxoO/8sXlgJ6qXoqGYjHj
	uD+m/2jHDPiEwVCNiM09kcowMli1inGyX1wqCLOFYU1TwDHl5NoNwNllKkNbA5MFPHkY
	llwg==
X-Gm-Message-State: ALoCoQn248t0Ll2FYRw0Yf83d7xn56SPkJJ6LbXu30nrwGQ0FR55AjXlt6IKs1037m2msLvvW7B4
X-Received: by 10.55.50.74 with SMTP id y71mr676148qky.51.1425053049725; Fri,
	27 Feb 2015 08:04:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Feb 2015 08:03:48 -0800 (PST)
In-Reply-To: <CAMKF1srCWK008StDy4q6-PKdqBaAhxdNPfu38SaBvQU5SEhHUg@mail.gmail.com>
References: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lax5EpeTy2y0PUGt+x3hM90U6V=oMaTnLGgRi8LtPGikw@mail.gmail.com>
	<CAMKF1srCWK008StDy4q6-PKdqBaAhxdNPfu38SaBvQU5SEhHUg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Feb 2015 16:03:48 +0000
Message-ID: <CAJTo0LYRKaBTMNUx_wuPJOSGx2-aJiBmDATsN+dkUEH=0SApQQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 16:04:13 -0000
Content-Type: multipart/alternative; boundary=001a11470ce2d0bbd10510140449

--001a11470ce2d0bbd10510140449
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 15:49, Khem Raj <raj.khem@gmail.com> wrote:

> I did not see it yet, since they were not part of my distro
>
> Pushed a fix here please try it out
>

I just sent a patch that does roughly the same thing apart from disabling
iptables (well, libiptc) by default.  Does anyone have a strong preference
either way?

Ross

--001a11470ce2d0bbd10510140449
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2015 at 15:49, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":5r8" class=3D"a3s" st=
yle=3D"overflow:hidden">I did not see it yet, since they were not part of m=
y distro<br>
<br>
Pushed a fix here please try it out</div></blockquote></div><br>I just sent=
 a patch that does roughly the same thing apart from disabling iptables (we=
ll, libiptc) by default.=C2=A0 Does anyone have a strong preference either =
way?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a11470ce2d0bbd10510140449--
