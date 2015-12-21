Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D7ED47317A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:12:02 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id jw2so34466559igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 04:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/CZ1P4brk8HY/CFuQSVshWtzLyCIGJ0gX0WDzYAeb1c=;
	b=aanEa9FHOYe7286NppoWwZu3vrM7GplVQRfJLVA3iNqCvx8y4Aw9CrkREhX96OAXl6
	hgEr1lwkRA0K1q0zXXuFPoh14yT26MQ2/gmMo3h9y6h9TOfyKqrFjWuWXJdcJYIliqsg
	1EqspDUy1KVrPWtZkpb1/9SO2PA1u0bsTA5AfqsR/7bANr0Xs4wysj0WwaLtxNP+FNi/
	WzdjUOdrvG/ijje51F3GvfEWLm5xM5d29kFb90HxspW/v65XkWgq8KTMz4zkjemSEy1i
	6j6ttuPptEcjdFPy0mwSGFAAnpnjVpmNEIb6p/fePSujxZ/vRhR+DzoFBO4NnIqORRlP
	zvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/CZ1P4brk8HY/CFuQSVshWtzLyCIGJ0gX0WDzYAeb1c=;
	b=EUdnx7brGOxUfEIGYxMLkgafvXUMVbFfgAqSgNHa8KP8Yf6nqhQTRaU9zXe5Ng2PN0
	FiHxr/VauHjrDK5rF4E4QClpzN5t3P1UVKLNXKiJeSIEr0vtmTdpV1rOVnw8pB8sa3/b
	8BZ/WyRPG6AlPuFoZSAhsD+l5d02muwmXo/VbhK5ImTvivEEOdJeFNNrPDko10mEaUuB
	kUPlswpPjIb6i/QoFCfncE0Hi88ZlpRXg9mrhATaBEwhB7GIhgVI4cprzAS/OOUI03te
	TPM84PdjkWcz4XUz1Z2srUf/W3vXk9jYhiDIxINE1ywK4EE/t+SzWWFmL5TpKrKYXO35
	BJkQ==
X-Gm-Message-State: ALoCoQmqARdkzzMipaSYLsWrnsW101x4KE255d4SnBOt6O0BPjZ8NLW45BTPEFkPfsKnNgllQUS57jmFlMbElaGcut+BzmwyZjNSWJP9MRsyeDii+qzjYS8=
X-Received: by 10.50.126.8 with SMTP id mu8mr16738342igb.52.1450699923209;
	Mon, 21 Dec 2015 04:12:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 04:11:43 -0800 (PST)
In-Reply-To: <f4988c6fbbbe8801912ef6c904e704a56f172cf2.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<f4988c6fbbbe8801912ef6c904e704a56f172cf2.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 12:11:43 +0000
Message-ID: <CAJTo0La5_dZt9+truAqbSNHBs0WyVyg0F_8qwOvRKz6Wgyh2DA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/17] dhcp: Include sys/types.h for u_int* defs
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
X-List-Received-Date: Mon, 21 Dec 2015 12:12:03 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf995b3b05276765d8

--047d7b1635bf995b3b05276765d8
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> +From 971491b6d7ab47d2f92f34269a129d0347fba15a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 14 Sep 2015 23:51:38 +0000
> +Subject: [PATCH] include missing sys/types.h
> +
> +Code uses plain typedefs defines in this header but does not include it
> +Fixes
> +
> +error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Missing Upstream-Status.

Ross

--047d7b1635bf995b3b05276765d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":4sb" class=3D"a3s" st=
yle=3D"overflow:hidden">+From 971491b6d7ab47d2f92f34269a129d0347fba15a Mon =
Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Mon, 14 Sep 2015 23:51:38 +0000<br>
+Subject: [PATCH] include missing sys/types.h<br>
+<br>
+Code uses plain typedefs defines in this header but does not include it<br=
>
+Fixes<br>
+<br>
+error: unknown type name &#39;u_int16_t&#39;; did you mean &#39;uint16_t&#=
39;?<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;</div></blockquote></div><br>Missing Upstream-Status.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--047d7b1635bf995b3b05276765d8--
