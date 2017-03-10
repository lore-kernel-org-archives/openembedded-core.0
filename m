Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7D71B776BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:52:18 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id y76so161455420qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 02:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NA+ISRlMXGE7wBrMIQb/jisiiwGReiKy5ZvoJt7oWSY=;
	b=Zhm+p86zpJptFXwIM44Uxrm8cl84+M6JRGOK0kvprhpbRC+SyHgPZfDyvbQr6yd42e
	dep5vHQzzmkd4gGowDt8zsqwNcudXvXdxS6w3u6TPjZ+8o/SORpL3s8eRLaJtU8coa5x
	egUZK0XkjaTThWdGntgr5rN+AWRtQDy0Y6HLZ8cESo232Uj2YvFaSIM3VXrzLbW0EI/B
	qIZH79LJx88VOPzJA1766Rd7lYbmbrLe5ixOcNr+x6yH/B/PnC0TKiXZbyGV58rBWLAb
	XPEHk8b9/+IPy+ju56Yl2W3TqPKBpA3OA182aayQDPkXHZva+8HDHsKv3Q7tqQuSDrA4
	UVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NA+ISRlMXGE7wBrMIQb/jisiiwGReiKy5ZvoJt7oWSY=;
	b=WIVc5RrcYIo3Wtu3xvcFbxxgVWIqBhLEsNx+q+n+NT6336S2atzc363V9kkOmXXy93
	RjtDyQNggjBfV9ev9PV/BtHpvxS1ySGt6MwIHIbTfD+k8Rh6XXBDPD11Ix//pjgbxb1H
	W3mATKm9l+C0HXiB09P2hqN4maZg7wv6WChYXlnhV0EdfTHzb3svFOgiVbtWK9yl52SQ
	pS0osTkHjuuMPjuTXeNo1dvO+qLRzRxtArW1QqhXMbO+XwuLZ0yWzfZtNIVRoa/UhWpu
	GuMkVnH4qsmjeE9/cSS8AP0txXfSGmnr8Bu36PZqYLt9FS/nXeTmCokxCIfBTWjloAjo
	Fvfg==
X-Gm-Message-State: AMke39lbif1M9hVvmGy0p49apIgjqWfa0AgusyADGeHCeYGInzUsXY7Qk8ukYIhfoYzHPWCnFvQHbDb9SZKVSsFE
X-Received: by 10.237.33.69 with SMTP id 63mr18789789qtc.109.1489143139254;
	Fri, 10 Mar 2017 02:52:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 10 Mar 2017 02:51:58 -0800 (PST)
In-Reply-To: <20170309202331.5595-4-alexander.kanavin@linux.intel.com>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
	<20170309202331.5595-4-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Mar 2017 10:51:58 +0000
Message-ID: <CAJTo0LYVkJE9Yk4TSdmE4CUR+oZrf7RqVcadNcjcwGrD82vMmg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gpgme: fix python module build and installation
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
X-List-Received-Date: Fri, 10 Mar 2017 10:52:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8d61fb4054a5e2772

--94eb2c0c7fc8d61fb4054a5e2772
Content-Type: text/plain; charset=UTF-8

On 9 March 2017 at 20:23, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +++ b/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-
> contamination-from-gpg-config.patch
> @@ -0,0 +1,28 @@
> +From 96cfc76def123141d0cecaab857da3880396d5ef Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 9 Mar 2017 22:11:00 +0200
> +Subject: [PATCH] Avoid host contamination from gpg-config
> +
> +gpg-config gives us -L/usr/lib as the first item for linking.
> +
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>

No upstream-status.

Also, does the PATH mangling in master-next solve this?

Ross

--94eb2c0c7fc8d61fb4054a5e2772
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2017 at 20:23, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":2ib" class=3D"a3s aXjCH m15ab4bf0abb7f4ac">+++ b/meta/recip=
es-support/gpgme/<wbr>gpgme/0001-Avoid-host-<wbr>contamination-from-gpg-con=
fig.<wbr>patch<br>
@@ -0,0 +1,28 @@<br>
+From 96cfc76def123141d0cecaab857da3<wbr>880396d5ef Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 9 Mar 2017 22:11:00 +0200<br>
+Subject: [PATCH] Avoid host contamination from gpg-config<br>
+<br>
+gpg-config gives us -L/usr/lib as the first item for linking.<br>
+<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;</div></blockquote></div><br>No upstream=
-status.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Also, does the PATH mangling in master-next solve this?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc8d61fb4054a5e2772--
