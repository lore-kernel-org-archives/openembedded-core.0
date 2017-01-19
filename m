Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 28ECD71A18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:52:33 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id v200so29289095ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 03:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U98QBBtIORyx7WmzTYTmcGT514tZ9deFlh6mTIPEZ6Y=;
	b=WeGZM6QEpVnx+sPSw43pwPtAA1brNG/i7goQB5b5LVIpeHPslZo42eHRfUxRayD+nJ
	qpWAIZCBdb5iTZmeaCMkBWO5tKxIgPX+cYPmLu/AIvmvc2pFREB9And+YKBPeyO5Eetl
	lJKGl8vg5NP6PNVONusGgTmwkSSe2J3sUTSvtXr+eCz6wGMTHdMG0oizRti68JpMkWsA
	yKCVb9Aw+5dXumsQDKAhLbZGrcr0npOPxjP8BnaxuxY89RMLEdZeKEBxjEwf4wN3iP1i
	9V43XCoCju3p4nMlKHV9Mteqi2Lj3mNef7s3HjrQpWtpIeoneC6oep7GS8mqYU5w0fFh
	OhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U98QBBtIORyx7WmzTYTmcGT514tZ9deFlh6mTIPEZ6Y=;
	b=E90bz9QLLyaLUFPz4pwVWyYpjyYwwMgc4+TMFnnVbbISvmu6Ngn7hNHPac4g7kc75N
	q7dTUlv2YrD7hF+yloRtYyQdJiAQuxulHusLT5PKUNmP38WXbCwEShWc1G4IQk/co9Tk
	k0BOAi4hWzVrQMTq4H3S1V1SBYXvsVc1i6/n2dQDqHrqVYWBznnKjuJcWXJCI+hbhlz6
	FT8teHp2L6ygPdomy9A3aRNSoh/xAzIdR3CrshhJZ/P/aaxV4LDnlDXMT+ZvTLNnwgAs
	8iLNKOVtL4emwfzw2QUCt/ldn4PSQN+wm6KoZr8ccAvPRfpatZFbazTIqcQnh1Golqw/
	6PFA==
X-Gm-Message-State: AIkVDXKlgaJbMgR7lZUp6GqiULut7aOQkdlAlm/0Mo3ghhNpjsxqK9kTw4Ge5s+Vcll9TtVeyXYEEdYJE6kD1t4R
X-Received: by 10.55.16.11 with SMTP id a11mr8130704qkh.3.1484826754050; Thu,
	19 Jan 2017 03:52:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 03:52:13 -0800 (PST)
In-Reply-To: <5f146756851fbbddb0b37c85b2705857495d38e0.1484819263.git.dengke.du@windriver.com>
References: <cover.1484819263.git.dengke.du@windriver.com>
	<5f146756851fbbddb0b37c85b2705857495d38e0.1484819263.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 11:52:13 +0000
Message-ID: <CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Thu, 19 Jan 2017 11:52:34 -0000
Content-Type: multipart/alternative; boundary=001a11475cbc3a76b20546712b92

--001a11475cbc3a76b20546712b92
Content-Type: text/plain; charset=UTF-8

You're removing this patch:

On 19 January 2017 at 09:50, Dengke Du <dengke.du@windriver.com> wrote:

> --- a/meta/recipes-connectivity/openssh/openssh/add-test-
> support-for-busybox.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Adjust test cases to work with busybox.
> -
> -- Replace dd parameter "obs" with "bs".
> -- Replace "head -<num>" with "head -n <num>".
> -
> -Signed-off-by: Maxin B. John <maxin.john@enea.com>
> -Upstream-Status: Pending
> -
> -Index: openssh-6.8p1/regress/cipher-speed.sh
> -===================================================================
> ---- openssh-6.8p1.orig/regress/cipher-speed.sh
> -+++ openssh-6.8p1/regress/cipher-speed.sh
> -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
> -               printf "%-60s" "$c/$m:"
> -               ( ${SSH} -o 'compression no' \
> -                       -F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
> --                      exec sh -c \'"dd of=/dev/null obs=32k"\' \
> -+                      exec sh -c \'"dd of=/dev/null bs=32k"\' \
>

But upstream still has exec sh -c \'"dd of=/dev/null obs=32k"\', so this
patch is still needed.

Please always explain why patches are being removed in the commit message.

Ross

--001a11475cbc3a76b20546712b92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">You&#39;re removing this patch:=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 Janua=
ry 2017 at 09:50, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto:dengke.=
du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D"gmail-:g0" class=3D"gmail-a3s gmail-a=
XjCH gmail-m159b623a3630db7c">--- a/meta/recipes-connectivity/<wbr>openssh/=
openssh/add-test-<wbr>support-for-busybox.patch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-Adjust test cases to work with busybox.<br>
-<br>
-- Replace dd parameter &quot;obs&quot; with &quot;bs&quot;.<br>
-- Replace &quot;head -&lt;num&gt;&quot; with &quot;head -n &lt;num&gt;&quo=
t;.<br>
-<br>
-Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@enea.com">ma=
xin.john@enea.com</a>&gt;<br>
-Upstream-Status: Pending<br>
-<br>
-Index: openssh-6.8p1/regress/cipher-<wbr>speed.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssh-6.8p1.orig/regress/<wbr>cipher-speed.sh<br>
-+++ openssh-6.8p1/regress/cipher-<wbr>speed.sh<br>
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;%-60s&=
quot; &quot;$c/$m:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0( ${SSH} -o &#39;co=
mpression no&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exec sh -c \&#39;&quot;dd of=3D/dev/null obs=3D32k&quot;\&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exec sh -c \&#39;&quot;dd of=3D/dev/null bs=3D32k&quot;\&#39; \</div></=
blockquote></div><br>But upstream still has exec sh -c \&#39;&quot;dd of=3D=
/dev/null obs=3D32k&quot;\&#39;, so this patch is still needed.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please always exp=
lain why patches are being removed in the commit message.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11475cbc3a76b20546712b92--
