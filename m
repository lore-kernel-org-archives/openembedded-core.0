Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 276566FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 20:28:48 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id r192so79878679ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kPiCzTWyhfd9jGrzS3A+N6FuJsOR1tpGGJRcaJQ39lg=;
	b=FS3KAIFFCkIg8dXveP0cFqo2sHLMrS88ashGdkUCp76H3ZoMhBNdbNrOBuySjvNMR4
	Thb0ivCmOcsFItmsQnBxwT4oKCHY+qtz6ihbMVU/gr6F+IW1o+iosmCbNYK/7HH4gBEs
	3QHWAgsxWqZ0KCNnRdicyFm1C+W1RFv2j9Gm3JLbANqZfprr+HzN11s98fzLNNp+9bMm
	72ESAfUPYyKCdy9Uvwjz4FvKng6JJ/vUQ7lNUgyyj8KaBK3Qj8kEoGrXeFTDJ7WdohyF
	RfzvYg/ZplQYu5hzPJPU3ph1uZotAj6PjfEu+fmOVGt72XUP0y7Mb+6fb488jXz1xJ06
	pXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kPiCzTWyhfd9jGrzS3A+N6FuJsOR1tpGGJRcaJQ39lg=;
	b=Cf2fsenU5odO0zD71s9ux6Y2X91rXvCP1DhY3N2sITAR9zcrPQ/5MIPdFxIiyx9iXl
	F10hwPef54+0aPlhHsIRUN3W04gapYTAIL5PtrTNAqt0axBl/amoJT200/L5kcAjgdDB
	2yjLES9Y+/YVYM8jCnRCMaiyUWDB7y4f6ZtuxGDL5Lb4tjbd0cw8iI/T1l102NZs4Xr/
	UoMU00WB3gMtGwoCN4GQqLVL10h2IDiaiKvPHYpFv5E69q1hUOhV5y6W0Rn0dANzyIMq
	tRw38Vvh6EMyMobppg1/od3trxpiIt3XZX3reUSIe8b4JlojBq5HxF1dUy0rd18nkTqJ
	Mucw==
X-Gm-Message-State: AE9vXwM6TaHft4RwcCX9/3ZnoAz9ITirjgPOrlasa1ihzFBcAoPRfyLJt/XmeXEMca6O0TBdiSA+nvAjTG208ScU
X-Received: by 10.36.112.135 with SMTP id f129mr50924itc.3.1474316929180; Mon,
	19 Sep 2016 13:28:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.210 with HTTP; Mon, 19 Sep 2016 13:28:28 -0700 (PDT)
In-Reply-To: <1474316538-7482-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1474316538-7482-1-git-send-email-Randy.MacLeod@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 21:28:28 +0100
Message-ID: <CAJTo0LYowN-66-EJV3SMTtpgEmw-wMFjCNBdCes0OVBA8evChQ@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Mon, 19 Sep 2016 20:28:49 -0000
Content-Type: multipart/alternative; boundary=001a11441c9ed9bd24053ce2288b

--001a11441c9ed9bd24053ce2288b
Content-Type: text/plain; charset=UTF-8

On 19 September 2016 at 21:22, Randy MacLeod <Randy.MacLeod@windriver.com>
wrote:

> +PACKAGECONFIG ??= "file"
> +PACKAGECONFIG[file] = ',,file'
>

This still has the non-determinism problem if file is disabled in
PACKAGECONFIG.

If the configure.ac doesn't have options but is doing standard
AC_CHECK_HEADERS or similar then you can preseed the autoconf cache values,
grepping oe-core or ac_cv_ will find plenty of prior art.

Ross

--001a11441c9ed9bd24053ce2288b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2016 at 21:22, Randy MacLeod <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":st" class=3D"a3s aXjCH m1574420652c04a87">+PACKAGECONFIG ??=3D &quot;f=
ile&quot;<br>
+PACKAGECONFIG[file] =3D &#39;,,file&#39;<br></div></blockquote></div><br>T=
his still has the non-determinism problem if file is disabled in PACKAGECON=
FIG.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I=
f the <a href=3D"http://configure.ac">configure.ac</a> doesn&#39;t have opt=
ions but is doing standard AC_CHECK_HEADERS or similar then you can preseed=
 the autoconf cache values, grepping oe-core or ac_cv_ will find plenty of =
prior art.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11441c9ed9bd24053ce2288b--
