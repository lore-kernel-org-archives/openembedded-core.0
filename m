Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id CDD0265D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:23:36 +0000 (UTC)
Received: by qkap81 with SMTP id p81so43634027qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FHvu+iWTBIrx5bvqT4ouynqinxyKlvgJz+GkyR0Oolo=;
	b=P5ci4LXL3U2Eo7bO9FfFjBB7sqg+mYwVz0mIVVtI+M0fHHai1Tdg7RgtfTJoq/aFRO
	LyYLJKrknEgEhBreUfVwn0KfSt9pkl01DKNy7HXStrBiboW+Xe+cjW8RPiHyYdk6gKHg
	lHsJqcUpesJOFS7nGsjQ/lSnvd48mnoa54RGhkRUHhAeDCqg5gHc9S2manCWv+HA0Itk
	u3Eq1HI9fyMb911vnYNtLehrw11yuntL1ubTJOxLm6UpNVbb8VqYlmoKsp5bLBaF25bI
	H4DZArMbGsXzEBuyWNrfmExLG5w9YfXICt255UU4z7A8gjtx6gAGSQ3Kp3YRAAhuI7hq
	SiOA==
X-Gm-Message-State: ALoCoQn5aOHvc+dO3n4Hbm4CcXpsSeIZD+RKw/2xXIN7uzwgklroVs0YEdzT3IMIZCJXvlW430NZ
X-Received: by 10.55.197.213 with SMTP id k82mr21034102qkl.49.1442838216353;
	Mon, 21 Sep 2015 05:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 05:23:16 -0700 (PDT)
In-Reply-To: <1442834624-25775-1-git-send-email-net147@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 13:23:16 +0100
Message-ID: <CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 12:23:37 -0000
Content-Type: multipart/alternative; boundary=001a1149a4825acf38052040f394

--001a1149a4825acf38052040f394
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 12:23, Jonathan Liu <net147@gmail.com> wrote:

> +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
>

Are these bugs with the gcc optimisations or the systemd source code, and
if its gcc's fault are the problematic optimisations specific to a
particular architecture (such as ARM)?  Just wondering if we can use
overrides to only change the optimisations where they're a problem.

Ross

--001a1149a4825acf38052040f394
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2015 at 12:23, Jonathan Liu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4dm" class=3D"a3s"=
 style=3D"overflow:hidden">+FULL_OPTIMIZATION +=3D &quot;-fno-schedule-insn=
s -fno-schedule-insns2&quot;<br></div></blockquote></div><br>Are these bugs=
 with the gcc optimisations or the systemd source code, and if its gcc&#39;=
s fault are the problematic optimisations specific to a particular architec=
ture (such as ARM)?=C2=A0 Just wondering if we can use overrides to only ch=
ange the optimisations where they&#39;re a problem.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149a4825acf38052040f394--
