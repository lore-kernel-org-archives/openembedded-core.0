Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 419686067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:52:56 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b62so114245374iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVAjlZ25ZuhytdTs+teQmLiqgUNs9E4hJwIAk/7oPww=;
	b=yYB2mW9Gakhq1EvUHM63v7BldZBSFeDSmJiI8eH/FRKgVq5LV1W7mqA51GEGDWuAl5
	Q0Y9ST+Wpwa2FT6/pbweym2W26AqwkqELMiK62uNj1zR1P2RiR+ulRDnuThZyaF24zUk
	giX8d/gKQX3qXJJlHjtyjHwGImf+w40R9CZqz5mH+FpNmKvvuzTnaN0p+dU0v+YfYPXb
	NLsjItgbK6V3IJR58niHUlIfUPqox2/rwD0lWgONPHFEVHsTMIWjyQsWA2QHZSaLs4s0
	J13tAORCftr4C4L/GXTsH8jOHXTNwBOINXR2phBFgfcD1gZDvySsO0MlbBaMdOwnmvL+
	y9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVAjlZ25ZuhytdTs+teQmLiqgUNs9E4hJwIAk/7oPww=;
	b=XxyA2HLavfqKrrpBQtN2acXrrVq2rTgCDiCTWSON7iEt6igj7g8czdEo6DHJKJvfvA
	gB7Gp7bEqDoIM94eEpjc3Oav4EzdCgOoN5oPo96ZlzMAor2c5vF2O1bvjpC4HgOaU67x
	17Y7xKS0hGHEIeZDLPjUAAgvihpAT8zgFX/ADpNQUIucF3iztI09OOSPhzw+g6+gY/bI
	XfddI/9ZWPxp1ZssFf0meYvN7F97eTF9XdSIabcB16ixPNwD0ZB4PzmtGdwaXT9coUFi
	41Wd1rDcO34dy1pJ/stTwaGQR02SZ9dQVdVCSe9/P8aaeYFG7Mq8U3ovpCziAoX1Qvgi
	OlJg==
X-Gm-Message-State: AEkoouv2XhFy7GVEfhWmVqPJ5fsD3u4xo38jxQhpFu/4fzIDTLFPoAFoLqGxkYDWZqpy+oA5Q2mSD4wMRRcQBBtd
X-Received: by 10.107.135.142 with SMTP id r14mr7111743ioi.133.1469217173437; 
	Fri, 22 Jul 2016 12:52:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 12:52:32 -0700 (PDT)
In-Reply-To: <5791DDA1.1070707@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
	<5791DDA1.1070707@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 20:52:32 +0100
Message-ID: <CAJTo0LaXgox5AuqLkjJ6xiJoLpYX6SDAnVnP4pzf30W-SWeaxA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Fri, 22 Jul 2016 19:52:59 -0000
Content-Type: multipart/alternative; boundary=001a113eccbccb2a3505383ec7e8

--001a113eccbccb2a3505383ec7e8
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 09:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> Sorry, updated in the repo:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/pu
>

And now I notice that its failing on musl:

| (cd elfshared; i586-poky-linux-musl-gcc  -m32 -march=i586
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/sysroots/qemux86
-o libcom_err.so.2.1 \
| -L../../../lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro
-Wl,-z,now -fPIC -shared \
| -Wl,-soname,libcom_err.so.2 error_message.o et_name.o init_et.o com_err.o
com_right.o )
| i586-poky-linux-musl-ar rc libcom_err.a error_message.o et_name.o
init_et.o com_err.o com_right.o
| error_message.o: In function `init_debug':
| /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/error_message.c:260:
undefined reference to `__stack_chk_fail_local'
| com_err.o: In function `default_com_err_proc':
| /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/com_err.c:63: undefined
reference to `__stack_chk_fail_local'
| collect2: error: ld returned 1 exit status

I guess the hardening needs to be glibc specific? (CC'ing Khem for an
opinion).

Ross

--001a113eccbccb2a3505383ec7e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2016 at 09:47, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":1jq" class=3D"">Sorry,=
 updated in the repo:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> rbt/pu</div></blockquote></div><br>And now I notice that i=
ts failing on musl:<br><br>| (cd elfshared; i586-poky-linux-musl-gcc =C2=A0=
-m32 -march=3Di586 --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-musl/build/build/tmp/sysroots/qemux86 -o libcom_err.so.2.1 \<br>=
| 	-L../../../lib -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,rel=
ro -Wl,-z,now -fPIC -shared \<br>| 	-Wl,-soname,libcom_err.so.2 error_messa=
ge.o et_name.o init_et.o com_err.o com_right.o )<br>| i586-poky-linux-musl-=
ar rc libcom_err.a error_message.o et_name.o init_et.o com_err.o com_right.=
o<br>| error_message.o: In function `init_debug&#39;:<br>| /usr/src/debug/e=
2fsprogs/1.43.1-r0/git/lib/et/error_message.c:260: undefined reference to `=
__stack_chk_fail_local&#39;<br>| com_err.o: In function `default_com_err_pr=
oc&#39;:<br>| /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/com_err.c:63: u=
ndefined reference to `__stack_chk_fail_local&#39;<br>| collect2: error: ld=
 returned 1 exit status<br><br>I guess the hardening needs to be glibc spec=
ific? (CC&#39;ing Khem for an opinion).<br></div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbccb2a3505383ec7e8--
