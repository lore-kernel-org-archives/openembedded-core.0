Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA2C76E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:18:07 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so87892924qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Cxh5wLHWqHBABLRIBeVVdhRdw3EXT7Qa/7ml9dZvw2k=;
	b=S8ZtyVvho3FouGXJo37WCtuELsED46OmYMDwDHneyVb88psaiPiqk1sC6XJES/31ZX
	/KuOQb9tMeY22CwB8is/XG38g0FV1eGyRS+EAiOE7f920bxdJZUU1DpzteHsy5WgE4Ig
	Xo7WnulSOWkmfJwl1FI5FllbfNIJT1lHFrgUQRf8RDDt7FB2FJUbwSo0UImy16JCoVa4
	1vLcj9eGz/gFtmTgI6qXmTPXHhBsZdnSYUknqVwetO1fQmfrM2eH4UShkZvLGJjtGaOe
	N4T5V4kspwRfQfqtM7w9V11en/EA3vnK0HuqL5RI1tzNKP1guWkv4MSulTWvnmvl9Y9y
	89yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cxh5wLHWqHBABLRIBeVVdhRdw3EXT7Qa/7ml9dZvw2k=;
	b=Ty3ol+OkuK7zYqDeCnC5CObcRz/qvmPAPjm7kcC4/Vivg9KLqfcw8JSuEPEM3CPjra
	BLmWJtcA1B8Wm7zZZoWqg1Zujwqw3NNxuF/z4u/q8fH5S3SNe9umcHxc+9rFl4CsdUZZ
	nHqZk/g/4oB7ZNS/+SmFn3caoYKBsScQwIqZ9Thdij+n6QplVfrb11RrNDFpEgFwbDmx
	SAuzRB9ILeVx/sW4eZxU0yCsWaVmQPbZRtqVXiMmb2HVG65psngPDwBzqThmdoZ0spgi
	VHP00EOuPxThZFQrI3+AnDr8lVBjmVktFslEJ1ejs34maCkdp1+MtsxdcnlgK6wZd4Jc
	4Gkg==
X-Gm-Message-State: ALoCoQk+qhzwfJXgR5V/f/NsqAj0NuBbYqpcYsONX59xrg4n1XJlF5qDlrp7zPEC3T1mq6dSj2XA
X-Received: by 10.140.93.14 with SMTP id c14mr24105593qge.59.1447071487267;
	Mon, 09 Nov 2015 04:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Mon, 9 Nov 2015 04:17:47 -0800 (PST)
In-Reply-To: <563FFA16.6070606@windriver.com>
References: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
	<1444032741.5118.5.camel@linuxfoundation.org>
	<563FFA16.6070606@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 12:17:47 +0000
Message-ID: <CAJTo0Lav3zHGErVDp+h-o1tCa2HCDruU8+4=NGND7kOyyu-5pA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should openssl(-native) build-depends on perl-native?
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
X-List-Received-Date: Mon, 09 Nov 2015 12:18:08 -0000
Content-Type: multipart/alternative; boundary=001a113a65d2f6af8105241a9523

--001a113a65d2f6af8105241a9523
Content-Type: text/plain; charset=UTF-8

On 9 November 2015 at 01:42, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> openssl fails to build on Fedora 23 with this signature.
> I suspect that bigint.pm isn't standard and that we
> need to re-work:
>
> commit cd3eddcf2842b9a360f72caf4337ab2968462bb2
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Tue Jun 16 00:32:15 2015 +0300
>
>     openssl: fix building on x32 systems
>
>     Fix build on Fedora 21 i686.
>
>     When building on x32 systems where the default type is 32bit,
>     make sure that 64bit integers can be represented transparently.
>
>     Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> ---
>
> $ git show cd3eddcf2842b9a360f72caf4337ab2968462bb2 | grep bigint
> +Subject: [PATCH] crypto: use bigint in x86-64 perl
> ++      use bigint;
>              file://crypto_use_bigint_in_x86-64_perl.patch \
>
>
> More later in the week unless someone has fixed this already.
>

That's right (#8562).  Installing perl-bignum should fix that.  Ideally
someone who understands perl can rewrite the patch so that it works out of
the box on F23.

Ross

--001a113a65d2f6af8105241a9523
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2015 at 01:42, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D=
"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:4h7" class=3D"a3s" style=3D"overflow:hidden">openssl fails to build on Fed=
ora 23 with this signature.<br>
I suspect that <a href=3D"http://bigint.pm" rel=3D"noreferrer" target=3D"_b=
lank">bigint.pm</a> isn&#39;t standard and that we<br>
need to re-work:<br>
<br>
commit cd3eddcf2842b9a360f72caf4337ab2968462bb2<br>
Author: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.com" targ=
et=3D"_blank">cristian.iorga@intel.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jun 16 00:32:15 2015 +0300<br>
<br>
=C2=A0 =C2=A0 openssl: fix building on x32 systems<br>
<br>
=C2=A0 =C2=A0 Fix build on Fedora 21 i686.<br>
<br>
=C2=A0 =C2=A0 When building on x32 systems where the default type is 32bit,=
<br>
=C2=A0 =C2=A0 make sure that 64bit integers can be represented transparentl=
y.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.=
iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
<br>
---<br>
<br>
$ git show cd3eddcf2842b9a360f72caf4337ab2968462bb2 | grep bigint<br>
+Subject: [PATCH] crypto: use bigint in x86-64 perl<br>
++=C2=A0 =C2=A0 =C2=A0 use bigint;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crypto_use_bigint_in=
_x86-64_perl.patch \<br>
<br>
<br>
More later in the week unless someone has fixed this already.<br></div></bl=
ockquote></div><br>That&#39;s right (#8562).=C2=A0 Installing perl-bignum s=
hould fix that.=C2=A0 Ideally someone who understands perl can rewrite the =
patch so that it works out of the box on F23.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a65d2f6af8105241a9523--
