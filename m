Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 088B1772A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:47:20 +0000 (UTC)
Received: by igvi2 with SMTP id i2so25924202igv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YfqmDyN6875QAVIFctCpX6J8pwN2SmWuuXlT+2RWdLk=;
	b=MltEQd1CC21KMwUkVsCw30BwsKczcuu7DkrcYNntI0izLD8e/4FpXF6d9yi7mM9Lsj
	KdvK5l9fVhx6A1wJXH0HUHiMg9pvsGAV2e0YN4pV45U3mTwBnvPz0dJ/DbJkmzDKMrTn
	mPKgledDYTOExcL001G8Upc9+mhih9/4NIVASmRinasg8r21f8pT1bJFdZf57KmFhsR+
	FIrlbzVIA8/oAnJJX6JzS7odH2zP9Md1XGacBWWDmCbq9rcNR0rgaWd5CokAEUG/GGE2
	bJADYruo7SwteUJPxUrRBLp9spuPE+OJVyZB62zRMU9QRtWjU1+AyHcJAkMwdU/W9nu6
	E3Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YfqmDyN6875QAVIFctCpX6J8pwN2SmWuuXlT+2RWdLk=;
	b=U5qQiZ/S0QvuVZyjn4EhlhButBbliq7SnAuoCL9D4+i2HOsMsbLRStM3iRh6A2Rn1O
	m3abrorxcUHg8RLExZtcXAxhdj5pEYjiodHNnx4dQee272RHRozt6DkIVv0qlBxhN9r1
	fttFA1xnDZoddknojODYgorbypJJZ5xzpykkLL2MQL0Cec/iBdp1ngUnczG/4nTIbYcM
	BWjLXTyZShCgRlE1l9+/uD5rwEabfiDhNmJJ4fyu4DSfnRgvX6K+kzcgmG1YMyFdnoqe
	VOxIuf9UUj7czqrghbGDeVVSDZBNw/3Ol0fA/xxzhMmHn7Jo14pQcy1KyzdgE85OjNzU
	MUdQ==
X-Received: by 10.50.136.132 with SMTP id qa4mr225764igb.68.1447372040783;
	Thu, 12 Nov 2015 15:47:20 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 12 Nov 2015 15:47:01 -0800 (PST)
In-Reply-To: <36a4020afc01b3c43075a13a8116cc7fe2d9de0f.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
	<0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
	<36a4020afc01b3c43075a13a8116cc7fe2d9de0f.1447371041.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 12 Nov 2015 16:47:01 -0700
X-Google-Sender-Auth: Uhvoi2KA5qto-OnoSsZVPaKXj7Y
Message-ID: <CABcZANnEDK7LM-PDrjOrKPLcZscV1tN60aKu+o7wn=C4FRx8EA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/7] sysprof: use packageconfig for the gui
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
X-List-Received-Date: Thu, 12 Nov 2015 23:47:23 -0000
Content-Type: multipart/alternative; boundary=089e0149bbc259501905246090e7

--089e0149bbc259501905246090e7
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This makes the gtk dependencies optional.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  .../sysprof/files/gui-argument.patch               | 35
> ++++++++++++++++++++++
>  meta/recipes-kernel/sysprof/sysprof_git.bb         |  9 ++++--
>  2 files changed, 41 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
>
> diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch
> b/meta/recipes-kernel/sysprof/files/gui-argument.patch
> new file mode 100644
> index 0000000..d4744e3
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/gui-argument.patch
> @@ -0,0 +1,35 @@
> +Add the ability to explicitly enable/diable GUI support
>

And there's a typo in this patch description. Hrmph.


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0149bbc259501905246090e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2nc" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
This makes the gtk dependencies optional.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../sysprof/files/gui-argument.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-kernel/sysprof/<a href=3D"http://sysprof_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sysprof_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 9 ++++--<br>
=C2=A02 files changed, 41 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.pat=
ch<br>
<br>
diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch b/meta/re=
cipes-kernel/sysprof/files/gui-argument.patch<br>
new file mode 100644<br>
index 0000000..d4744e3<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/sysprof/files/gui-argument.patch<br>
@@ -0,0 +1,35 @@<br>
+Add the ability to explicitly enable/diable GUI support</div></blockquote>=
</div><br>And there&#39;s a typo in this patch description. Hrmph.<br><br c=
lear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature"><div dir=
=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics</div></div>
</div></div>

--089e0149bbc259501905246090e7--
