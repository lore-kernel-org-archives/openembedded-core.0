Received: from mail-ia0-f172.google.com ([209.85.210.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UOyPl-0000su-6X
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 00:50:37 +0200
Received: by mail-ia0-f172.google.com with SMTP id k38so914890iah.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2013 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=bRl5XYpZbKeRZaOkOVWHNkRUQthsb5dT5SSjKUYqVeA=;
	b=pBxXJ7qfXq9Swt8QZ5FT8KQh6NuJsfvFNOkhNn1o0lN3w3bCYPZ1TcX+hW8BymTvFI
	W4/6jK2qP+nUZTXWY4YCnSjV+82OHrR+cxAjksSBdx2Dcb2IJOaJX4gtVEpdQKWKjkCB
	IcHUQWU1efeprSs5J1G8RuUHsJjww3IPPQUQErwvXvWAh8gryj9zvYQ/7uUw9yWf0jie
	j0ClhvvmA0vWnnL0NQCzzQ6hbtt2SoE0hXX0kxAzbDTd6J2YSPeoIYpb2L05Dpor+V+V
	y2F47McnNtmlSp8tSCcDX/+eaigq6IzmC4SUvHqnzijNtw6B1Ou/870rLR/w4w+ectqU
	Y0iQ==
X-Received: by 10.50.164.162 with SMTP id yr2mr5198113igb.0.1365373982971;
	Sun, 07 Apr 2013 15:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.191.170 with HTTP; Sun, 7 Apr 2013 15:32:31 -0700 (PDT)
In-Reply-To: <1365323007.6526.229.camel@ted>
References: <1365323007.6526.229.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Apr 2013 15:32:31 -0700
Message-ID: <CAMKF1sp4L_N6NDG8=qeWTu4sewV2O8T9f7Xzt8s7xCBv_9MtjQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Sanity Failures - Segfaults in qemu images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2013 22:50:58 -0000
Content-Type: multipart/alternative; boundary=089e013a09ca3d9ca104d9cce7c9

--089e013a09ca3d9ca104d9cce7c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2013 at 1:23 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64-lsb/buil=
ds/87/steps/Running%20Sanity%20Tests/logs/stdio
>
>

what does complete dmesg output looks like ? I have seen ld.so segfaults on
real x86_64 hardware but havent narrowed it down since
it does not seem to bother my testing.=E2=80=8B

--089e013a09ca3d9ca104d9cce7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Apr 7, 2013 at 1:23 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><a href=3D"http://autobuilder.yoctoproject.o=
rg:8011/builders/nightly-x86-64-lsb/builds/87/steps/Running%20Sanity%20Test=
s/logs/stdio" target=3D"_blank">http://autobuilder.yoctoproject.org:8011/bu=
ilders/nightly-x86-64-lsb/builds/87/steps/Running%20Sanity%20Tests/logs/std=
io</a><br>


<br></blockquote></div><br><br></div><div class=3D"gmail_extra"><div style=
=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" class=3D"g=
mail_default">what does complete dmesg output looks like ? I have seen ld.s=
o segfaults on real x86_64 hardware but havent narrowed it down since</div>

<div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" =
class=3D"gmail_default">it does not seem to bother my testing.=E2=80=8B</di=
v><br></div></div>

--089e013a09ca3d9ca104d9cce7c9--
