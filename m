Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3219971E63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:08:25 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id mw1so1517907igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eOrnB4c9gUcfxHlPm09tac3iOk/TukDGhOZuVxd5NkM=;
	b=Re+VOBLpIPiTMWao1SqlcVST+00QmmMNXtWNfWJfe7NIT4vZwG5QzPZaMD7KskniKN
	S65b1nTo4DbGxxzX2iyltrgjBERH8xwDCGQanlefaQi6ILbu/kKMDlITzhv8T6uTxrm8
	51fQQCYGq5erQ/uZy3VRtuUHqcJHa6MFA9Lq1gMD+1IgLJ/xlWRSRL0QXRa6H45MoOr6
	IqvG/YcwKBa88Sv+QOuSIom0GMIsPLz1TeKTOzC6AZvpRH5H7pdoygJCMtXoMIAivo1x
	EZUPuTQQB7g/+T8ALkIIUFB/g980poAEMu3K1VQnakhfXFHZLWJG0y3OlLy1IsAq8KeN
	MHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eOrnB4c9gUcfxHlPm09tac3iOk/TukDGhOZuVxd5NkM=;
	b=LWnKDa053FndGABO0wCu5bCedYD6Urs8AU8NQpCIoAovkVywC9H2Uih2y6OnDfBZco
	F7s2zhTtCQXR007lqQfcg2xnZ+yi+nB9Psxgv/fa7QWT2aXZ63hhy4o4Gs+fUPaMEQMe
	qJiQb1tZmAYhZVyTVCceHzGnKkzuCtHnhRjcUKBuO24DcUKh84nbX/7R3CljTFUnwrX4
	HXhkfdmJ00wnTFrQ+qK+4DhIwCd1i90579/ctLsIZeYDy2mrJ++xD4QyPupdOia6Nes9
	8C9SaAg3h6XxriFKcD4seQspHwGkzDr5mQUvhZpSSrYh/qvoDaZjOasZoTM2w69Fd7K1
	kUFw==
X-Gm-Message-State: AG10YOSWtXToNdzQpRqcOkV/lF+iy70LBnyRvTaer/b1SsnuAmNhPzvHWM7APG4KWyYi7zPqAcWQhpIxQmiFfc8A
X-Received: by 10.50.55.4 with SMTP id n4mr5690691igp.64.1453504105908; Fri,
	22 Jan 2016 15:08:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 15:08:06 -0800 (PST)
In-Reply-To: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
References: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 23:08:06 +0000
Message-ID: <CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
To: bmouring@ni.com
Cc: Brad Mouring <brad.mouring@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: Add patch to fix Win10 mDNS issues
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
X-List-Received-Date: Fri, 22 Jan 2016 23:08:29 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b49e9a5c30529f44bd1

--e89a8f3b9b49e9a5c30529f44bd1
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 18:13, <bmouring@ni.com> wrote:

> +SRC_URI_append = " \
> +
> file://0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch \
> +    "
> +
>  DEPENDS += "intltool-native"
>

Can you add this to the SRC_URI assignment in avahi.inc please.


> --- /dev/null
> +++
> b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
> @@ -0,0 +1,151 @@
> +From de7cde877e4daa5d9d4fb5b1a349299eaa94969d Mon Sep 17 00:00:00 2001
> +From: Trent Lloyd <trent@lloyd.id.au>
> +Date: Sat, 10 Oct 2015 06:20:46 +0800
> +Subject: [PATCH] Don't log warnings about invalid packets (Fixes
> + lathiat/avahi#10)
>

This patch is missing Upstream-Status and Signed-off-by (by you,
presumably) tags.

Ross

--e89a8f3b9b49e9a5c30529f44bd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 18:13,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bmour=
ing@ni.com" target=3D"_blank">bmouring@ni.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div id=3D":wwd" class=3D"a3s" style=3D"overflow=
:hidden">+SRC_URI_append =3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-Don-t-log-warnings-about-invalid-packets-Fixes-l=
athi.patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0DEPENDS +=3D &quot;intltool-native&quot;<br></div></blockquote><div><=
br></div><div>Can you add this to the SRC_URI assignment in avahi.inc pleas=
e.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":wwd" cl=
ass=3D"a3s" style=3D"overflow:hidden">--- /dev/null<br>
+++ b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-i=
nvalid-packets-Fixes-lathi.patch<br>
@@ -0,0 +1,151 @@<br>
+From de7cde877e4daa5d9d4fb5b1a349299eaa94969d Mon Sep 17 00:00:00 2001<br>
+From: Trent Lloyd &lt;<a href=3D"mailto:trent@lloyd.id.au">trent@lloyd.id.=
au</a>&gt;<br>
+Date: Sat, 10 Oct 2015 06:20:46 +0800<br>
+Subject: [PATCH] Don&#39;t log warnings about invalid packets (Fixes<br>
+ lathiat/avahi#10)</div></blockquote></div><br>This patch is missing Upstr=
eam-Status and Signed-off-by (by you, presumably) tags.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--e89a8f3b9b49e9a5c30529f44bd1--
